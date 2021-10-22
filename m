Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A094373D9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 10:46:43 +0200 (CEST)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdqCI-0006J9-Rq
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 04:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdq7k-0000Ho-Lf; Fri, 22 Oct 2021 04:42:00 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:14111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdq7f-0001Fp-DO; Fri, 22 Oct 2021 04:42:00 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 19M8fHYO012023;
 Fri, 22 Oct 2021 16:41:17 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from ruinland-x1c (192.168.21.142) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Fri, 22 Oct 2021
 16:41:12 +0800
Date: Fri, 22 Oct 2021 16:41:11 +0800
From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH v1 1/2] riscv: Add preliminary infra for custom
 instrcution handling
Message-ID: <YXJ5J/kYBtosvtWj@ruinland-x1c>
References: <20211021151136.721746-1-ruinland@andestech.com>
 <e085e176-4ed4-248d-7546-c992ac283077@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e085e176-4ed4-248d-7546-c992ac283077@linaro.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
X-Originating-IP: [192.168.21.142]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 19M8fHYO012023
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: ycliang@andestech.com, qemu-riscv@nongnu.org, alankao@andestech.com,
 wangjunqiang@iscas.ac.cn, dylan@andestech.com, qemu-devel@nongnu.org,
 alistair23@gmail.com, bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 09:11:44AM -0700, Richard Henderson wrote:
> On 10/21/21 8:11 AM, Ruinland Chuan-Tzu Tsai wrote:
> > -static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
> > +/* Custom insn related definitions/prototypes */
> > +extern __thread bool cpu_has_custom_insns;
> > +/*
> > + * These 2 are for indication if decode fails.
> > + * We don't want to interfere the following regular extension decoding
> > + * We assume MTTCG is 1-1 mapping for now.
> > + */
> > +__thread bool custom_c_insn_decoded;
> > +__thread bool custom_insn_decoded;
> > +
> > +extern bool (*custom_c_insn_handler)(DisasContext *, uint16_t);
> > +extern bool (*custom_insn_handler)(DisasContext *, uint32_t);
> > +
> > +static void try_decode_custom_insn(CPURISCVState *env, DisasContext *ctx,
> > +                                   uint16_t opcode)
> 
> 
> This is way, way over-engineered.
> 
> You seem to be trying to design something that can be plugged in, which the
> rest of QEMU knows nothing of.  I think that's a mistake.  Your custom cpu
> extensions should be treated as any other RISC-V extension, since it is in
> fact built in to QEMU.
> 
> Begin with adding the "bool ext_andes" field in RISCVCPU.  Propagate that
> into the DisasContext just like the other extensions.

Wilco, thanks for the tips.

Cordially yours,
Ruinland

> 
> Changes to decode_opc should be quite simple:
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 6d7fbca1fa..ea1e159259 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -473,13 +473,16 @@ static void decode_opc(CPURISCVState *env,
> DisasContext *ctx, uint16_t opcode)
>  {
>      /* check for compressed insn */
>      if (extract16(opcode, 0, 2) != 3) {
> +        ctx->pc_succ_insn = ctx->base.pc_next + 2;
>          if (!has_ext(ctx, RVC)) {
>              gen_exception_illegal(ctx);
> -        } else {
> -            ctx->pc_succ_insn = ctx->base.pc_next + 2;
> -            if (!decode_insn16(ctx, opcode)) {
> -                gen_exception_illegal(ctx);
> -            }
> +            return;
> +        }
> +        if (ctx->ext_andes && decode_andes16(ctx, opcode)) {
> +            return;
> +        }
> +        if (!decode_insn16(ctx, opcode)) {
> +            gen_exception_illegal(ctx);
>          }
>      } else {
>          uint32_t opcode32 = opcode;
> @@ -487,6 +490,9 @@ static void decode_opc(CPURISCVState *env, DisasContext
> *ctx, uint16_t opcode)
>                               translator_lduw(env, &ctx->base,
>                                               ctx->base.pc_next + 2));
>          ctx->pc_succ_insn = ctx->base.pc_next + 4;
> +        if (ctx->ext_andes && decode_andes32(ctx, opcode)) {
> +            return;
> +        }
>          if (!decode_insn32(ctx, opcode32)) {
>              gen_exception_illegal(ctx);
>          }
> 
> 
> r~

