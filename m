Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34E935FB62
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 21:12:43 +0200 (CEST)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWkwM-0007vU-BI
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 15:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWkvI-0007Ne-J0
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:11:36 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWkvF-0007KE-0K
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:11:36 -0400
Received: by mail-pl1-x630.google.com with SMTP id j7so10688507plx.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 12:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e22LYlRv0BC6uzLBp1fZ3Cauwyn9kuzNtH13Qv1K5rE=;
 b=BhiwPp9HCa09NKgaI/9wkaOEtzg01L+Mr3IKlF2bmaHSgmVqgjP121ykuUCqWUxJLx
 zjaYnTstJmqBWm+VzC2bRtBe/p3pVBeo/74S3RC15H7qr9DeTSo9XUNbAl5cWOB/O+zu
 Hv9NHMVKWcZ6p6Knq1rtH4U5GLadWbHtHTpiOTHdEIbFy9f9X2GIEKMW+FC1pogJszlV
 N/piPyfY5NfmjzlKHMvi0drHbWytTEgQi9+Lnm36R0qeCLNgIr1AKPOUP+OhCN/iMnSx
 al8yNCYozc2d9FV0bonVr7wjAF5yuc9U4OPiyGlwxvtrl3HPVON5wbvltyNzbpAu64SJ
 +JsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e22LYlRv0BC6uzLBp1fZ3Cauwyn9kuzNtH13Qv1K5rE=;
 b=EmEbvRe2XqFXutg8ksJhfz26HeXirAfkTkEVJRucNPiNZAzx/EC3d9edgZfvSdsxAe
 2PlgV+bAxeNvu+fA59QB/G4TyTwiaeqqLq+ngu0wwxBu1RQKVqzcr+FeFIsQvUcKZpcF
 08JpcO3jkLv35I/f/TxSCfmw/i6K2WjMCWayDOCsA19eg7PPfUc4SqBSn7kw60kfGFPQ
 OtOhwKyhXRRTlobAlBHQeDASSReYWRS6x/Oc29mHilUOpriBvKI97fqCcNYui3J3Amor
 2l+1EQl0cukp/K3twJ/EsSprukfHccNoeMCZ/pElBSnNp0V46uxEpLRXfufn7XtaDqX1
 PiLQ==
X-Gm-Message-State: AOAM532cLYbEYrVWssMo3LpQkr7QyWrWqnfoVfCg29reIE9BGZq2Z4Sa
 /O061TIoxsNuyj2NWVwAtjushA==
X-Google-Smtp-Source: ABdhPJy/TIAr83uMCgR5T9Q7FIF8cfP3nn9toGhaU2Fc/94z6Xg/0lBTJhAW7DYbwX6sKWEo6vw3+Q==
X-Received: by 2002:a17:902:eac1:b029:ea:dfe4:7b44 with SMTP id
 p1-20020a170902eac1b02900eadfe47b44mr20369463pld.79.1618427487709; 
 Wed, 14 Apr 2021 12:11:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id e26sm178706pfm.148.2021.04.14.12.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 12:11:27 -0700 (PDT)
Subject: Re: [PATCH 5/5] target/ppc: Implement paddi and replace addi insns
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
 <20210413211129.457272-6-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <35a37fdc-0580-7c0b-5748-1f194386007c@linaro.org>
Date: Wed, 14 Apr 2021 12:11:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413211129.457272-6-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 2:11 PM, Luis Pires wrote:
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -0,0 +1,26 @@

Missing copyright+license header.

> +static bool trans_paddi(DisasContext *ctx, arg_paddi *a)
> +{
> +    if (a->r == 0) {
> +        if (a->ra == 0) {
> +            /* li case */
> +            tcg_gen_movi_tl(cpu_gpr[a->rt], a->si);
> +        } else {
> +            tcg_gen_addi_tl(cpu_gpr[a->rt],
> +                            cpu_gpr[a->ra], a->si);
> +        }
> +    } else {
> +        if (a->ra == 0) {
> +            tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_nip, a->si);
> +        } else {
> +            /* invalid form */
> +            gen_invalid(ctx);
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +static bool trans_addi(DisasContext *ctx, arg_addi *a)
> +{
> +    return trans_paddi(ctx, a);
> +}

Just a note about decodetree: this kind of thing is where you would use the 
same name for both patterns, so that you would not need to have a separate 
symbol for addi (or vice versa).

That said, I'm now having a bit of a read-up on power10, and I have some 
suggestions.

First, type 2 and type 3 prefixes modify existing instructions.  Which means 
that you are going to wind up with a lot of duplication.  Preferentially, we 
should avoid that.

One example of how to approach this is target/microblaze, which has an "imm" 
instruction prefix to extend a 16-bit immediate to a 32-bit immediate.  This 
can be worked into decodetree directly:

# Include any IMM prefix in the value reported.
%extimm         0:s16 !function=typeb_imm
@typeb          ...... rd:5 ra:5 ................ \
                 &typeb imm=%extimm

static int typeb_imm(DisasContext *dc, int x)
{
     if (dc->tb_flags & IMM_FLAG) {
         return deposit32(dc->ext_imm, 0, 16, x);
     }
     return x;
}

static bool trans_imm(DisasContext *dc, arg_imm *arg)
{
     if (invalid_delay_slot(dc, "imm")) {
         return true;
     }
     dc->ext_imm = arg->imm << 16;
     tcg_gen_movi_i32(cpu_imm, dc->ext_imm);
     dc->tb_flags_to_set = IMM_FLAG;
     return true;
}

We decode "imm" as a separate instruction, set some bits in DisasContext, and 
then use those bits while decoding the next instruction.

I think the exact mechanism that microblaze uses is going to be too simplistic 
for Power10, but the basic idea of modifying the "normal" instructions is still 
sound, I think.

Using addi+paddi as an example, what about

# All ppc formats have names -- use them.
%MLS        r ie
prefix_MLS  000001 10 -- r:1 -- ie:s18          &MLS

# TODO: decodetree extension -- allow :type after name.
# The SI field needs to be 64-bit for MLS:D-form.
%D          rt ra si:int64_t
@D          ...... rt:5 ra:5 si:s16

ADDI        001110 ..... ..... ................ @D


static bool
trans_prefix_MLS(DisasContext *ctx, arg_MLS *a)
{
     if (cpu does not support prefixes ||
         ctx->prefix_type != PREFIX_NONE) {
         return false;
     }
     /* Record the prefix for the next instruction. */
     ctx->prefix_type = PREFIX_MLS;
     ctx->prefix_data.mls = *a;
     return true;
}

static bool
allow_prefix_MLS(DisasContext *ctx, arg_D *a)
{
     int64_t imm;

     /* Require MLS prefix or no prefix. */
     if (ctx->prefix_type != PREFIX_MLS) {
         if (ctx->prefix_type == PREFIX_NONE) {
             return true;
         }
         gen_invalid(ctx);
         return false;
     }

     /*
      * Concatenate the two immediate fields.
      * Note that IE is sign-extended 18 bits,
      * so this forms a signed 34-bit constant.
      */
     imm = deposit64(a->si, 16, 48, ctx->prefix_data.mls.ie);

     /*
      * If R, then the constant is pc-relative,
      * and RA must be 0.
      */
     if (ctx->prefix_data.mls.r) {
         if (ctx->prefix_data.mls.ra != 0) {
             gen_invalid(ctx);
             return false;
         }
         imm += ctx->cia;
     }
     a->si = imm;
     return true;
}

static bool
trans_ADDI(DisasContext *ctx, arg_D *a)
{
     if (!allow_prefix_MLS(ctx, a)) {
         return true;
     }
     if (a->ra) {
         tcg_gen_addi_tl(cpu_gpr[a->rt],
                         cpu_gpr[a->ra], a->si);
     } else {
         tcg_gen_movi_tl(cpu_gpr[a->rt], a->si);
     }
     return true;
}

This approach seems like it will work fine for MLS and MMIR prefixes.  For 8LS, 
8RR, and MRR prefixes, we'll need some extra help within ppc_tr_translate_insn. 
  E.g.

     insn = translator_ldl_swap(env, ctx->base.pc_next,
                                need_byteswap(ctx));
     switch (ctx->prefix_type) {
     case PREFIX_NONE:
         ok = decode_opcode_space_0(ctx, insn) ||
              decode_legacy(ctx, insn);
         break;
     case PREFIX_MLS:
     case PREFIX_MMIRR:
         ok = decode_opcode_space_0(ctx, insn);
         break;
     case PREFIX_8LS:
     case PREFIX_8RR:
         ok = decode_opcode_space_1(ctx, insn);
         break;
     case PREFIX_MRR:
         /*
          * The only instruction with this prefix is PNOP.
          * TODO: diagnose the set of patterns that are illegal:
          * branches, rfebb, sync other than isync, or a
          * service processor attention.
          * The Engineering Note allows us to either diagnose
          * these as illegal, or treat them all as no-op.
          */
         ok = true;
         break;
     default:
         g_assert_not_reached();
     }
     if (!ok) {
         gen_invalid(ctx);
     }


r~

