Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F43637AFE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 15:03:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyCnj-0004Jp-FW; Thu, 24 Nov 2022 09:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1oyCnL-0004Ct-EF
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 09:01:49 -0500
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1oyCnJ-0006qn-7J
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 09:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1669298483; bh=AoIel4w+JRQ/jK7hEzDTo1ooQVDioZn5F3sPHAbOF2A=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=HGLSjv4XAZXEUAzlcPKwjVSMLz9CbaPQp8/UDeelhjp6s5xWVXtZyoWOwNKa+ypYG
 dfIizEuop1U1/OuUmC615QYlZqQH1z3+X/6dtIaSUKQ5HY24MYKLAfh6QlkVrQ7sHQ
 NZwobpl1mB3e3pg8GWGYo6YzNGQX1mQNdYr2YdeX3VLJFVBExKlJKNyedNnb3fnVQI
 66JHtol68sHXAHGacCKgbEHKfdB0mvFVcamOIuOFBAHkngXCCFWZlGOh0q3yxyCvGq
 y8BVQJ6v1TwnoS993uFHw1hVjCwHgDKZgIEm9FZmQFL+wie5NqfH+nwEFgJXxxOATy
 2C3KqMaLtrIWA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id DA5309A0549;
 Thu, 24 Nov 2022 14:01:19 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH] gdbstub: move update guest debug to accel ops
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <af92080f-e708-f593-7ff5-81b7b264d587@linaro.org>
Date: Thu, 24 Nov 2022 14:59:52 +0100
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C8BC6E24-F98D-428D-80F8-98BDA40C7B15@ynddal.dk>
References: <20221123121712.72817-1-mads@ynddal.dk>
 <af92080f-e708-f593-7ff5-81b7b264d587@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-ORIG-GUID: DWzLgZrbfIE4SuGNGfuepdxL-rqKcJSM
X-Proofpoint-GUID: DWzLgZrbfIE4SuGNGfuepdxL-rqKcJSM
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 clxscore=1030 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211240106
Received-SPF: pass client-ip=17.58.23.196; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06021701.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


> Isn't this '0' flag here accelerator-specific? ...

> ... if so the prototype should be:
>=20
>       int (*update_guest_debug)(CPUState *cpu);
>=20
> and the '0' value set within kvm-accel-ops.c handler implementation.
>=20

You're right, we can avoid the additional variable. We'll then have to =
wrap
`kvm_update_guest_debug`. Would the following be ok?

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 6ebf9a644f..5e0fb42408 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -86,6 +86,10 @@ static bool kvm_cpus_are_resettable(void)
     return !kvm_enabled() || kvm_cpu_check_are_resettable();
 }
=20
+static int kvm_update_guest_debug_ops(CPUState *cpu) {
+    return kvm_update_guest_debug(cpu, 0);
+}
+
 static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops =3D ACCEL_OPS_CLASS(oc);
@@ -99,7 +103,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, =
void *data)
     ops->synchronize_pre_loadvm =3D kvm_cpu_synchronize_pre_loadvm;
=20
 #ifdef KVM_CAP_SET_GUEST_DEBUG
-    ops->update_guest_debug =3D kvm_update_guest_debug;
+    ops->update_guest_debug =3D kvm_update_guest_debug_ops;
     ops->supports_guest_debug =3D kvm_supports_guest_debug;
     ops->insert_breakpoint =3D kvm_insert_breakpoint;
     ops->remove_breakpoint =3D kvm_remove_breakpoint;
diff --git a/cpu.c b/cpu.c
index ef433a79e3..b2ade96caa 100644
--- a/cpu.c
+++ b/cpu.c
@@ -383,7 +383,7 @@ void cpu_single_step(CPUState *cpu, int enabled)
         cpu->singlestep_enabled =3D enabled;
=20
         if (ops->update_guest_debug) {
-            ops->update_guest_debug(cpu, 0);
+            ops->update_guest_debug(cpu);
         }
=20
         trace_breakpoint_singlestep(cpu->cpu_index, enabled);
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 0a47a2f00c..cd6a4ef7a5 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -48,7 +48,7 @@ struct AccelOpsClass {
=20
     /* gdbstub hooks */
     bool (*supports_guest_debug)(void);
-    int (*update_guest_debug)(CPUState *cpu, unsigned long flags);
+    int (*update_guest_debug)(CPUState *cpu);
     int (*insert_breakpoint)(CPUState *cpu, int type, hwaddr addr, =
hwaddr len);
     int (*remove_breakpoint)(CPUState *cpu, int type, hwaddr addr, =
hwaddr len);
     void (*remove_all_breakpoints)(CPUState *cpu);


If you have a better name for `kvm_update_guest_debug_ops`, I'm open for
suggestions.

On a side note. When compiling for an arch that isn't the same as the =
system
(i.e. aarch64 on x86_64), I'm getting a linker-error for cpu.c that
`cpus_get_accel` isn't defined. Do I need to move `cpus_get_accel` or =
somehow
#ifdef its use?=

