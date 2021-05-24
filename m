Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E918138E076
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:47:42 +0200 (CEST)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2VA-0003kQ-Ag
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1ll2UI-0002x1-Em
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:46:46 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1ll2UF-0006ca-Ko
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:46:46 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z4so11811837plg.8
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 21:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+XOQeysAfX0hQEu0i6Me/kIyP3wbkypxnZojoEGao14=;
 b=AMfZDKNOKHIeHeQKb4dTh8ioBY1JwHIoL5VzTtCft6e7a4zIJREu3By/57aQCXf1Kq
 r/qnGrwX04t+bMNYT/AfZMPSrI2qE5loT6Ydcxg5WCTFgbURYqwFA0XVjpkvZLDjoyGL
 GchNTp96FQqlFfs1KTLUUqVopLHneWoheTXUHpZKMc82rovsQf28RNu8lUiZIM2VOx80
 BlBVoQT2lo53gST9EF/6z1RIUkmLcHtAsASbZSAVhHIQ3WvhuI9OdHk3s7SUcNDH/mFs
 dH7Hmsm8E4WMj+nDR5BMY4IjJL4yhjeTXDkd+NLlPY3XxCalCCEFjFMBtx3P3S6YrCvW
 yf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+XOQeysAfX0hQEu0i6Me/kIyP3wbkypxnZojoEGao14=;
 b=T0sUtrHSrrZu380o4Vra5vK1BCzFv79SIi+++Byu232N0ze8dwOVRqt6SHFvJF7Men
 FjCxtrKHW8+phZvzFMTPNXOWJbUUt0kKalH8+uIeMX9cYltEBitkqL1gn9ys+XVclySX
 r3pWikbvgTP4RvO0wq8SprJfE9RiDttH3yMaiYyip8SOwHrATYZcR3fjDU2TwSQQwmni
 cfD20PQRpD6jjEqfHPyxngtlFC1V9LwcqzmRgTmy1QggYN6HLthU7xtxOGADsVVCPDBk
 rcEQZU6rZGPtXJ1BegY9TUYyimsxGNEB6AapAj/4is8nBO6AwMNLB1WsirJXT26yEIpi
 dhjg==
X-Gm-Message-State: AOAM531SAD5M6VPZ7Z4FWDG8aSoYCxmwSk3Z1BV08fHFNt0913ZVM60f
 N5PHEjZDXsecSE8OOd/R43Zx22m3WOHcHQ==
X-Google-Smtp-Source: ABdhPJwLVPB3jMI1+uXQimSfLh4wqxhkwd3bnUB7Qzt4EFz/fHxgAjUAbeRaUtL15PRJsDsfTuS4UQ==
X-Received: by 2002:a17:90b:8c5:: with SMTP id
 ds5mr23472789pjb.127.1621831601725; 
 Sun, 23 May 2021 21:46:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c7sm10333311pga.4.2021.05.23.21.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 21:46:41 -0700 (PDT)
Date: Sun, 23 May 2021 21:46:41 -0700 (PDT)
X-Google-Original-Date: Sun, 23 May 2021 21:46:39 PDT (-0700)
Subject: Re: [PATCH 07/38] target/riscv: SIMD 8-bit Shift Instructions
In-Reply-To: <20210212150256.885-8-zhiwei_liu@c-sky.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhiwei_liu@c-sky.com
Message-ID: <mhng-473b2bdf-9ee3-4780-87bf-e8adabce949c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, zhiwei_liu@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021 07:02:25 PST (-0800), zhiwei_liu@c-sky.com wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

I know it's always kind of akward for this type of patches, but IIUC 
they're all supposed to have some sort of description.

> ---
>  target/riscv/helper.h                   |   9 +++
>  target/riscv/insn32.decode              |  17 ++++
>  target/riscv/insn_trans/trans_rvp.c.inc |  16 ++++
>  target/riscv/packed_helper.c            | 102 ++++++++++++++++++++++++
>  4 files changed, 144 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 20bf400ac2..0ecd4d53f9 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1193,3 +1193,12 @@ DEF_HELPER_3(sll16, tl, env, tl, tl)
>  DEF_HELPER_3(ksll16, tl, env, tl, tl)
>  DEF_HELPER_3(kslra16, tl, env, tl, tl)
>  DEF_HELPER_3(kslra16_u, tl, env, tl, tl)
> +
> +DEF_HELPER_3(sra8, tl, env, tl, tl)
> +DEF_HELPER_3(sra8_u, tl, env, tl, tl)
> +DEF_HELPER_3(srl8, tl, env, tl, tl)
> +DEF_HELPER_3(srl8_u, tl, env, tl, tl)
> +DEF_HELPER_3(sll8, tl, env, tl, tl)
> +DEF_HELPER_3(ksll8, tl, env, tl, tl)
> +DEF_HELPER_3(kslra8, tl, env, tl, tl)
> +DEF_HELPER_3(kslra8_u, tl, env, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 6f053bfeb7..cc782fcde5 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -24,6 +24,7 @@
>
>  %sh10    20:10
>  %sh4    20:4
> +%sh3    20:3
>  %csr    20:12
>  %rm     12:3
>  %nf     29:3                     !function=ex_plus_1
> @@ -61,6 +62,7 @@
>
>  @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
>  @sh4     ......  ...... .....  ... ..... ....... &shift  shamt=%sh4      %rs1 %rd
> +@sh3     ......  ...... .....  ... ..... ....... &shift  shamt=%sh3      %rs1 %rd
>  @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
>
>  @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
> @@ -652,3 +654,18 @@ ksll16     0110010  ..... ..... 000 ..... 1111111 @r
>  kslli16    0111010  1.... ..... 000 ..... 1111111 @sh4
>  kslra16    0101011  ..... ..... 000 ..... 1111111 @r
>  kslra16_u  0110011  ..... ..... 000 ..... 1111111 @r
> +
> +sra8       0101100  ..... ..... 000 ..... 1111111 @r
> +sra8_u     0110100  ..... ..... 000 ..... 1111111 @r
> +srai8      0111100  00... ..... 000 ..... 1111111 @sh3
> +srai8_u    0111100  01... ..... 000 ..... 1111111 @sh3
> +srl8       0101101  ..... ..... 000 ..... 1111111 @r
> +srl8_u     0110101  ..... ..... 000 ..... 1111111 @r
> +srli8      0111101  00... ..... 000 ..... 1111111 @sh3
> +srli8_u    0111101  01... ..... 000 ..... 1111111 @sh3
> +sll8       0101110  ..... ..... 000 ..... 1111111 @r
> +slli8      0111110  00... ..... 000 ..... 1111111 @sh3
> +ksll8      0110110  ..... ..... 000 ..... 1111111 @r
> +kslli8     0111110  01... ..... 000 ..... 1111111 @sh3
> +kslra8     0101111  ..... ..... 000 ..... 1111111 @r
> +kslra8_u   0110111  ..... ..... 000 ..... 1111111 @r
> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> index 848edab7e5..12a64849eb 100644
> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> @@ -353,3 +353,19 @@ GEN_RVP_SHIFTI(slli16, sll16, tcg_gen_vec_shl16i_i64);
>  GEN_RVP_SHIFTI(srai16_u, sra16_u, NULL);
>  GEN_RVP_SHIFTI(srli16_u, srl16_u, NULL);
>  GEN_RVP_SHIFTI(kslli16, ksll16, NULL);
> +
> +/* SIMD 8-bit Shift Instructions */
> +GEN_RVP_SHIFT(sra8, tcg_gen_gvec_sars, 0);
> +GEN_RVP_SHIFT(srl8, tcg_gen_gvec_shrs, 0);
> +GEN_RVP_SHIFT(sll8, tcg_gen_gvec_shls, 0);
> +GEN_RVP_R_OOL(sra8_u);
> +GEN_RVP_R_OOL(srl8_u);
> +GEN_RVP_R_OOL(ksll8);
> +GEN_RVP_R_OOL(kslra8);
> +GEN_RVP_R_OOL(kslra8_u);
> +GEN_RVP_SHIFTI(srai8, sra8, tcg_gen_vec_sar8i_i64);
> +GEN_RVP_SHIFTI(srli8, srl8, tcg_gen_vec_shr8i_i64);
> +GEN_RVP_SHIFTI(slli8, sll8, tcg_gen_vec_shl8i_i64);
> +GEN_RVP_SHIFTI(srai8_u, sra8_u, NULL);
> +GEN_RVP_SHIFTI(srli8_u, srl8_u, NULL);
> +GEN_RVP_SHIFTI(kslli8, ksll8, NULL);
> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> index 7e31c2fe46..ab9ebc472b 100644
> --- a/target/riscv/packed_helper.c
> +++ b/target/riscv/packed_helper.c
> @@ -529,3 +529,105 @@ static inline void do_kslra16_u(CPURISCVState *env, void *vd, void *va,
>  }
>
>  RVPR(kslra16_u, 1, 2);
> +
> +/* SIMD 8-bit Shift Instructions */
> +static inline void do_sra8(CPURISCVState *env, void *vd, void *va,
> +                           void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] = a[i] >> shift;
> +}
> +
> +RVPR(sra8, 1, 1);
> +
> +static inline void do_srl8(CPURISCVState *env, void *vd, void *va,
> +                           void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] = a[i] >> shift;
> +}
> +
> +RVPR(srl8, 1, 1);
> +
> +static inline void do_sll8(CPURISCVState *env, void *vd, void *va,
> +                           void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] = a[i] << shift;
> +}
> +
> +RVPR(sll8, 1, 1);
> +
> +static inline void do_sra8_u(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] =  vssra8(env, 0, a[i], shift);
> +}
> +
> +RVPR(sra8_u, 1, 1);
> +
> +static inline void do_srl8_u(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    uint8_t *d = vd, *a = va;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +    d[i] =  vssrl8(env, 0, a[i], shift);
> +}
> +
> +RVPR(srl8_u, 1, 1);
> +
> +static inline void do_ksll8(CPURISCVState *env, void *vd, void *va,
> +                            void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va, result;
> +    uint8_t shift = *(uint8_t *)vb & 0x7;
> +
> +    result = a[i] << shift;
> +    if (shift > (clrsb32(a[i]) - 24)) {
> +        env->vxsat = 0x1;
> +        d[i] = (a[i] & INT8_MIN) ? INT8_MIN : INT8_MAX;
> +    } else {
> +        d[i] = result;
> +    }
> +}
> +
> +RVPR(ksll8, 1, 1);
> +
> +static inline void do_kslra8(CPURISCVState *env, void *vd, void *va,
> +                             void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    int32_t shift = sextract32((*(uint32_t *)vb), 0, 4);
> +
> +    if (shift >= 0) {
> +        do_ksll8(env, vd, va, vb, i);
> +    } else {
> +        shift = -shift;
> +        shift = (shift == 8) ? 7 : shift;
> +        d[i] = a[i] >> shift;
> +    }
> +}
> +
> +RVPR(kslra8, 1, 1);
> +
> +static inline void do_kslra8_u(CPURISCVState *env, void *vd, void *va,
> +                               void *vb, uint8_t i)
> +{
> +    int8_t *d = vd, *a = va;
> +    int32_t shift = sextract32((*(uint32_t *)vb), 0, 4);
> +
> +    if (shift >= 0) {
> +        do_ksll8(env, vd, va, vb, i);
> +    } else {
> +        shift = -shift;
> +        shift = (shift == 8) ? 7 : shift;
> +        d[i] =  vssra8(env, 0, a[i], shift);
> +    }
> +}
> +
> +RVPR(kslra8_u, 1, 1);

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

