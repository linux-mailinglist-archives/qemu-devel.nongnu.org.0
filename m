Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397746F4257
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:13:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnw1-0006Xl-Qy; Tue, 02 May 2023 07:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ptnvz-0006XM-LV
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:12:39 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ptnvv-0000Si-GS
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To
 :Reply-To:Subject:From:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dTHYiy29FP7J4iaRvDhoV/D35O+7npggsp+iTe0oReU=; b=NENJl85jghwfkHfhYEUD3/ZkHz
 ucQYTpCEBFDsoQ6gWV/lO9Z2/UwWlwVIa8Bb1Yk+wx2UlLD4TIH9Qo8LKwNumhCtMxcFyxAHbgmZY
 RXQ6pfkuUFPQnqOjn6pocBJcrWQZ+lBrEhQsy7iM13GMmeQeKPdjT6FF6fibjRTg6E7Y=;
Message-ID: <9699ff6f-3406-dd61-31d7-a288a96cf697@rev.ng>
Date: Tue, 2 May 2023 13:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3] Hexagon (target/hexagon) Additional instructions
 handled by idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230501203125.4025991-1-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230501203125.4025991-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 5/1/23 22:31, Taylor Simpson wrote:
> **** Changes in v3 ****
> Fix bugs exposed by dpmpyss_rnd_s0 instruction
>      Set correct size/signedness for constants
>      Test cases added to tests/tcg/hexagon/misc.c
>
> **** Changes in v2 ****
> Fix bug in imm_print identified in clang build
>
> Currently, idef-parser skips all floating point instructions.  However,
> there are some floating point instructions that can be handled.
>
> The following instructions are now parsed
>      F2_sfimm_p
>      F2_sfimm_n
>      F2_dfimm_p
>      F2_dfimm_n
>      F2_dfmpyll
>      F2_dfmpylh
>
> To make these instructions work, we fix some bugs in parser-helpers.c
>      gen_rvalue_extend
>      gen_cast_op
>      imm_print
>      lexer properly sets size/signedness of constants
>
> Test cases added to tests/tcg/hexagon/fpstuff.c
>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/idef-parser/parser-helpers.h |  2 +-
>   target/hexagon/idef-parser/parser-helpers.c | 41 +++++++++++-----
>   tests/tcg/hexagon/fpstuff.c                 | 54 +++++++++++++++++++++
>   tests/tcg/hexagon/misc.c                    | 35 +++++++++++++
>   target/hexagon/gen_idef_parser_funcs.py     | 10 +++-
>   target/hexagon/idef-parser/idef-parser.lex  | 38 +++++++++++++--
>   target/hexagon/idef-parser/idef-parser.y    |  2 -
>   7 files changed, 162 insertions(+), 20 deletions(-)
>
> diff --git a/target/hexagon/idef-parser/parser-helpers.h b/target/hexagon/idef-parser/parser-helpers.h
> index 1239d23a6a..7c58087169 100644
> --- a/target/hexagon/idef-parser/parser-helpers.h
> +++ b/target/hexagon/idef-parser/parser-helpers.h
> @@ -80,7 +80,7 @@ void reg_compose(Context *c, YYLTYPE *locp, HexReg *reg, char reg_id[5]);
>   
>   void reg_print(Context *c, YYLTYPE *locp, HexReg *reg);
>   
> -void imm_print(Context *c, YYLTYPE *locp, HexImm *imm);
> +void imm_print(Context *c, YYLTYPE *locp, HexValue *rvalue);
>   
>   void var_print(Context *c, YYLTYPE *locp, HexVar *var);
>   
> diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
> index 86511efb62..0ad917f591 100644
> --- a/target/hexagon/idef-parser/parser-helpers.c
> +++ b/target/hexagon/idef-parser/parser-helpers.c
> @@ -167,8 +167,9 @@ void reg_print(Context *c, YYLTYPE *locp, HexReg *reg)
>       EMIT(c, "hex_gpr[%u]", reg->id);
>   }
>   
> -void imm_print(Context *c, YYLTYPE *locp, HexImm *imm)
> +void imm_print(Context *c, YYLTYPE *locp, HexValue *rvalue)
>   {
> +    HexImm *imm = &rvalue->imm;
>       switch (imm->type) {
>       case I:
>           EMIT(c, "i");
> @@ -177,7 +178,21 @@ void imm_print(Context *c, YYLTYPE *locp, HexImm *imm)
>           EMIT(c, "%ciV", imm->id);
>           break;
>       case VALUE:
> -        EMIT(c, "((int64_t) %" PRIu64 "ULL)", (int64_t) imm->value);
> +        if (rvalue->bit_width == 32) {
> +            if (rvalue->signedness == UNSIGNED) {
> +                EMIT(c, "((uint32_t) 0x%" PRIx32 ")", (uint32_t) imm->value);
> +            }  else {
> +                EMIT(c, "((int32_t) 0x%" PRIx32 ")", (int32_t) imm->value);
> +            }
> +        } else if (rvalue->bit_width == 64) {
> +            if (rvalue->signedness == UNSIGNED) {
> +                EMIT(c, "((uint64_t) 0x%" PRIx64 "ULL)", (uint64_t) imm->value);
> +            } else {
> +                EMIT(c, "((int64_t) 0x%" PRIx64 "LL)", (int64_t) imm->value);
> +            }
> +        } else {
> +            g_assert_not_reached();
> +        }
>           break;
>       case QEMU_TMP:
>           EMIT(c, "qemu_tmp_%" PRIu64, imm->index);
> @@ -213,7 +228,7 @@ void rvalue_print(Context *c, YYLTYPE *locp, void *pointer)
>         tmp_print(c, locp, &rvalue->tmp);
>         break;
>     case IMMEDIATE:
> -      imm_print(c, locp, &rvalue->imm);
> +      imm_print(c, locp, rvalue);
>         break;
>     case VARID:
>         var_print(c, locp, &rvalue->var);
> @@ -386,13 +401,10 @@ HexValue gen_rvalue_extend(Context *c, YYLTYPE *locp, HexValue *rvalue)
>   
>       if (rvalue->type == IMMEDIATE) {
>           HexValue res = gen_imm_qemu_tmp(c, locp, 64, rvalue->signedness);
> -        bool is_unsigned = (rvalue->signedness == UNSIGNED);
> -        const char *sign_suffix = is_unsigned ? "u" : "";
>           gen_c_int_type(c, locp, 64, rvalue->signedness);
> -        OUT(c, locp, " ", &res, " = ");
> -        OUT(c, locp, "(", sign_suffix, "int64_t) ");
> -        OUT(c, locp, "(", sign_suffix, "int32_t) ");
> -        OUT(c, locp, rvalue, ";\n");
> +        OUT(c, locp, " ", &res, " = (");
> +        gen_c_int_type(c, locp, 64, rvalue->signedness);
> +        OUT(c, locp, ")", rvalue, ";\n");
>           return res;
>       } else {
>           HexValue res = gen_tmp(c, locp, 64, rvalue->signedness);
> @@ -961,9 +973,16 @@ HexValue gen_cast_op(Context *c,
>   {
>       assert_signedness(c, locp, src->signedness);
>       if (src->bit_width == target_width) {
> -        return *src;
> -    } else if (src->type == IMMEDIATE) {
>           HexValue res = *src;
> +        res.signedness = signedness;
> +        return res;
> +    } else if (src->type == IMMEDIATE) {
> +        HexValue res;
> +        if (src->bit_width < target_width) {
> +            res = gen_rvalue_extend(c, locp, src);
> +        } else {
> +            res = *src;
> +        }
>           res.bit_width = target_width;
>           res.signedness = signedness;
>           return res;

Ah, gen_cast_op() can be simplified a great deal here to

     HexValue gen_cast_op(Context *c,
                          YYLTYPE *locp,
                          HexValue *src,
                          unsigned target_width,
                          HexSignedness signedness)
     {
         HexValue res;
         assert_signedness(c, locp, src->signedness);
         if (src->bit_width == target_width) {
             res = *src;
         } else if (src->bit_width < target_width) {
             res = gen_rvalue_extend(c, locp, src);
         } else {
             res = gen_rvalue_truncate(c, locp, src);
         }
         res.signedness = signedness;
         return res;
     }

Other than that this patch looks good:

Tested-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Anton Johansson <anjo@rev.ng>



