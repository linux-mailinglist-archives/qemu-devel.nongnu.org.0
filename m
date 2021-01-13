Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7CC2F5576
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 01:10:39 +0100 (CET)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzqDl-0003B3-62
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 19:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzq25-0007CO-IY; Wed, 13 Jan 2021 18:58:33 -0500
Received: from ozlabs.org ([203.11.71.1]:58647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzq23-0006en-Lz; Wed, 13 Jan 2021 18:58:33 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DGPXQ6v7Cz9sWk; Thu, 14 Jan 2021 10:58:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610582294;
 bh=idJr0chYvjooRoA3aqKnU601BZd17+94MhdcU47V62A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZL+y3MKlNgB5V+HRIddau2xZRc6ivsKrn3t/xFPR8WxiViIiH2Xk6XkGU+p50nzp3
 9PiQflWHy4l7o9AMlYI6cuxI6Ra0IMEMQUAlves2Zjz6icBTX85QlI1njCPu4/yEZ+
 0oS6eZN8sQ8K+HEg3dVIKHxSHipa8jKx9IAI+y9E=
From: David Gibson <david@gibson.dropbear.id.au>
To: brijesh.singh@amd.com, pair@us.ibm.com, dgilbert@redhat.com,
 pasic@linux.ibm.com, qemu-devel@nongnu.org
Subject: [PATCH v7 07/13] confidential guest support: Introduce cgs "ready"
 flag
Date: Thu, 14 Jan 2021 10:58:05 +1100
Message-Id: <20210113235811.1909610-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
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
Cc: qemu-ppc@nongnu.org, thuth@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, berrange@redhat.com,
 jun.nakajima@intel.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 mdroth@linux.vnet.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com, mst@redhat.com, pragyansri.pathi@intel.com,
 andi.kleen@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The platform specific details of mechanisms for implementing
confidential guest support may require setup at various points during
initialization.  Thus, it's not really feasible to have a single cgs
initialization hook, but instead each mechanism needs its own
initialization calls in arch or machine specific code.

However, to make it harder to have a bug where a mechanism isn't
properly initialized under some circumstances, we want to have a
common place, relatively late in boot, where we verify that cgs has
been initialized if it was requested.

This patch introduces a ready flag to the ConfidentialGuestSupport
base type to accomplish this, which we verify just before the machine
specific initialization function.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/core/machine.c                         | 8 ++++++++
 include/exec/confidential-guest-support.h | 2 ++
 target/i386/sev.c                         | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 94194ab82d..5a7433332b 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1190,6 +1190,14 @@ void machine_run_board_init(MachineState *machine)
     }
 
     if (machine->cgs) {
+        /*
+         * Where confidential guest support is initialized depends on
+         * the specific mechanism in use.  But, we need to make sure
+         * it's ready by now.  If it isn't, that's a bug in the
+         * implementation of that cgs mechanism.
+         */
+        assert(machine->cgs->ready);
+
         /*
          * With confidential guests, the host can't see the real
          * contents of RAM, so there's no point in it trying to merge
diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
index 5f131023ba..bcaf6c9f49 100644
--- a/include/exec/confidential-guest-support.h
+++ b/include/exec/confidential-guest-support.h
@@ -27,6 +27,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, CONFIDENTIAL_GUEST_SUPPORT)
 
 struct ConfidentialGuestSupport {
     Object parent;
+
+    bool ready;
 };
 
 typedef struct ConfidentialGuestSupportClass {
diff --git a/target/i386/sev.c b/target/i386/sev.c
index e2b41ef342..3d94635397 100644
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


