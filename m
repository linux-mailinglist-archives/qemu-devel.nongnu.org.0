Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A352D928E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:22:05 +0100 (CET)
Received: from localhost ([::1]:59640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogJA-0004Fe-Kj
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwz-00060i-KT; Sun, 13 Dec 2020 23:59:09 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:38689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofww-0004uP-Vi; Sun, 13 Dec 2020 23:59:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfw12wYz9sWy; Mon, 14 Dec 2020 15:58:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921896;
 bh=rBtI7QtDbKBKhAKdfxPEGMs7Fzmi01R0i3YdnlS7DhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K49jv2tJoQF2diS7wCER/ror1HLF212jduj/2W7ztinGvZ+xcXgu48CW42OhVH6b4
 rQM+5kkVpr1ODe4GUJtk2iG6FacFIVYP0bhAxnCUHjoKts/+wJSxEIfmHxDVPnuH0g
 8NSEzaOftNDiTzN7KvPoo7013O+KusxKIecT2p48=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 30/30] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
Date: Mon, 14 Dec 2020 15:58:07 +1100
Message-Id: <20201214045807.41003-31-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

spapr_kvm_type() is considering 'vm_type=NULL' as a valid input, where
the function returns 0. This is relying on the current QEMU machine
options handling logic, where the absence of the 'kvm-type' option
will be reflected as 'vm_type=NULL' in this function.

This is not robust, and will break if QEMU options code decides to propagate
something else in the case mentioned above (e.g. an empty string instead
of NULL).

Let's avoid this entirely by setting a non-NULL default value in case of
no user input for 'kvm-type'. spapr_kvm_type() was changed to handle 3 fixed
values of kvm-type: "auto", "hv", and "pr", with "auto" being the default
if no kvm-type was set by the user. This allows us to always be predictable
regardless of any enhancements/changes made in QEMU options mechanics.

While we're at it, let's also document in 'kvm-type' description the
already existing default mode, now named 'auto'. The information provided
about it is based on how the pseries kernel handles the KVM_CREATE_VM
ioctl(), where the default value '0' makes the kernel choose an available
KVM module to use, giving precedence to kvm_hv. This logic is described in
the kernel source file arch/powerpc/kvm/powerpc.c, function kvm_arch_init_vm().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20201210145517.1532269-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index dfedded9a8..dee48a0043 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3021,17 +3021,25 @@ static void spapr_machine_init(MachineState *machine)
     qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
 }
 
+#define DEFAULT_KVM_TYPE "auto"
 static int spapr_kvm_type(MachineState *machine, const char *vm_type)
 {
-    if (!vm_type) {
+    /*
+     * The use of g_ascii_strcasecmp() for 'hv' and 'pr' is to
+     * accomodate the 'HV' and 'PV' formats that exists in the
+     * wild. The 'auto' mode is being introduced already as
+     * lower-case, thus we don't need to bother checking for
+     * "AUTO".
+     */
+    if (!vm_type || !strcmp(vm_type, DEFAULT_KVM_TYPE)) {
         return 0;
     }
 
-    if (!strcmp(vm_type, "HV")) {
+    if (!g_ascii_strcasecmp(vm_type, "hv")) {
         return 1;
     }
 
-    if (!strcmp(vm_type, "PR")) {
+    if (!g_ascii_strcasecmp(vm_type, "pr")) {
         return 2;
     }
 
@@ -3270,10 +3278,15 @@ static void spapr_instance_init(Object *obj)
 
     spapr->htab_fd = -1;
     spapr->use_hotplug_event_source = true;
+    spapr->kvm_type = g_strdup(DEFAULT_KVM_TYPE);
     object_property_add_str(obj, "kvm-type",
                             spapr_get_kvm_type, spapr_set_kvm_type);
     object_property_set_description(obj, "kvm-type",
-                                    "Specifies the KVM virtualization mode (HV, PR)");
+                                    "Specifies the KVM virtualization mode (auto,"
+                                    " hv, pr). Defaults to 'auto'. This mode will use"
+                                    " any available KVM module loaded in the host,"
+                                    " where kvm_hv takes precedence if both kvm_hv and"
+                                    " kvm_pr are loaded.");
     object_property_add_bool(obj, "modern-hotplug-events",
                             spapr_get_modern_hotplug_events,
                             spapr_set_modern_hotplug_events);
-- 
2.29.2


