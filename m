Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCDD30B657
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 05:19:04 +0100 (CET)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6n9b-0003Kl-VN
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 23:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6n4T-00065Q-BD; Mon, 01 Feb 2021 23:13:45 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34495 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6n4R-0004zB-6I; Mon, 01 Feb 2021 23:13:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DVBHz5Kcmz9tl5; Tue,  2 Feb 2021 15:13:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612239199;
 bh=EX4Wo8XL9ghYEf3SyZWEad+uxvbQlvG/RZ3Zj48wzzQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BYWatgOlBbtnb/3n2asQZVLc2OzJ6W+5SQ60ckgWR33jZfKGBiN3BEXmOeYJJi3Dr
 3QX2rjUMloH/YGWb+B5MrASqiziVbKqyjdgCRYLrNqB0hat2N47uTmsn3BrXB80bbn
 up11lI3HgWmpMCNTsXvlIeVUucyA26T2IRr7ziMY=
From: David Gibson <david@gibson.dropbear.id.au>
To: dgilbert@redhat.com, pair@us.ibm.com, qemu-devel@nongnu.org,
 brijesh.singh@amd.com, pasic@linux.ibm.com
Subject: [PATCH v8 09/13] confidential guest support: Update documentation
Date: Tue,  2 Feb 2021 15:13:11 +1100
Message-Id: <20210202041315.196530-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202041315.196530-1-david@gibson.dropbear.id.au>
References: <20210202041315.196530-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: thuth@redhat.com, Cornelia Huck <cohuck@redhat.com>, berrange@redhat.com,
 mst@redhat.com, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 jun.nakajima@intel.com, mtosatti@redhat.com, richard.henderson@linaro.org,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, pragyansri.pathi@intel.com, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com, qemu-ppc@nongnu.org, andi.kleen@intel.com,
 pbonzini@redhat.com, borntraeger@de.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we've implemented a generic machine option for configuring various
confidential guest support mechanisms:
  1. Update docs/amd-memory-encryption.txt to reference this rather than
     the earlier SEV specific option
  2. Add a docs/confidential-guest-support.txt to cover the generalities of
     the confidential guest support scheme

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 docs/amd-memory-encryption.txt      |  2 +-
 docs/confidential-guest-support.txt | 43 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 docs/confidential-guest-support.txt

diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
index 80b8eb00e9..145896aec7 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/amd-memory-encryption.txt
@@ -73,7 +73,7 @@ complete flow chart.
 To launch a SEV guest
 
 # ${QEMU} \
-    -machine ...,memory-encryption=sev0 \
+    -machine ...,confidential-guest-support=sev0 \
     -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
 
 Debugging
diff --git a/docs/confidential-guest-support.txt b/docs/confidential-guest-support.txt
new file mode 100644
index 0000000000..bd439ac800
--- /dev/null
+++ b/docs/confidential-guest-support.txt
@@ -0,0 +1,43 @@
+Confidential Guest Support
+==========================
+
+Traditionally, hypervisors such as QEMU have complete access to a
+guest's memory and other state, meaning that a compromised hypervisor
+can compromise any of its guests.  A number of platforms have added
+mechanisms in hardware and/or firmware which give guests at least some
+protection from a compromised hypervisor.  This is obviously
+especially desirable for public cloud environments.
+
+These mechanisms have different names and different modes of
+operation, but are often referred to as Secure Guests or Confidential
+Guests.  We use the term "Confidential Guest Support" to distinguish
+this from other aspects of guest security (such as security against
+attacks from other guests, or from network sources).
+
+Running a Confidential Guest
+----------------------------
+
+To run a confidential guest you need to add two command line parameters:
+
+1. Use "-object" to create a "confidential guest support" object.  The
+   type and parameters will vary with the specific mechanism to be
+   used
+2. Set the "confidential-guest-support" machine parameter to the ID of
+   the object from (1).
+
+Example (for AMD SEV)::
+
+    qemu-system-x86_64 \
+        <other parameters> \
+        -machine ...,confidential-guest-support=sev0 \
+        -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
+
+Supported mechanisms
+--------------------
+
+Currently supported confidential guest mechanisms are:
+
+AMD Secure Encrypted Virtualization (SEV)
+    docs/amd-memory-encryption.txt
+
+Other mechanisms may be supported in future.
-- 
2.29.2


