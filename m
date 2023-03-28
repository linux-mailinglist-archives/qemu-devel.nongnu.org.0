Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AA46CCB05
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 21:57:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phFQm-0005MJ-9r; Tue, 28 Mar 2023 15:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFQa-0005Iz-7V
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:56:22 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phFQY-0000Wg-B9
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:56:19 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w4so12768555plg.9
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 12:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680033376;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ZoE4+1Vp+EipMNLdu+/RgWWuHQZmJnULTz0Uj4Fb/M=;
 b=c9OJIFkkPUiFlA0w/J+abfh1K0+rhh9jH3/dUHLUubnZNkNb4tN/GrgWBxiEYJgIKW
 NPGmR7nkjl3qWe51cg7NlAM/oyi3LvrRsadY2nIr2Hklu4eUT2bSw7KQM4cHdGzfug8r
 mSIzsApTHeqJ8bDH77A2HV2O5ZNpkCW5cJ/RkjSQc0jMbr3tkClgAnAbkCasiT8ahxKD
 3/EEtb2xv2PTvs3PaotbsB2o3GXq6/v/WhSNX6p0573Ax8c6KWce9VCY3ntS9ewHWjUE
 OiUV/hr6qy70Fl22UownY56udJlTP1mW0zw7Ptlzo1eYpm3PzoBDwHowA0l3DaPr1KaB
 G3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680033376;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZoE4+1Vp+EipMNLdu+/RgWWuHQZmJnULTz0Uj4Fb/M=;
 b=TIRfetFhiDcuExAUAjVaDUnFtBdaskkuONoq5nH+AxfYdzsL8fP2xozFc1MhfpWgJ4
 PFVocp/G8CpbqvVfyvhTbmCszwbkJdWO3dNEjAS2llrx7o6WxS0dTlOkKv1mvQ9duxMF
 d5V+LrirjQvmo3xexrnjd7WgexJAgOEyC+YLcdDCuUvSxDgEIJxF4B6EZBwBvdlK25mr
 QubhIxOH2YAkT7enACXzySCKYxBbK4qAiArqWiaRTtibKu7A4mTdxoGMCet/OcjYUcPA
 5oHaKKNWrBtnTk0fQQhjPq3875p2bde4hraCnVx8cALvCtkuw1zEUmSf6X9XylgRCAvC
 ubfQ==
X-Gm-Message-State: AAQBX9dV2PQrHdqKC0pVgAheJULyg8M0YPH3kJPJC51C1zr61eGM99ux
 8p8p6OO8lv2kvgd+WsbqFU6sjQ==
X-Google-Smtp-Source: AKy350ai1/MXRWH+3oZXoB6nWF5XW28sn4d/k9CT+5rnUwnM7X8mCjT2X8SZgdAQ4FFLSBEXvv2NrQ==
X-Received: by 2002:a17:902:d481:b0:1a1:9020:f9d5 with SMTP id
 c1-20020a170902d48100b001a19020f9d5mr19648861plg.64.1680033376402; 
 Tue, 28 Mar 2023 12:56:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170902968500b0019c3296844csm20192013plp.301.2023.03.28.12.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:56:15 -0700 (PDT)
Message-ID: <e7464e59-ce39-28b2-1cd8-3ba80ef51533@linaro.org>
Date: Tue, 28 Mar 2023 12:56:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 01/44] target/loongarch: Add LSX data type VReg
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/27/23 20:05, Song Gao wrote:
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   linux-user/loongarch64/signal.c |  4 ++--
>   target/loongarch/cpu.c          |  2 +-
>   target/loongarch/cpu.h          | 31 +++++++++++++++++++++++++++++-
>   target/loongarch/gdbstub.c      |  4 ++--
>   target/loongarch/machine.c      | 34 ++++++++++++++++++++++++++++++++-
>   5 files changed, 68 insertions(+), 7 deletions(-)
> 
> diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
> index 7c7afb652e..bb8efb1172 100644
> --- a/linux-user/loongarch64/signal.c
> +++ b/linux-user/loongarch64/signal.c
> @@ -128,7 +128,7 @@ static void setup_sigframe(CPULoongArchState *env,
>   
>       fpu_ctx = (struct target_fpu_context *)(info + 1);
>       for (i = 0; i < 32; ++i) {
> -        __put_user(env->fpr[i], &fpu_ctx->regs[i]);
> +        __put_user(env->fpr[i].vreg.D(0), &fpu_ctx->regs[i]);
>       }
>       __put_user(read_fcc(env), &fpu_ctx->fcc);
>       __put_user(env->fcsr0, &fpu_ctx->fcsr);
> @@ -193,7 +193,7 @@ static void restore_sigframe(CPULoongArchState *env,
>           uint64_t fcc;
>   
>           for (i = 0; i < 32; ++i) {
> -            __get_user(env->fpr[i], &fpu_ctx->regs[i]);
> +            __get_user(env->fpr[i].vreg.D(0), &fpu_ctx->regs[i]);
>           }
>           __get_user(fcc, &fpu_ctx->fcc);
>           write_fcc(env, fcc);
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 97e6579f6a..18b41221a6 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -656,7 +656,7 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>       /* fpr */
>       if (flags & CPU_DUMP_FPU) {
>           for (i = 0; i < 32; i++) {
> -            qemu_fprintf(f, " %s %016" PRIx64, fregnames[i], env->fpr[i]);
> +            qemu_fprintf(f, " %s %016" PRIx64, fregnames[i], env->fpr[i].vreg.D(0));
>               if ((i & 3) == 3) {
>                   qemu_fprintf(f, "\n");
>               }
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index e11c875188..6e5fa6a01d 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -8,6 +8,7 @@
>   #ifndef LOONGARCH_CPU_H
>   #define LOONGARCH_CPU_H
>   
> +#include "qemu/int128.h"
>   #include "exec/cpu-defs.h"
>   #include "fpu/softfloat-types.h"
>   #include "hw/registerfields.h"
> @@ -241,6 +242,34 @@ FIELD(TLB_MISC, ASID, 1, 10)
>   FIELD(TLB_MISC, VPPN, 13, 35)
>   FIELD(TLB_MISC, PS, 48, 6)
>   
> +#define LSX_LEN   (128)
> +typedef union VReg {
> +    int8_t   B[LSX_LEN / 8];
> +    int16_t  H[LSX_LEN / 16];
> +    int32_t  W[LSX_LEN / 32];
> +    int64_t  D[LSX_LEN / 64];
> +    Int128   Q[LSX_LEN / 128];
> +}VReg;
> +
> +typedef union fpr_t fpr_t;
> +union fpr_t {
> +    VReg  vreg;
> +};
> +
> +#if  HOST_BIG_ENDIAN
> +#define B(x)  B[15 - (x)]
> +#define H(x)  H[7 - (x)]
> +#define W(x)  W[3 - (x)]
> +#define D(x)  D[1 - (x)]
> +#define Q(x)  Q[x]
> +#else
> +#define B(x)  B[x]
> +#define H(x)  H[x]
> +#define W(x)  W[x]
> +#define D(x)  D[x]
> +#define Q(x)  Q[x]
> +#endif

It would probably be better to move these rather generically named macros outside of cpu.h 
(e.g. internals.h).

> @@ -33,7 +33,39 @@ const VMStateDescription vmstate_loongarch_cpu = {
>   
>           VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
>           VMSTATE_UINTTL(env.pc, LoongArchCPU),
> -        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
> +        VMSTATE_INT64(env.fpr[0].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[1].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[2].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[3].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[4].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[5].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[6].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[7].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[8].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[9].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[10].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[11].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[12].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[13].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[14].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[15].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[16].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[17].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[18].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[19].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[20].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[21].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[22].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[23].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[24].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[25].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[26].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[27].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[28].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[29].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[30].vreg.D(0), LoongArchCPU),
> +        VMSTATE_INT64(env.fpr[31].vreg.D(0), LoongArchCPU),

Do you care about migration compatibility between qemu versions?
If not, it might be easier to handle the vector registers differently.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


