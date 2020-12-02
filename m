Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6F02CC97F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 23:21:23 +0100 (CET)
Received: from localhost ([::1]:59876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkaUz-0007yr-W6
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 17:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lfy@google.com>) id 1kkaTV-0007Ox-W7
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 17:19:50 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:46955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lfy@google.com>) id 1kkaTT-000599-BN
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 17:19:49 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id s8so115716yba.13
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 14:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Z2oMFh0UtFsC+WX1cHN7TFNpNKzs/ZPOQBocx/DRAls=;
 b=Dr9FwZSSjNO/PsUB2bqkJTcem83yRpBtx+KF9X6VxJcaVIRrHZoQsNmLuPdNiDPus/
 xUtTbJMpDayFt8vyoVVot9Y6lkCG9c5XJiF1W8tL9L71QfkzR+H0dUFBpBUwv+XdHruH
 rKqeR9cmJbxvVCQOyuNEC0RFAEcnRqQpoWtJONbWQfIbfWTRrX21L8YTm/fpz9qCB30H
 DCF2pZkWPIlNpKKs8d0I62OsSSeP+dKOTHzUGEk5YpwONWBeEeC9RZK0aN4PDlKzGa/A
 T+zGj8WJBCOJQR5kob12KFQ28mta3W/yq44tVRaiWKP8kWB+cSbz+WCBZfH1Ur1vlybs
 eJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Z2oMFh0UtFsC+WX1cHN7TFNpNKzs/ZPOQBocx/DRAls=;
 b=WHv5HFgJbrRd40QPyI0btMjOEwRzD505e7/TsvkWqUMVg7SpEd3km0sshlSWDwpPA/
 JT7sMjiFmHYV44sKQ/0MBsxG/g9OEO3kTiqAKPA0wxmtEAz29YtZAxEuOmUq3iRWLGL1
 FQJ02ziZfj7nepG1x7fUVHRDULBGcM7L6M0eSGQ2yUaHonxXkxh/WXe5A8/b5DfNINVS
 rzagOBk3Fs+zeH4hnZoqMWwao6lW+O0V5RgUK+anfLE8if83coHkMUI1RawlxJEZfADT
 JMODrPvkBvCEUjehH34RCK39ZzcfI5Nea9qfXNU6udRHdhmhsS62bsjILNBPCvGrh7PN
 3JEQ==
X-Gm-Message-State: AOAM532/+3FXyoCgIfcMoT9VkTBT86HD1FdRdB3EXColx4asph6LqBEr
 /yRNbBkxfv3rEUpt/WPwWRjdijZy9ZthduryVzXQwA==
X-Google-Smtp-Source: ABdhPJwFVp3DYTmIeJu9n1hL/s/l6TkAdAYv4ytNsjEUMZ361mlWOBwYh53YJtW+f4wCTgLtyUoARMzz9kShjYa+D9I=
X-Received: by 2002:a25:abce:: with SMTP id v72mr459970ybi.138.1606947583047; 
 Wed, 02 Dec 2020 14:19:43 -0800 (PST)
MIME-Version: 1.0
From: Frank Yang <lfy@google.com>
Date: Wed, 2 Dec 2020 14:19:31 -0800
Message-ID: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
Subject: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Alexander Graf <agraf@csgraf.de>
Cc: Peter Collingbourne <pcc@google.com>, Frank Yang <lfy@google.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000dcc34405b582a311"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=lfy@google.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dcc34405b582a311
Content-Type: text/plain; charset="UTF-8"

From downstream:
https://android-review.googlesource.com/c/platform/external/qemu/+/1515002

Based on v3 of Alexander Graf's patches

https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de

We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even though we
can set separate CNTVOFF_EL2 values per vCPU, it just is not worth the
require effort to do that accurately---with individual values, even if
they are a tiny bit off it can result in a lockup due to inconsistent
time differences between vCPUs. So just use a global approximate value
for now.

Not tested in upstream yet, but Android emulator snapshots work without
time warp now.

Signed-off-by: Lingfeng Yang <lfy@google.com>
---
 accel/hvf/hvf-cpus.c     |  3 +++
 include/sysemu/hvf_int.h |  4 ++++
 target/arm/hvf/hvf.c     | 43 +++++++++++++++++++++++++++++++++++++++-
 target/i386/hvf/hvf.c    |  4 ++++
 4 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index a981ccde70..484c7717f5 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -456,6 +456,9 @@ static int hvf_accel_init(MachineState *ms)
     hvf_state = s;
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
     cpus_register_accel(&hvf_cpus);
+
+    hvf_arch_init(s);
+
     return 0;
 }

diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 13adf6ea77..08830782c9 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -55,6 +55,9 @@ struct HVFState {
     hvf_slot slots[32];
     int num_slots;

+#if defined(__aarch64__)
+    uint64_t ticks;
+#endif
     hvf_vcpu_caps *hvf_caps;
 };
 extern HVFState *hvf_state;
@@ -73,5 +76,6 @@ void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *cpu);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 void hvf_kick_vcpu_thread(CPUState *cpu);
+void hvf_arch_init(HVFState* s);

 #endif
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 9442e2f232..37380c6c53 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -312,6 +312,10 @@ int hvf_put_registers(CPUState *cpu)
     uint64_t val;
     int i;

+    /* Sync up CNTVOFF_EL2 */
+    env->cp15.cntvoff_el2 = hvf_state->ticks;
+    hv_vcpu_set_vtimer_offset(cpu->hvf->fd, env->cp15.cntvoff_el2);
+
     for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
         val = *(uint64_t *)((void *)env + hvf_reg_match[i].offset);
         ret = hv_vcpu_set_reg(cpu->hvf->fd, hvf_reg_match[i].reg, val);
@@ -418,6 +422,8 @@ void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
 }

+static HVFState* hvf_state = 0;
+
 int hvf_arch_init_vcpu(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -795,7 +801,11 @@ int hvf_vcpu_exec(CPUState *cpu)
                                         &cval);
                 assert_hvf_ok(r);

-                int64_t ticks_to_sleep = cval - mach_absolute_time();
+                /* mach_absolute_time() is an absolute host tick number. We
+                 * have set up the guest to use the host tick number offset
+                 * by env->cp15.cntvoff_el2.
+                 */
+                int64_t ticks_to_sleep = cval - (mach_absolute_time() -
env->cp15.cntvoff_el2);
                 if (ticks_to_sleep < 0) {
                     break;
                 }
@@ -855,3 +865,34 @@ int hvf_vcpu_exec(CPUState *cpu)
         }
     }
 }
+
+static int hvf_mig_state_pre_save(void* opaque) {
+    struct HVFState* s = opaque;
+    s->ticks -= mach_absolute_time();
+    return 0;
+}
+
+static int hvf_mig_state_post_load(void* opaque) {
+    struct HVFState* s = opaque;
+    m->ticks += mach_absolute_time();
+    return 0;
+}
+
+
+const VMStateDescription vmstate_hvf_migration = {
+    .name = "hvf-migration",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .pre_save = hvf_mig_state_pre_save,
+    .post_load = hvf_mig_state_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(ticks_to_save, HVFState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+void hvf_arch_init(HVFState* s) {
+    hvf_state = s;
+    hvf_state->ticks = 0;
+    vmstate_register(NULL, 0, &vmstate_hvf_migration, hvf_state);
+}
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 08b4adecd9..7ca6387620 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -557,3 +557,7 @@ int hvf_vcpu_exec(CPUState *cpu)

     return ret;
 }
+
+void hvf_arch_init(HVFState* s) {
+    (void)s;
+}
-- 
2.24.3 (Apple Git-128)

--000000000000dcc34405b582a311
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>From downstream: <a href=3D"https://android-revie=
w.googlesource.com/c/platform/external/qemu/+/1515002">https://android-revi=
ew.googlesource.com/c/platform/external/qemu/+/1515002</a><br><br>Based on =
v3 of Alexander Graf&#39;s patches<br><br><a href=3D"https://patchew.org/QE=
MU/20201202190408.2041-1-agraf@csgraf.de">https://patchew.org/QEMU/20201202=
190408.2041-1-agraf@csgraf.de</a><br><br>We need to adjust CNTVOFF_EL2 so t=
hat time doesnt warp.=C2=A0 Even though we<br>can set separate CNTVOFF_EL2 =
values per vCPU, it just is not worth the<br>require effort to do that accu=
rately---with individual values, even if<br>they are a tiny bit off it can =
result in a lockup due to inconsistent<br>time differences between vCPUs. S=
o just use a global approximate value<br>for now.<br><br>Not tested in upst=
ream yet, but Android emulator snapshots work without<br>time warp now.<br>=
<br>Signed-off-by: Lingfeng Yang &lt;<a href=3D"mailto:lfy@google.com">lfy@=
google.com</a>&gt;<br>---<br>=C2=A0accel/hvf/hvf-cpus.c =C2=A0 =C2=A0 | =C2=
=A03 +++<br>=C2=A0include/sysemu/hvf_int.h | =C2=A04 ++++<br>=C2=A0target/a=
rm/hvf/hvf.c =C2=A0 =C2=A0 | 43 +++++++++++++++++++++++++++++++++++++++-<br=
>=C2=A0target/i386/hvf/hvf.c =C2=A0 =C2=A0| =C2=A04 ++++<br>=C2=A04 files c=
hanged, 53 insertions(+), 1 deletion(-)<br><br>diff --git a/accel/hvf/hvf-c=
pus.c b/accel/hvf/hvf-cpus.c<br>index a981ccde70..484c7717f5 100644<br>--- =
a/accel/hvf/hvf-cpus.c<br>+++ b/accel/hvf/hvf-cpus.c<br>@@ -456,6 +456,9 @@=
 static int hvf_accel_init(MachineState *ms)<br>=C2=A0 =C2=A0 =C2=A0hvf_sta=
te =3D s;<br>=C2=A0 =C2=A0 =C2=A0memory_listener_register(&amp;hvf_memory_l=
istener, &amp;address_space_memory);<br>=C2=A0 =C2=A0 =C2=A0cpus_register_a=
ccel(&amp;hvf_cpus);<br>+<br>+ =C2=A0 =C2=A0hvf_arch_init(s);<br>+<br>=C2=
=A0 =C2=A0 =C2=A0return 0;<br>=C2=A0}<br>=C2=A0<br>diff --git a/include/sys=
emu/hvf_int.h b/include/sysemu/hvf_int.h<br>index 13adf6ea77..08830782c9 10=
0644<br>--- a/include/sysemu/hvf_int.h<br>+++ b/include/sysemu/hvf_int.h<br=
>@@ -55,6 +55,9 @@ struct HVFState {<br>=C2=A0 =C2=A0 =C2=A0hvf_slot slots[=
32];<br>=C2=A0 =C2=A0 =C2=A0int num_slots;<br>=C2=A0<br>+#if defined(__aarc=
h64__)<br>+ =C2=A0 =C2=A0uint64_t ticks;<br>+#endif<br>=C2=A0 =C2=A0 =C2=A0=
hvf_vcpu_caps *hvf_caps;<br>=C2=A0};<br>=C2=A0extern HVFState *hvf_state;<b=
r>@@ -73,5 +76,6 @@ void hvf_arch_vcpu_destroy(CPUState *cpu);<br>=C2=A0int=
 hvf_vcpu_exec(CPUState *cpu);<br>=C2=A0hvf_slot *hvf_find_overlap_slot(uin=
t64_t, uint64_t);<br>=C2=A0void hvf_kick_vcpu_thread(CPUState *cpu);<br>+vo=
id hvf_arch_init(HVFState* s);<br>=C2=A0<br>=C2=A0#endif<br>diff --git a/ta=
rget/arm/hvf/hvf.c b/target/arm/hvf/hvf.c<br>index 9442e2f232..37380c6c53 1=
00644<br>--- a/target/arm/hvf/hvf.c<br>+++ b/target/arm/hvf/hvf.c<br>@@ -31=
2,6 +312,10 @@ int hvf_put_registers(CPUState *cpu)<br>=C2=A0 =C2=A0 =C2=A0=
uint64_t val;<br>=C2=A0 =C2=A0 =C2=A0int i;<br>=C2=A0<br>+ =C2=A0 =C2=A0/* =
Sync up CNTVOFF_EL2 */<br>+ =C2=A0 =C2=A0env-&gt;cp15.cntvoff_el2 =3D hvf_s=
tate-&gt;ticks;<br>+ =C2=A0 =C2=A0hv_vcpu_set_vtimer_offset(cpu-&gt;hvf-&gt=
;fd, env-&gt;cp15.cntvoff_el2);<br>+<br>=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i=
 &lt; ARRAY_SIZE(hvf_reg_match); i++) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0val =3D *(uint64_t *)((void *)env + hvf_reg_match[i].offset);<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D hv_vcpu_set_reg(cpu-&gt;hvf-&gt;fd, hvf_=
reg_match[i].reg, val);<br>@@ -418,6 +422,8 @@ void hvf_arch_vcpu_destroy(C=
PUState *cpu)<br>=C2=A0{<br>=C2=A0}<br>=C2=A0<br>+static HVFState* hvf_stat=
e =3D 0;<br>+<br>=C2=A0int hvf_arch_init_vcpu(CPUState *cpu)<br>=C2=A0{<br>=
=C2=A0 =C2=A0 =C2=A0ARMCPU *arm_cpu =3D ARM_CPU(cpu);<br>@@ -795,7 +801,11 =
@@ int hvf_vcpu_exec(CPUState *cpu)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;cval);<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_hvf_ok(r);<br>=C2=A0<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t ticks_to_sle=
ep =3D cval - mach_absolute_time();<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0/* mach_absolute_time() is an absolute host tick numbe=
r. We<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * have s=
et up the guest to use the host tick number offset<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * by env-&gt;cp15.cntvoff_el2.<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t ticks_to_sleep =3D cva=
l - (mach_absolute_time() - env-&gt;cp15.cntvoff_el2);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ticks_to_sleep &lt; 0) {<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>@@ -855,3 +865,34 @@ int hvf_vcpu_exec(CPUState *cpu)<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0}<br>+<br>+static =
int hvf_mig_state_pre_save(void* opaque) {<br>+ =C2=A0 =C2=A0struct HVFStat=
e* s =3D opaque;<br>+ =C2=A0 =C2=A0s-&gt;ticks -=3D mach_absolute_time();<b=
r>+ =C2=A0 =C2=A0return 0;<br>+}<br>+<br>+static int hvf_mig_state_post_loa=
d(void* opaque) {<br>+ =C2=A0 =C2=A0struct HVFState* s =3D opaque;<br>+ =C2=
=A0 =C2=A0m-&gt;ticks +=3D mach_absolute_time();<br>+ =C2=A0 =C2=A0return 0=
;<br>+}<br>+<br>+<br>+const VMStateDescription vmstate_hvf_migration =3D {<=
br>+ =C2=A0 =C2=A0.name =3D &quot;hvf-migration&quot;,<br>+ =C2=A0 =C2=A0.v=
ersion_id =3D 1,<br>+ =C2=A0 =C2=A0.minimum_version_id =3D 1,<br>+ =C2=A0 =
=C2=A0.pre_save =3D hvf_mig_state_pre_save,<br>+ =C2=A0 =C2=A0.post_load =
=3D hvf_mig_state_post_load,<br>+ =C2=A0 =C2=A0.fields =3D (VMStateField[])=
 {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(ticks_to_save, HVFState),=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_END_OF_LIST()<br>+ =C2=A0 =C2=A0},=
<br>+};<br>+<br>+void hvf_arch_init(HVFState* s) {<br>+ =C2=A0 =C2=A0hvf_st=
ate =3D s;<br>+ =C2=A0 =C2=A0hvf_state-&gt;ticks =3D 0;<br>+ =C2=A0 =C2=A0v=
mstate_register(NULL, 0, &amp;vmstate_hvf_migration, hvf_state);<br>+}<br>d=
iff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c<br>index 08b4adec=
d9..7ca6387620 100644<br>--- a/target/i386/hvf/hvf.c<br>+++ b/target/i386/h=
vf/hvf.c<br>@@ -557,3 +557,7 @@ int hvf_vcpu_exec(CPUState *cpu)<br>=C2=A0<=
br>=C2=A0 =C2=A0 =C2=A0return ret;<br>=C2=A0}<br>+<br>+void hvf_arch_init(H=
VFState* s) {<br>+ =C2=A0 =C2=A0(void)s;<br>+}<br>-- <br>2.24.3 (Apple Git-=
128)<br></div></div>

--000000000000dcc34405b582a311--

