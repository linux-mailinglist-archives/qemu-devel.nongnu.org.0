Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232342D2C2E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:48:30 +0100 (CET)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdLx-0006M5-6Y
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kmdJW-0005NY-8b; Tue, 08 Dec 2020 08:46:01 -0500
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:33968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kmdJT-0001AN-7g; Tue, 08 Dec 2020 08:45:58 -0500
Received: by mail-qt1-x841.google.com with SMTP id 7so11929439qtp.1;
 Tue, 08 Dec 2020 05:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8chbzLh3QwfWevV+kcPem8Kys4KxWjcAD/H6h20cpQ=;
 b=cqqQYvnR9F/kp/VsvToLDoP3AePf7dJWD2PQNqVowy2dMHxnb17DOZ0X5gZQK6owIO
 UlQsS8qnRkO9kzEKN6F3Gju+HCmcTY+hahKgyt32WpUT9PSVQ2uKN9ILojKfEL3GKKdu
 UJETERR9Gm1RQ+VwXi0sxXGNn2sPVXGFyKAmggBUDITw5D1YQsah6cWcnRCLTkBNVP2s
 DeeR62+9cFGK4fmdrTP0D4SPf4EGI3TpuvAbawTX8fAm7iBRBmi7HwZFLKNanMpJm41u
 baEQMtgd26WET3SBd7JbOOe8f0Cpn5v8T0m71XXDSC/gUVM8717tNWbMviK5tJpBtl0Q
 SzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I8chbzLh3QwfWevV+kcPem8Kys4KxWjcAD/H6h20cpQ=;
 b=QTtNHvvyAVbWvthodGj6/lQedUSp3HD2EKzZApTbEUEcd8Jd//+gwA7zbWyTad6Sfv
 i+Ll5NDtKOsPgi/H9Mo3+qaHYiBvBVc59nEzlxEgqHhn5tQ9Pu8MCa8AwzveScPkjXpZ
 qAp+m702xZaE3KaHJpqxangwRsasAHmEPpxaMt0silJtRJ406UDbmH29B6lG71nGlZ5S
 EtFWS1eQfyslM1R9eXPHw+Aia2sbmEAHaYrR8vem3C/RBJmw0o7hmVFNfvV2BU/5X7k6
 4XFfylaD4CYdsIzbrmVjtXjz3sFSNSzsOT0niOkrLD6L5UJ8Tj3M0LGLZqu3w4HdApqv
 YtrQ==
X-Gm-Message-State: AOAM531rfAJ08s2dzcYu0AoZeUur1s/JEQfdLc8lr9G3ms3+AzVgdP5y
 NclFNt9c8rYIZsm37rkwP33JUoya5BM=
X-Google-Smtp-Source: ABdhPJy4dbUZ0H12pbT11Cf9AjDg2xZe3d8BZJumeZNrqSr0ldU8egiPfopP/YpX0u5Fei7o4y7jEQ==
X-Received: by 2002:ac8:7604:: with SMTP id t4mr29502549qtq.366.1607435153234; 
 Tue, 08 Dec 2020 05:45:53 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id p128sm5504996qka.56.2020.12.08.05.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 05:45:52 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
Date: Tue,  8 Dec 2020 10:45:36 -0300
Message-Id: <20201208134536.1012045-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::841;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x841.google.com
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
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
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
values of kvm-type: "HV", "PR" and, if no kvm-type was set by the user,
DEFAULT_KVM_TYPE. This allows us always be predictable regardless of any
enhancements/changes made in QEMU options mechanics.

While we're at it, let's also document in 'kvm-type' description what
happens if the user does not set this option. This information is based
on how the pseries kernel handles the KVM_CREATE_VM ioctl(), where the
default value '0' makes the kernel choose an available KVM module to
use, giving precedence to kvm_hv. This logic is described in the kernel
source file arch/powerpc/kvm/powerpc.c, function kvm_arch_init_vm().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---

The case I mentioned in the second paragraph is happening when we try to
execute a pseries guest with '--enable-kvm' using Paolo's patch 
"vl: make qemu_get_machine_opts static" [1]:

$ sudo ./ppc64-softmmu/qemu-system-ppc64 -nographic -nodefaults -machine pseries --enable-kvm
qemu-system-ppc64: Unknown kvm-type specified '' 

This happens due to the differences between how qemu_opt_get() and
object_property_get_str() works when there is no 'kvm-type' specified.
See [2] for more info about the issue found.


[1] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg00471.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg01578.html 


 hw/ppc/spapr.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b7e0894019..32d938dc6a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3021,9 +3021,10 @@ static void spapr_machine_init(MachineState *machine)
     qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
 }
 
+#define DEFAULT_KVM_TYPE "auto"
 static int spapr_kvm_type(MachineState *machine, const char *vm_type)
 {
-    if (!vm_type) {
+    if (!strcmp(vm_type, DEFAULT_KVM_TYPE)) {
         return 0;
     }
 
@@ -3131,6 +3132,16 @@ static char *spapr_get_kvm_type(Object *obj, Error **errp)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
 
+    /*
+     * In case the user didn't set 'kvm-type', return DEFAULT_KVM_TYPE
+     * instead of NULL. This allows us to be more predictable with what
+     * is expected to happen in spapr_kvm_type(), since we can stop relying
+     * on receiving a 'NULL' parameter as a valid input there.
+     */
+    if (!spapr->kvm_type) {
+        return g_strdup(DEFAULT_KVM_TYPE);
+    }
+
     return g_strdup(spapr->kvm_type);
 }
 
@@ -3273,7 +3284,11 @@ static void spapr_instance_init(Object *obj)
     object_property_add_str(obj, "kvm-type",
                             spapr_get_kvm_type, spapr_set_kvm_type);
     object_property_set_description(obj, "kvm-type",
-                                    "Specifies the KVM virtualization mode (HV, PR)");
+                                    "Specifies the KVM virtualization mode (HV, PR)."
+                                    " If not specified, defaults to any available KVM"
+                                    " module loaded in the host. In case both kvm_hv"
+                                    " and kvm_pr are loaded, kvm_hv takes precedence.");
+
     object_property_add_bool(obj, "modern-hotplug-events",
                             spapr_get_modern_hotplug_events,
                             spapr_set_modern_hotplug_events);
-- 
2.26.2


