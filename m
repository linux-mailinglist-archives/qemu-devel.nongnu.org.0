Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708CB3B700F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:24:39 +0200 (CEST)
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly9yw-0003b4-Hn
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9xl-0001ou-5U
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:23:25 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:36361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9xi-0008Vb-Nw
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:23:24 -0400
Received: by mail-ed1-x534.google.com with SMTP id h2so30384734edt.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ADMtAui2o1pOIUrlALnecegKxJsSYMVXu9qoCC78qM8=;
 b=hJx8MJN1GwwYqO77xVVC5YaUd5z7ac/9SrCdsp8X5zZnwvNsWlR79p5sbBIVPUXnKp
 gT8cdPS1GvzwrSssKIc9o9t1v4kmN45KLkdZbNpF8S8mpdC3yOKr7xTtIlDPF4ypVmem
 JABzAi1DIay9vfPHzMxBgiCisPL+H7kI1kQ2cCpzx+5E88ZN/N41E/YPgR0shmjCgzUT
 5lxzkrAeIbSp81GQgizXUHrUmoY/bD2c9R4yPqRWu1Ep1iEhwChthQKEUbIAP0mk0V3S
 xF44r+qQq+uwG960W7keyGXWxp32y8ub4qpLsSKwmsdX92yf4KC9OikgOFGdypee1QeN
 rrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ADMtAui2o1pOIUrlALnecegKxJsSYMVXu9qoCC78qM8=;
 b=Vny5d3X47tdVzu8BtR9BjDwWLHyMoA/xC8KLBaW7mTMgaOknTMdBgou5frw05BSQTM
 wKYtnrseichVORcwtpOYGELWxJPLRdKym5uajhzj+DYc3L3OpEKgMny8nWgBOChxRyXx
 if2wtqlrA5pMqxN8P1iTHhUQgHQiipI3qLcB6MXZ/GLn/9JXj9Tz2vCCHp9Tfmja5pn/
 xGSdfGNiBQ+AeYv+LEQgQzM/7iQZmLuCLZiBpRjbqLfoV1pEMzFUeHOsiBYELKYgLXOf
 LEx4NqaTzbzgfem/7w4l7I5e+BBlEFDZbfpU1uTthIwqMEkHSe051l9yXRTtn1tu6bbJ
 CFTQ==
X-Gm-Message-State: AOAM531T7mxW4jartPJh7csB6BbAtnlUSfd8sS8Nb5JIybwpyidyLtw6
 j7Bx40UfZjf/LOJy9QXJFH9zbaGEPUJ2ljpca+5aCQ==
X-Google-Smtp-Source: ABdhPJwGZOKGbmXLPQp66+D7nbw2UOP4WTp8ACETTAlH7qejEaURN6fRJzntCtU13pAXLLek/2/0WX5a2opwuuRD9Tk=
X-Received: by 2002:a05:6402:759:: with SMTP id
 p25mr39532093edy.146.1624958601421; 
 Tue, 29 Jun 2021 02:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
 <20210628220810.2919600-8-richard.henderson@linaro.org>
In-Reply-To: <20210628220810.2919600-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:22:44 +0100
Message-ID: <CAFEAcA_n6C3EcBY-yUm1GEALDNbKh08_4Xy_5D9i1jJ1rHgFSg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] target/nios2: Clean up goto in handle_instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 23:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 6fd4330b31..9e71267b42 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -753,7 +753,8 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
>      op = get_opcode(code);
>
>      if (unlikely(op >= ARRAY_SIZE(i_type_instructions))) {
> -        goto illegal_op;
> +        t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
> +        return;
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

