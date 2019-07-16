Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82C6A98A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 15:22:44 +0200 (CEST)
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnNPm-0003jJ-Vd
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 09:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54065)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ivan@espressif.com>) id 1hnIIY-0003C9-NG
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ivan@espressif.com>) id 1hnIIX-0005uc-Gr
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:54:54 -0400
Received: from hkmail.espressif.com ([203.60.5.236]:48354)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ivan@espressif.com>) id 1hnIIW-0005sF-W7
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:54:53 -0400
Received: from cnmail.espressif.com ([140.206.114.118])
 by hkmail.espressif.com (IceWarp 11.3.0.4 RHEL6 x64) with ESMTP (SSL) id
 201907161552152486
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 15:52:15 +0800
Received: from [192.168.0.170] ([195.122.199.236])
 by cnmail.espressif.com ((Espressif cloud mail system)) with ASMTP (SSL) id
 201907161553256154; Tue, 16 Jul 2019 15:53:25 +0800
From: Ivan Grokhotkov <ivan@espressif.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <F94AE129-7994-48B1-8215-EF429990C512@espressif.com>
Date: Tue, 16 Jul 2019 09:52:01 +0200
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3445.104.11)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.60.5.236
X-Mailman-Approved-At: Tue, 16 Jul 2019 09:22:23 -0400
Subject: [Qemu-devel] [PATCH] target/riscv: don't overwrite priv_version and
 resetvec when realizing
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
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CPU-specific init functions (riscv_*_cpu_init) configure members of
CPURISCVState, such as priv_version and resetvec. However
riscv_cpu_realize unconditionally overwrites these members. The
result is that some CPUs (such as CPU_SIFIVE_U34) are getting created
with incorrect priv_version.

Only set priv_version in riscv_cpu_realize if priv_spec property was
set. Don't set resetvec in riscv_cpu_realize, rely on the init
function to set it. Set default priv_version and resetvec in init
functions where this was missing.

Signed-off-by: Ivan Grokhotkov <ivan@espressif.com>
---
target/riscv/cpu.c | 12 +++++++-----
target/riscv/cpu.h |  1 +
2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f8d07bd20a..cded5bac22 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,7 +110,7 @@ static void riscv_any_cpu_init(Object *obj)
{
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
     set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    set_priv_version(env, PRIV_VERSION_DEFAULT);
     set_resetvec(env, DEFAULT_RSTVEC);
}

@@ -119,6 +119,8 @@ static void riscv_any_cpu_init(Object *obj)
static void riscv_base32_cpu_init(Object *obj)
{
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    set_priv_version(env, PRIV_VERSION_DEFAULT);
+	set_resetvec(env, DEFAULT_RSTVEC);
     /* We set this in the realise function */
     set_misa(env, 0);
}
@@ -157,6 +159,8 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
static void riscv_base64_cpu_init(Object *obj)
{
     CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+    set_priv_version(env, PRIV_VERSION_DEFAULT);
+	set_resetvec(env, DEFAULT_RSTVEC);
     /* We set this in the realise function */
     set_misa(env, 0);
}
@@ -316,7 +320,7 @@ static void riscv_cpu_realize(DeviceState *dev, =
Error **errp)
     RISCVCPU *cpu =3D RISCV_CPU(dev);
     CPURISCVState *env =3D &cpu->env;
     RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
-    int priv_version =3D PRIV_VERSION_1_11_0;
+    int priv_version =3D PRIV_VERSION_DEFAULT;
     target_ulong target_misa =3D 0;
     Error *local_err =3D NULL;

@@ -339,11 +343,9 @@ static void riscv_cpu_realize(DeviceState *dev, =
Error **errp)
                        cpu->cfg.priv_spec);
             return;
         }
+        set_priv_version(env, priv_version);
     }

-    set_priv_version(env, priv_version);
-    set_resetvec(env, DEFAULT_RSTVEC);
-
     if (cpu->cfg.mmu) {
         set_feature(env, RISCV_FEATURE_MMU);
     }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0adb307f32..88a52a1c8c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@ enum {
#define PRIV_VERSION_1_09_1 0x00010901
#define PRIV_VERSION_1_10_0 0x00011000
#define PRIV_VERSION_1_11_0 0x00011100
+#define PRIV_VERSION_DEFAULT PRIV_VERSION_1_11_0

#define TRANSLATE_PMP_FAIL 2
#define TRANSLATE_FAIL 1
--=20
2.20.1 (Apple Git-117)

I couldn=E2=80=99t find an existing place where a unit test for correct =
priv_version could be added, but would be happy to do so if poked in the =
right direction. Thanks.

---
Best regards,
Ivan Grokhotkov



