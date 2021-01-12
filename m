Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B972F275E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:52:23 +0100 (CET)
Received: from localhost ([::1]:52294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBfI-0008SD-RZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzBYd-0002Hq-47; Mon, 11 Jan 2021 23:45:27 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38301 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzBYb-000800-Do; Mon, 11 Jan 2021 23:45:26 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFJ0S1qsDz9t15; Tue, 12 Jan 2021 15:45:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610426712;
 bh=XAe7Xx+YpNUPHcyhxW/cHKgMuEbgQoNbc1c/1ol/ah8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gsgUbwoe/uiSnZj4VGfKpGe5Ib+aKheRMxqeX9Ln6sYcVvmJg1D53AAky24w2MF96
 VvM0yqUgiQzuZbqTtB08ba0jsQBdyg8VlrWvHr6WVAKfeNyns5k4kRX/oyZwG5X4Ox
 QE3wVg4PCZ3eUco9uBmCLYgUm08Epv/kF+W/HQTA=
From: David Gibson <david@gibson.dropbear.id.au>
To: pasic@linux.ibm.com, brijesh.singh@amd.com, pair@us.ibm.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v6 09/13] confidential guest support: Update documentation
Date: Tue, 12 Jan 2021 15:45:04 +1100
Message-Id: <20210112044508.427338-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112044508.427338-1-david@gibson.dropbear.id.au>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
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
Cc: thuth@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 frankja@linux.ibm.com, kvm@vger.kernel.org, david@redhat.com,
 jun.nakajima@intel.com, mst@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 richard.henderson@linaro.org, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <ehabkost@redhat.com>, mdroth@linux.vnet.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, pragyansri.pathi@intel.com, andi.kleen@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>,
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
index 0000000000..2790425b38
--- /dev/null
+++ b/docs/confidential-guest-support.txt
@@ -0,0 +1,43 @@
+Confidential Guest Support
+==========================
+
+Traditionally, hypervisors such as qemu have complete access to a
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


