Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0D12D5EC4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:58:10 +0100 (CET)
Received: from localhost ([::1]:39634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNOT-00074Y-MX
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knNLw-0005S1-3m; Thu, 10 Dec 2020 09:55:32 -0500
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:38047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knNLu-0000Ey-9M; Thu, 10 Dec 2020 09:55:31 -0500
Received: by mail-qk1-x743.google.com with SMTP id w79so4977743qkb.5;
 Thu, 10 Dec 2020 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uuBdtTFPCzwR4FETWOA6e8aH1OYR/u7pzKmo9V2OtXU=;
 b=CM0TdPiSWiwcpAtX7mcKvtmmoHsAPa11/v96pN2O0ZXJi9TrDtA7s2I4C8NksKXUyz
 vkZ3rKGyk5cxPAbFXWI8U7Eu2SmTBotW4PtDTCQF3p/2aySp+nqYD/wmeVNjyt9OEIrG
 2XHTOl7h4OnC/pHBxFzfMZPG1RtfWqx8iUPW/+au4PAkHQ4rxXmHBH9iMvHzLMn6sEuu
 2WDHbEyqFRizzkLkDDmeiA52pEZ3/0/rfzFgiyXLiucVMrhm/v1dIH2Kd28XYFcnWw3L
 +/EkGAzXuyRp0pd+sg9u0dhLirpuwAKMk97WiGtGr8lhHbysflJiqHsaqzYmrvTjcZlu
 tAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uuBdtTFPCzwR4FETWOA6e8aH1OYR/u7pzKmo9V2OtXU=;
 b=QrKHfyFNmdXKN5svnDODUK4CYKKUr17siog7RTAqT9WBFUQ/221vVxwaj0jvO46J8Y
 mMNnlEUMAKV5rsifnD3jHj3h27evn1Bu/Epr/2vlxVFmEcYGziWVcJ9Ez194aw8hyqR3
 wQFCA2JVmsUIYWDGwfmflZHRBkBJz1MjY+KRAFSFEB0Fmjudjvb+3PmkYpTt/2kUStfj
 4Yk8FNY6mlzoRo6/7Ww0Dyr0hQNc/83NSzNK2ibaQi+OaritAHZNIMFt46h9qYc+kEmk
 8bFUg7xD/mNk9kRLkuO5pkqTMSx1zVZDjQum2LwVoItDt+qNNd1wgLrBFSlBk/5rk01R
 71uw==
X-Gm-Message-State: AOAM533NXs7KPRtBnqjVM6QemPxR4EGCjJojs6lGIXmHhyoKII+ohTAZ
 8XgwjocrggDmHcl+3I9dmgUD5D6rtcQ=
X-Google-Smtp-Source: ABdhPJzGMVyiaRIYFRRuCind4jGVsFlJANvWzOLGcbis1T9bFbGQl4MTfNHipEWdzu7LCb5Eg+BS+g==
X-Received: by 2002:a37:4dd1:: with SMTP id a200mr6024998qkb.457.1607612128753; 
 Thu, 10 Dec 2020 06:55:28 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id b6sm3592534qkc.128.2020.12.10.06.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 06:55:27 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
Date: Thu, 10 Dec 2020 11:55:17 -0300
Message-Id: <20201210145517.1532269-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210145517.1532269-1-danielhb413@gmail.com>
References: <20201210145517.1532269-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x743.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/ppc/spapr.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b7e0894019..877bd264ce 100644
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
2.26.2


