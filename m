Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D11142820
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 11:21:05 +0100 (CET)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itUB6-0000RV-CM
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 05:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1itU8o-000730-Fw
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:18:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1itU8m-0006gM-SN
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:18:42 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21564
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1itU8m-0006fp-NW
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579515520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9+DILeRgdjz5rTMxsXsTACh5c/3flqmx//VXm9Prbcg=;
 b=bCBp0UdNb4YQXo62YwAFlpK5sbr/3Wqn9amI04JBdg3Ojyy4+OEx8+zkT0S3Gqho+jIh0T
 Gwr+STqHZk6hesAbDWGjCcVq3P+K04S04ZqXIRZva4TkY0kmIi6RXqWs0J+RQp4pw5MQnv
 EADd4vl/SIiUj4t9qrh/dDUcjjQwpDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-2Zac0TpxMUmhMEcn18bU1A-1; Mon, 20 Jan 2020 05:18:38 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CF33DB61;
 Mon, 20 Jan 2020 10:18:37 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFF4A60BF7;
 Mon, 20 Jan 2020 10:18:32 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH REPOST v3] target/arm/arch_dump: Add SVE notes
Date: Mon, 20 Jan 2020 11:18:32 +0100
Message-Id: <20200120101832.18781-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 2Zac0TpxMUmhMEcn18bU1A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h          |   2 +
 target/arm/arch_dump.c | 124 ++++++++++++++++++++++++++++++++++++++++-
 target/arm/cpu.h       |  25 +++++++++
 target/arm/kvm64.c     |  24 --------
 4 files changed, 149 insertions(+), 26 deletions(-)

diff --git a/include/elf.h b/include/elf.h
index 3501e0c8d03a..a7c357af74ca 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1650,6 +1650,8 @@ typedef struct elf64_shdr {
 #define NT_ARM_HW_BREAK 0x402           /* ARM hardware breakpoint registe=
rs */
 #define NT_ARM_HW_WATCH 0x403           /* ARM hardware watchpoint registe=
rs */
 #define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
+#define NT_ARM_SVE=090x405=09=09/* ARM Scalable Vector Extension
+=09=09=09=09=09   registers */
=20
 /*
  * Physical entry point into the kernel.
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 26a2c098687c..2345dec3c2c2 100644
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
             (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_elf_prstatus=
))
 #define AARCH64_PRFPREG_NOTE_SIZE \
             (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_user_vfp_sta=
te))
+#define AARCH64_SVE_NOTE_SIZE(env) \
+            (AARCH64_NOTE_HEADER_SIZE + sve_size(env))
=20
 static void aarch64_note_init(struct aarch64_note *note, DumpState *s,
                               const char *name, Elf64_Word namesz,
@@ -128,11 +141,102 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDump=
Function f,
     return 0;
 }
=20
+#ifdef TARGET_AARCH64
+static off_t sve_zreg_offset(uint32_t vq, int n)
+{
+    off_t off =3D sizeof(struct aarch64_user_sve_header);
+    return ROUND_UP(off, 16) + vq * 16 * n;
+}
+
+static off_t sve_preg_offset(uint32_t vq, int n)
+{
+    return sve_zreg_offset(vq, 32) + vq * 16 / 8 * n;
+}
+
+static off_t sve_fpsr_offset(uint32_t vq)
+{
+    off_t off =3D sve_preg_offset(vq, 17);
+    return ROUND_UP(off, 16);
+}
+
+static off_t sve_fpcr_offset(uint32_t vq)
+{
+    return sve_fpsr_offset(vq) + sizeof(uint32_t);
+}
+
+static uint32_t sve_current_vq(CPUARMState *env)
+{
+    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+}
+
+static size_t sve_size_vq(uint32_t vq)
+{
+    off_t off =3D sve_fpcr_offset(vq) + sizeof(uint32_t);
+    return ROUND_UP(off, 16);
+}
+
+static size_t sve_size(CPUARMState *env)
+{
+    return sve_size_vq(sve_current_vq(env));
+}
+
+static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
+                                   CPUARMState *env, int cpuid,
+                                   DumpState *s)
+{
+    struct aarch64_note *note;
+    ARMCPU *cpu =3D env_archcpu(env);
+    uint32_t vq =3D sve_current_vq(env);
+    uint64_t tmp[ARM_MAX_VQ * 2], *r;
+    uint32_t fpr;
+    uint8_t *buf;
+    int ret, i;
+
+    note =3D g_malloc0(AARCH64_SVE_NOTE_SIZE(env));
+    buf =3D (uint8_t *)&note->sve;
+
+    aarch64_note_init(note, s, "LINUX", 6, NT_ARM_SVE, sve_size_vq(vq));
+
+    note->sve.size =3D cpu_to_dump32(s, sve_size_vq(vq));
+    note->sve.max_size =3D cpu_to_dump32(s, sve_size_vq(cpu->sve_max_vq));
+    note->sve.vl =3D cpu_to_dump16(s, vq * 16);
+    note->sve.max_vl =3D cpu_to_dump16(s, cpu->sve_max_vq * 16);
+    note->sve.flags =3D cpu_to_dump16(s, 1);
+
+    for (i =3D 0; i < 32; ++i) {
+        r =3D sve_bswap64(tmp, &env->vfp.zregs[i].d[0], vq * 2);
+        memcpy(&buf[sve_zreg_offset(vq, i)], r, vq * 16);
+    }
+
+    for (i =3D 0; i < 17; ++i) {
+        r =3D sve_bswap64(tmp, r =3D &env->vfp.pregs[i].p[0],
+                        DIV_ROUND_UP(vq * 2, 8));
+        memcpy(&buf[sve_preg_offset(vq, i)], r, vq * 16 / 8);
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
@@ -163,7 +267,18 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, =
CPUState *cs,
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
@@ -335,6 +450,11 @@ ssize_t cpu_get_note_size(int class, int machine, int =
nr_cpus)
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
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 40f2c45e17e3..c1aedbeac0db 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -980,6 +980,31 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned =
vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_add_sve_properties(Object *obj);
+
+/*
+ * SVE registers are encoded in KVM's memory in an endianness-invariant fo=
rmat.
+ * The byte at offset i from the start of the in-memory representation con=
tains
+ * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means t=
he
+ * lowest offsets are stored in the lowest memory addresses, then that nea=
rly
+ * matches QEMU's representation, which is to use an array of host-endian
+ * uint64_t's, where the lower offsets are at the lower indices. To comple=
te
+ * the translation we just need to byte swap the uint64_t's on big-endian =
hosts.
+ */
+static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
+{
+#ifdef HOST_WORDS_BIGENDIAN
+    int i;
+
+    for (i =3D 0; i < nr; ++i) {
+        dst[i] =3D bswap64(src[i]);
+    }
+
+    return dst;
+#else
+    return src;
+#endif
+}
+
 #else
 static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { =
}
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 876184b8fe4d..e2da756e65ed 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -876,30 +876,6 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
     return 0;
 }
=20
-/*
- * SVE registers are encoded in KVM's memory in an endianness-invariant fo=
rmat.
- * The byte at offset i from the start of the in-memory representation con=
tains
- * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means t=
he
- * lowest offsets are stored in the lowest memory addresses, then that nea=
rly
- * matches QEMU's representation, which is to use an array of host-endian
- * uint64_t's, where the lower offsets are at the lower indices. To comple=
te
- * the translation we just need to byte swap the uint64_t's on big-endian =
hosts.
- */
-static uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
-{
-#ifdef HOST_WORDS_BIGENDIAN
-    int i;
-
-    for (i =3D 0; i < nr; ++i) {
-        dst[i] =3D bswap64(src[i]);
-    }
-
-    return dst;
-#else
-    return src;
-#endif
-}
-
 /*
  * KVM SVE registers come in slices where ZREGs have a slice size of 2048 =
bits
  * and PREGS and the FFR have a slice size of 256 bits. However we simply =
hard
--=20
2.21.1


