Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576792D5BC8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:32:13 +0100 (CET)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knM3I-0002is-Ag
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knLfo-0007wR-MV; Thu, 10 Dec 2020 08:07:56 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:46654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1knLfZ-0006GB-2G; Thu, 10 Dec 2020 08:07:56 -0500
Received: by mail-qt1-x843.google.com with SMTP id h19so3499444qtq.13;
 Thu, 10 Dec 2020 05:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iJUdCje23rl8HiYmDWp08o8WlHS631Owr0XN1ot9RGQ=;
 b=dd8ASIgyWxD2PCuk1f99AM3rMr2OI/BFqScBIiNCLkYry5HWXMTwy+kzK4xk84IN3P
 M+CSEe2ekLfaIDpHqNaRpcjBMWRytx2Hr6XQA0d+TS7cj4F7a8arFFBU3+F97Q8nVhQz
 OCldZuLCqgqs+LCJv1ArwsHryas4MUnZxz7b2kyEOBS+oj57GsW8899YPgzxh30RnSVn
 VYz5+SajuGr34iBaPrExLUrOBu5Yj0Zo4Y6AtfWrvBEAmpPTUu1OzdgY3dWncNF7L+ds
 tQzcPmt5NMUptWKR2iHJ47Di6QfXtuTG0ivazne26R9rICozDVybayInLPIFKN0n+/kz
 ZUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJUdCje23rl8HiYmDWp08o8WlHS631Owr0XN1ot9RGQ=;
 b=NPXXgzE3Iufr5ySplLVZJcMHLgUkjEOzwY1oQZFjH/RtN0c9ekmEXL3r+7LfFYwMgh
 JQmUAVOHY8hYMUviZshtuyuki64JrKIeSEEaWgW/A+2wj8+KmEQIem9bEo0WtcHj0jAv
 EQmIhpBDD2tmKujmN1+pm3MN0sS5wfhvfgTfE8t1KWUDRSKOPKZAj02MyJiB6ufm19bi
 SxXtAjB0wjUSEZjSLrCq41AQu5YXK6eI6nvPvobWml9yKb9wDAkt49xHVWWc6KnRjV2J
 Ayo6oL7tebZvb08LLz6GQ/yWqMW25mMazdN65/czbSGkdELE39AGL45z1gCw5eorP0Gz
 mamg==
X-Gm-Message-State: AOAM531ntnLH5IlA39EuVrfcEW6oowRMN1hhgxRtnCBXKYpOaJtcreBY
 DCNRadUjIofLgAPyiLfCHTJhnRYX3TU=
X-Google-Smtp-Source: ABdhPJyv9B4QTAFBWm5DQU7YtxTzYnGNHNRSzUdyCs+72Ki/xWvUxNioEHFYO9jHmExvrTMTlNnS2g==
X-Received: by 2002:ac8:38f6:: with SMTP id g51mr9246509qtc.79.1607605658898; 
 Thu, 10 Dec 2020 05:07:38 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id d66sm3594914qke.132.2020.12.10.05.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 05:07:38 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
Date: Thu, 10 Dec 2020 10:07:21 -0300
Message-Id: <20201210130721.1521487-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210130721.1521487-1-danielhb413@gmail.com>
References: <20201210130721.1521487-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::843;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x843.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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
 hw/ppc/spapr.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b7e0894019..f097f4ea30 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3021,17 +3021,18 @@ static void spapr_machine_init(MachineState *machine)
     qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
 }
 
+#define DEFAULT_KVM_TYPE "auto"
 static int spapr_kvm_type(MachineState *machine, const char *vm_type)
 {
-    if (!vm_type) {
+    if (!g_ascii_strcasecmp(vm_type, DEFAULT_KVM_TYPE)) {
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
 
@@ -3131,7 +3132,7 @@ static char *spapr_get_kvm_type(Object *obj, Error **errp)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
 
-    return g_strdup(spapr->kvm_type);
+    return g_strdup(spapr->kvm_type ? spapr->kvm_type : DEFAULT_KVM_TYPE);
 }
 
 static void spapr_set_kvm_type(Object *obj, const char *value, Error **errp)
@@ -3273,7 +3274,11 @@ static void spapr_instance_init(Object *obj)
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


