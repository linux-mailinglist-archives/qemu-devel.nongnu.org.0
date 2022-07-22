Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5957E1AE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:53:12 +0200 (CEST)
Received: from localhost ([::1]:41574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEs9X-0001qp-EN
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oEs4O-0003hJ-VU
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oEs4L-0008Np-FQ
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658494068;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4UMNW5SEbRjKDN8EtZLXXixfCtUE+YGfVzwFAro5at4=;
 b=JBRnxTIXMwlnuIZ5arjcr39bC+r/LvtO+6bzcrEHPJtUAz2dvWzx1s+OwclpiKOeyCUu4o
 DodQGp0v3Z7ddCET2thNAiUIJi+m6eL3IceBbf9b9hMnnxawUWhlAuB9s0MY7KV+J8Y5Q+
 CvpX4zZoe74RJyTTX5ccvMAFeHv6jq4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-b1R0JW2FNx22fdMPlSDgsQ-1; Fri, 22 Jul 2022 08:47:45 -0400
X-MC-Unique: b1R0JW2FNx22fdMPlSDgsQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c17-20020a7bc011000000b003a2bfaf8d3dso2516679wmb.0
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 05:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=4UMNW5SEbRjKDN8EtZLXXixfCtUE+YGfVzwFAro5at4=;
 b=7Hrs7bEjzMPNG1Z3MGju9PNXFEZddh7nruMwKculZATcoJ7ZLQtJozmYZfwJonI9oe
 ghYr5KJ2ROJcMdiUC97z8MwiDl5DfGSAVtXmbBVdUGxqqOV6UzQbGeWDQ/tPOkJs/MfR
 FxNS6JIpDvS1mTSsTONYFp16E/F1HsCpFCrFckpX8NUxH3m5bMVb/veTZm6hxbt4TVTL
 7SgcbnkJhIVdyAziBFhQcZUzKPbQa4ciW1C6UlOP/1m0l2717TWymu1DbKd2TfMDdQgj
 98EAW9pmJMNC8mYM6tXjAEPaImI/EyrpBPIjSOT4g/cflXC9uzLu80W7aUXrjzwBnNFw
 J3+A==
X-Gm-Message-State: AJIora95ko6QG5veQHEFjbjJOvyhFUmlnAH1qnxaM+En3xuzwiYo9BdO
 2b3qTAPPTiIc4IRZgESaxpBfiPmT3QHxPyAb1zfcxTjNlvBJzzYx6Wmy1S0pTWbe8/MSNE3K2aj
 Q2x9UUguTOYYFba0=
X-Received: by 2002:a05:600c:502b:b0:3a3:22c1:ca61 with SMTP id
 n43-20020a05600c502b00b003a322c1ca61mr12227767wmr.10.1658494063939; 
 Fri, 22 Jul 2022 05:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tqEPlCGJIoNf/J0mlaiTXVQJ4wiyjwzPpIwqUFGQSU0auMiQ8B86Qf6gb09DVWRTJFDOd26A==
X-Received: by 2002:a05:600c:502b:b0:3a3:22c1:ca61 with SMTP id
 n43-20020a05600c502b00b003a322c1ca61mr12227753wmr.10.1658494063683; 
 Fri, 22 Jul 2022 05:47:43 -0700 (PDT)
Received: from localhost (84.125.84.58.dyn.user.ono.com. [84.125.84.58])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c2cd600b003a2f96935c0sm4141934wmc.9.2022.07.22.05.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 05:47:43 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Fam Zheng <fam@euphon.net>,  Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: Re: [PATCH 2/2] migration: Define BLK_MIG_BLOCK_SIZE as unsigned
 long long
In-Reply-To: <20220721115207.729615-3-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 21 Jul 2022 12:52:07 +0100")
References: <20220721115207.729615-1-peter.maydell@linaro.org>
 <20220721115207.729615-3-peter.maydell@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 22 Jul 2022 14:47:41 +0200
Message-ID: <87ilnp5n6a.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> wrote:
> When we use BLK_MIG_BLOCK_SIZE in expressions like
> block_mig_state.submitted * BLK_MIG_BLOCK_SIZE, this multiplication
> is done as 32 bits, because both operands are 32 bits.  Coverity
> complains about possible overflows because we then accumulate that
> into a 64 bit variable.
>
> Define BLK_MIG_BLOCK_SIZE as unsigned long long using the ULL suffix.
> The only two current uses of it with this problem are both in
> block_save_pending(), so we could just cast to uint64_t there, but
> using the ULL suffix is simpler and ensures that we don't
> accidentally introduce new variants of the same issue in future.
>
> Resolves: Coverity CID 1487136, 1487175
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


