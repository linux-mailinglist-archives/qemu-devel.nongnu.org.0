Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917563EA2FD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 12:35:06 +0200 (CEST)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE83F-0003jw-Ix
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 06:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mE82I-0002aa-V6
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:34:06 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mE82F-0000Fl-R3
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:34:06 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so2712594wma.0
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 03:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mDETTrPvtY6A1qWyGKOG2/CXIx0tiHhkAg/zvp7FWC8=;
 b=kCqiDCtd/87VY65COgNuQqi7vaS9fveN8R7Q9Ugzjbe0/9e9xq30d5Lcw2OzTZ6rB8
 /1/yr8h0Kc4d4J//p1+bGgjrezC78GINDep7ygHZGg7MD4Z6AER4gncH/FbDnb7bt5eP
 GC6HADJUpwqAM9eqKtIxLPsq2dc7eLI2yaWCVnFJg8IWsNGB46Fi3OdtVDxIIcVTCkIf
 DeuDYvFFjZ/JKlB8KvFpk/zTkd6t+wWUcUQ0TsVgPjiz6OTw3YMuUQjvQmWfzYzo4dJP
 QW7tK+Zje04CkfIcc8GfNruJTmjoLrOQF5PZZ3PXgXEeHj5TZAQq9XUj3ZhsHMVUp/Qj
 DDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mDETTrPvtY6A1qWyGKOG2/CXIx0tiHhkAg/zvp7FWC8=;
 b=Zdr/rtdW2wvgsZTuROPQOVjQlPP3TYstWUEJZV6dwTmJM8xU+RNIN6UT2/3yqw1ccZ
 tk1gIEHaoEcvxi5cvo3IBEcYAsvuempzLRnHQAQDUeNRktnWmIbDKxSYbsq8elb+b+XH
 R/3J2PvfB98uGYlVfXcHQRUDnofWNob/gFBn3mKKFtFFREaVlR8s2UttacIVWNUMmCRt
 LYVL9IL0LU2vhMC7xeVJaO0yI0UuinihnmTF720pXsc8+/j5jnHU2WVfV6Tgl3TKvxOY
 QVX4hmHmRfbj26ahEm42bIbn7skswzDn2au3VnYH5uAnxoaDlqV0MWXOb5G5V0QDru7q
 gJZg==
X-Gm-Message-State: AOAM530rTUaI5DRcHtZJoalI5bPipgqbQaZuSuiyhrJm5LTdZN3Nzu3a
 16aHsZcU8MYRJuc0dHC0kM0=
X-Google-Smtp-Source: ABdhPJwnDWdrGEegu0BfCUWZJEtDMepJjWHC4vbH+T3DOkoCnJKXii0uAWbql+pmcObyFWi/LienWw==
X-Received: by 2002:a1c:2747:: with SMTP id n68mr5025452wmn.100.1628764441674; 
 Thu, 12 Aug 2021 03:34:01 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j6sm2096401wms.44.2021.08.12.03.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 03:34:00 -0700 (PDT)
Subject: Re: [PATCH v2 19/22] target/loongarch: Add disassembler
To: richard.henderson@linaro.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-20-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7f8002a2-f31c-4ba7-4e94-099eded691ce@amsat.org>
Date: Thu, 12 Aug 2021 12:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-20-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, maobibo@loongson.cn,
 qemu-devel@nongnu.org, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 7/21/21 11:53 AM, Song Gao wrote:
> This patch add support for disassembling via option '-d in_asm'.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  MAINTAINERS             |    1 +
>  disas/loongarch.c       | 2511 +++++++++++++++++++++++++++++++++++++++++++++++
>  disas/meson.build       |    1 +
>  include/disas/dis-asm.h |    2 +
>  meson.build             |    1 +
>  5 files changed, 2516 insertions(+)
>  create mode 100644 disas/loongarch.c

> +/* decode opcode */
> +static void decode_insn_opcode(la_decode *dec)
> +{
> +    uint32_t insn = dec->insn;
> +    uint16_t op = la_op_illegal;
> +    switch ((insn >> 26) & 0x3f) {
> +    case 0x0:
> +        switch ((insn >> 22) & 0xf) {
> +        case 0x0:
> +            switch ((insn >> 18) & 0xf) {
> +            case 0x0:
> +                switch ((insn >> 15) & 0x7) {
> +                case 0x0:
> +                    switch ((insn >> 10) & 0x1f) {
> +                    case 0x4:
> +                        op = la_op_clo_w;
> +                        break;
> +                    case 0x5:
> +                        op = la_op_clz_w;
> +                        break;
> +                    case 0x6:
> +                        op = la_op_cto_w;
> +                        break;
> +                    case 0x7:
> +                        op = la_op_ctz_w;
> +                        break;
> +                    case 0x8:
> +                        op = la_op_clo_d;
> +                        break;
> +                    case 0x9:
> +                        op = la_op_clz_d;
> +                        break;
> +                    case 0xa:
> +                        op = la_op_cto_d;
> +                        break;
> +                    case 0xb:
> +                        op = la_op_ctz_d;
> +                        break;
> +                    case 0xc:
> +                        op = la_op_revb_2h;
> +                        break;
> +                    case 0xd:
> +                        op = la_op_revb_4h;
> +                        break;
> +                    case 0xe:
> +                        op = la_op_revb_2w;
> +                        break;
> +                    case 0xf:
> +                        op = la_op_revb_d;
> +                        break;
> +                    case 0x10:
> +                        op = la_op_revh_2w;
> +                        break;
> +                    case 0x11:
> +                        op = la_op_revh_d;
> +                        break;
> +                    case 0x12:
> +                        op = la_op_bitrev_4b;
> +                        break;
> +                    case 0x13:
> +                        op = la_op_bitrev_8b;
> +                        break;
> +                    case 0x14:
> +                        op = la_op_bitrev_w;
> +                        break;
> +                    case 0x15:
> +                        op = la_op_bitrev_d;
> +                        break;
> +                    case 0x16:
> +                        op = la_op_ext_w_h;
> +                        break;
> +                    case 0x17:
> +                        op = la_op_ext_w_b;
> +                        break;
> +                    case 0x18:
> +                        op = la_op_rdtimel_w;
> +                        break;
> +                    case 0x19:
> +                        op = la_op_rdtimeh_w;
> +                        break;
> +                    case 0x1a:
> +                        op = la_op_rdtime_d;
> +                        break;
> +                    case 0x1b:
> +                        op = la_op_cpucfg;
> +                        break;
> +                    }
> +                    break;
> +                case 0x2:
> +                    switch (insn & 0x0000001f) {
> +                    case 0x00000000:
> +                        op = la_op_asrtle_d;
> +                        break;
> +                    }
> +                    break;
> +                case 0x3:
> +                    switch (insn & 0x0000001f) {
> +                    case 0x00000000:
> +                        op = la_op_asrtgt_d;
> +                        break;
> +                    }
> +                    break;
> +                }
> +                break;
> +            case 0x1:
> +                switch ((insn >> 17) & 0x1) {
> +                case 0x0:
> +                    op = la_op_alsl_w;
> +                    break;
> +                case 0x1:
> +                    op = la_op_alsl_wu;
> +                    break;
> +                }
> +                break;
> +            case 0x2:
> +                switch ((insn >> 17) & 0x1) {
> +                case 0x0:
> +                    op = la_op_bytepick_w;
> +                    break;
> +                }
> +                break;
> +            case 0x3:
> +                op = la_op_bytepick_d;
> +                break;
> +            case 0x4:
> +                switch ((insn >> 15) & 0x7) {
> +                case 0x0:
> +                    op = la_op_add_w;
> +                    break;
> +                case 0x1:
> +                    op = la_op_add_d;
> +                    break;
> +                case 0x2:
> +                    op = la_op_sub_w;
> +                    break;
> +                case 0x3:
> +                    op = la_op_sub_d;
> +                    break;
> +                case 0x4:
> +                    op = la_op_slt;
> +                    break;
> +                case 0x5:
> +                    op = la_op_sltu;
> +                    break;
> +                case 0x6:
> +                    op = la_op_maskeqz;
> +                    break;
> +                case 0x7:
> +                    op = la_op_masknez;
> +                    break;
> +                }
> +                break;
> +            case 0x5:
> +                switch ((insn >> 15) & 0x7) {
> +                case 0x0:
> +                    op = la_op_nor;
> +                    break;
> +                case 0x1:
> +                    op = la_op_and;
> +                    break;
> +                case 0x2:
> +                    op = la_op_or;
> +                    break;
> +                case 0x3:
> +                    op = la_op_xor;
> +                    break;
> +                case 0x4:
> +                    op = la_op_orn;
> +                    break;
> +                case 0x5:
> +                    op = la_op_andn;
> +                    break;
> +                case 0x6:
> +                    op = la_op_sll_w;
> +                    break;
> +                case 0x7:
> +                    op = la_op_srl_w;
> +                    break;
> +                }
> +                break;
> +            case 0x6:
> +                switch ((insn >> 15) & 0x7) {
> +                case 0x0:
> +                    op = la_op_sra_w;
> +                    break;
> +                case 0x1:
> +                    op = la_op_sll_d;
> +                    break;
> +                case 0x2:
> +                    op = la_op_srl_d;
> +                    break;
> +                case 0x3:
> +                    op = la_op_sra_d;
> +                    break;
> +                case 0x6:
> +                    op = la_op_rotr_w;
> +                    break;
> +                case 0x7:
> +                    op = la_op_rotr_d;
> +                    break;
> +                }
> +                break;
> +            case 0x7:
> +                switch ((insn >> 15) & 0x7) {
> +                case 0x0:
> +                    op = la_op_mul_w;
> +                    break;
> +                case 0x1:
> +                    op = la_op_mulh_w;
> +                    break;
> +                case 0x2:
> +                    op = la_op_mulh_wu;
> +                    break;
> +                case 0x3:
> +                    op = la_op_mul_d;
> +                    break;
> +                case 0x4:
> +                    op = la_op_mulh_d;
> +                    break;
> +                case 0x5:
> +                    op = la_op_mulh_du;
> +                    break;
> +                case 0x6:
> +                    op = la_op_mulw_d_w;
> +                    break;
> +                case 0x7:
> +                    op = la_op_mulw_d_wu;
> +                    break;
> +                }
> +                break;
> +            case 0x8:
> +                switch ((insn >> 15) & 0x7) {
> +                case 0x0:
> +                    op = la_op_div_w;
> +                    break;
> +                case 0x1:
> +                    op = la_op_mod_w;
> +                    break;
> +                case 0x2:
> +                    op = la_op_div_wu;
> +                    break;
> +                case 0x3:
> +                    op = la_op_mod_wu;
> +                    break;
> +                case 0x4:
> +                    op = la_op_div_d;
> +                    break;
> +                case 0x5:
> +                    op = la_op_mod_d;
> +                    break;
> +                case 0x6:
> +                    op = la_op_div_du;
> +                    break;
> +                case 0x7:
> +                    op = la_op_mod_du;
> +                    break;
> +                }
> +                break;
> +            case 0x9:
> +                switch ((insn >> 15) & 0x7) {
> +                case 0x0:
> +                    op = la_op_crc_w_b_w;
> +                    break;
> +                case 0x1:
> +                    op = la_op_crc_w_h_w;
> +                    break;
> +                case 0x2:
> +                    op = la_op_crc_w_w_w;
> +                    break;
> +                case 0x3:
> +                    op = la_op_crc_w_d_w;
> +                    break;
> +                case 0x4:
> +                    op = la_op_crcc_w_b_w;
> +                    break;
> +                case 0x5:
> +                    op = la_op_crcc_w_h_w;
> +                    break;
> +                case 0x6:
> +                    op = la_op_crcc_w_w_w;
> +                    break;
> +                case 0x7:
> +                    op = la_op_crcc_w_d_w;
> +                    break;
> +                }
> +                break;
> +            case 0xa:
> +                switch ((insn >> 15) & 0x7) {
> +                case 0x4:
> +                    op = la_op_break;
> +                    break;
> +                case 0x6:
> +                    op = la_op_syscall;
> +                    break;
> +                }
> +                break;
> +            case 0xb:
> +                switch ((insn >> 17) & 0x1) {
> +                case 0x0:
> +                    op = la_op_alsl_d;
> +                    break;
> +                }
> +                break;
> +            }
> +            break;
> +        case 0x1:
> +            switch ((insn >> 21) & 0x1) {
> +            case 0x0:
> +                switch ((insn >> 16) & 0x1f) {
> +                case 0x0:
> +                    switch ((insn >> 15) & 0x1) {
> +                    case 0x1:
> +                        op = la_op_slli_w;
> +                        break;
> +                    }
> +                    break;
> +                case 0x1:
> +                    op = la_op_slli_d;
> +                    break;
> +                case 0x4:
> +                    switch ((insn >> 15) & 0x1) {
> +                    case 0x1:
> +                        op = la_op_srli_w;
> +                        break;
> +                    }
> +                    break;
> +                case 0x5:
> +                    op = la_op_srli_d;
> +                    break;
> +                case 0x8:
> +                    switch ((insn >> 15) & 0x1) {
> +                    case 0x1:
> +                        op = la_op_srai_w;
> +                        break;
> +                    }
> +                    break;
> +                case 0x9:
> +                    op = la_op_srai_d;
> +                    break;
> +                case 0xc:
> +                    switch ((insn >> 15) & 0x1) {
> +                    case 0x1:
> +                        op = la_op_rotri_w;
> +                        break;
> +                    }
> +                    break;
> +                case 0xd:
> +                    op = la_op_rotri_d;
> +                    break;
> +                }
> +                break;
> +            case 0x1:
> +                switch ((insn >> 15) & 0x1) {
> +                case 0x0:
> +                    op = la_op_bstrins_w;
> +                    break;
> +                case 0x1:
> +                    op = la_op_bstrpick_w;
> +                    break;
> +                }
> +                break;
> +            }
> +            break;
> +        case 0x2:
> +            op = la_op_bstrins_d;
> +            break;
> +        case 0x3:
> +            op = la_op_bstrpick_d;
> +            break;
> +        case 0x4:
> +            switch ((insn >> 15) & 0x7f) {
> +            case 0x1:
> +                op = la_op_fadd_s;
> +                break;
> +            case 0x2:
> +                op = la_op_fadd_d;
> +                break;
> +            case 0x5:
> +                op = la_op_fsub_s;
> +                break;
> +            case 0x6:
> +                op = la_op_fsub_d;
> +                break;
> +            case 0x9:
> +                op = la_op_fmul_s;
> +                break;
> +            case 0xa:
> +                op = la_op_fmul_d;
> +                break;
> +            case 0xd:
> +                op = la_op_fdiv_s;
> +                break;
> +            case 0xe:
> +                op = la_op_fdiv_d;
> +                break;
> +            case 0x11:
> +                op = la_op_fmax_s;
> +                break;
> +            case 0x12:
> +                op = la_op_fmax_d;
> +                break;
> +            case 0x15:
> +                op = la_op_fmin_s;
> +                break;
> +            case 0x16:
> +                op = la_op_fmin_d;
> +                break;
> +            case 0x19:
> +                op = la_op_fmaxa_s;
> +                break;
> +            case 0x1a:
> +                op = la_op_fmaxa_d;
> +                break;
> +            case 0x1d:
> +                op = la_op_fmina_s;
> +                break;
> +            case 0x1e:
> +                op = la_op_fmina_d;
> +                break;
> +            case 0x21:
> +                op = la_op_fscaleb_s;
> +                break;
> +            case 0x22:
> +                op = la_op_fscaleb_d;
> +                break;
> +            case 0x25:
> +                op = la_op_fcopysign_s;
> +                break;
> +            case 0x26:
> +                op = la_op_fcopysign_d;
> +                break;
> +            case 0x28:
> +                switch ((insn >> 10) & 0x1f) {
> +                case 0x1:
> +                    op = la_op_fabs_s;
> +                    break;
> +                case 0x2:
> +                    op = la_op_fabs_d;
> +                    break;
> +                case 0x5:
> +                    op = la_op_fneg_s;
> +                    break;
> +                case 0x6:
> +                    op = la_op_fneg_d;
> +                    break;
> +                case 0x9:
> +                    op = la_op_flogb_s;
> +                    break;
> +                case 0xa:
> +                    op = la_op_flogb_d;
> +                    break;
> +                case 0xd:
> +                    op = la_op_fclass_s;
> +                    break;
> +                case 0xe:
> +                    op = la_op_fclass_d;
> +                    break;
> +                case 0x11:
> +                    op = la_op_fsqrt_s;
> +                    break;
> +                case 0x12:
> +                    op = la_op_fsqrt_d;
> +                    break;
> +                case 0x15:
> +                    op = la_op_frecip_s;
> +                    break;
> +                case 0x16:
> +                    op = la_op_frecip_d;
> +                    break;
> +                case 0x19:
> +                    op = la_op_frsqrt_s;
> +                    break;
> +                case 0x1a:
> +                    op = la_op_frsqrt_d;
> +                    break;
> +                }
> +                break;
> +            case 0x29:
> +                switch ((insn >> 10) & 0x1f) {
> +                case 0x5:
> +                    op = la_op_fmov_s;
> +                    break;
> +                case 0x6:
> +                    op = la_op_fmov_d;
> +                    break;
> +                case 0x9:
> +                    op = la_op_movgr2fr_w;
> +                    break;
> +                case 0xa:
> +                    op = la_op_movgr2fr_d;
> +                    break;
> +                case 0xb:
> +                    op = la_op_movgr2frh_w;
> +                    break;
> +                case 0xd:
> +                    op = la_op_movfr2gr_s;
> +                    break;
> +                case 0xe:
> +                    op = la_op_movfr2gr_d;
> +                    break;
> +                case 0xf:
> +                    op = la_op_movfrh2gr_s;
> +                    break;
> +                case 0x10:
> +                    op = la_op_movgr2fcsr;
> +                    break;
> +                case 0x12:
> +                    op = la_op_movfcsr2gr;
> +                    break;
> +                case 0x14:
> +                    switch ((insn >> 3) & 0x3) {
> +                    case 0x0:
> +                        op = la_op_movfr2cf;
> +                        break;
> +                    }
> +                    break;
> +                case 0x15:
> +                    switch ((insn >> 8) & 0x3) {
> +                    case 0x0:
> +                        op = la_op_movcf2fr;
> +                        break;
> +                    }
> +                    break;
> +                case 0x16:
> +                    switch ((insn >> 3) & 0x3) {
> +                    case 0x0:
> +                        op = la_op_movgr2cf;
> +                        break;
> +                    }
> +                    break;
> +                case 0x17:
> +                    switch ((insn >> 8) & 0x3) {
> +                    case 0x0:
> +                        op = la_op_movcf2gr;
> +                        break;
> +                    }
> +                    break;
> +                }
> +                break;
> +            case 0x32:
> +                switch ((insn >> 10) & 0x1f) {
> +                case 0x6:
> +                    op = la_op_fcvt_s_d;
> +                    break;
> +                case 0x9:
> +                    op = la_op_fcvt_d_s;
> +                    break;
> +                }
> +                break;
> +            case 0x34:
> +                switch ((insn >> 10) & 0x1f) {
> +                case 0x1:
> +                    op = la_op_ftintrm_w_s;
> +                    break;
> +                case 0x2:
> +                    op = la_op_ftintrm_w_d;
> +                    break;
> +                case 0x9:
> +                    op = la_op_ftintrm_l_s;
> +                    break;
> +                case 0xa:
> +                    op = la_op_ftintrm_l_d;
> +                    break;
> +                case 0x11:
> +                    op = la_op_ftintrp_w_s;
> +                    break;
> +                case 0x12:
> +                    op = la_op_ftintrp_w_d;
> +                    break;
> +                case 0x19:
> +                    op = la_op_ftintrp_l_s;
> +                    break;
> +                case 0x1a:
> +                    op = la_op_ftintrp_l_d;
> +                    break;
> +                }
> +                break;
> +            case 0x35:
> +                switch ((insn >> 10) & 0x1f) {
> +                case 0x1:
> +                    op = la_op_ftintrz_w_s;
> +                    break;
> +                case 0x2:
> +                    op = la_op_ftintrz_w_d;
> +                    break;
> +                case 0x9:
> +                    op = la_op_ftintrz_l_s;
> +                    break;
> +                case 0xa:
> +                    op = la_op_ftintrz_l_d;
> +                    break;
> +                case 0x11:
> +                    op = la_op_ftintrne_w_s;
> +                    break;
> +                case 0x12:
> +                    op = la_op_ftintrne_w_d;
> +                    break;
> +                case 0x19:
> +                    op = la_op_ftintrne_l_s;
> +                    break;
> +                case 0x1a:
> +                    op = la_op_ftintrne_l_d;
> +                    break;
> +                }
> +                break;
> +            case 0x36:
> +                switch ((insn >> 10) & 0x1f) {
> +                case 0x1:
> +                    op = la_op_ftint_w_s;
> +                    break;
> +                case 0x2:
> +                    op = la_op_ftint_w_d;
> +                    break;
> +                case 0x9:
> +                    op = la_op_ftint_l_s;
> +                    break;
> +                case 0xa:
> +                    op = la_op_ftint_l_d;
> +                    break;
> +                }
> +                break;
> +            case 0x3a:
> +                switch ((insn >> 10) & 0x1f) {
> +                case 0x4:
> +                    op = la_op_ffint_s_w;
> +                    break;
> +                case 0x6:
> +                    op = la_op_ffint_s_l;
> +                    break;
> +                case 0x8:
> +                    op = la_op_ffint_d_w;
> +                    break;
> +                case 0xa:
> +                    op = la_op_ffint_d_l;
> +                    break;
> +                }
> +                break;
> +            case 0x3c:
> +                switch ((insn >> 10) & 0x1f) {
> +                case 0x11:
> +                    op = la_op_frint_s;
> +                    break;
> +                case 0x12:
> +                    op = la_op_frint_d;
> +                    break;
> +                }
> +                break;
> +            }
> +            break;
> +        case 0x8:
> +            op = la_op_slti;
> +            break;
> +        case 0x9:
> +            op = la_op_sltui;
> +            break;
> +        case 0xa:
> +            op = la_op_addi_w;
> +            break;
> +        case 0xb:
> +            op = la_op_addi_d;
> +            break;
> +        case 0xc:
> +            op = la_op_lu52i_d;
> +            break;
> +        case 0xd:
> +            op = la_op_addi;
> +            break;
> +        case 0xe:
> +            op = la_op_ori;
> +            break;
> +        case 0xf:
> +            op = la_op_xori;
> +            break;
> +        }
> +        break;
> +    case 0x2:
> +        switch ((insn >> 20) & 0x3f) {
> +        case 0x1:
> +            op = la_op_fmadd_s;
> +            break;
> +        case 0x2:
> +            op = la_op_fmadd_d;
> +            break;
> +        case 0x5:
> +            op = la_op_fmsub_s;
> +            break;
> +        case 0x6:
> +            op = la_op_fmsub_d;
> +            break;
> +        case 0x9:
> +            op = la_op_fnmadd_s;
> +            break;
> +        case 0xa:
> +            op = la_op_fnmadd_d;
> +            break;
> +        case 0xd:
> +            op = la_op_fnmsub_s;
> +            break;
> +        case 0xe:
> +            op = la_op_fnmsub_d;
> +            break;
> +        }
> +        break;
> +    case 0x3:
> +        switch ((insn >> 20) & 0x3f) {
> +        case 0x1:
> +            switch ((insn >> 3) & 0x3) {
> +            case 0x0:
> +                op = la_op_fcmp_cond_s;
> +                break;
> +            }
> +            break;
> +        case 0x2:
> +            switch ((insn >> 3) & 0x3) {
> +            case 0x0:
> +                op = la_op_fcmp_cond_d;
> +                break;
> +            }
> +            break;
> +        case 0x10:
> +            switch ((insn >> 18) & 0x3) {
> +            case 0x0:
> +                op = la_op_fsel;
> +                break;
> +            }
> +            break;
> +        }
> +        break;
> +    case 0x4:
> +        op = la_op_addu16i_d;
> +        break;
> +    case 0x5:
> +        switch ((insn >> 25) & 0x1) {
> +        case 0x0:
> +            op = la_op_lu12i_w;
> +            break;
> +        case 0x1:
> +            op = la_op_lu32i_d;
> +            break;
> +        }
> +        break;
> +    case 0x6:
> +        switch ((insn >> 25) & 0x1) {
> +        case 0x0:
> +            op = la_op_pcaddi;
> +            break;
> +        case 0x1:
> +            op = la_op_pcalau12i;
> +            break;
> +        }
> +        break;
> +    case 0x7:
> +        switch ((insn >> 25) & 0x1) {
> +        case 0x0:
> +            op = la_op_pcaddu12i;
> +            break;
> +        case 0x1:
> +            op = la_op_pcaddu18i;
> +            break;
> +        }
> +        break;
> +    case 0x8:
> +        switch ((insn >> 24) & 0x3) {
> +        case 0x0:
> +            op = la_op_ll_w;
> +            break;
> +        case 0x1:
> +            op = la_op_sc_w;
> +            break;
> +        case 0x2:
> +            op = la_op_ll_d;
> +            break;
> +        case 0x3:
> +            op = la_op_sc_d;
> +            break;
> +        }
> +        break;
> +    case 0x9:
> +        switch ((insn >> 24) & 0x3) {
> +        case 0x0:
> +            op = la_op_ldptr_w;
> +            break;
> +        case 0x1:
> +            op = la_op_stptr_w;
> +            break;
> +        case 0x2:
> +            op = la_op_ldptr_d;
> +            break;
> +        case 0x3:
> +            op = la_op_stptr_d;
> +            break;
> +        }
> +        break;
> +    case 0xa:
> +        switch ((insn >> 22) & 0xf) {
> +        case 0x0:
> +            op = la_op_ld_b;
> +            break;
> +        case 0x1:
> +            op = la_op_ld_h;
> +            break;
> +        case 0x2:
> +            op = la_op_ld_w;
> +            break;
> +        case 0x3:
> +            op = la_op_ld_d;
> +            break;
> +        case 0x4:
> +            op = la_op_st_b;
> +            break;
> +        case 0x5:
> +            op = la_op_st_h;
> +            break;
> +        case 0x6:
> +            op = la_op_st_w;
> +            break;
> +        case 0x7:
> +            op = la_op_st_d;
> +            break;
> +        case 0x8:
> +            op = la_op_ld_bu;
> +            break;
> +        case 0x9:
> +            op = la_op_ld_hu;
> +            break;
> +        case 0xa:
> +            op = la_op_ld_wu;
> +            break;
> +        case 0xb:
> +            op = la_op_preld;
> +            break;
> +        case 0xc:
> +            op = la_op_fld_s;
> +            break;
> +        case 0xd:
> +            op = la_op_fst_s;
> +            break;
> +        case 0xe:
> +            op = la_op_fld_d;
> +            break;
> +        case 0xf:
> +            op = la_op_fst_d;
> +            break;
> +        }
> +        break;
> +    case 0xe:
> +        switch ((insn >> 15) & 0x7ff) {
> +        case 0x0:
> +            op = la_op_ldx_b;
> +            break;
> +        case 0x8:
> +            op = la_op_ldx_h;
> +            break;
> +        case 0x10:
> +            op = la_op_ldx_w;
> +            break;
> +        case 0x18:
> +            op = la_op_ldx_d;
> +            break;
> +        case 0x20:
> +            op = la_op_stx_b;
> +            break;
> +        case 0x28:
> +            op = la_op_stx_h;
> +            break;
> +        case 0x30:
> +            op = la_op_stx_w;
> +            break;
> +        case 0x38:
> +            op = la_op_stx_d;
> +            break;
> +        case 0x40:
> +            op = la_op_ldx_bu;
> +            break;
> +        case 0x48:
> +            op = la_op_ldx_hu;
> +            break;
> +        case 0x50:
> +            op = la_op_ldx_wu;
> +            break;
> +        case 0x60:
> +            op = la_op_fldx_s;
> +            break;
> +        case 0x68:
> +            op = la_op_fldx_d;
> +            break;
> +        case 0x70:
> +            op = la_op_fstx_s;
> +            break;
> +        case 0x78:
> +            op = la_op_fstx_d;
> +            break;
> +        case 0xc0:
> +            op = la_op_amswap_w;
> +            break;
> +        case 0xc1:
> +            op = la_op_amswap_d;
> +            break;
> +        case 0xc2:
> +            op = la_op_amadd_w;
> +            break;
> +        case 0xc3:
> +            op = la_op_amadd_d;
> +            break;
> +        case 0xc4:
> +            op = la_op_amand_w;
> +            break;
> +        case 0xc5:
> +            op = la_op_amand_d;
> +            break;
> +        case 0xc6:
> +            op = la_op_amor_w;
> +            break;
> +        case 0xc7:
> +            op = la_op_amor_d;
> +            break;
> +        case 0xc8:
> +            op = la_op_amxor_w;
> +            break;
> +        case 0xc9:
> +            op = la_op_amxor_d;
> +            break;
> +        case 0xca:
> +            op = la_op_ammax_w;
> +            break;
> +        case 0xcb:
> +            op = la_op_ammax_d;
> +            break;
> +        case 0xcc:
> +            op = la_op_ammin_w;
> +            break;
> +        case 0xcd:
> +            op = la_op_ammin_d;
> +            break;
> +        case 0xce:
> +            op = la_op_ammax_wu;
> +            break;
> +        case 0xcf:
> +            op = la_op_ammax_du;
> +            break;
> +        case 0xd0:
> +            op = la_op_ammin_wu;
> +             break;
> +        case 0xd1:
> +            op = la_op_ammin_du;
> +            break;
> +        case 0xd2:
> +            op = la_op_amswap_db_w;
> +            break;
> +        case 0xd3:
> +            op = la_op_amswap_db_d;
> +            break;
> +        case 0xd4:
> +            op = la_op_amadd_db_w;
> +            break;
> +        case 0xd5:
> +            op = la_op_amadd_db_d;
> +            break;
> +        case 0xd6:
> +            op = la_op_amand_db_w;
> +            break;
> +        case 0xd7:
> +            op = la_op_amand_db_d;
> +            break;
> +        case 0xd8:
> +            op = la_op_amor_db_w;
> +            break;
> +        case 0xd9:
> +            op = la_op_amor_db_d;
> +            break;
> +        case 0xda:
> +            op = la_op_amxor_db_w;
> +            break;
> +        case 0xdb:
> +            op = la_op_amxor_db_d;
> +            break;
> +        case 0xdc:
> +            op = la_op_ammax_db_w;
> +            break;
> +        case 0xdd:
> +            op = la_op_ammax_db_d;
> +            break;
> +        case 0xde:
> +            op = la_op_ammin_db_w;
> +            break;
> +        case 0xdf:
> +            op = la_op_ammin_db_d;
> +            break;
> +        case 0xe0:
> +            op = la_op_ammax_db_wu;
> +            break;
> +        case 0xe1:
> +            op = la_op_ammax_db_du;
> +            break;
> +        case 0xe2:
> +            op = la_op_ammin_db_wu;
> +            break;
> +        case 0xe3:
> +            op = la_op_ammin_db_du;
> +            break;
> +        case 0xe4:
> +            op = la_op_dbar;
> +            break;
> +        case 0xe5:
> +            op = la_op_ibar;
> +            break;
> +        case 0xe8:
> +            op = la_op_fldgt_s;
> +            break;
> +        case 0xe9:
> +            op = la_op_fldgt_d;
> +            break;
> +        case 0xea:
> +            op = la_op_fldle_s;
> +            break;
> +        case 0xeb:
> +            op = la_op_fldle_d;
> +            break;
> +        case 0xec:
> +            op = la_op_fstgt_s;
> +            break;
> +        case 0xed:
> +            op = la_op_fstgt_d;
> +            break;
> +        case 0xee:
> +            op = ls_op_fstle_s;
> +            break;
> +        case 0xef:
> +            op = la_op_fstle_d;
> +            break;
> +        case 0xf0:
> +            op = la_op_ldgt_b;
> +            break;
> +        case 0xf1:
> +            op = la_op_ldgt_h;
> +            break;
> +        case 0xf2:
> +            op = la_op_ldgt_w;
> +            break;
> +        case 0xf3:
> +            op = la_op_ldgt_d;
> +            break;
> +        case 0xf4:
> +            op = la_op_ldle_b;
> +            break;
> +        case 0xf5:
> +            op = la_op_ldle_h;
> +            break;
> +        case 0xf6:
> +            op = la_op_ldle_w;
> +            break;
> +        case 0xf7:
> +            op = la_op_ldle_d;
> +            break;
> +        case 0xf8:
> +            op = la_op_stgt_b;
> +            break;
> +        case 0xf9:
> +            op = la_op_stgt_h;
> +            break;
> +        case 0xfa:
> +            op = la_op_stgt_w;
> +            break;
> +        case 0xfb:
> +            op = la_op_stgt_d;
> +            break;
> +        case 0xfc:
> +            op = la_op_stle_b;
> +            break;
> +        case 0xfd:
> +            op = la_op_stle_h;
> +            break;
> +        case 0xfe:
> +            op = la_op_stle_w;
> +            break;
> +        case 0xff:
> +            op = la_op_stle_d;
> +            break;
> +        }
> +        break;
> +    case 0x10:
> +        op = la_op_beqz;
> +        break;
> +    case 0x11:
> +        op = la_op_bnez;
> +        break;
> +    case 0x12:
> +        switch ((insn >> 8) & 0x3) {
> +        case 0x0:
> +            op = la_op_bceqz;
> +            break;
> +        case 0x1:
> +            op = la_op_bcnez;
> +            break;
> +        }
> +        break;
> +    case 0x13:
> +        op = la_op_jirl;
> +        break;
> +    case 0x14:
> +        op = la_op_b;
> +        break;
> +    case 0x15:
> +        op = la_op_bl;
> +        break;
> +    case 0x16:
> +        op = la_op_beq;
> +        break;
> +    case 0x17:
> +        op = la_op_bne;
> +        break;
> +    case 0x18:
> +        op = la_op_blt;
> +        break;
> +    case 0x19:
> +        op = la_op_bge;
> +        break;
> +    case 0x1a:
> +        op = la_op_bltu;
> +        break;
> +    case 0x1b:
> +        op = la_op_bgeu;
> +        break;
> +    default:
> +        op = la_op_illegal;
> +        break;
> +    }
> +    dec->op = op;
> +}
> +
> +/* operand extractors */
> +#define IM_5  5
> +#define IM_8  8
> +#define IM_12 12
> +#define IM_14 14
> +#define IM_15 15
> +#define IM_16 16
> +#define IM_20 20
> +#define IM_21 21
> +#define IM_26 26
> +
> +static uint32_t operand_r1(uint32_t insn)
> +{
> +    return insn & 0x1f;
> +}
> +
> +static uint32_t operand_r2(uint32_t insn)
> +{
> +    return (insn >> 5) & 0x1f;
> +}
> +
> +static uint32_t operand_r3(uint32_t insn)
> +{
> +    return (insn >> 10) & 0x1f;
> +}
> +
> +static uint32_t operand_r4(uint32_t insn)
> +{
> +    return (insn >> 15) & 0x1f;
> +}
> +
> +static uint32_t operand_u6(uint32_t insn)
> +{
> +    return (insn >> 10) & 0x3f;
> +}
> +
> +static uint32_t operand_bw1(uint32_t insn)
> +{
> +    return (insn >> 10) & 0x1f;
> +}
> +
> +static uint32_t operand_bw2(uint32_t insn)
> +{
> +    return (insn >> 16) & 0x1f;
> +}
> +
> +static uint32_t operand_bd1(uint32_t insn)
> +{
> +    return (insn >> 10) & 0x3f;
> +}
> +
> +static uint32_t operand_bd2(uint32_t insn)
> +{
> +    return (insn >> 16) & 0x3f;
> +}
> +
> +static uint32_t operand_sa2(uint32_t insn)
> +{
> +    return (insn >> 15) & 0x3;
> +}
> +
> +static uint32_t operand_sa3(uint32_t insn)
> +{
> +    return (insn >> 15) & 0x3;
> +}
> +
> +static int32_t operand_im20(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)((insn >> 5) & 0xfffff);
> +    return imm > (1 << 19) ? imm - (1 << 20) : imm;
> +}
> +
> +static int32_t operand_im16(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)((insn >> 10) & 0xffff);
> +    return imm > (1 << 15) ? imm - (1 << 16) : imm;
> +}
> +
> +static int32_t operand_im14(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)((insn >> 10) & 0x3fff);
> +    return imm > (1 << 13) ? imm - (1 << 14) : imm;
> +}
> +
> +static int32_t operand_im12(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)((insn >> 10) & 0xfff);
> +    return imm > (1 << 11) ? imm - (1 << 12) : imm;
> +}
> +
> +static int32_t operand_im8(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)((insn >> 10) & 0xff);
> +    return imm > (1 << 7) ? imm - (1 << 8) : imm;
> +}
> +
> +static uint32_t operand_sd(uint32_t insn)
> +{
> +    return insn & 0x3;
> +}
> +
> +static uint32_t operand_sj(uint32_t insn)
> +{
> +    return (insn >> 5) & 0x3;
> +}
> +
> +static uint32_t operand_cd(uint32_t insn)
> +{
> +    return insn & 0x7;
> +}
> +
> +static uint32_t operand_cj(uint32_t insn)
> +{
> +    return (insn >> 5) & 0x7;
> +}
> +
> +static uint32_t operand_code(uint32_t insn)
> +{
> +    return insn & 0x7fff;
> +}
> +
> +static int32_t operand_whint(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)(insn & 0x7fff);
> +    return imm > (1 << 14) ? imm - (1 << 15) : imm;
> +}
> +
> +static int32_t operand_invop(uint32_t insn)
> +{
> +    int32_t imm = (int32_t)(insn & 0x1f);
> +    return imm > (1 << 4) ? imm - (1 << 5) : imm;
> +}
> +
> +static int32_t operand_ofs21(uint32_t insn)
> +{
> +    int32_t imm = (((int32_t)insn & 0x1f) << 16) |
> +        ((insn >> 10) & 0xffff);
> +    return imm > (1 << 20) ? imm - (1 << 21) : imm;
> +}
> +
> +static int32_t operand_ofs26(uint32_t insn)
> +{
> +    int32_t imm = (((int32_t)insn & 0x3ff) << 16) |
> +        ((insn >> 10) & 0xffff);
> +    return imm > (1 << 25) ? imm - (1 << 26) : imm;
> +}
> +
> +static uint32_t operand_fcond(uint32_t insn)
> +{
> +    return (insn >> 15) & 0x1f;
> +}
> +
> +static uint32_t operand_sel(uint32_t insn)
> +{
> +    return (insn >> 15) & 0x7;
> +}
> +
> +/* decode operands */
> +static void decode_insn_operands(la_decode *dec)
> +{
> +    uint32_t insn = dec->insn;
> +    dec->codec = opcode_data[dec->op].codec;
> +    switch (dec->codec) {
> +    case la_codec_illegal:
> +    case la_codec_empty:
> +        break;
> +    case la_codec_2r:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        break;
> +    case la_codec_2r_u5:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        break;
> +    case la_codec_2r_u6:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_u6(insn);
> +        break;
> +    case la_codec_2r_2bw:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_bw1(insn);
> +        dec->r4 = operand_bw2(insn);
> +        break;
> +    case la_codec_2r_2bd:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_bd1(insn);
> +        dec->r4 = operand_bd2(insn);
> +        break;
> +    case la_codec_3r:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        break;
> +    case la_codec_3r_rd0:
> +        dec->r1 = 0;
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        break;
> +    case la_codec_3r_sa2:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        dec->r4 = operand_sa2(insn);
> +        break;
> +    case la_codec_3r_sa3:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        dec->r4 = operand_sa3(insn);
> +        break;
> +    case la_codec_4r:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        dec->r4 = operand_r4(insn);
> +        break;
> +    case la_codec_r_im20:
> +        dec->r1 = operand_r1(insn);
> +        dec->imm = operand_im20(insn);
> +        dec->bit = IM_20;
> +        break;
> +    case la_codec_2r_im16:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->imm = operand_im16(insn);
> +        dec->bit = IM_16;
> +        break;
> +    case la_codec_2r_im14:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->imm = operand_im14(insn);
> +        dec->bit = IM_14;
> +        break;
> +    case la_codec_r_im14:
> +        dec->r1 = operand_r1(insn);
> +        dec->imm = operand_im14(insn);
> +        dec->bit = IM_14;
> +        break;
> +    case la_codec_im5_r_im12:
> +        dec->imm2 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->imm = operand_im12(insn);
> +        dec->bit = IM_12;
> +        break;
> +    case la_codec_2r_im12:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->imm = operand_im12(insn);
> +        dec->bit = IM_12;
> +        break;
> +    case la_codec_2r_im8:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->imm = operand_im8(insn);
> +        dec->bit = IM_8;
> +        break;
> +    case la_codec_r_sd:
> +        dec->r1 = operand_sd(insn);
> +        dec->r2 = operand_r2(insn);
> +        break;
> +    case la_codec_r_sj:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_sj(insn);
> +        break;
> +    case la_codec_r_cd:
> +        dec->r1 = operand_cd(insn);
> +        dec->r2 = operand_r2(insn);
> +        break;
> +    case la_codec_r_cj:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_cj(insn);
> +        break;
> +    case la_codec_r_seq:
> +        dec->r1 = 0;
> +        dec->r2 = operand_r1(insn);
> +        dec->imm = operand_im8(insn);
> +        dec->bit = IM_8;
> +        break;
> +    case la_codec_code:
> +        dec->code = operand_code(insn);
> +        break;
> +    case la_codec_whint:
> +        dec->imm = operand_whint(insn);
> +        dec->bit = IM_15;
> +        break;
> +    case la_codec_invtlb:
> +        dec->imm = operand_invop(insn);
> +        dec->bit = IM_5;
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        break;
> +    case la_codec_r_ofs21:
> +        dec->imm = operand_ofs21(insn);
> +        dec->bit = IM_21;
> +        dec->r2 = operand_r2(insn);
> +        break;
> +    case la_codec_cj_ofs21:
> +        dec->imm = operand_ofs21(insn);
> +        dec->bit = IM_21;
> +        dec->r2 = operand_cj(insn);
> +        break;
> +    case la_codec_ofs26:
> +        dec->imm = operand_ofs26(insn);
> +        dec->bit = IM_26;
> +        break;
> +    case la_codec_cond:
> +        dec->r1 = operand_cd(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        dec->r4 = operand_fcond(insn);
> +        break;
> +    case la_codec_sel:
> +        dec->r1 = operand_r1(insn);
> +        dec->r2 = operand_r2(insn);
> +        dec->r3 = operand_r3(insn);
> +        dec->r4 = operand_sel(insn);
> +        break;
> +    }
> +}

Am I right these 1500 lines could eventually be generated by
the decodetree.py script parsing target/loongarch/insns.decode?

