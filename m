Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FED4AE2AC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:54:13 +0100 (CET)
Received: from localhost ([::1]:52252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXV6-0007Ft-8G
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nHX9j-0006jc-41; Tue, 08 Feb 2022 15:32:07 -0500
Received: from [187.72.171.209] (port=13564 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nHX9g-0001fq-9K; Tue, 08 Feb 2022 15:32:06 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 8 Feb 2022 17:31:57 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id EDD27801D19;
 Tue,  8 Feb 2022 17:31:56 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 0/3] tests/tcg/ppc64le: fix the build of TCG tests with
 Clang
Date: Tue,  8 Feb 2022 17:31:42 -0300
Message-Id: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 Feb 2022 20:31:57.0399 (UTC)
 FILETIME=[EAE2BE70:01D81D2A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, groug@kaod.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Based-on: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg06506.html

As the configuration scripts used -mbig and -mlittle, building PPC tests
with Clang was silently skipped. With the patch to fix these options[1],
"make check-tcg" fails because of build and runtime errors. This patch
series tries to fix some of these problems.

The first patch fixes "tests/tcg/ppc64le/mtfsf.c" by removing the
GCC-only builtins used to emit mtfsf and mffs. We can emit these insns
with inline asm instead.

The second patch addresses differences in the output of float_madds.c.
The __builtin_fmaf used in this test emits fmadds with GCC and xsmaddasp
with LLVM. The first insn had rounding errors fixed in
d04ca895dc7f ("target/ppc: Add helpers for fmadds et al"), we apply
a similar fix to xsmaddasp.

Then we have the build errors of tests/tcg/ppc64le/bcdsub.c. According
to GCC docs[2], the '-mpower8-vector' flag provides some bcdsub
builtins, so it'd be reasonable to assume that the rest of the toolchain
knows about the insn if the compiler accepts this flag. Clang supports
this flag since version 3.6[3], but the insn and builtins were only
added in LLVM 14[4]. I couldn't find a good solution. Should we write a
test to check for this insn at configuration time? Should we detect the
compiler at build time and emit the insns with ".long" and fixed
registers?

Even building with Clang 14, the test will fail in runtime because
LLVM doesn't like "__int128" in inline asm. No error or warning is
emitted, but the generated code only loads one doubleword of the VSR.
The third patch of this series avoids this issue by using a vector
type for VSR values.

Finally, it seems that the insns tested by
tests/tcg/ppc64le/byte_reverse.c are not yet supported by LLVM. Since
the configuration script uses '-mpower10' to check for POWER10 support
and Clang doesn't support this flag, "make check-tcg" doesn't fail. We
should probably change this check in the future, but since LLVM support
of POWER10 seems incomplete, I guess we can leave it for now.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg06506.html
[2] https://gcc.gnu.org/onlinedocs/gcc-8.3.0/gcc/PowerPC-AltiVec_002fVSX-Built-in-Functions.html
[3] https://github.com/llvm/llvm-project/commit/59eb767e11d4ffefb5f55409524e5c8416b2b0db
[4] https://github.com/llvm/llvm-project/commit/c933c2eb334660c131f4afc9d194fafb0cec0423

Matheus Ferst (3):
  tests/tcg/ppc64le: use inline asm instead of __builtin_mtfsf
  target/ppc: change xs[n]madd[am]sp to use float64r32_muladd
  tests/tcg/ppc64le: Use vector types instead of __int128

 target/ppc/fpu_helper.c    | 54 ++++++++--------------
 tests/tcg/ppc64le/bcdsub.c | 92 +++++++++++++++++++++-----------------
 tests/tcg/ppc64le/mtfsf.c  | 19 ++++----
 3 files changed, 80 insertions(+), 85 deletions(-)

-- 
2.25.1


