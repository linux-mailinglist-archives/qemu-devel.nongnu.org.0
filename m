Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0622185E92
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Mar 2020 17:49:26 +0100 (CET)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDWS5-0007HO-Bl
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 12:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vfazio@xes-inc.com>) id 1jDVZ6-0008Hq-2r
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 11:52:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vfazio@xes-inc.com>) id 1jDVZ4-00063O-LE
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 11:52:35 -0400
Received: from xes-mad.com ([162.248.234.2]:39161 helo=mail.xes-mad.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vfazio@xes-inc.com>)
 id 1jDVZ4-0005tm-Es; Sun, 15 Mar 2020 11:52:34 -0400
Received: from vfazio1.xes-mad.com (vfazio1.xes-mad.com [10.52.16.140])
 by mail.xes-mad.com (Postfix) with ESMTP id 70062201E3;
 Sun, 15 Mar 2020 10:52:32 -0500 (CDT)
From: Vincent Fazio <vfazio@xes-inc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] target/ppc: fix ELFv2 signal handler endianness
Date: Sun, 15 Mar 2020 10:52:02 -0500
Message-Id: <20200315155202.13107-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 162.248.234.2
X-Mailman-Approved-At: Sun, 15 Mar 2020 12:42:13 -0400
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
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Vincent Fazio <vfazio@gmail.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vincent Fazio <vfazio@gmail.com>

In ELFv2, function pointers are entry points and are in host endianness.

Previously, the signal handler would be swapped if the target CPU was a
different endianness than the host. This would cause a SIGSEGV when
attempting to translate the opcode pointed to by the swapped address.

 Thread 1 "qemu-ppc64" received signal SIGSEGV, Segmentation fault.
 0x00000000600a9257 in ldl_he_p (ptr=3D0x4c2c061000000000) at qemu/includ=
e/qemu/bswap.h:351
 351        __builtin_memcpy(&r, ptr, sizeof(r));

 #0  0x00000000600a9257 in ldl_he_p (ptr=3D0x4c2c061000000000) at qemu/in=
clude/qemu/bswap.h:351
 #1  0x00000000600a92fe in ldl_be_p (ptr=3D0x4c2c061000000000) at qemu/in=
clude/qemu/bswap.h:449
 #2  0x00000000600c0790 in translator_ldl_swap at qemu/include/exec/trans=
lator.h:201
 #3  0x000000006011c1ab in ppc_tr_translate_insn at qemu/target/ppc/trans=
late.c:7856
 #4  0x000000006005ae70 in translator_loop at qemu/accel/tcg/translator.c=
:102

Now, no swap is performed and execution continues properly.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 linux-user/ppc/signal.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 5b82af6cb6..c7f6455170 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -567,9 +567,13 @@ void setup_rt_frame(int sig, struct target_sigaction=
 *ka,
         env->nip =3D tswapl(handler->entry);
         env->gpr[2] =3D tswapl(handler->toc);
     } else {
-        /* ELFv2 PPC64 function pointers are entry points, but R12
-         * must also be set */
-        env->nip =3D tswapl((target_ulong) ka->_sa_handler);
+        /*
+         * ELFv2 PPC64 function pointers are entry points and are in hos=
t
+         * endianness so should not to be swapped.
+         *
+         * Note: R12 must also be set.
+         */
+        env->nip =3D (target_ulong) ka->_sa_handler;
         env->gpr[12] =3D env->nip;
     }
 #else
--=20
2.25.1


