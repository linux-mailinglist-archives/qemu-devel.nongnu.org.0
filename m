Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F7E313191
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 12:57:25 +0100 (CET)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l95AS-0006xN-Pe
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 06:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8ziE-0002OW-BO; Mon, 08 Feb 2021 01:07:54 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50657 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8ziA-0006sl-W9; Mon, 08 Feb 2021 01:07:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYwY62byYz9sWL; Mon,  8 Feb 2021 17:07:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612764458;
 bh=h6CrH2kWeN/5tQoGqPKC41Ubgnz5HIyzZ1YIEbo4sAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PtUWy3HkPTPcMmM9BectZzKIXfd0qgQczET0/sqQeLcbm7bsj413rcwqIcdiE9gP+
 ipmyPdatOye9gzStGIBkP+Azx7nUbLztlrm3693t8zIlfiMqHjpZ4wzdvsLoLZ3h5i
 mLLUpW8QVJ3kjf5sJ8zBdAT6+KPpwiTHl7LcE07k=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 dgilbert@redhat.com, brijesh.singh@amd.com, pasic@linux.ibm.com
Subject: [PULL v9 07/13] confidential guest support: Introduce cgs "ready" flag
Date: Mon,  8 Feb 2021 17:07:29 +1100
Message-Id: <20210208060735.39838-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208060735.39838-1-david@gibson.dropbear.id.au>
References: <20210208060735.39838-1-david@gibson.dropbear.id.au>
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, cohuck@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 david@redhat.com, jun.nakajima@intel.com, mtosatti@redhat.com,
 richard.henderson@linaro.org, mdroth@linux.vnet.ibm.com,
 Greg Kurz <groug@kaod.org>, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com, mst@redhat.com, pragyansri.pathi@intel.com,
 andi.kleen@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
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


