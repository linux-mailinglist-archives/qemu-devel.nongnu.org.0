Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E44419FE8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 22:13:22 +0200 (CEST)
Received: from localhost ([::1]:48954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUx05-0004Xx-L9
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 16:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1mUwsA-0005NJ-SZ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 16:05:12 -0400
Received: from ciao.gmane.io ([116.202.254.214]:46244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1mUws6-0004Es-Ou
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 16:05:09 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>) id 1mUws2-0007lM-6S
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:05:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: qemu-devel@nongnu.org
From: Vineet Gupta <vineet.gupta@linux.dev>
Subject: Re: [PATCH v11 00/16] target/riscv: Update QEmu for Zb[abcs] 1.0.0
Date: Mon, 27 Sep 2021 13:01:39 -0700
Message-ID: <5be1705c-c39e-fa44-201c-467811f8e5c8@linux.dev>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
Content-Language: en-US
Received-SPF: pass client-ip=116.202.254.214;
 envelope-from=gceq-qemu-devel2@m.gmane-mx.org; helo=ciao.gmane.io
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.136, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 Jim Wilson <jimw@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 9/11/21 7:00 AM, Philipp Tomsich wrote:
> 
> The Zb[abcs] extensions have complete public review and are nearing
> ratifications. These individual extensions are one part of what was
> previously though of as the "BitManip" (B) extension, leaving the
> final details of future Zb* extensions open as they will undergo
> further public discourse.
> 
> This series updates the earlier support for the B extension by
>   - removing those instructions that are not included in Zb[abcs]
>   - splitting this into 4 separate extensions that can be independently
>     enabled: Zba (addressing), Zbb (basic bit-manip), Zbc (carryless
>     multiplication), Zbs (single-bit operations)
>   - update the to the 1.0.0 version (e.g. w-forms of rev8 and Zbs
>     instructions are not included in Zb[abcs])
> 
> For the latest version of the public review speicifcaiton
> (incorporating some editorial fixes and corrections from the review
> period), refer to:
>    https://github.com/riscv/riscv-bitmanip/releases/download/1.0.0/bitmanip-1.0.0-31-g2af7256.pdf

I was curious to try these out. Challenge was not qemu but stuff built 
to run on this qemu.

At LPC last week Jim/Kito suggested I use the gcc branch @
https://github.com/riscv-collab/riscv-gcc/tree/riscv-gcc-10.2.0-rvb

With that I get

$ riscv64-unknown-elf-gcc 
~/gnu/gcc/gcc/testsuite/gcc.target/riscv/rvb-zbs-bclr.c -c --save-temps 
-march=rv64gc_zbb_zbs -O2
Assembler messages:
Error: -march=rv64imafdc_zbb_zbs: unknown prefixed ISA extension `zbs'

So I obviously forgot to get the equivalent binutils branch, but the 
only rvb branch on sifive fork feels dated

https://github.com/riscv-collab/riscv-binutils-gdb/tree/riscv-binutils-2.35-rvb

Can someone point me to the right binutils repo/branch to pair with gcc 
changes above.

Thx,
-Vineet

> 
> 
> Changes in v11:
> - Swaps out the EXT_ZERO to EXT_NONE, as no extension is to be performed.
> - Fix typos in commit message.
> 
> Changes in v10:
> - New patch
> - New patch, fixing regressions discovered with x264_r.
> - New patch, fixing correctnes for clzw called on a register with undefined
>    (as in: not properly sign-extended) upper bits.
> - Retested with CF3 and SPEC2017 (size=test, size=ref); addressing new
>    regressions (due to bugs in gen_clzw) from testing with SPEC2017 using
>    different optimization levels
> - Split off gen_add_uw() fix into a separate patch, as requested.
> 
> Changes in v9:
> - Retested with CF3 and SPEC2017 (size=test only).
> - Rebased to 8880cc4362.
> - Update gen_add_uw() to use a temporary instead of messing with
>    arg1 (fixes a regression after rebase on CF3 and SPEC2017).
> - Rebased to 8880cc4362.
> - Picked up Alistair's Reviewed-by, after patman had failed to catch
>    it for v8.
> - Rebased to 8880cc4362.
> - Fixes a whitespace-at-the-end-of-line warning for the rev8 comment
>    in insn32.decode
> - Rebased to 8880cc4362.
> 
> Changes in v8:
> - Optimize orc.b further by reordering the shift/and, updating the
>    comment to reflect that we put the truth-value into the LSB, and
>    putting the (now only) constant in a temporary
> - Fold the final bitwise-not into the second and, using and andc.
> 
> Changes in v7:
> - Free TCG temporary in gen_orc_b().
> 
> Changes in v6:
> - Move gen_clmulh to trans_rvb.c.inc, as per Richard H's request.
> - Fixed orc.b (now passes SPEC w/ optimized string functions) by
>    adding the missing final negation.
> 
> Changes in v5:
> - Introduce gen_clmulh (as suggested by Richard H) and use to simplify
>    trans_clmulh().
> 
> Changes in v4:
> - Drop rewrite of slli.uw (to match formal specification), as it would
>    remove an optimization.
> - Change orc.b to implementation suggested by Richard Henderson
> - reorder trans_rev8* functions to be sequential
> - rename rev8 to rev8_32 in decoder
> - Renamed RV32 variant to zext_h_32.
> - Reordered trans_zext_h_{32,64} to be next to each other.
> 
> Changes in v3:
> - Split off removal of 'x-b' property and 'ext_b' field into a separate
>    patch to ensure bisectability.
> - The changes to the Zba instructions (i.e. the REQUIRE_ZBA macro
>    and its use for qualifying the Zba instructions) are moved into
>    a separate commit.
> - Remove the W-form instructions from Zbs in a separate commit.
> - Remove shift-one instructions in a separate commit.
> - The changes to the Zbs instructions (i.e. the REQUIRE_ZBS macro) and
>    its use for qualifying the Zba instructions) are moved into a
>    separate commit.
> - This adds the Zbc instructions as a spearate commit.
> - Uses a helper for clmul/clmulr instead of inlining the calculation of
>    the result (addressing a comment from Richard Henderson).
> - The changes to the Zbb instructions (i.e. use the REQUIRE_ZBB macro)
>    are now in a separate commit.
> - Moved orc.b and gorc/gorci changes into separate commit.
> - Using the simpler orc.b implementation suggested by Richard Henderson
> - Moved the REQUIRE_32BIT macro into a separate commit.
> - rev8-addition & grevi*-removal moved to a separate commit
> - Moved zext.h-addition & pack*-removal to a separate commit.
> - Removing RVB moved into a separate commit at the tail-end of the series.
> 
> Changes in v2:
> - Fix missing ';' from last-minute whitespace cleanups.
> 
> Philipp Tomsich (16):
>    target/riscv: Introduce temporary in gen_add_uw()
>    target/riscv: fix clzw implementation to operate on arg1
>    target/riscv: clwz must ignore high bits (use shift-left & changed
>      logic)
>    target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs properties
>    target/riscv: Reassign instructions to the Zba-extension
>    target/riscv: Remove the W-form instructions from Zbs
>    target/riscv: Remove shift-one instructions (proposed Zbo in pre-0.93
>      draft-B)
>    target/riscv: Reassign instructions to the Zbs-extension
>    target/riscv: Add instructions of the Zbc-extension
>    target/riscv: Reassign instructions to the Zbb-extension
>    target/riscv: Add orc.b instruction for Zbb, removing gorc/gorci
>    target/riscv: Add a REQUIRE_32BIT macro
>    target/riscv: Add rev8 instruction, removing grev/grevi
>    target/riscv: Add zext.h instructions to Zbb, removing
>      pack/packu/packh
>    target/riscv: Remove RVB (replaced by Zb[abcs])
>    disas/riscv: Add Zb[abcs] instructions
> 
>   disas/riscv.c                           | 157 ++++++++-
>   target/riscv/bitmanip_helper.c          |  65 +---
>   target/riscv/cpu.c                      |  30 +-
>   target/riscv/cpu.h                      |   7 +-
>   target/riscv/helper.h                   |   6 +-
>   target/riscv/insn32.decode              | 115 +++----
>   target/riscv/insn_trans/trans_rvb.c.inc | 419 ++++++++----------------
>   target/riscv/translate.c                |   6 +
>   8 files changed, 366 insertions(+), 439 deletions(-)
> 



