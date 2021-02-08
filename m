Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB2312C14
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 09:43:50 +0100 (CET)
Received: from localhost ([::1]:42268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9295-0000HI-Pj
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 03:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zgV-0007sL-N8; Mon, 08 Feb 2021 01:06:07 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56095 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zgT-00061f-I4; Mon, 08 Feb 2021 01:06:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYwVs5qbSz9sWC; Mon,  8 Feb 2021 17:05:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612764341;
 bh=h6CrH2kWeN/5tQoGqPKC41Ubgnz5HIyzZ1YIEbo4sAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hYtQMkG0iMg3KdJh5lB2HWx3iHvmDW3sylOw+TnpdYaATje/rUj5tkt3zvtNpFbFK
 88uG0GAFAD0BxQfB7NuVQa2bWYzlBFDDq67Mh7HtzOOgSocN7MLYuirDvNEQlWR242
 z0qiTDKJpFGjYrhiNCB/J2olod/CVuHc22X5pMGk=
From: David Gibson <david@gibson.dropbear.id.au>
To: pasic@linux.ibm.com, dgilbert@redhat.com, pair@us.ibm.com,
 qemu-devel@nongnu.org, brijesh.singh@amd.com
Subject: [PULL v9 07/13] confidential guest support: Introduce cgs "ready" flag
Date: Mon,  8 Feb 2021 17:05:32 +1100
Message-Id: <20210208060538.39276-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208060538.39276-1-david@gibson.dropbear.id.au>
References: <20210208060538.39276-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>, cohuck@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 ehabkost@redhat.com, kvm@vger.kernel.org, mst@redhat.com, mtosatti@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, mdroth@linux.vnet.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, pragyansri.pathi@intel.com, jun.nakajima@intel.com,
 andi.kleen@intel.com, pbonzini@redhat.com,
 David Hildenbrand <david@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, frankja@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The platform specific details of mechanisms for implementing
confidential guest support may require setup at various points during
initialization.  Thus, it's not really feasible to have a single cgs
initialization hook, but instead each mechanism needs its own
initialization calls in arch or machine specific code.

However, to make it harder to have a bug where a mechanism isn't
properly initialized under some circumstances, we want to have a
common place, late in boot, where we verify that cgs has been
initialized if it was requested.

This patch introduces a ready flag to the ConfidentialGuestSupport
base type to accomplish this, which we verify in
qemu_machine_creation_done().

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 include/exec/confidential-guest-support.h | 24 +++++++++++++++++++++++
 softmmu/vl.c                              | 10 ++++++++++
 target/i386/sev.c                         |  2 ++
 3 files changed, 36 insertions(+)

diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
index 3db6380e63..ba2dd4b5df 100644
--- a/include/exec/confidential-guest-support.h
+++ b/include/exec/confidential-guest-support.h
@@ -27,6 +27,30 @@ OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, CONFIDENTIAL_GUEST_SUPPORT)
 
 struct ConfidentialGuestSupport {
     Object parent;
+
+    /*
+     * ready: flag set by CGS initialization code once it's ready to
+     *        start executing instructions in a potentially-secure
+     *        guest
+     *
+     * The definition here is a bit fuzzy, because this is essentially
+     * part of a self-sanity-check, rather than a strict mechanism.
+     *
+     * It's not feasible to have a single point in the common machine
+     * init path to configure confidential guest support, because
+     * different mechanisms have different interdependencies requiring
+     * initialization in different places, often in arch or machine
+     * type specific code.  It's also usually not possible to check
+     * for invalid configurations until that initialization code.
+     * That means it would be very easy to have a bug allowing CGS
+     * init to be bypassed entirely in certain configurations.
+     *
+     * Silently ignoring a requested security feature would be bad, so
+     * to avoid that we check late in init that this 'ready' flag is
+     * set if CGS was requested.  If the CGS init hasn't happened, and
+     * so 'ready' is not set, we'll abort.
+     */
+    bool ready;
 };
 
 typedef struct ConfidentialGuestSupportClass {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0d934844ff..9eb9dab1fc 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -101,6 +101,7 @@
 #include "qemu/plugin.h"
 #include "qemu/queue.h"
 #include "sysemu/arch_init.h"
+#include "exec/confidential-guest-support.h"
 
 #include "ui/qemu-spice.h"
 #include "qapi/string-input-visitor.h"
@@ -2498,6 +2499,8 @@ static void qemu_create_cli_devices(void)
 
 static void qemu_machine_creation_done(void)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
+
     /* Did we create any drives that we failed to create a device for? */
     drive_check_orphaned();
 
@@ -2517,6 +2520,13 @@ static void qemu_machine_creation_done(void)
 
     qdev_machine_creation_done();
 
+    if (machine->cgs) {
+        /*
+         * Verify that Confidential Guest Support has actually been initialized
+         */
+        assert(machine->cgs->ready);
+    }
+
     if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
         exit(1);
     }
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 590cb31fa8..f9e9b5d8ae 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -737,6 +737,8 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
     qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
 
+    cgs->ready = true;
+
     return 0;
 err:
     sev_guest = NULL;
-- 
2.29.2


