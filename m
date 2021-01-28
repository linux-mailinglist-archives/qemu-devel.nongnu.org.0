Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444843075A6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:14:19 +0100 (CET)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l56Bm-0002Zi-7Z
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l569R-0001UN-76
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:11:53 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l569P-0007H8-MQ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:11:52 -0500
Received: by mail-ed1-x531.google.com with SMTP id dj23so6281438edb.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 04:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0lWTQBcnDCad8XpdN62W1XLqjcZb1faD1VJFzo+wx5c=;
 b=jOsWkj1VBqgvLEJNsfW/aIG2I2AEZM94wUeGAvUAKWuQVDW+d0o5T3z3Zc5bwYV+0/
 Iv1sCgbVG6hBoJqZJB82GLQv3DYx+b4aflbL1cQFgzY3za6Sky7eRkNODOqNQiqpR6PB
 VL3IuliHsG90QP7BHUGYb0GAkhAUJ6eG0YuKw3WXU9fBtZkApxF1iyzocSDx2kpgydkg
 lzHIFLnoHb3QZ330bgr9dPlTwb+b8EZ5mvHK3tcdWnvGuGKmqJlQgvL9kn1dI/bBFOKP
 R9iPc1Zg/CxOYrA/gUqACCryVq6iTlw1gz8SxaMyECSZ2CibaPmTJ0s5V5GK8oIHU+cb
 /fIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0lWTQBcnDCad8XpdN62W1XLqjcZb1faD1VJFzo+wx5c=;
 b=Wn6qtMOocI8bQiL0DkiA1l3c/qsWKY+eooq541EcFM1Mfu0zemEn/1R3aMZrUAYXn2
 CMjMDGbvTm0PWvIbICq+mNjXtmXgKZI3h+SjdaLJWlxB4v04aFcIvfbpkhck+NgkHPSP
 viyt/k9sYf28bKm6d3oMu5H7K4JCvP4BzgMNeZHxySp5oArb64z63xC7f/2/xO+to7uJ
 GbLjWO5k7EMHnkt3N0bw06MU1aIV/5pFNLR76zc+JQNEwUzlb97ZsU8sKGCuiB2s4Tmf
 3ZcpG7qJv4KGbI7evE4KC6DbVsGbaI2DX2+ayY2Xq9BV/6X9zQabiabvmhDNZ+SJQYpl
 vnwg==
X-Gm-Message-State: AOAM533h4HtDwXPsoC8EC4gk8ss4iyxGGsYxmXuKPjR3THIHqjk5IFMQ
 iHd5A0X9c7oYLwU5SSWrNvzleGJ7dDh2Fcgr4TWIsg==
X-Google-Smtp-Source: ABdhPJwSUoyImPlO/hkwouKtduzASZ6+PiOhDTWs2l6snrmmf/CYUnaY/yW2CcrI38hekbTDKAM/8VWQcT4saQ7KOm8=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr13543617edd.52.1611835910179; 
 Thu, 28 Jan 2021 04:11:50 -0800 (PST)
MIME-Version: 1.0
References: <20210127011142.2122790-1-wuhaotsh@google.com>
In-Reply-To: <20210127011142.2122790-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 12:11:38 +0000
Message-ID: <CAFEAcA_PHnwpdPBT-fYqogwaiVj3CU2tXg1C00F_eVHmc4L+ww@mail.gmail.com>
Subject: Re: [PATCH v2] hw/misc: Fix arith overflow in NPCM7XX PWM module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 at 01:11, Hao Wu <wuhaotsh@google.com> wrote:
>
> Fix potential overflow problem when calculating pwm_duty.
> 1. Ensure p->cmr and p->cnr to be from [0,65535], according to the
>    hardware specification.
> 2. Changed duty to uint32_t. However, since MAX_DUTY * (p->cmr+1)
>    can excceed UINT32_MAX, we convert them to uint64_t in computation
>    and converted them back to uint32_t.
>    (duty is guaranteed to be <= MAX_DUTY so it won't overflow.)
>
> Fixes: CID 1442342
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Doug Evans <dje@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

