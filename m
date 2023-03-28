Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC436CCB9F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:48:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phGDK-0004Bq-Iy; Tue, 28 Mar 2023 16:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phGDH-0004BU-3s
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:46:39 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phGDD-0000R0-8N
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:46:37 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so16388636pjb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680036393;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QGyGmOT0P3OKvkd8zxJewUrvMIhSe5wkiaizNoYu0v8=;
 b=kBJA+pV+22csuzcC+dvuqA9CDiXyGzY1kGLxXBq27dHszpkz557ngIBgIhavF3VqMc
 OfKt3J1WO1PIoBsoMWPMzKAmoQZZI6Uzf7FXapjaqx3PTW+GFyI1+DRIdxDS3RagPwNA
 HABntwMkyikPzXnJYER8ceP5Nu5RTBOjroIyaDcfaiRKIfvE7f9LNZkw3RsDFZ+6PDyk
 hd75KQ7j1eLm3jZnHOJlvfoME3g4JXg41J4WTfsBtLb+RG/Irc17MwvoDhxZ1bX3oVOx
 I3P20clp5XPdBFJEq6ON2I2PeKeoSooXyby6X645g5ILhbTuV9+QZwNmnA/GyzAKkg09
 mkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680036393;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QGyGmOT0P3OKvkd8zxJewUrvMIhSe5wkiaizNoYu0v8=;
 b=m7xvFa4GW511PiIPfeZAuBKEbDanUt3d0A2pGHY2Nd7j5POlYphF2MpDR9GzhLsO+g
 /IwIClVdDXwvOFfSH20JJN6APbb7u6LFYZi1f44vUG43p+VPzZg2cZX0r0/W8w0DNYsi
 kBqtUIhn7daPCIKSIQgnFx3iOggNoTfhomiFhq+HNx66XkpyNd9IbZpDoEkgYzmtuTN+
 xJd880TlQ++nDiQP/QCasZ3/e2DQDaxrqTGY932bLh9InzQ3BCX1rp3QkMqF7suwZO6O
 YMreRANTwEdjr5JIdr9MudxEMc/+2QP0HUHy42oyfdaCNoOvVUDstxc/hPrwWBTvjvTX
 n6Nw==
X-Gm-Message-State: AAQBX9epFQJWNtWEErw+k+CdLmGH+fw78CJY4XSYqA3xh7eoRlFDTHvr
 RjadocK+by6/TuMmxYlFritEBQ==
X-Google-Smtp-Source: AKy350ZE57uXPzxhAMtppFPoca7qSCb6qYeV/kfFPrd0fOqgrNA0B1+gxjIGhkZRAS6Sr9NGKgC5iQ==
X-Received: by 2002:a17:90b:3148:b0:23b:49ad:a350 with SMTP id
 ip8-20020a17090b314800b0023b49ada350mr18490310pjb.9.1680036393549; 
 Tue, 28 Mar 2023 13:46:33 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 iw4-20020a170903044400b0019a97a4324dsm21723136plb.5.2023.03.28.13.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:46:32 -0700 (PDT)
Message-ID: <732518bf-6832-aac8-cd8a-367ef68831f1@linaro.org>
Date: Tue, 28 Mar 2023 13:46:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 15/44] target/loongarch: Implement
 vmul/vmuh/vmulw{ev/od}
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-16-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-16-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VMUL.{B/H/W/D};
> - VMUH.{B/H/W/D}[U];
> - VMULW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
> - VMULW{EV/OD}.{H.BU.B/W.HU.H/D.WU.W/Q.DU.D}.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  38 ++
>   target/loongarch/helper.h                   |  36 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 378 ++++++++++++++++++++
>   target/loongarch/insns.decode               |  38 ++
>   target/loongarch/lsx_helper.c               | 140 ++++++++
>   5 files changed, 630 insertions(+)
> 
> diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
> index 6b0e518bfa..48e6ef5309 100644
> --- a/target/loongarch/disas.c
> +++ b/target/loongarch/disas.c
> @@ -972,3 +972,41 @@ INSN_LSX(vmini_bu,         vv_i)
>   INSN_LSX(vmini_hu,         vv_i)
>   INSN_LSX(vmini_wu,         vv_i)
>   INSN_LSX(vmini_du,         vv_i)
> +
> +INSN_LSX(vmul_b,           vvv)
> +INSN_LSX(vmul_h,           vvv)
> +INSN_LSX(vmul_w,           vvv)
> +INSN_LSX(vmul_d,           vvv)
> +INSN_LSX(vmuh_b,           vvv)
> +INSN_LSX(vmuh_h,           vvv)
> +INSN_LSX(vmuh_w,           vvv)
> +INSN_LSX(vmuh_d,           vvv)
> +INSN_LSX(vmuh_bu,          vvv)
> +INSN_LSX(vmuh_hu,          vvv)
> +INSN_LSX(vmuh_wu,          vvv)
> +INSN_LSX(vmuh_du,          vvv)
> +
> +INSN_LSX(vmulwev_h_b,      vvv)
> +INSN_LSX(vmulwev_w_h,      vvv)
> +INSN_LSX(vmulwev_d_w,      vvv)
> +INSN_LSX(vmulwev_q_d,      vvv)
> +INSN_LSX(vmulwod_h_b,      vvv)
> +INSN_LSX(vmulwod_w_h,      vvv)
> +INSN_LSX(vmulwod_d_w,      vvv)
> +INSN_LSX(vmulwod_q_d,      vvv)
> +INSN_LSX(vmulwev_h_bu,     vvv)
> +INSN_LSX(vmulwev_w_hu,     vvv)
> +INSN_LSX(vmulwev_d_wu,     vvv)
> +INSN_LSX(vmulwev_q_du,     vvv)
> +INSN_LSX(vmulwod_h_bu,     vvv)
> +INSN_LSX(vmulwod_w_hu,     vvv)
> +INSN_LSX(vmulwod_d_wu,     vvv)
> +INSN_LSX(vmulwod_q_du,     vvv)
> +INSN_LSX(vmulwev_h_bu_b,   vvv)
> +INSN_LSX(vmulwev_w_hu_h,   vvv)
> +INSN_LSX(vmulwev_d_wu_w,   vvv)
> +INSN_LSX(vmulwev_q_du_d,   vvv)
> +INSN_LSX(vmulwod_h_bu_b,   vvv)
> +INSN_LSX(vmulwod_w_hu_h,   vvv)
> +INSN_LSX(vmulwod_d_wu_w,   vvv)
> +INSN_LSX(vmulwod_q_du_d,   vvv)
> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
> index f0fc7760bd..437b47fa78 100644
> --- a/target/loongarch/helper.h
> +++ b/target/loongarch/helper.h
> @@ -246,3 +246,39 @@ DEF_HELPER_FLAGS_4(vmaxi_bu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
>   DEF_HELPER_FLAGS_4(vmaxi_hu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
>   DEF_HELPER_FLAGS_4(vmaxi_wu, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
>   DEF_HELPER_FLAGS_4(vmaxi_du, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
> +
> +DEF_HELPER_FLAGS_4(vmuh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmuh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmuh_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmuh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmuh_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmuh_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmuh_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmuh_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +
> +DEF_HELPER_FLAGS_4(vmulwev_h_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwev_w_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwev_d_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwev_q_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_h_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_w_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_d_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_q_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +
> +DEF_HELPER_FLAGS_4(vmulwev_h_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwev_w_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwev_d_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwev_q_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_h_bu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_w_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_d_wu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_q_du, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +
> +DEF_HELPER_FLAGS_4(vmulwev_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwev_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwev_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwev_q_du_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_h_bu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_w_hu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_d_wu_w, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(vmulwod_q_du_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
> index 4e2f1ff097..583b608cd2 100644
> --- a/target/loongarch/insn_trans/trans_lsx.c.inc
> +++ b/target/loongarch/insn_trans/trans_lsx.c.inc
> @@ -1533,3 +1533,381 @@ TRANS(vmaxi_bu, gvec_vv_i, MO_8, do_vmaxi_u)
>   TRANS(vmaxi_hu, gvec_vv_i, MO_16, do_vmaxi_u)
>   TRANS(vmaxi_wu, gvec_vv_i, MO_32, do_vmaxi_u)
>   TRANS(vmaxi_du, gvec_vv_i, MO_64, do_vmaxi_u)
> +
> +TRANS(vmul_b, gvec_vvv, MO_8, tcg_gen_gvec_mul)
> +TRANS(vmul_h, gvec_vvv, MO_16, tcg_gen_gvec_mul)
> +TRANS(vmul_w, gvec_vvv, MO_32, tcg_gen_gvec_mul)
> +TRANS(vmul_d, gvec_vvv, MO_64, tcg_gen_gvec_mul)
> +
> +static void do_vmuh_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
> +                      uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
> +{
> +    static const GVecGen3 op[4] = {
> +        {
> +            .fno = gen_helper_vmuh_b,
> +            .vece = MO_8
> +        },
> +        {
> +            .fno = gen_helper_vmuh_h,
> +            .vece = MO_16
> +        },
> +        {
> +            .fno = gen_helper_vmuh_w,
> +            .vece = MO_32
> +        },
> +        {
> +            .fno = gen_helper_vmuh_d,
> +            .vece = MO_64
> +        },
> +    };

Could be worth integer expansion, especially for MO_32/MO_64?
Should be trivial...

> +static void do_vmulwev_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
> +                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
> +{
> +    static const TCGOpcode vecop_list[] = {
> +        INDEX_op_shli_vec, INDEX_op_sari_vec, INDEX_op_mul_vec, 0
> +        };
> +    static const GVecGen3 op[4] = {
> +        {
> +            .fniv = gen_vmulwev_s,
> +            .fno = gen_helper_vmulwev_h_b,
> +            .opt_opc = vecop_list,
> +            .vece = MO_16
> +        },
> +        {
> +            .fniv = gen_vmulwev_s,
> +            .fno = gen_helper_vmulwev_w_h,
> +            .opt_opc = vecop_list,
> +            .vece = MO_32
> +        },
> +        {
> +            .fniv = gen_vmulwev_s,
> +            .fno = gen_helper_vmulwev_d_w,
> +            .opt_opc = vecop_list,
> +            .vece = MO_64
> +        },
> +        {
> +            .fno = gen_helper_vmulwev_q_d,
> +            .vece = MO_128
> +        },
> +    };

Likewise.  And MO_128 may be had via tcg_gen_muls2_i64.

> +static void do_vmulwev_u(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
> +                         uint32_t vk_ofs, uint32_t oprsz, uint32_t maxsz)
> +{
> +    static const TCGOpcode vecop_list[] = {
> +        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_mul_vec, 0
> +        };
> +    static const GVecGen3 op[4] = {
> +        {
> +            .fniv = gen_vmulwev_u,
> +            .fno = gen_helper_vmulwev_h_bu,
> +            .opt_opc = vecop_list,
> +            .vece = MO_16
> +        },
> +        {
> +            .fniv = gen_vmulwev_u,
> +            .fno = gen_helper_vmulwev_w_hu,
> +            .opt_opc = vecop_list,
> +            .vece = MO_32
> +        },
> +        {
> +            .fniv = gen_vmulwev_u,
> +            .fno = gen_helper_vmulwev_d_wu,
> +            .opt_opc = vecop_list,
> +            .vece = MO_64
> +        },
> +        {
> +            .fno = gen_helper_vmulwev_q_du,
> +            .vece = MO_128
> +        },
> +    };

tcg_gen_mulu2_i64.


r~

