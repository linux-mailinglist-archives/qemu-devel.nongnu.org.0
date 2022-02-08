Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFD04AD236
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 08:31:04 +0100 (CET)
Received: from localhost ([::1]:51996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHKxn-0002Qh-Jy
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 02:31:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan@cloudflare.com>)
 id 1nHF2L-0004GS-6Y
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 20:11:17 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=34310
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ivan@cloudflare.com>)
 id 1nHF2I-0004yJ-Te
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 20:11:16 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id v186so45453551ybg.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 17:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4dVs808c/KGh7au+kF/SwIx8k0X8gpbFoQIaxWk+ets=;
 b=uQUOvggN13kn4i2tfnhN9y+nFgexTEtoRTA+WqlWDv6hn6H2jHxNniizR/qmFoMy9X
 IeLJT8+ylOUqLv760mCCnjXuak76FVUT0Fie2iBJiHxqCOE6p6O2uAEGBCqiXh8dpZvN
 Xl35nhcmfSxaZjXEvISDpin3wStT3YOnZef/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4dVs808c/KGh7au+kF/SwIx8k0X8gpbFoQIaxWk+ets=;
 b=YP7gtbacnP2hUKVHcruc6M1bC/WwB1HE1LKpaedvrcvnF3E9XQQMpa7rq6re0GLxdV
 jAy1Mmetvx63mj++K3LufwKH+65gyPiLTbcM/EiMCdfYGz+EAxnykQTq5iZLU5ICZbHk
 /Vyd7dDAT52B0T6K9DIjUXV/9auinadHf4Qm4fp8u8rb84rytJvsnK8K1MPx8hOW+NvM
 B+7u/O6YbIhik0tJU4A07tF23BkpmSTrfkN+CEPYD6Y9BjzJ3AAB4tNTZ25biSx8rhrr
 q2GCm64OnZFPIkBHqOps0zKHQ5EpcUc3M4LVIJh+y0yHkJoRj3URkZGEgZzF/WNNdG9Q
 v3YQ==
X-Gm-Message-State: AOAM531NjKcKrwqn/f1xT2DEzLNkhoRHp16Qz9DLtR8bSlUymMqTEDOG
 AMGZzBJ4Y03xECv1RdgR07ETUrHZvvSIcoHii5/erQ==
X-Google-Smtp-Source: ABdhPJyxX1MrREWljrpqHeoFAIHzoZJ27qsUBW9Prnl267bm2ZDfAb4hr6S7DmR/AHjC09qG5mT8soARMnfUkIQ97WU=
X-Received: by 2002:a81:c60c:: with SMTP id l12mr2626307ywi.379.1644282672862; 
 Mon, 07 Feb 2022 17:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20220207225211.15281-1-agraf@csgraf.de>
 <913E2F6B-AEBD-4DF6-9470-3AF34FE1E99D@apple.com>
In-Reply-To: <913E2F6B-AEBD-4DF6-9470-3AF34FE1E99D@apple.com>
From: Ivan Babrou <ivan@cloudflare.com>
Date: Mon, 7 Feb 2022 17:11:02 -0800
Message-ID: <CABWYdi18X6JMbHkWQdJcX-W0=C+v1O1DsbzqmzHuUF9P=TFBvw@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Handle ID_AA64ISAR2_EL1 reads
To: Cameron Esfahani <dirty@apple.com>
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Cameron Esfahani via <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=ivan@cloudflare.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 08 Feb 2022 02:07:39 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch addresses the current issue for me, thanks!

Is it possible to make it more future proof? I can imagine a very
similar situation arising in the future and it would be good to be
able to handle it gracefully. If it's not possible, then maybe there's
a way to output some sort of error from qemu that a user can search
for. Right now all one gets is a qemu process using 100% of CPU and
outputting nothing. None of this is required for this patch, but it
would be good to have it at some point.

Reviewed-by: Ivan Babrou <ivan@cloudflare.com>

