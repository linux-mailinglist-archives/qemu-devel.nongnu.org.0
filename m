Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E55492C97
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:41:38 +0100 (CET)
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9sUD-0007Zs-GW
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:41:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9sLM-00052O-S9
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:32:28 -0500
Received: from [2a00:1450:4864:20::52c] (port=41782
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9sLK-0006yg-Lk
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:32:28 -0500
Received: by mail-ed1-x52c.google.com with SMTP id j2so1214818edj.8
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CMqSbcPDSeJ06n09Sn6ZgRjHLErKbjj4zKNKm3bkVQc=;
 b=ZJXWlcwKnvI2Gl9bSIpY1yM54HyYpNd1ETzzdSqOdC+ELYJKKDD/II3EwbMLZ6Pwor
 /jCOckvqQeXBh1UEh6tJ0Iju/lrVcMc20GUm43iOjriMbP5sXj7ZLgiDPc5WQ2Udry58
 l2uv63ZuDWA7XjfLqnL5pwEF2uVDxTdXDi2lC/vBWlGYPlUrliVl2drYnznOGjLRGePY
 Dc7rp7KTo/JU7cVL0gwLLs1jAIhv8VSr/qht9wN5UQGQW24Ayk6SNl1QyQYNRHNWthM2
 WrhctNxQ//P0s5YiKxveOn6J08OTEk0xkMksk30pTHtP3KSFD/kNny7HIvLWPfQjTbXO
 eayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CMqSbcPDSeJ06n09Sn6ZgRjHLErKbjj4zKNKm3bkVQc=;
 b=km93GqaRliVK5RHzLvf5MXgAbi0qAsvZq6bqiE0v0kcFyR6AEY8NcVr2bv3lsW4vPw
 QxzqPzQeHWyqTxLbk5YhiQ28V4+dMxD4dGXlqTVrC+GGqHeyAOgEY/Wq7PKL89/HCzkY
 Jpo51n2uJR9wK32hDJEoqNx0umO8qTFlB5imIPwHQhpKqasHqpcTuwvbPgkhCN09rypf
 BBsikQXw4Ct+TBKBzFhYfq+kbWZ8bztOGCBYuoWY2RbUprd7oQ83N4uwtml2Ftd0t18c
 Eui+rdDvFh5HVP2Ob5SsgkDLKE0Y0ZTWiQBLIwX1JZ2kGuzcTyS+/Lh1SsgeCkZcy1hv
 WQBQ==
X-Gm-Message-State: AOAM530rbds+AwNfu17RnG6P1uflJii4hGzAqmCZuE5QBuh6WqvWR6H8
 Rl5hUMKjB/VvZxQtHeqLWTDAjw==
X-Google-Smtp-Source: ABdhPJylYUqI1+YSE+EMyH8bodgWWDYoeAQtj0NqhMElX3a/v5yaYoop/zRMzW8QLYnyiCd7je25Lg==
X-Received: by 2002:a05:6402:5249:: with SMTP id
 t9mr7615660edd.35.1642527144726; 
 Tue, 18 Jan 2022 09:32:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w3sm149978edd.63.2022.01.18.09.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 09:32:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D59A1FFB7;
 Tue, 18 Jan 2022 17:32:23 +0000 (GMT)
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-13-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 12/13] hw/intc/arm_gicv3_its: Check indexes before
 use, not after
Date: Tue, 18 Jan 2022 17:32:18 +0000
In-reply-to: <20220111171048.3545974-13-peter.maydell@linaro.org>
Message-ID: <87y23d7xw8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In a few places in the ITS command handling functions, we were
> doing the range-check of an event ID or device ID only after using
> it as a table index; move the checks to before the uses.
>
> This misordering wouldn't have very bad effects because the
> tables are in guest memory anyway.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

