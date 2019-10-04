Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE06CB892
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:46:38 +0200 (CEST)
Received: from localhost ([::1]:45916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGL6a-00017G-O4
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iGKAU-0005q0-1j
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:46:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iGKAS-0003Sn-DF
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:46:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42486)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iGKAD-0003IL-77; Fri, 04 Oct 2019 05:46:17 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E4103883BA;
 Fri,  4 Oct 2019 09:46:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09B9B5C1D8;
 Fri,  4 Oct 2019 09:46:10 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH] target/arm/arch_dump: Add SVE notes
Date: Fri,  4 Oct 2019 11:46:09 +0200
Message-Id: <20191004094609.32714-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 04 Oct 2019 09:46:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Dave.Martin@arm.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When dumping a guest with dump-guest-memory also dump the SVE
registers if they are in use.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 include/elf.h          |   2 +
 target/arm/arch_dump.c | 133 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 133 insertions(+), 2 deletions(-)

diff --git a/include/elf.h b/include/elf.h
index 3501e0c8d03a..a7c357af74ca 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1650,6 +1650,8 @@ typedef struct elf64_shdr {
 #define NT_ARM_HW_BREAK 0x402           /* ARM hardware breakpoint regis=
ters */
 #define NT_ARM_HW_WATCH 0x403           /* ARM hardware watchpoint regis=
ters */
 #define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
+#define NT_ARM_SVE	0x405		/* ARM Scalable Vector Extension
+					   registers */
=20
 /*
  * Physical entry point into the kernel.
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 26a2c098687c..98976167d155 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -62,12 +62,23 @@ struct aarch64_user_vfp_state {
=20
 QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_vfp_state) !=3D 528);
=20
+/* struct user_sve_header from arch/arm64/include/uapi/asm/ptrace.h */
+struct aarch64_user_sve_header {
+    uint32_t size;
+    uint32_t max_size;
+    uint16_t vl;
+    uint16_t max_vl;
+    uint16_t flags;
+    uint16_t reserved;
+} QEMU_PACKED;
+
 struct aarch64_note {
     Elf64_Nhdr hdr;
     char name[8]; /* align_up(sizeof("CORE"), 4) */
     union {
         struct aarch64_elf_prstatus prstatus;
         struct aarch64_user_vfp_state vfp;
+        struct aarch64_user_sve_header sve;
     };
 } QEMU_PACKED;
=20
@@ -76,6 +87,8 @@ struct aarch64_note {
             (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_elf_prstat=
us))
 #define AARCH64_PRFPREG_NOTE_SIZE \
             (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_user_vfp_s=
tate))
+#define AARCH64_SVE_NOTE_SIZE(env) \
+            (AARCH64_NOTE_HEADER_SIZE + sve_size(env))
=20
 static void aarch64_note_init(struct aarch64_note *note, DumpState *s,
                               const char *name, Elf64_Word namesz,
@@ -128,11 +141,111 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDu=
mpFunction f,
     return 0;
 }
=20
+#ifdef TARGET_AARCH64
+static off_t sve_zreg_offset(uint32_t vq, int n)
+{
+    off_t off =3D sizeof(struct aarch64_user_sve_header);
+    return ROUND_UP(off, 16) + vq * 16 * n;
+}
+static off_t sve_preg_offset(uint32_t vq, int n)
+{
+    return sve_zreg_offset(vq, 32) + vq * 16 / 8 * n;
+}
+static off_t sve_fpsr_offset(uint32_t vq)
+{
+    off_t off =3D sve_preg_offset(vq, 17) + offsetof(struct aarch64_note=
, sve);
+    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
+}
+static off_t sve_fpcr_offset(uint32_t vq)
+{
+    return sve_fpsr_offset(vq) + sizeof(uint32_t);
+}
+static uint32_t sve_current_vq(CPUARMState *env)
+{
+    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+}
+static size_t sve_size(CPUARMState *env)
+{
+    off_t off =3D sve_fpcr_offset(sve_current_vq(env)) +
+                sizeof(uint32_t) +
+                offsetof(struct aarch64_note, sve);
+    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
+}
+
+static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
+                                   CPUARMState *env, int cpuid,
+                                   DumpState *s)
+{
+    struct aarch64_note *note;
+    uint32_t vq =3D sve_current_vq(env);
+    uint32_t fpr;
+    uint8_t *buf;
+    size_t size;
+    int ret, i;
+
+    note =3D g_malloc0(AARCH64_SVE_NOTE_SIZE(env));
+    size =3D sve_size(env);
+    buf =3D (uint8_t *)&note->sve;
+
+    aarch64_note_init(note, s, "LINUX", 6, NT_ARM_SVE, size);
+
+    note->sve.size =3D cpu_to_dump32(s, size);
+    note->sve.max_size =3D cpu_to_dump32(s, size);
+    note->sve.vl =3D cpu_to_dump16(s, vq * 16);
+    note->sve.max_vl =3D cpu_to_dump16(s, vq * 16);
+    note->sve.flags =3D cpu_to_dump16(s, 1);
+
+    for (i =3D 0; i < 32; ++i) {
+#ifdef HOST_WORDS_BIGENDIAN
+        uint64_t d[vq * 2];
+        int j;
+
+        for (j =3D 0; j < vq * 2; ++j) {
+            d[j] =3D bswap64(env->vfp.zregs[i].d[j]);
+        }
+#else
+        uint64_t *d =3D &env->vfp.zregs[i].d[0];
+#endif
+        memcpy(&buf[sve_zreg_offset(vq, i)], &d[0], vq * 16);
+    }
+
+    for (i =3D 0; i < 17; ++i) {
+#ifdef HOST_WORDS_BIGENDIAN
+        uint64_t d[DIV_ROUND_UP(vq * 2, 8)];
+        int j;
+
+        for (j =3D 0; j < DIV_ROUND_UP(vq * 2, 8); ++j) {
+            d[j] =3D bswap64(env->vfp.pregs[i].p[j]);
+        }
+#else
+        uint64_t *d =3D &env->vfp.pregs[i].p[0];
+#endif
+        memcpy(&buf[sve_preg_offset(vq, i)], &d[0], vq * 16 / 8);
+    }
+
+    fpr =3D cpu_to_dump32(s, vfp_get_fpsr(env));
+    memcpy(&buf[sve_fpsr_offset(vq)], &fpr, sizeof(uint32_t));
+
+    fpr =3D cpu_to_dump32(s, vfp_get_fpcr(env));
+    memcpy(&buf[sve_fpcr_offset(vq)], &fpr, sizeof(uint32_t));
+
+    ret =3D f(note, AARCH64_SVE_NOTE_SIZE(env), s);
+    g_free(note);
+
+    if (ret < 0) {
+        return -1;
+    }
+
+    return 0;
+}
+#endif
+
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque)
 {
     struct aarch64_note note;
-    CPUARMState *env =3D &ARM_CPU(cs)->env;
+    ARMCPU *cpu =3D ARM_CPU(cs);
+    CPUARMState *env =3D &cpu->env;
     DumpState *s =3D opaque;
     uint64_t pstate, sp;
     int ret, i;
@@ -163,7 +276,18 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f=
, CPUState *cs,
         return -1;
     }
=20
-    return aarch64_write_elf64_prfpreg(f, env, cpuid, s);
+    ret =3D aarch64_write_elf64_prfpreg(f, env, cpuid, s);
+    if (ret) {
+        return ret;
+    }
+
+#ifdef TARGET_AARCH64
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret =3D aarch64_write_elf64_sve(f, env, cpuid, s);
+    }
+#endif
+
+    return ret;
 }
=20
 /* struct pt_regs from arch/arm/include/asm/ptrace.h */
@@ -335,6 +459,11 @@ ssize_t cpu_get_note_size(int class, int machine, in=
t nr_cpus)
     if (class =3D=3D ELFCLASS64) {
         note_size =3D AARCH64_PRSTATUS_NOTE_SIZE;
         note_size +=3D AARCH64_PRFPREG_NOTE_SIZE;
+#ifdef TARGET_AARCH64
+        if (cpu_isar_feature(aa64_sve, cpu)) {
+            note_size +=3D AARCH64_SVE_NOTE_SIZE(env);
+        }
+#endif
     } else {
         note_size =3D ARM_PRSTATUS_NOTE_SIZE;
         if (arm_feature(env, ARM_FEATURE_VFP)) {
--=20
2.20.1


