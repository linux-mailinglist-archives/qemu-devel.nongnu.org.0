Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A221D3130FC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 12:36:59 +0100 (CET)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l94qg-0003Rt-OI
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 06:36:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zi6-00026W-69; Mon, 08 Feb 2021 01:07:46 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:32903 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l8zi4-0006pE-FM; Mon, 08 Feb 2021 01:07:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DYwY55y60z9sVn; Mon,  8 Feb 2021 17:07:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612764457;
 bh=cnlEO+w/k8AwHUX8N63/06xxXcU3DOPo90IV/45n4iQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W8ceGQJj8z7kVA9nRtUV9t1pPWi8NU874YIXAXvsWhp19DLPzS9OVg9Xex51W+8QT
 /8Ee4CylX1dXTbj7irRceP1MNdp9X5cAsJgnyiv7xttoI6xkbZ1tw70eUONHrACMPS
 Sfhb+bMKezzgXv2AauR3qgOsv4WxyYet1EI9MeCA=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 dgilbert@redhat.com, brijesh.singh@amd.com, pasic@linux.ibm.com
Subject: [PULL v9 04/13] confidential guest support: Move side effect out of
 machine_set_memory_encryption()
Date: Mon,  8 Feb 2021 17:07:26 +1100
Message-Id: <20210208060735.39838-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208060735.39838-1-david@gibson.dropbear.id.au>
References: <20210208060735.39838-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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

When the "memory-encryption" property is set, we also disable KSM
merging for the guest, since it won't accomplish anything.

We want that, but doing it in the property set function itself is
thereoretically incorrect, in the unlikely event of some configuration
environment that set the property then cleared it again before
constructing the guest.

More importantly, it makes some other cleanups we want more difficult.
So, instead move this logic to machine_run_board_init() conditional on
the final value of the property.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/core/machine.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 5d6163ab70..919067b5c9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -437,14 +437,6 @@ static void machine_set_memory_encryption(Object *obj, const char *value,
 
     g_free(ms->memory_encryption);
     ms->memory_encryption = g_strdup(value);
-
-    /*
-     * With memory encryption, the host can't see the real contents of RAM,
-     * so there's no point in it trying to merge areas.
-     */
-    if (value) {
-        machine_set_mem_merge(obj, false, errp);
-    }
 }
 
 static bool machine_get_nvdimm(Object *obj, Error **errp)
@@ -1166,6 +1158,15 @@ void machine_run_board_init(MachineState *machine)
                     cc->deprecation_note);
     }
 
+    if (machine->memory_encryption) {
+        /*
+         * With memory encryption, the host can't see the real
+         * contents of RAM, so there's no point in it trying to merge
+         * areas.
+         */
+        machine_set_mem_merge(OBJECT(machine), false, &error_abort);
+    }
+
     machine_class->init(machine);
     phase_advance(PHASE_MACHINE_INITIALIZED);
 }
-- 
2.29.2


