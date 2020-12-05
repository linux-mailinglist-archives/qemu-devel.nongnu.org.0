Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0F2CF8A6
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 02:35:45 +0100 (CET)
Received: from localhost ([::1]:59590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klMUB-0000qR-IS
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 20:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephane.duverger@free.fr>)
 id 1klMSm-0000PA-CI
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 20:34:16 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:50406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stephane.duverger@free.fr>)
 id 1klMSj-0000ix-TP
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 20:34:16 -0500
Received: from wise (unknown [77.159.208.71])
 (Authenticated sender: stephane.duverger@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 13D705FEF7;
 Sat,  5 Dec 2020 02:34:05 +0100 (CET)
Date: Sat, 5 Dec 2020 02:34:02 +0100
From: Stephane Duverger <stephane.duverger@free.fr>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: x86 TCG helpers clobbered registers
Message-ID: <20201205013402.GA69224@wise>
References: <20201204153446.GA66154@wise>
 <1d246e29-b364-099f-440c-5b644087b55f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d246e29-b364-099f-440c-5b644087b55f@linaro.org>
Received-SPF: none client-ip=212.27.42.5;
 envelope-from=stephane.duverger@free.fr; helo=smtp5-g21.free.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 01:35:55PM -0600, Richard Henderson wrote:

Thank you Richard for your answer. I don't want to generate a debate,
or defend the way I've done things initially. Really want to clarify
these internals. Hope it will benefit to other QEMU enthusiasts.

> You can't just inject a call anywhere you like.  If you add it at
> the IR level, then the rest of the compiler will see it and work
> properly.  If you add the call in the middle of another operation,
> the compiler doesn't get to see it and Bad Things Happen.

I do understand that, and surprisingly isn't it what is done in the
qemu slow path ? I mean, the call to the helper is not generated at IR
level but rather injected through a 'jmp' right in the middle of
currently generated instructions, plus code added at the end of the
TB.

What's the difference between the way it is currently done for the
slow path and something like:

static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
{ [...]
    tcg_out_tlb_load(s, addrlo, addrhi, mem_index, opc,
                     label_ptr, offsetof(CPUTLBEntry, addr_write));

    /* TLB Hit.  */
    tcg_out_qemu_st_filter(s, opc, addrlo, addrhi, datalo, datahi);
    tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);

    /* Record the current context of a store into ldst label */
    add_qemu_ldst_label(s, false, is64, oi, datalo, datahi, addrlo, addrhi,
                        s->code_ptr, label_ptr);
}

Where:
static void tcg_out_qemu_st_filter(TCGContext *s, MemOp opc,
                                   TCGReg addrlo, TCGReg addrhi,
                                   TCGReg datalo, TCGReg datahi)
{
  MemOp s_bits = opc & MO_SIZE;

  tcg_out_push(s, TCG_REG_L1); // used later on by tcg_out_qemu_st_direct

  tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
              tcg_target_call_iarg_regs[0], addrlo);

  tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
              tcg_target_call_iarg_regs[1], datalo);

  tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], opc);

  tcg_out_call(s, (void*)filter_store_memop);

  tcg_out_pop(s, TCG_REG_L1);
}

Does the ldst_label mechanism generating slow path code at TB's end
change something ? There is still an injected 'jne' at
tcg_out_tlb_load() which redirects to the slow path code, whatever its
location, like I do in-place for tcg_out_qemu_st_filter.

For sure the TCG is blind at some point, but it works for the slow
path, so it should for the filter. The TCG qemu_st_i32 op is

DEF(qemu_st_i32, 0, TLADDR_ARGS + 1, 1,
    TCG_OPF_CALL_CLOBBER | TCG_OPF_SIDE_EFFECTS)

And as you stated, the tcg_reg_alloc_op() had properly managed the
call clobbered registers. So we should be safe calling a helper from
tcg_out_qemu_st() and arguably that's why you do so for the slow path
?


> > I noticed that 'esp' is not shifted down before stacking up the
> > args, which might corrupt last stacked words.
> 
> No, we generate code for a constant esp, as if by gcc's
> -mno-push-args option. We have reserved TCG_STATIC_CALL_ARGS_SIZE
> bytes of stack for the arguments (which is actually larger than
> necessary for any of the tcg targets).

As this is done only at the TB prologue, do you mean that the TCG will
never generate an equivalent to a push *followed* by a memory
store/load ? Our host esp will never point to a last stacked word,
issued by the translation of a TCG op ?

