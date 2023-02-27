Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0806A4F80
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:06:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmZ2-0006da-Ln; Mon, 27 Feb 2023 18:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pWmYr-0006Xh-P8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:05:38 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pWmYp-0001yS-2a
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:05:37 -0500
Received: by mail-pf1-x430.google.com with SMTP id z11so4601092pfh.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=XTWcHDXRtqFeebJAjVJLI1udiVSkKM3sW3bM2RnzdHw=;
 b=Afh+BvpBcvZo4oKKmJ6xW8avyDLbZuNxjfQnidna3ybtUOl+FvV29lrCTDI3Oczkum
 wVkA8U3xEsUgZK/xd9a6ENnZ077DCzzCgbIfG/877BoN3d8KQGXh419VpB6KdvbKBGMC
 CAOU6j8iBcK7w+cBPo27KL6NmtTthWd7LWE2nCJbDtOJ5sTL/ky0VlfkiKAfBRKvt3PX
 JiETd8wfDni+0t1O6eBYm2dqcQLxqy/li0YvTgHlLGbgwsDOgHPeuMreHQmBUzO3BEdb
 wRqq/8BdtX76I3Rn3XKYP34K37sUpIj1hYLnwRjiDbfUKzVaNcudfJTwWWiB+rCcu7qT
 /i/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTWcHDXRtqFeebJAjVJLI1udiVSkKM3sW3bM2RnzdHw=;
 b=YW2huKr8/pCxuRWmrwt9eJpsAd/RiGKepnJPQfeR6JoRIj+IbewEULVAoicgq1pcb2
 AMdDcNqp7hnqGZsDS4wLuk20G7qwSHP3qKyfMTuarJj4EAulqHUqCqq4uJR/MQ7OVfAy
 PmU+KAkWtAKCCzHqTVaPvGZoQKU99hgA4NTHYF4JUnWBftMwwjqAR5C0bDSBDbi4aGRU
 IVqsfVOydPJ7ej2nSLCrFj2nneFvjPQ1NCbKS7o15vHnijvL5dVCFp96DVL819xWExS5
 elAzwwD479K8MowqrgpRn4re9z2H85OoIbarHlBlgFyG0jkB0oiywMsNfunECvDhuO+E
 OZQg==
X-Gm-Message-State: AO0yUKVj/3YUA1KWxS4qI/yxVz/ghAPHrZ5rzHj9p6LGUy3U5qr5jQvH
 2g1zhicQ8JtiINOJwfrB5S+qKbBVpFkxNoEU
X-Google-Smtp-Source: AK7set/wEfh7U0FymCcQI+gmBmYTECA3uiU/MJKekBBNPNsP614Pc5J/N1CwNJVszwHu2aVWEkUcWA==
X-Received: by 2002:a62:840e:0:b0:5a8:a467:f975 with SMTP id
 k14-20020a62840e000000b005a8a467f975mr683084pfd.17.1677539132392; 
 Mon, 27 Feb 2023 15:05:32 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 f21-20020aa782d5000000b005810c4286d6sm4743272pfn.0.2023.02.27.15.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:05:31 -0800 (PST)
Date: Mon, 27 Feb 2023 15:05:31 -0800 (PST)
X-Google-Original-Date: Mon, 27 Feb 2023 15:04:44 PST (-0800)
Subject: Re: [PATCH v3 17/27] target/riscv: Replace `tb_pc()` with `tb->pc`
In-Reply-To: <20230227135202.9710-18-anjo@rev.ng>
CC: qemu-devel@nongnu.org, ale@rev.ng,
 Richard Henderson <richard.henderson@linaro.org>, pbonzini@redhat.com,
 eduardo@habkost.net, 
 Peter Maydell <peter.maydell@linaro.org>, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, 
 yangxiaojuan@loongson.cn, edgar.iglesias@gmail.com, philmd@linaro.org,
 shorne@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, 
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anjo@rev.ng
Message-ID: <mhng-4cd6d6c3-ac6c-40e7-ba7d-fe4b9761a395@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 05:51:52 PST (-0800), anjo@rev.ng wrote:
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/riscv/cpu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 93b52b826c..9eb748a283 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,7 @@
>  #include "fpu/softfloat-helpers.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_riscv.h"
> +#include "tcg/tcg.h"
>
>  /* RISC-V CPU definitions */
>
> @@ -533,10 +534,12 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>      CPURISCVState *env = &cpu->env;
>      RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
>
> +    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
> +
>      if (xl == MXL_RV32) {
> -        env->pc = (int32_t)tb_pc(tb);
> +        env->pc = (int32_t) tb->pc;
>      } else {
> -        env->pc = tb_pc(tb);
> +        env->pc = tb->pc;
>      }
>  }

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!  I'm going to assume you want these to stay together, but LMK if 
you were looking to aim this at the RISC-V tree.

