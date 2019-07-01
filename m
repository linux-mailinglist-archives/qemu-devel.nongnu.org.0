Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D424710B
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jun 2019 17:51:36 +0200 (CEST)
Received: from localhost ([::1]:32898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcAxr-0007kX-9P
	for lists+qemu-devel@lfdr.de; Sat, 15 Jun 2019 11:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35899)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAr4-00044T-1j
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAr2-0000tJ-H1
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:44:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41868)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqw-0000YG-Oc; Sat, 15 Jun 2019 11:44:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ED74A356D2;
 Sat, 15 Jun 2019 15:44:24 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACEF21001B05;
 Sat, 15 Jun 2019 15:44:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:42 +0200
Message-Id: <20190615154352.26824-14-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Sat, 15 Jun 2019 15:44:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 13/23] target/arm: Make the v7-M Security
 State routines
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Security State helpers are now only called within v7m_helper.c.
Remove them from "internals.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/internals.h  |  8 --------
 target/arm/v7m_helper.c | 10 +++++-----
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1d15af3f8b..fe9e4665e2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1043,12 +1043,4 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t =
address,
                        int *prot, bool *is_subpage,
                        ARMMMUFaultInfo *fi, uint32_t *mregion);
=20
-void write_v7m_control_spsel_for_secstate(CPUARMState *env,
-                                          bool new_spsel,
-                                          bool secstate);
-
-void write_v7m_control_spsel(CPUARMState *env, bool new_spsel);
-
-void switch_v7m_security_state(CPUARMState *env, bool new_secstate);
-
 #endif
diff --git a/target/arm/v7m_helper.c b/target/arm/v7m_helper.c
index b50bb98e06..aa6a08e326 100644
--- a/target/arm/v7m_helper.c
+++ b/target/arm/v7m_helper.c
@@ -94,9 +94,9 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr=
, uint32_t op)
  * stack pointers if it is done for the CONTROL register for the current
  * security state.
  */
-void write_v7m_control_spsel_for_secstate(CPUARMState *env,
-                                          bool new_spsel,
-                                          bool secstate)
+static void write_v7m_control_spsel_for_secstate(CPUARMState *env,
+                                                 bool new_spsel,
+                                                 bool secstate)
 {
     bool old_is_psp =3D v7m_using_psp(env);
=20
@@ -121,13 +121,13 @@ void write_v7m_control_spsel_for_secstate(CPUARMSta=
te *env,
  * Write to v7M CONTROL.SPSEL bit. This may change the current
  * stack pointer between Main and Process stack pointers.
  */
-void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
+static void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
 {
     write_v7m_control_spsel_for_secstate(env, new_spsel, env->v7m.secure=
);
 }
=20
 /* Switch M profile security state between NS and S */
-void switch_v7m_security_state(CPUARMState *env, bool new_secstate)
+static void switch_v7m_security_state(CPUARMState *env, bool new_secstat=
e)
 {
     uint32_t new_ss_msp, new_ss_psp;
=20
--=20
2.20.1


