Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40AF3B7456
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:29:38 +0200 (CEST)
Received: from localhost ([::1]:53020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEk5-0000r6-Cx
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lyEhY-0005pu-0y
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:27:00 -0400
Received: from rev.ng ([5.9.113.41]:45393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lyEhW-0007nx-4e
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C0oNNss3yk+MPdbWuF9cAwJF9lFiz1Hhr600QnRL5us=; b=XY2vxAGqwq1F8PdB5tbicKJyWF
 T5gqGYxnaeDWoDL1yBKXLcmJ4q6pdSOewkuGwyfSjxZCBqP8/MHL8FtK5dx5x1EykW0DdkeP75tRc
 5+OJbWxq5U/n1rILqQoIKrXnWeVzM0VihsrE6MzMQF09s6cMQxCWtSKoz/bUV+Zp6in0=;
Date: Tue, 29 Jun 2021 16:26:38 +0200
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Taylor Simpson <tsimpson@quicinc.com>, Brian Cain <bcain@quicinc.com>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 10/14] target/hexagon: import parser for idef-parser
Message-ID: <20210629162638.2db6fd62@orange>
In-Reply-To: <BYAPR02MB488679E9F94D484852DD2398DE079@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-11-ale.qemu@rev.ng>
 <BYAPR02MB488679E9F94D484852DD2398DE079@BYAPR02MB4886.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Thu, 24 Jun 2021 03:55:35 +0000
Taylor Simpson <tsimpson@quicinc.com> wrote:

> > +       | rvalue '[' rvalue ']'
> > +         {
> > +             @1.last_column = @4.last_column;
> > +             if ($3.type == IMMEDIATE) {
> > +                 $$ = gen_tmp(c, &@1, $1.bit_width);
> > +                 OUT(c, &@1, "tcg_gen_extract_i", &$$.bit_width,
> > "(");
> > +                 OUT(c, &@1, &$$, ", ", &$1, ", ", &$3, ", 1);\n");
> > +             } else {
> > +                 HexValue one = gen_imm_value(c, &@1, 1,
> > $3.bit_width);
> > +                 HexValue tmp = gen_bin_op(c, &@1, ASR_OP, &$1,
> > &$3);
> > +                 $$ = gen_bin_op(c, &@1, ANDB_OP, &tmp, &one);  
> 
> Can this be done with a tcg_gen_extract_tl or tcg_gen_sextract_tl?

Those require translation-time constants as offsets while we need TCGv:

    tcg_gen_extract_i32(TCGv_i32 ret,
                        TCGv_i32 arg,
                        unsigned int ofs,
                        unsigned int len);

> Do you need to worry about signed-ness?

`gen_bin_op` should take care of that.

On Thu, 24 Jun 2021 03:55:35 +0000
Taylor Simpson <tsimpson@quicinc.com> wrote:

> > +void imm_print(Context *c, YYLTYPE *locp, HexImm *imm)
> > +{
> > +    switch (imm->type) {
> > +    case I:
> > +        EMIT(c, "i");
> > +        break;
> > +    case VARIABLE:
> > +        EMIT(c, "%ciV", imm->id);
> > +        break;
> > +    case VALUE:
> > +        EMIT(c, "((int64_t)%" PRIu64 "ULL)", (int64_t)imm->value);
> > +        break;
> > +    case QEMU_TMP:
> > +        EMIT(c, "qemu_tmp_%" PRIu64, imm->index);
> > +        break;
> > +    case IMM_PC:
> > +        EMIT(c, "ctx->base.pc_next");
> > +        break;
> > +    case IMM_NPC:
> > +        EMIT(c, "ctx->npc");
> > +        break;
> > +    case IMM_CONSTEXT:
> > +        EMIT(c, "insn->extension_valid");  
> 
> The extension_valid field is a bool indicating if the instruction has
> a constant extender.  Don't you want the actual value here?

No, this maps to Constant_extended:

    #define fREAD_GP() (Constant_extended ? (0) : GP)

Constant extensions is handle for us externally.

On Thu, 24 Jun 2021 03:55:35 +0000
Taylor Simpson <tsimpson@quicinc.com> wrote:

> > +    if (dest->bit_width != res.bit_width) {
> > +        res = rvalue_truncate(c, locp, &res);
> > +    }
> > +
> > +    HexValue zero = gen_tmp_value(c, locp, "0", res.bit_width);
> > +    OUT(c, locp, "tcg_gen_movcond_i", &res.bit_width,
> > "(TCG_COND_NE, ", dest);
> > +    OUT(c, locp, ", ", &width_orig, ", ", &zero, ", ", &res, ", ",
> > dest,
> > +        ");\n");
> > +
> > +    rvalue_free(c, locp, &zero);
> > +    rvalue_free(c, locp, width);
> > +    rvalue_free(c, locp, &res);
> > +}
> > +
> > +void gen_deposit_op(Context *c,
> > +                    YYLTYPE *locp,
> > +                    HexValue *dest,
> > +                    HexValue *value,
> > +                    HexValue *index,
> > +                    HexCast *cast)  
> 
> What's the difference between this and the gen_rdeposit_op above?

`gen_rdeposit_op` is general purpose, it takes start and width of the
deposit.
`gen_deposit_op` is more tailored to handle `fINSERT_BITS`.

We will improve `gen_rdeposit_op` in order to handle the immediate
case efficiently and then implement `gen_deposit_op` with
`gen_rdeposit_op`.

-- 
Alessandro Di Federico
rev.ng

