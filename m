Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E14CDAD1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:34:44 +0100 (CET)
Received: from localhost ([::1]:58672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBpD-00039X-61
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:34:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQBCL-0008HP-Ut; Fri, 04 Mar 2022 11:54:33 -0500
Received: from [187.72.171.209] (port=61123 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nQBCJ-0004rt-Oc; Fri, 04 Mar 2022 11:54:33 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 4 Mar 2022 13:54:25 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7C1D78001C2;
 Fri,  4 Mar 2022 13:54:25 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 0/5] tests/tcg/ppc64le: fix the build of TCG tests with
 Clang
Date: Fri,  4 Mar 2022 13:54:12 -0300
Message-Id: <20220304165417.1981159-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Mar 2022 16:54:25.0927 (UTC)
 FILETIME=[81842970:01D82FE8]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

As the configuration scripts used -mbig and -mlittle, building PPC tests
with Clang was silently skipped. With the patch to fix these options[1],
"make check-tcg" fails because of build and runtime errors. This patch
series tries to fix some of these problems.

The first patch fixes tests/tcg/ppc64le/mtfsf.c by removing the GCC-only
builtins used to emit mtfsf and mffs. We can emit these insns with
inline asm instead.

The second patch addresses differences in the output of float_madds.c.
The __builtin_fmaf used in this test emits fmadds with GCC and
xsmaddasp with LLVM. The first insn had rounding errors fixed in
d04ca895dc7f ("target/ppc: Add helpers for fmadds et al"), we apply a
similar fix to xsmaddasp.

Then we have build and runtime errors of bcdsub. According to GCC
docs[2], the '-mpower8-vector' flag provides some bcdsub builtins, so
it'd be reasonable to assume that the rest of the toolchain knows about
the insn if the compiler accepts this flag. Clang has supported this
flag since version 3.6[3], but the insn and builtins were only added in
LLVM 14[4]. I couldn't find a good config-time solution, so we use
__has_builtin to check for __builtin_bcdsub at compile-time and, if not
available, emit the opcode with a ".long." If __has_builtin itself is
not available, we assume that -mpower8-vector is enough and that the
insn is available.

Even building with a newer Clang that accepts the bcdsub insn, the test
fails at runtime because LLVM doesn't like "__int128" in inline asm. No
error or warning is emitted, but the generated code only loads one
doubleword of the VSR. The third patch avoids this issue by passing the
VSR values in GPR pairs, as we did in
84ade98e87ea ("target/ppc: do not silence snan in xscvspdpn").

The last patch fixes tests/tcg/ppc64le/non_signalling_xscv.c build with
-mabi=elfv1. Clang only recognizes VSX register in the clobber list of
inline asm when using ELFv2, so we use VSRs >= 32 and list them by their
Altivec name.

Finally, the insns tested by tests/tcg/ppc64le/byte_reverse.c are not
yet supported by LLVM. Since the configuration script uses '-mpower10'
to check for POWER10 support and Clang doesn't support this flag,
"make check-tcg" doesn't fail. We should probably change this check in
the future, but since LLVM support of POWER10 seems incomplete, I guess
we can leave it for now.

v3:
 - Removed unrelated changes in patch 2
 - Fixed __has_builtin check in bcdsub

v2:
 - New patch to address non_signalling_xscv.c build problems with Clang
   and ELFv1;
 - Rework of bcdsub patch to work with LLVM < 14 and avoid vector types.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg06506.html
[2] https://gcc.gnu.org/onlinedocs/gcc-8.3.0/gcc/PowerPC-AltiVec_002fVSX-Built-in-Functions.html
[3] https://github.com/llvm/llvm-project/commit/59eb767e11d4ffefb5f55409524e5c8416b2b0db
[4] https://github.com/llvm/llvm-project/commit/c933c2eb334660c131f4afc9d194fafb0cec0423

Matheus Ferst (5):
  tests/tcg/ppc64le: use inline asm instead of __builtin_mtfsf
  target/ppc: change xs[n]madd[am]sp to use float64r32_muladd
  tests/tcg/ppc64le: drop __int128 usage in bcdsub
  tests/tcg/ppc64le: emit bcdsub with .long when needed
  tests/tcg/ppc64le: Use Altivec register names in clobber list

 target/ppc/fpu_helper.c                 |  54 ++++------
 tests/tcg/ppc64le/bcdsub.c              | 138 ++++++++++++------------
 tests/tcg/ppc64le/mtfsf.c               |  19 ++--
 tests/tcg/ppc64le/non_signalling_xscv.c |  16 +--
 4 files changed, 106 insertions(+), 121 deletions(-)

-- 
2.25.1


