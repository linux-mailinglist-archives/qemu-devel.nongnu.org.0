Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7634F3697F8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:06:58 +0200 (CEST)
Received: from localhost ([::1]:35596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzGb-0002Ss-Hl
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzET-0000ir-2v
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:04:46 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzEI-0001Mf-49
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:04:44 -0400
Received: by mail-ed1-x52c.google.com with SMTP id j12so33172482edy.3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3tzZP0fDZefeqyzFszJ/lusnF0SL8+AuxHmeZQ+fMGQ=;
 b=wTZ+0+ZAcJv6TTLHShqs3Y/yKogDuAAD9k2axb9juCZTAhgm/GcUfKC2z7XiP/WFQH
 PrfgT5zoMly4xzA8qRUx+U7CaTsH0K9o3vk8P+GPrBRMWxcRnokz/OOi7BBxOvl7leEd
 aL3aYQ49Rh4rYpZCHMxx93O5mme6Z8qEF8FB+CeRL0vdcJ1BCg0whicAPAGpZJxs/2KV
 I3r+QyIa2BiPPbCaZmRqNYlMQ3x1I2Wa2LnM3nyBOxfreKldnDLqMNugT6c8NOGr0Eks
 aCXBWP5XfbAmitKTWf1HLHDbybW+VreZ9DBVTlBG0gdA1apzCKhMu7QgJN0u2Y+uEkAL
 AfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3tzZP0fDZefeqyzFszJ/lusnF0SL8+AuxHmeZQ+fMGQ=;
 b=srb0b/hQi3BAbbrLHiF3LeBMRwKbwvgPb6LlWs+qvVJFXBr0omwL9KziuZnTWlVs06
 ON4u1F2/bX7NC13RlHP21UDc4/NgfjuAs8HrzEhHrXkX+foR1iRDhL7MS86bM60ORNQj
 pbrNjzApn3/sAvh2KTi+6HQ4myhxWWW9G5fGEB1czwbwXjny6dRXssg6pro/3bEM3hDE
 LzD/r+ALMWyx0awNw4s0sqsZGkqyFfOmnc/j9sDXXOdivGXEZXOlqBhZ7tVnvyhRlrix
 wFiK8b06yBrVuuaBBu7Ac04mKTJ1yNZdQM61EJpfJTYSaTS4IPiZ9kQZofAXu7f81/VQ
 dhAg==
X-Gm-Message-State: AOAM5313igEApJFEf439dsKApMNwtxlp1Ss0FlBMGjCxyaGleYbD+lkS
 dWTzbfHZHkKlPjW9xRnh/CPGGcH3vz2aYxpnzDDjeQ==
X-Google-Smtp-Source: ABdhPJyUwwKEIi6pTUosOfqA1oA3oxOPsKzx2aD83Cl9bc/sCKL/fZxhdbTq+XCso2oapnD/c7nThM5Q1bZHxfy+T7g=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr5610803edv.44.1619197472029; 
 Fri, 23 Apr 2021 10:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165413.338259-1-richard.henderson@linaro.org>
 <20210423165413.338259-3-richard.henderson@linaro.org>
In-Reply-To: <20210423165413.338259-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 18:03:36 +0100
Message-ID: <CAFEAcA-026gLPGLTjmBhvthSg5GzZw9Uu63W-MR=t9vaZTAB5Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] linux-user/arm: Do not emulate fpa11 in thumb mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These antiquated instructions are arm-mode only.
>
> Buglink: https://bugs.launchpad.net/bugs/1925512
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 106909c7d8..e2a1496b9f 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -347,7 +347,7 @@ void cpu_loop(CPUARMState *env)
>                      goto excp_debug;
>                  }
>
> -                if (emulate_arm_fpa11(env, opcode)) {
> +                if (!env->thumb && emulate_arm_fpa11(env, opcode)) {
>                      break;
>                  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

