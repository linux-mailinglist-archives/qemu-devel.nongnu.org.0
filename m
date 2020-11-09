Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E747D2AB7B0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 13:02:36 +0100 (CET)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc5sa-0003Aa-0n
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 07:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc5pj-0001Qq-GW
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:59:39 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc5ph-0008BV-P9
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:59:39 -0500
Received: by mail-ej1-x642.google.com with SMTP id 7so11862923ejm.0
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 03:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lOpNSO4aJUbc4ft2JlG7GfZVwh1xTEhJE95ZLxcR8ZY=;
 b=S4ol7PvaZXewUmjj1r27kr+fbJQafexXBdC8Z7vqUPt2LLIQSdNhvdalbHuSMn9nFG
 iZDl5QpsQzSNzu0BXyF78auDphtjp3a31IpsZbZkYFAWrdmvmvTuIwdqb1sWfX0zZPC9
 t803wiaTSwAStNk3/wbMtNK0hVrUNU82cTd8xX+GVojSlXIi+r8WF+cSzziYE7evpBHS
 LlNFa4vhPIeqGDXGyYOAvxedYpBgvLoHjEHUiW5Kx3eRWfxcVR59/w+px6iflCsKa6XT
 SvkcHSu+rR3mYk5C34FsGa++K5sDlccYsAwdUxHrqIG8/uD+DU6TY1ZI9M7xMybyMTBS
 aWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lOpNSO4aJUbc4ft2JlG7GfZVwh1xTEhJE95ZLxcR8ZY=;
 b=mDlXVqZcP5Z82lVShrgFyBtGhjsud6fmGYYzsoJI6TxrueJEZ2XMX87yhbUjmJvbSY
 8AhLcVsIwtxZyUHkl8iFWVTfTfmDuGFJHx7InRuQEcbWB5+QoD2nl6NMHlK5WkI04wKn
 9tHQke8C1cnlDZLwjFbIJpVy5dNJTLRM965kCUCwWpmXc0fSuxeCF5qNKTrUnYMCWrpM
 fU4zzn/RczLCVZkJaPOmWPwzIvyZhCDgLsJ8f3zF9KyVBucWmgvdYjHisHm5VqDjty0f
 QLGyycdzUOJGs1S/AvBep5cDmDZsRKaNPROL8fbFiCwFh2YL1s5pfJVqStimAB8ddwa/
 ufRw==
X-Gm-Message-State: AOAM5304z3wrADLKy4KYG8uwUBOlAZqtMkXfI1a71ypsiHS2sDxGecOY
 zsBKuT7DFd89SboHjmphBXNXv4AKdxLNaCr4MQn8xg==
X-Google-Smtp-Source: ABdhPJytC2AuKOGfowPNNu5lz1iZe9MvwY8wD/nEh5SALEAxc9rRR+LaU6t5/oWfZNBLM9yxtzcs9uAN5ryIILxbZMM=
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr14611146ejs.482.1604923175637; 
 Mon, 09 Nov 2020 03:59:35 -0800 (PST)
MIME-Version: 1.0
References: <20201105171126.88014-1-richard.henderson@linaro.org>
In-Reply-To: <20201105171126.88014-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 11:59:24 +0000
Message-ID: <CAFEAcA9BSNwtqNwh1H3+SjEAvxihpfcXc=frPLcqNtaKUJi0Yg@mail.gmail.com>
Subject: Re: [PATCH for-5.2] target/arm: Fix neon VTBL/VTBX for len > 1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Nov 2020 at 17:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The helper function did not get updated when we reorganized
> the vector register file for SVE.  Since then, the neon dregs
> are non-sequential and cannot be simply indexed.
>
> At the same time, make the helper function operate on 64-bit
> quantities so that we do not have to call it twice.
>
> Fixes: c39c2b9043e
> Reported-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> -    val = 0;
> -    for (shift = 0; shift < 32; shift += 8) {
> -        uint32_t index = (ireg >> shift) & 0xff;
> +    for (shift = 0; shift < 64; shift += 8) {
> +        index = (ireg >> shift) & 0xff;
>          if (index < maxindex) {
> -            uint32_t tmp = (table[index >> 3] >> ((index & 7) << 3)) & 0xff;
> -            val |= tmp << shift;
> +            reg = base_reg + (index >> 3);
> +            tmp = env->vfp.zregs[reg >> 1].d[reg & 1];

This can be written
  tmp = *aa32_vfp_dreg(env, reg);
rather than open-coding the conversion from a dreg number into
the appropriate access into the zregs representation.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

so I'll just make that change and apply it to target-arm.next.

thanks
-- PMM

