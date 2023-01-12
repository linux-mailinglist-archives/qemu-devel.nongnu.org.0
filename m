Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0C66795B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:33:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFzVk-0002nz-KI; Thu, 12 Jan 2023 10:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pFzVO-0002lR-BU
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:28:38 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1pFzVM-0003y0-18
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cWEwDq7sYWw+XlGl/O65SStEEAQ6Qs9HeNBDr0z0Iek=; b=nxPwV1dIo+nGd7Rgfnq1tOhYMZ
 xPbrEzIfKlqd4FWW+BS8arfxkdlPM7mf/8rapWjisOI2kCX+pGD4T0/412r0He4QsFp3TvzpFK9+m
 NCtYuiTXD2z4XSbaRWdjv8XheJXKngPMbwnnrB2xSrW1+1hihIQNVZcb9Di3o+jCBypQ=;
Date: Thu, 12 Jan 2023 16:28:21 +0100
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Taylor Simpson <tsimpson@quicinc.com>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [RFC] Reducing NEED_CPU_H usage
Message-ID: <20230112162821.21ae8d7a@orange>
In-Reply-To: <ad150bbe-6a59-7b46-2e7b-bbc8441e118a@linaro.org>
References: <20221228171617.059750c3@orange>
 <ad150bbe-6a59-7b46-2e7b-bbc8441e118a@linaro.org>
Followup-To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 10 Jan 2023 11:56:50 -0800
Richard Henderson <richard.henderson@linaro.org> wrote:

> However, at some point we do want to keep some target addresses in
> the proper size.  For instance within the softmmu tlb, where
> CPUTLBEntry is either 16 or 32 bytes, depending.

So that would be an optimization if `HOST_LONG_BITS =3D=3D 32 &&
TARGET_LONG_BITS =3D=3D 32`, correct?

I've heard about dropping 32 bit hosts multiple times here and there.
Maybe we could start with dropping oversized guests, which AFAIU are
the real offenders for most (all?) of these situations.

> > ## `abi_ulong`
> >=20
> > Similar to `target_ulong`, but with alignment info. =20
>=20
> Pardon?  There's no alignment info in abi_ulong.

=46rom include/exec/user/abitypes.h:

    typedef uint32_t abi_ulong __attribute__((aligned(ABI_LONG_ALIGNMENT)));
    typedef target_ulong abi_ulong __attribute__((aligned(ABI_LONG_ALIGNMEN=
T)));

I thought that was the difference. Thanks for the clarification.

> This one requires some work within tcg/ to handle two target address
> sizes simultaneously. It should not be technically difficult to
> solve, but it does involve adding a few TCG opcodes and adjusting all
> tcg backends.

I'm a bit confused by this, do backends for some reason have
expectations about the address size?
Wouldn't this be enough?

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 019fab00ccb..175162b8fef 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -29,0 +29,0 @@
@@ -2827,17 +2843,17 @@ static inline MemOp tcg_canonicalize_memop(MemOp op=
, bool is64, bool st)
     return op;
 }
=20
-static void gen_ldst_i32(TCGOpcode opc, TCGv_i32 val, TCGv addr,
+static void gen_ldst_i32(TCGOpcode opc, TCGv_i32 val, TCGv_dyn addr,
                          MemOp memop, TCGArg idx)
 {
     MemOpIdx oi =3D make_memop_idx(memop, idx);
-#if TARGET_LONG_BITS =3D=3D 32
-    tcg_gen_op3i_i32(opc, val, addr, oi);
-#else
-    if (TCG_TARGET_REG_BITS =3D=3D 32) {
-        tcg_gen_op4i_i32(opc, val, TCGV_LOW(addr), TCGV_HIGH(addr), oi);
-    } else {
-        tcg_gen_op3(opc, tcgv_i32_arg(val), tcgv_i64_arg(addr), oi);
-    }
-#endif
+    if (addr.size =3D=3D 32) {
+        tcg_gen_op3i_i32(opc, val, addr.i32, oi);
+    } else {
+        if (TCG_TARGET_REG_BITS =3D=3D 32) {
+            tcg_gen_op4i_i32(opc, val, TCGV_LOW(addr.i64), TCGV_HIGH(addr.=
i64), oi);
+        } else {
+            tcg_gen_op3(opc, tcgv_i32_arg(val), tcgv_i64_arg(addr.i64), oi=
);
+        }
+    }
 }


> This forgets that both TCGv_i32 and TCGv_i64 are represented by
> TCGTemp,

    https://i.imgflip.com/777wax.jpg

> which contains 'TCGType type' to discriminate.  This is not
> exposed to target/, but it's there.
>=20
> Anyway, there's no need for this.

So, if I got it right, we could just make TCGv become a new opaque
type, propagate it down until the spot where we actually need to know
its size and then just have some `TCGTemp *tcgv_temp(TCGv v)` function
to inspect the actual size?

Makes sense!

> Before CPUNegativeOffsetState, we had all of those variables within
> CPUState, and even comments that they should remain at the end of the
> struct.  But those comments were ignored and one day icount_decr was
> too far away from env for easy addressing on arm host. Luckily there
> was an assert that fired, but it didn't get caught right away.

How comes it wasn't caught immediately?
We could have something like:

    QEMU_BUILD_BUG_MSG(&ArchCPU.env - &ArchCPU.neg.tlb
                       < DESIRED_THRESHOLD)

> > # Current status
> >=20
> > We currently have a branch where we can build (but not link nor
> > run) a `x86_64-linux-user` configuration where `NEED_CPU_H` is
> > defined only for translation units in `target/` and `linux-user/`. =20
>=20
> This effort should be exclusive to system mode -- don't consider
> *-user at all. Each linux-user target bakes in not just target
> architecture parameters, which are complicated enough, but also C
> ABI, and kernel API.  Moreover, the most common use case for
> linux-user is a statically linked binary that operates within a
> chroot.

Our current goal is to get the following compilation unit to build
without NEED_CPU_H:

    trace/control-target.c
    gdbstub/gdbstub.c
    cpu.c
    disas.c
    page-vary.c
    tcg/optimize.c
    tcg/region.c
    tcg/tcg.c
    tcg/tcg-common.c
    tcg/tcg-op.c
    tcg/tcg-op-gvec.c
    tcg/tcg-op-vec.c
    fpu/softfloat.c
    accel/accel-common.c
    accel/tcg/tcg-all.c
    accel/tcg/cpu-exec-common.c
    accel/tcg/cpu-exec.c
    accel/tcg/tb-maint.c
    accel/tcg/tcg-runtime-gvec.c
    accel/tcg/tcg-runtime.c
    accel/tcg/translate-all.c
    accel/tcg/translator.c
    accel/tcg/user-exec.c
    accel/tcg/user-exec-stub.c
    accel/tcg/plugin-gen.c
    plugins/loader.c
    plugins/core.c
    plugins/api.c

They are subset of `arch_srcs` from `meson.build`.

Making them target agnostic for *-user too should be easy and could save
some build time.
But yeah, we'll now focus on system-mode.

We'll now try to sort out things from the easiest to the most complex
and start send out patches.

Thanks a lot for your valuable insights!

--=20
Alessandro Di Federico
rev.ng Labs

