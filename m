Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C82CE7C9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:48:59 +0100 (CET)
Received: from localhost ([::1]:42168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl3xi-0001Gp-6w
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tU-00044l-3f; Fri, 04 Dec 2020 00:44:36 -0500
Received: from ozlabs.org ([203.11.71.1]:38083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tS-00005A-7J; Fri, 04 Dec 2020 00:44:35 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnM8h1L2wz9sVt; Fri,  4 Dec 2020 16:44:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607060660;
 bh=4EauSkQD4kf3/NsUuIz4zpH/jdlckopP7jBdsIJNjEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YgPXfOzAOuOoBPOHOWWpAFUyEbqE8iXKps8pTVpnfIiP5ObF/yHua3SZ3sUmfYMoD
 jSmIGUjtGGFkOFYcN/eQWJlzcSqATpYn8vMbKlIvzXdhPnr4oKlEd5kiV2BaMe05Uk
 a58wlRW+tkhPrViITJm+BG+uQNK0RKsROy/tGTeY=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, pbonzini@redhat.com, frankja@linux.ibm.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [for-6.0 v5 08/13] securable guest memory: Introduce sgm "ready" flag
Date: Fri,  4 Dec 2020 16:44:10 +1100
Message-Id: <20201204054415.579042-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204054415.579042-1-david@gibson.dropbear.id.au>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: thuth@redhat.com, cohuck@redhat.com, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The platform specific details of mechanisms for implementing securable
guest memory may require setup at various points during initialization.
Thus, it's not really feasible to have a single sgm initialization hook,
but instead each mechanism needs its own initialization calls in arch or
machine specific code.

However, to make it harder to have a bug where a mechanism isn't properly
initialized under some circumstances, we want to have a common place,
relatively late in boot, where we verify that sgm has been initialized if
it was requested.

This patch introduces a ready flag to the SecurableGuestMemory base type
to accomplish this, which we verify just before the machine specific
initialization function.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/core/machine.c                     | 8 ++++++++
 include/exec/securable-guest-memory.h | 2 ++
 target/i386/sev.c                     | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 816ea3ae3e..a67a27d03c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1155,6 +1155,14 @@ void machine_run_board_init(MachineState *machine)
     }
 
     if (machine->sgm) {
+        /*
+         * Where securable guest memory is initialized depends on the
+         * specific mechanism in use.  But, we need to make sure it's
+         * ready by now.  If it isn't, that's a bug in the
+         * implementation of that sgm mechanism.
+         */
+        assert(machine->sgm->ready);
+
         /*
          * With securable guest memory, the host can't see the real
          * contents of RAM, so there's no point in it trying to merge
diff --git a/include/exec/securable-guest-memory.h b/include/exec/securable-guest-memory.h
index 7325b504ba..20cf13777b 100644
--- a/include/exec/securable-guest-memory.h
+++ b/include/exec/securable-guest-memory.h
@@ -36,6 +36,8 @@
 
 struct SecurableGuestMemory {
     Object parent;
+
+    bool ready;
 };
 
 typedef struct SecurableGuestMemoryClass {
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 7333a60dc0..022ce5fc3a 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -701,6 +701,8 @@ int sev_kvm_init(SecurableGuestMemory *sgm, Error **errp)
     qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
     qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
 
+    sgm->ready = true;
+
     return 0;
 err:
     sev_guest = NULL;
-- 
2.28.0


