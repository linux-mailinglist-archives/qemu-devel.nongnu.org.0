Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F85135E924
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 00:42:36 +0200 (CEST)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWRju-00049B-P8
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 18:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWRio-0003hI-VA; Tue, 13 Apr 2021 18:41:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWRim-0005lt-Sk; Tue, 13 Apr 2021 18:41:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id w186so5039316wmg.3;
 Tue, 13 Apr 2021 15:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XZoeM7fzlJ7mkSFEXlMyI09PViB+q7RjcE0+s46WjYw=;
 b=IVN2ZlGsqo/kkHohK6cadN8m+4+QPVJ7Ydk0qC+yAOXsvaQM0L02lX5yLsbLkKzrzB
 LeUz2O0K5KV6joFf3zVLSw28254/Sov5PabeyirERbSO4RaFwqfGE3InRJrqih4mVn9E
 8xpU0GCWlXyroskAk+rbg57INiPOhL+AHxJ9zx9wUvF0YDttfjnSy00onrNkNgN6rjmP
 YdKf5WJ4kDhXNzDFimGdsMIZLOm/CGTSdWnI9J+xwfaFYfxc3QmvbI2ov1+Mv2TWXD9F
 T8nrVICPy78jg3jz8tfTr7LilG5KLsbnKGqymZIyEPIW41bKhgigjqOIMjTyHOpyahfd
 nycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XZoeM7fzlJ7mkSFEXlMyI09PViB+q7RjcE0+s46WjYw=;
 b=TzA5tyLGS3gepTCvbjqtWxsY8Yj+8uwwrk7GgLxbCUUWB4K/yOafKOJDbfmgKLYxM1
 BQWfEa3TZV0i4vGovm3YtcRpm8kJI/7Zsc9EpT890QkzAcvcWbdoh0IQHcaVs+z2hqnf
 Qdf/eUTbTcVxjrXsGSAl+gajhLe9jl/ka0LlJS+ShJrgeaRSOMn0mkTQg1muDtPHL5Cf
 BeTy4IKOKPsro4BCLfy2LwcAMP2gr9UuTaCXYa9sgApkzhL7qs2YYNMx1d0W309dHfOX
 /69MgEK7mhtreMqidz/nr4rzECMkfoOLMno8iIy2euHdQA39SxkAqPL+D52B2r8+CDia
 3aOQ==
X-Gm-Message-State: AOAM531ERf5zBbMWP7lgWAQ5RwEG7LcOazxe9MFezMvnvlbpIiErA/wh
 NpR/hHLyv50F5zQXEY9FYqo=
X-Google-Smtp-Source: ABdhPJy4eEXsHyB0vzyo5+gUnQhHcrc+ceJk/tE2w0Avy0tq9kaFC6DT3rNsaitMJ9A/tivL3TSWuw==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr66320wmc.126.1618353682904;
 Tue, 13 Apr 2021 15:41:22 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l5sm3638375wmh.0.2021.04.13.15.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 15:41:22 -0700 (PDT)
Subject: Re: [PATCH 5/5] target/ppc: Implement paddi and replace addi insns
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
 <20210413211129.457272-6-luis.pires@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <866f5277-60e9-3934-2465-e93c6d5f74b0@amsat.org>
Date: Wed, 14 Apr 2021 00:41:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413211129.457272-6-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Luis,

On 4/13/21 11:11 PM, Luis Pires wrote:
> This implements the Power ISA 3.1 prefixed (64-bit) paddi
> instruction, while also replacing the legacy addi implementation.
> Both using the decode tree.
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  target/ppc/ppc.decode                      |  8 +++++++
>  target/ppc/translate.c                     | 15 +------------
>  target/ppc/translate/fixedpoint-impl.c.inc | 26 ++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 14 deletions(-)
>  create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc
> 
> diff --git a/target/ppc/ppc.decode b/target/ppc/ppc.decode
> index 84bb73ac19..c87174dc20 100644
> --- a/target/ppc/ppc.decode
> +++ b/target/ppc/ppc.decode
> @@ -16,3 +16,11 @@
>  # You should have received a copy of the GNU Lesser General Public
>  # License along with this library; if not, see <http://www.gnu.org/licenses/>.
>  #
> +
> +%p_D8_SI        32:s18 0:16
> +
> +# Fixed-Point Facility Instructions
> +&addi   r rt ra si
> +
> +paddi   000001 10 0 -- r:1 -- .................. 001110 rt:5 ra:5 ................ si=%p_D8_SI &addi

IIUC you should be able to do something like catch ra=0 first ...:

{
  addi_movi   000001 10 0 -- r:1 -- .................. 001110 rt:5 .....
................ si=%p_D8_SI &addi ra=0
  addi   000001 10 0 -- r:1 -- .................. 001110 rt:5 ra:5
................ si=%p_D8_SI &addi
}

> +addi    001110 rt:5 ra:5 si:s16 &addi r=0
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 0f123f7b80..2ff192c9e5 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -945,19 +945,6 @@ GEN_INT_ARITH_ADD(addex, 0x05, cpu_ov, 1, 1, 0);
>  /* addze  addze.  addzeo  addzeo.*/
>  GEN_INT_ARITH_ADD_CONST(addze, 0x06, 0, cpu_ca, 1, 1, 0)
>  GEN_INT_ARITH_ADD_CONST(addzeo, 0x16, 0, cpu_ca, 1, 1, 1)
> -/* addi */
> -static void gen_addi(DisasContext *ctx)
> -{
> -    target_long simm = SIMM(ctx->opcode);
> -
> -    if (rA(ctx->opcode) == 0) {
> -        /* li case */
> -        tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], simm);
> -    } else {
> -        tcg_gen_addi_tl(cpu_gpr[rD(ctx->opcode)],
> -                        cpu_gpr[rA(ctx->opcode)], simm);
> -    }
> -}
>  /* addic  addic.*/
>  static inline void gen_op_addic(DisasContext *ctx, bool compute_rc0)
>  {
> @@ -6967,6 +6954,7 @@ static target_ulong ppc_peek_next_insn_size(DisasContext *ctx)
>  }
>  
>  #include "decode-ppc.c.inc"
> +#include "translate/fixedpoint-impl.c.inc"
>  
>  #include "translate/fp-impl.c.inc"
>  
> @@ -7091,7 +7079,6 @@ GEN_HANDLER_E(cmpeqb, 0x1F, 0x00, 0x07, 0x00600000, PPC_NONE, PPC2_ISA300),
>  GEN_HANDLER_E(cmpb, 0x1F, 0x1C, 0x0F, 0x00000001, PPC_NONE, PPC2_ISA205),
>  GEN_HANDLER_E(cmprb, 0x1F, 0x00, 0x06, 0x00400001, PPC_NONE, PPC2_ISA300),
>  GEN_HANDLER(isel, 0x1F, 0x0F, 0xFF, 0x00000001, PPC_ISEL),
> -GEN_HANDLER(addi, 0x0E, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
>  GEN_HANDLER(addic, 0x0C, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
>  GEN_HANDLER2(addic_, "addic.", 0x0D, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
>  GEN_HANDLER(addis, 0x0F, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
> new file mode 100644
> index 0000000000..8620954b57
> --- /dev/null
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -0,0 +1,26 @@
> +static bool trans_paddi(DisasContext *ctx, arg_paddi *a)

(Nitpick, use the format: arg_addi, not arg_paddi).

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

... which then simplifies the trans_OPCODE() logic:

static bool trans_addi_movi(DisasContext *ctx, arg_addi *a)
{
    if (a->r == 0) {
        /* li case */
        tcg_gen_movi_tl(cpu_gpr[a->rt], a->si);
    } else {
        tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_nip, a->si);
    }

    return true;
}

static bool trans_addi(DisasContext *ctx, arg_addi *a)
{
    if (a->r == 0) {
        tcg_gen_addi_tl(cpu_gpr[a->rt], cpu_gpr[a->ra], a->si);
    } else {
        /* invalid form */
        gen_invalid(ctx);
    }

    return true;
}

Maybe you can do the same with the r bit to remove the dual addi_movi.

Regards,

Phil.

