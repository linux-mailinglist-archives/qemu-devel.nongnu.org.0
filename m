Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6124C48C69C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:58:34 +0100 (CET)
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7f57-0002zK-Fy
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n7e3q-0008JH-OQ; Wed, 12 Jan 2022 08:53:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n7e3l-0001by-HB; Wed, 12 Jan 2022 08:53:10 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CDoKni019247; 
 Wed, 12 Jan 2022 13:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=dFIKXU9o6NqjwzalfDKSePX4heE4+D+jB4KRzT0+vMM=;
 b=axPLUJLAOT/BuF7tK7O9tvnRzhdsOGxJkhPzms6+PzgIHm7oAT6SIcJmR3Rk1BZyEqm9
 HeXovTIi3HvbvuDt/V8GYT6NJA3mugpuRreOWLVEs96gPHMPxkgXl2CbtL2qAMDXHbE8
 RN8UsxllGr3sGuj/1xg2MlNqpWydV6sXAiO7CGOewmGvncaK6UjfSmAg78XuNeFhqaHu
 /kPH9qUZM7Dl338s4EVB6BkAYBiD6Ou+pziJdwYLISOwVU674G8c7Tl7wMyWNJ5FiMEP
 GKEgvf/1EkPpQp6YIAUjwln6j0DAIJyzHA/nWZAC/XyD+ynxlua+6EErh5YqqwhmVNYy Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhtht1b4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:52:38 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CDoPiW020286;
 Wed, 12 Jan 2022 13:52:38 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhtht1b4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:52:38 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CDqLnK025923;
 Wed, 12 Jan 2022 13:52:37 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3df28auuvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:52:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CDqZUo30671162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 13:52:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BCF2C6059;
 Wed, 12 Jan 2022 13:52:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51D2DC605F;
 Wed, 12 Jan 2022 13:52:33 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.79.38])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 13:52:33 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 1/3] docs: rSTify ppc-spapr-hotplug.txt.
Date: Wed, 12 Jan 2022 10:52:14 -0300
Message-Id: <50ed30232e0e6eafb580c17adec3fba17b873014.1641995058.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1641995057.git.lagarcia@br.ibm.com>
References: <cover.1641995057.git.lagarcia@br.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HS2Aap5TM1fyJU9S_AMetG8Fouh22F0O
X-Proofpoint-ORIG-GUID: T01xJ8Zxw3g_qcP3y99CkBy4qmpLzwj2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120088
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

While working on this file, also removed and unused reference in the end of the file. The reference in the text was removed by commit 9f992cca93d (spapr: update spapr hotplug documentation), but the link in the end of the document was not removed then.

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 docs/specs/ppc-spapr-hotplug.txt | 759 +++++++++++++++++--------------
 1 file changed, 430 insertions(+), 329 deletions(-)

diff --git a/docs/specs/ppc-spapr-hotplug.txt b/docs/specs/ppc-spapr-hotplug.txt
index d4fb2d46d9..f84dc55ad9 100644
--- a/docs/specs/ppc-spapr-hotplug.txt
+++ b/docs/specs/ppc-spapr-hotplug.txt
@@ -1,224 +1,316 @@
-= sPAPR Dynamic Reconfiguration =
+=============================
+sPAPR Dynamic Reconfiguration
+=============================
 
-sPAPR/"pseries" guests make use of a facility called dynamic-reconfiguration
-to handle hotplugging of dynamic "physical" resources like PCI cards, or
-"logical"/paravirtual resources like memory, CPUs, and "physical"
+sPAPR or pSeries guests make use of a facility called dynamic reconfiguration
+to handle hot plugging of dynamic "physical" resources like PCI cards, or
+"logical"/para-virtual resources like memory, CPUs, and "physical"
 host-bridges, which are generally managed by the host/hypervisor and provided
-to guests as virtualized resources. The specifics of dynamic-reconfiguration
-are documented extensively in PAPR+ v2.7, Section 13.1. This document
-provides a summary of that information as it applies to the implementation
-within QEMU.
+to guests as virtualized resources. The specifics of dynamic reconfiguration
+are documented extensively in section 13 of the Linux on Power Architecture
+Reference document ([LoPAR]_). This document provides a summary of that
+information as it applies to the implementation within QEMU.
 
-== Dynamic-reconfiguration Connectors ==
+Dynamic-reconfiguration Connectors
+==================================
 
-To manage hotplug/unplug of these resources, a firmware abstraction known as
+To manage hot plug/unplug of these resources, a firmware abstraction known as
 a Dynamic Resource Connector (DRC) is used to assign a particular dynamic
 resource to the guest, and provide an interface for the guest to manage
 configuration/removal of the resource associated with it.
 
-== Device-tree description of DRCs ==
+Device tree description of DRCs
+===============================
 
-A set of 4 Open Firmware device tree array properties are used to describe
+A set of four Open Firmware device tree array properties are used to describe
 the name/index/power-domain/type of each DRC allocated to a guest at
-boot-time. There may be multiple sets of these arrays, rooted at different
+boot time. There may be multiple sets of these arrays, rooted at different
 paths in the device tree depending on the type of resource the DRCs manage.
 
 In some cases, the DRCs themselves may be provided by a dynamic resource,
-such as the DRCs managing PCI slots on a hotplugged PHB. In this case the
+such as the DRCs managing PCI slots on a hot plugged PHB. In this case the
 arrays would be fetched as part of the device tree retrieval interfaces
-for hotplugged resources described under "Guest->Host interface".
+for hot plugged resources described under :ref:`guest-host-interface`.
 
 The array properties are described below. Each entry/element in an array
 describes the DRC identified by the element in the corresponding position
-of ibm,drc-indexes:
-
-ibm,drc-names:
-  first 4-bytes: BE-encoded integer denoting the number of entries
-  each entry: a NULL-terminated <name> string encoded as a byte array
-
-  <name> values for logical/virtual resources are defined in PAPR+ v2.7,
-  Section 13.5.2.4, and basically consist of the type of the resource
-  followed by a space and a numerical value that's unique across resources
-  of that type.
-
-  <name> values for "physical" resources such as PCI or VIO devices are
-  defined as being "location codes", which are the "location labels" of
-  each encapsulating device, starting from the chassis down to the
-  individual slot for the device, concatenated by a hyphen. This provides
-  a mapping of resources to a physical location in a chassis for debugging
-  purposes. For QEMU, this mapping is less important, so we assign a
-  location code that conforms to naming specifications, but is simply a
-  location label for the slot by itself to simplify the implementation.
-  The naming convention for location labels is documented in detail in
-  PAPR+ v2.7, Section 12.3.1.5, and in our case amounts to using "C<n>"
-  for PCI/VIO device slots, where <n> is unique across all PCI/VIO
-  device slots.
-
-ibm,drc-indexes:
-  first 4-bytes: BE-encoded integer denoting the number of entries
-  each 4-byte entry: BE-encoded <index> integer that is unique across all DRCs
-    in the machine
-
-  <index> is arbitrary, but in the case of QEMU we try to maintain the
-  convention used to assign them to pSeries guests on pHyp:
-
-    bit[31:28]: integer encoding of <type>, where <type> is:
-                  1 for CPU resource
-                  2 for PHB resource
-                  3 for VIO resource
-                  4 for PCI resource
-                  8 for Memory resource
-    bit[27:0]: integer encoding of <id>, where <id> is unique across
-                 all resources of specified type
-
-ibm,drc-power-domains:
-  first 4-bytes: BE-encoded integer denoting the number of entries
-  each 4-byte entry: 32-bit, BE-encoded <index> integer that specifies the
-    power domain the resource will be assigned to. In the case of QEMU
-    we associated all resources with a "live insertion" domain, where the
-    power is assumed to be managed automatically. The integer value for
-    this domain is a special value of -1.
-
-
-ibm,drc-types:
-  first 4-bytes: BE-encoded integer denoting the number of entries
-  each entry: a NULL-terminated <type> string encoded as a byte array
-
-  <type> is assigned as follows:
-    "CPU" for a CPU
-    "PHB" for a physical host-bridge
-    "SLOT" for a VIO slot
-    "28" for a PCI slot
-    "MEM" for memory resource
-
-== Guest->Host interface to manage dynamic resources ==
-
-Each DRC is given a globally unique DRC Index, and resources associated with
-a particular DRC are configured/managed by the guest via a number of RTAS
-calls which reference individual DRCs based on the DRC index. This can be
-considered the guest->host interface.
-
-rtas-set-power-level:
-  arg[0]: integer identifying power domain
-  arg[1]: new power level for the domain, 0-100
-  output[0]: status, 0 on success
-  output[1]: power level after command
-
-  Set the power level for a specified power domain
-
-rtas-get-power-level:
-  arg[0]: integer identifying power domain
-  output[0]: status, 0 on success
-  output[1]: current power level
-
-  Get the power level for a specified power domain
-
-rtas-set-indicator:
-  arg[0]: integer identifying sensor/indicator type
-  arg[1]: index of sensor, for DR-related sensors this is generally the
-          DRC index
-  arg[2]: desired sensor value
-  output[0]: status, 0 on success
-
-  Set the state of an indicator or sensor. For the purpose of this document we
-  focus on the indicator/sensor types associated with a DRC. The types are:
-
-    9001: isolation-state, controls/indicates whether a device has been made
-          accessible to a guest
-
-          supported sensor values:
-            0: isolate, device is made unaccessible by guest OS
-            1: unisolate, device is made available to guest OS
-
-    9002: dr-indicator, controls "visual" indicator associated with device
-
-          supported sensor values:
-            0: inactive, resource may be safely removed
-            1: active, resource is in use and cannot be safely removed
-            2: identify, used to visually identify slot for interactive hotplug
-            3: action, in most cases, used in the same manner as identify
-
-    9003: allocation-state, generally only used for "logical" DR resources to
-          request the allocation/deallocation of a resource prior to acquiring
-          it via isolation-state->unisolate, or after releasing it via
-          isolation-state->isolate, respectively. for "physical" DR (like PCI
-          hotplug/unplug) the pre-allocation of the resource is implied and
-          this sensor is unused.
-
-          supported sensor values:
-            0: unusable, tell firmware/system the resource can be
-               unallocated/reclaimed and added back to the system resource pool
-            1: usable, request the resource be allocated/reserved for use by
-               guest OS
-            2: exchange, used to allocate a spare resource to use for fail-over
-               in certain situations. unused in QEMU
-            3: recover, used to reclaim a previously allocated resource that's
-               not currently allocated to the guest OS. unused in QEMU
-
-rtas-get-sensor-state:
-  arg[0]: integer identifying sensor/indicator type
-  arg[1]: index of sensor, for DR-related sensors this is generally the
-          DRC index
-  output[0]: status, 0 on success
-
-  Used to read an indicator or sensor value.
-
-  For DR-related operations, the only noteworthy sensor is dr-entity-sense,
-  which has a type value of 9003, as allocation-state does in the case of
-  rtas-set-indicator. The semantics/encodings of the sensor values are distinct
-  however:
-
-  supported sensor values for dr-entity-sense (9003) sensor:
-    0: empty,
-         for physical resources: DRC/slot is empty
-         for logical resources: unused
-    1: present,
-         for physical resources: DRC/slot is populated with a device/resource
-         for logical resources: resource has been allocated to the DRC
-    2: unusable,
-         for physical resources: unused
-         for logical resources: DRC has no resource allocated to it
-    3: exchange,
-         for physical resources: unused
-         for logical resources: resource available for exchange (see
-           allocation-state sensor semantics above)
-    4: recovery,
-         for physical resources: unused
-         for logical resources: resource available for recovery (see
-           allocation-state sensor semantics above)
-
-rtas-ibm-configure-connector:
-  arg[0]: guest physical address of 4096-byte work area buffer
-  arg[1]: 0, or address of additional 4096-byte work area buffer. only non-zero
-          if a prior RTAS response indicated a need for additional memory
-  output[0]: status:
-               0: completed transmittal of device-tree node
-               1: instruct guest to prepare for next DT sibling node
-               2: instruct guest to prepare for next DT child node
-               3: instruct guest to prepare for next DT property
-               4: instruct guest to ascend to parent DT node
-               5: instruct guest to provide additional work-area buffer
-                  via arg[1]
-            990x: instruct guest that operation took too long and to try
-                  again later
-
-  Used to fetch an OF device-tree description of the resource associated with
-  a particular DRC. The DRC index is encoded in the first 4-bytes of the first
-  work area buffer.
-
-  Work area layout, using 4-byte offsets:
-    wa[0]: DRC index of the DRC to fetch device-tree nodes from
-    wa[1]: 0 (hard-coded)
-    wa[2]: for next-sibling/next-child response:
-             wa offset of null-terminated string denoting the new node's name
-           for next-property response:
-             wa offset of null-terminated string denoting new property's name
-    wa[3]: for next-property response (unused otherwise):
-             byte-length of new property's value
-    wa[4]: for next-property response (unused otherwise):
-             new property's value, encoded as an OFDT-compatible byte array
-
-== hotplug/unplug events ==
+of ``ibm,drc-indexes``:
+
+``ibm,drc-names``
+-----------------
+
+  First 4-bytes: big-endian (BE) encoded integer denoting the number of entries.
+
+  Each entry: a NULL-terminated ``<name>`` string encoded as a byte array.
+
+    ``<name>`` values for logical/virtual resources are defined in the Linux on
+    Power Architecture Reference ([LoPAR]_) section 13.5.2.4, and basically
+    consist of the type of the resource followed by a space and a numerical
+    value that's unique across resources of that type.
+
+    ``<name>`` values for "physical" resources such as PCI or VIO devices are
+    defined as being "location codes", which are the "location labels" of each
+    encapsulating device, starting from the chassis down to the individual slot
+    for the device, concatenated by a hyphen. This provides a mapping of
+    resources to a physical location in a chassis for debugging purposes. For
+    QEMU, this mapping is less important, so we assign a location code that
+    conforms to naming specifications, but is simply a location label for the
+    slot by itself to simplify the implementation. The naming convention for
+    location labels is documented in detail in the [LoPAR]_ section 12.3.1.5,
+    and in our case amounts to using ``C<n>`` for PCI/VIO device slots, where
+    ``<n>`` is unique across all PCI/VIO device slots.
+
+``ibm,drc-indexes``
+-------------------
+
+  First 4-bytes: BE-encoded integer denoting the number of entries.
+
+  Each 4-byte entry: BE-encoded ``<index>`` integer that is unique across all
+  DRCs in the machine.
+
+    ``<index>`` is arbitrary, but in the case of QEMU we try to maintain the
+    convention used to assign them to pSeries guests on pHyp (the hypervisor
+    portion of PowerVM):
+
+      ``bit[31:28]``: integer encoding of ``<type>``, where ``<type>`` is:
+
+        ``1`` for CPU resource.
+
+        ``2`` for PHB resource.
+
+        ``3`` for VIO resource.
+
+        ``4`` for PCI resource.
+
+        ``8`` for memory resource.
+
+      ``bit[27:0]``: integer encoding of ``<id>``, where ``<id>`` is unique
+      across all resources of specified type.
+
+``ibm,drc-power-domains``
+-------------------------
+
+  First 4-bytes: BE-encoded integer denoting the number of entries.
+
+  Each 4-byte entry: 32-bit, BE-encoded ``<index>`` integer that specifies the
+  power domain the resource will be assigned to. In the case of QEMU we
+  associated all resources with a "live insertion" domain, where the power is
+  assumed to be managed automatically. The integer value for this domain is a
+  special value of ``-1``.
+
+
+``ibm,drc-types``
+-----------------
+
+  First 4-bytes: BE-encoded integer denoting the number of entries.
+
+  Each entry: a NULL-terminated ``<type>`` string encoded as a byte array.
+  ``<type>`` is assigned as follows:
+
+    "CPU" for a CPU.
+
+    "PHB" for a physical host-bridge.
+
+    "SLOT" for a VIO slot.
+
+    "28" for a PCI slot.
+
+    "MEM" for memory resource.
+
+.. _guest-host-interface:
+
+Guest->Host interface to manage dynamic resources
+=================================================
+
+Each DRC is given a globally unique DRC index, and resources associated with a
+particular DRC are configured/managed by the guest via a number of RTAS calls
+which reference individual DRCs based on the DRC index. This can be considered
+the guest->host interface.
+
+``rtas-set-power-level``
+------------------------
+
+Set the power level for a specified power domain.
+
+  ``arg[0]``: integer identifying power domain.
+
+  ``arg[1]``: new power level for the domain, ``0-100``.
+
+  ``output[0]``: status, ``0`` on success.
+
+  ``output[1]``: power level after command.
+
+``rtas-get-power-level``
+------------------------
+
+Get the power level for a specified power domain.
+
+  ``arg[0]``: integer identifying power domain.
+
+  ``output[0]``: status, ``0`` on success.
+
+  ``output[1]``: current power level.
+
+``rtas-set-indicator``
+----------------------
+
+Set the state of an indicator or sensor.
+
+  ``arg[0]``: integer identifying sensor/indicator type.
+
+  ``arg[1]``: index of sensor, for DR-related sensors this is generally the DRC
+  index.
+
+  ``arg[2]``: desired sensor value.
+
+  ``output[0]``: status, ``0`` on success.
+
+For the purpose of this document we focus on the indicator/sensor types
+associated with a DRC. The types are:
+
+* ``9001``: ``isolation-state``, controls/indicates whether a device has been
+  made accessible to a guest. Supported sensor values:
+
+    ``0``: ``isolate``, device is made inaccessible by guest OS.
+
+    ``1``: ``unisolate``, device is made available to guest OS.
+
+* ``9002``: ``dr-indicator``, controls "visual" indicator associated with
+  device. Supported sensor values:
+
+    ``0``: ``inactive``, resource may be safely removed.
+
+    ``1``: ``active``, resource is in use and cannot be safely removed.
+
+    ``2``: ``identify``, used to visually identify slot for interactive hot plug.
+
+    ``3``: ``action``, in most cases, used in the same manner as identify.
+
+* ``9003``: ``allocation-state``, generally only used for "logical" DR resources
+  to request the allocation/deallocation of a resource prior to acquiring it via
+  ``isolation-state->unisolate``, or after releasing it via
+  ``isolation-state->isolate``, respectively. For "physical" DR (like PCI
+  hot plug/unplug) the pre-allocation of the resource is implied and this sensor
+  is unused. Supported sensor values:
+
+    ``0``: ``unusable``, tell firmware/system the resource can be
+    unallocated/reclaimed and added back to the system resource pool.
+
+    ``1``: ``usable``, request the resource be allocated/reserved for use by
+    guest OS.
+
+    ``2``: ``exchange``, used to allocate a spare resource to use for fail-over
+    in certain situations. Unused in QEMU.
+
+    ``3``: ``recover``, used to reclaim a previously allocated resource that's
+    not currently allocated to the guest OS. Unused in QEMU.
+
+``rtas-get-sensor-state:``
+--------------------------
+
+Used to read an indicator or sensor value.
+
+  ``arg[0]``: integer identifying sensor/indicator type.
+
+  ``arg[1]``: index of sensor, for DR-related sensors this is generally the DRC
+  index
+
+  ``output[0]``: status, 0 on success
+
+For DR-related operations, the only noteworthy sensor is ``dr-entity-sense``,
+which has a type value of ``9003``, as ``allocation-state`` does in the case of
+``rtas-set-indicator``. The semantics/encodings of the sensor values are
+distinct however.
+
+Supported sensor values for ``dr-entity-sense`` (``9003``) sensor:
+
+  ``0``: empty.
+
+    For physical resources: DRC/slot is empty.
+
+    For logical resources: unused.
+
+  ``1``: present.
+
+    For physical resources: DRC/slot is populated with a device/resource.
+
+    For logical resources: resource has been allocated to the DRC.
+
+  ``2``: unusable.
+
+    For physical resources: unused.
+
+    For logical resources: DRC has no resource allocated to it.
+
+  ``3``: exchange.
+
+    For physical resources: unused.
+
+    For logical resources: resource available for exchange (see
+    ``allocation-state`` sensor semantics above).
+
+  ``4``: recovery.
+
+    For physical resources: unused.
+
+    For logical resources: resource available for recovery (see
+    ``allocation-state`` sensor semantics above).
+
+``rtas-ibm-configure-connector``
+--------------------------------
+
+Used to fetch an OpenFirmware device tree description of the resource associated
+with a particular DRC.
+
+  ``arg[0]``: guest physical address of 4096-byte work area buffer.
+
+  ``arg[1]``: 0, or address of additional 4096-byte work area buffer; only
+  non-zero if a prior RTAS response indicated a need for additional memory.
+
+  ``output[0]``: status:
+
+    ``0``: completed transmittal of device tree node.
+
+    ``1``: instruct guest to prepare for next device tree sibling node.
+
+    ``2``: instruct guest to prepare for next device tree child node.
+
+    ``3``: instruct guest to prepare for next device tree property.
+
+    ``4``: instruct guest to ascend to parent device tree node.
+
+    ``5``: instruct guest to provide additional work-area buffer via ``arg[1]``.
+
+    ``990x``: instruct guest that operation took too long and to try again
+    later.
+
+The DRC index is encoded in the first 4-bytes of the first work area buffer.
+Work area (``wa``) layout, using 4-byte offsets:
+
+  ``wa[0]``: DRC index of the DRC to fetch device tree nodes from.
+
+  ``wa[1]``: ``0`` (hard-coded).
+
+  ``wa[2]``:
+
+    For next-sibling/next-child response:
+
+      ``wa`` offset of null-terminated string denoting the new node's name.
+
+    For next-property response:
+
+      ``wa`` offset of null-terminated string denoting new property's name.
+
+  ``wa[3]``: for next-property response (unused otherwise):
+
+      Byte-length of new property's value.
+
+  ``wa[4]``: for next-property response (unused otherwise):
+
+      New property's value, encoded as an OFDT-compatible byte array.
+
+Hot plug/unplug events
+======================
 
 For most DR operations, the hypervisor will issue host->guest add/remove events
 using the EPOW/check-exception notification framework, where the host issues a
@@ -230,130 +322,140 @@ requests via EPOW events.
 For DR, this framework has been extended to include hotplug events, which were
 previously unneeded due to direct manipulation of DR-related guest userspace
 tools by host-level management such as an HMC. This level of management is not
-applicable to PowerKVM, hence the reason for extending the notification
+applicable to KVM on Power, hence the reason for extending the notification
 framework to support hotplug events.
 
 The format for these EPOW-signalled events is described below under
-"hotplug/unplug event structure". Note that these events are not
-formally part of the PAPR+ specification, and have been superseded by a
-newer format, also described below under "hotplug/unplug event structure",
-and so are now deemed a "legacy" format. The formats are similar, but the
-"modern" format contains additional fields/flags, which are denoted for the
-purposes of this documentation with "#ifdef GUEST_SUPPORTS_MODERN" guards.
+:ref:`hot-plug-unplug-event-structure`. Note that these events are not formally
+part of the PAPR+ specification, and have been superseded by a newer format,
+also described below under :ref:`hot-plug-unplug-event-structure`, and so are
+now deemed a "legacy" format. The formats are similar, but the "modern" format
+contains additional fields/flags, which are denoted for the purposes of this
+documentation with ``#ifdef GUEST_SUPPORTS_MODERN`` guards.
 
 QEMU should assume support only for "legacy" fields/flags unless the guest
-advertises support for the "modern" format via ibm,client-architecture-support
-hcall by setting byte 5, bit 6 of it's ibm,architecture-vec-5 option vector
-structure (as described by LoPAPR v11, B.6.2.3). As with "legacy" format events,
-"modern" format events are surfaced to the guest via check-exception RTAS calls,
-but use a dedicated event source to signal the guest. This event source is
-advertised to the guest by the addition of a "hot-plug-events" node under
-"/event-sources" node of the guest's device tree using the standard format
-described in LoPAPR v11, B.6.12.1.
-
-== hotplug/unplug event structure ==
-
-The hotplug-specific payload in QEMU is implemented as follows (with all values
+advertises support for the "modern" format via
+``ibm,client-architecture-support`` hcall by setting byte 5, bit 6 of it's
+``ibm,architecture-vec-5`` option vector structure (as described by [LoPAR]_,
+section B.5.2.3). As with "legacy" format events, "modern" format events are
+surfaced to the guest via check-exception RTAS calls, but use a dedicated event
+source to signal the guest. This event source is advertised to the guest by the
+addition of a ``hot-plug-events`` node under ``/event-sources`` node of the
+guest's device tree using the standard format described in [LoPAR]_,
+section B.5.12.2.
+
+.. _hot-plug-unplug-event-structure:
+
+Hot plug/unplug event structure
+===============================
+
+The hot plug specific payload in QEMU is implemented as follows (with all values
 encoded in big-endian format):
 
-struct rtas_event_log_v6_hp {
-#define SECTION_ID_HOTPLUG              0x4850 /* HP */
-    struct section_header {
-        uint16_t section_id;            /* set to SECTION_ID_HOTPLUG */
-        uint16_t section_length;        /* sizeof(rtas_event_log_v6_hp),
-                                         * plus the length of the DRC name
-                                         * if a DRC name identifier is
-                                         * specified for hotplug_identifier
-                                         */
-        uint8_t section_version;        /* version 1 */
-        uint8_t section_subtype;        /* unused */
-        uint16_t creator_component_id;  /* unused */
-    } hdr;
-#define RTAS_LOG_V6_HP_TYPE_CPU         1
-#define RTAS_LOG_V6_HP_TYPE_MEMORY      2
-#define RTAS_LOG_V6_HP_TYPE_SLOT        3
-#define RTAS_LOG_V6_HP_TYPE_PHB         4
-#define RTAS_LOG_V6_HP_TYPE_PCI         5
-    uint8_t hotplug_type;               /* type of resource/device */
-#define RTAS_LOG_V6_HP_ACTION_ADD       1
-#define RTAS_LOG_V6_HP_ACTION_REMOVE    2
-    uint8_t hotplug_action;             /* action (add/remove) */
-#define RTAS_LOG_V6_HP_ID_DRC_NAME          1
-#define RTAS_LOG_V6_HP_ID_DRC_INDEX         2
-#define RTAS_LOG_V6_HP_ID_DRC_COUNT         3
-#ifdef GUEST_SUPPORTS_MODERN
-#define RTAS_LOG_V6_HP_ID_DRC_COUNT_INDEXED 4
-#endif
-    uint8_t hotplug_identifier;         /* type of the resource identifier,
-                                         * which serves as the discriminator
-                                         * for the 'drc' union field below
-                                         */
-#ifdef GUEST_SUPPORTS_MODERN
-    uint8_t capabilities;               /* capability flags, currently unused
-                                         * by QEMU
-                                         */
-#else
-    uint8_t reserved;
-#endif
-    union {
-        uint32_t index;                 /* DRC index of resource to take action
-                                         * on
-                                         */
-        uint32_t count;                 /* number of DR resources to take
-                                         * action on (guest chooses which)
-                                         */
-#ifdef GUEST_SUPPORTS_MODERN
-        struct {
-            uint32_t count;             /* number of DR resources to take
-                                         * action on
-                                         */
-            uint32_t index;             /* DRC index of first resource to take
-                                         * action on. guest will take action
-                                         * on DRC index <index> through
-                                         * DRC index <index + count - 1> in
-                                         * sequential order
-                                         */
-        } count_indexed;
-#endif
-        char name[1];                   /* string representing the name of the
-                                         * DRC to take action on
-                                         */
-    } drc;
-} QEMU_PACKED;
-
-== ibm,lrdr-capacity ==
-
-ibm,lrdr-capacity is a property in the /rtas device tree node that identifies
-the dynamic reconfiguration capabilities of the guest. It consists of a triple
-consisting of <phys>, <size> and <maxcpus>.
-
-  <phys>, encoded in BE format represents the maximum address in bytes and
+.. code-block:: c
+
+   struct rtas_event_log_v6_hp {
+   #define SECTION_ID_HOTPLUG              0x4850 /* HP */
+       struct section_header {
+           uint16_t section_id;            /* set to SECTION_ID_HOTPLUG */
+           uint16_t section_length;        /* sizeof(rtas_event_log_v6_hp),
+                                            * plus the length of the DRC name
+                                            * if a DRC name identifier is
+                                            * specified for hotplug_identifier
+                                            */
+           uint8_t section_version;        /* version 1 */
+           uint8_t section_subtype;        /* unused */
+           uint16_t creator_component_id;  /* unused */
+       } hdr;
+   #define RTAS_LOG_V6_HP_TYPE_CPU         1
+   #define RTAS_LOG_V6_HP_TYPE_MEMORY      2
+   #define RTAS_LOG_V6_HP_TYPE_SLOT        3
+   #define RTAS_LOG_V6_HP_TYPE_PHB         4
+   #define RTAS_LOG_V6_HP_TYPE_PCI         5
+       uint8_t hotplug_type;               /* type of resource/device */
+   #define RTAS_LOG_V6_HP_ACTION_ADD       1
+   #define RTAS_LOG_V6_HP_ACTION_REMOVE    2
+       uint8_t hotplug_action;             /* action (add/remove) */
+   #define RTAS_LOG_V6_HP_ID_DRC_NAME          1
+   #define RTAS_LOG_V6_HP_ID_DRC_INDEX         2
+   #define RTAS_LOG_V6_HP_ID_DRC_COUNT         3
+   #ifdef GUEST_SUPPORTS_MODERN
+   #define RTAS_LOG_V6_HP_ID_DRC_COUNT_INDEXED 4
+   #endif
+       uint8_t hotplug_identifier;         /* type of the resource identifier,
+                                            * which serves as the discriminator
+                                            * for the 'drc' union field below
+                                            */
+   #ifdef GUEST_SUPPORTS_MODERN
+       uint8_t capabilities;               /* capability flags, currently unused
+                                            * by QEMU
+                                            */
+   #else
+       uint8_t reserved;
+   #endif
+       union {
+           uint32_t index;                 /* DRC index of resource to take action
+                                            * on
+                                            */
+           uint32_t count;                 /* number of DR resources to take
+                                            * action on (guest chooses which)
+                                            */
+   #ifdef GUEST_SUPPORTS_MODERN
+           struct {
+               uint32_t count;             /* number of DR resources to take
+                                            * action on
+                                            */
+               uint32_t index;             /* DRC index of first resource to take
+                                            * action on. guest will take action
+                                            * on DRC index <index> through
+                                            * DRC index <index + count - 1> in
+                                            * sequential order
+                                            */
+           } count_indexed;
+   #endif
+           char name[1];                   /* string representing the name of the
+                                            * DRC to take action on
+                                            */
+       } drc;
+   } QEMU_PACKED;
+
+``ibm,lrdr-capacity``
+=====================
+
+``ibm,lrdr-capacity`` is a property in the /rtas device tree node that
+identifies the dynamic reconfiguration capabilities of the guest. It consists
+of a triple consisting of ``<phys>``, ``<size>`` and ``<maxcpus>``.
+
+  ``<phys>``, encoded in BE format represents the maximum address in bytes and
   hence the maximum memory that can be allocated to the guest.
 
-  <size>, encoded in BE format represents the size increments in which
+  ``<size>``, encoded in BE format represents the size increments in which
   memory can be hot-plugged to the guest.
 
-  <maxcpus>, a BE-encoded integer, represents the maximum number of
+  ``<maxcpus>``, a BE-encoded integer, represents the maximum number of
   processors that the guest can have.
 
-pseries guests use this property to note the maximum allowed CPUs for the
+``pseries`` guests use this property to note the maximum allowed CPUs for the
 guest.
 
-== ibm,dynamic-reconfiguration-memory ==
+``ibm,dynamic-reconfiguration-memory``
+======================================
 
-ibm,dynamic-reconfiguration-memory is a device tree node that represents
-dynamically reconfigurable logical memory blocks (LMB). This node
-is generated only when the guest advertises the support for it via
-ibm,client-architecture-support call. Memory that is not dynamically
-reconfigurable is represented by /memory nodes. The properties of this
-node that are of interest to the sPAPR memory hotplug implementation
-in QEMU are described here.
+``ibm,dynamic-reconfiguration-memory`` is a device tree node that represents
+dynamically reconfigurable logical memory blocks (LMB). This node is generated
+only when the guest advertises the support for it via
+``ibm,client-architecture-support`` call. Memory that is not dynamically
+reconfigurable is represented by ``/memory`` nodes. The properties of this node
+that are of interest to the sPAPR memory hotplug implementation in QEMU are
+described here.
 
-ibm,lmb-size
+``ibm,lmb-size``
+----------------
 
-This 64bit integer defines the size of each dynamically reconfigurable LMB.
+This 64-bit integer defines the size of each dynamically reconfigurable LMB.
 
-ibm,associativity-lookup-arrays
+``ibm,associativity-lookup-arrays``
+-----------------------------------
 
 This property defines a lookup array in which the NUMA associativity
 information for each LMB can be found. It is a property encoded array
@@ -361,13 +463,14 @@ that begins with an integer M, the number of associativity lists followed
 by an integer N, the number of entries per associativity list and terminated
 by M associativity lists each of length N integers.
 
-This property provides the same information as given by ibm,associativity
-property in a /memory node. Each assigned LMB has an index value between
+This property provides the same information as given by ``ibm,associativity``
+property in a ``/memory`` node. Each assigned LMB has an index value between
 0 and M-1 which is used as an index into this table to select which
-associativity list to use for the LMB. This index value for each LMB
-is defined in ibm,dynamic-memory property.
+associativity list to use for the LMB. This index value for each LMB is defined
+in ``ibm,dynamic-memory`` property.
 
-ibm,dynamic-memory
+``ibm,dynamic-memory``
+----------------------
 
 This property describes the dynamically reconfigurable memory. It is a
 property encoded array that has an integer N, the number of LMBs followed
@@ -375,19 +478,19 @@ by N LMB list entries.
 
 Each LMB list entry consists of the following elements:
 
-- Logical address of the start of the LMB encoded as a 64bit integer. This
-  corresponds to reg property in /memory node.
-- DRC index of the LMB that corresponds to ibm,my-drc-index property
-  in a /memory node.
+- Logical address of the start of the LMB encoded as a 64-bit integer. This
+  corresponds to ``reg`` property in ``/memory`` node.
+- DRC index of the LMB that corresponds to ``ibm,my-drc-index`` property
+  in a ``/memory`` node.
 - Four bytes reserved for expansion.
 - Associativity list index for the LMB that is used as an index into
-  ibm,associativity-lookup-arrays property described earlier. This
-  is used to retrieve the right associativity list to be used for this
-  LMB.
-- A 32bit flags word. The bit at bit position 0x00000008 defines whether
+  ``ibm,associativity-lookup-arrays`` property described earlier. This is used
+  to retrieve the right associativity list to be used for this LMB.
+- A 32-bit flags word. The bit at bit position ``0x00000008`` defines whether
   the LMB is assigned to the partition as of boot time.
 
-ibm,dynamic-memory-v2
+``ibm,dynamic-memory-v2``
+-------------------------
 
 This property describes the dynamically reconfigurable memory. This is
 an alternate and newer way to describe dynamically reconfigurable memory.
@@ -397,13 +500,11 @@ for each sequential group of LMBs that share common attributes.
 
 Each LMB set entry consists of the following elements:
 
-- Number of sequential LMBs in the entry represented by a 32bit integer.
-- Logical address of the first LMB in the set encoded as a 64bit integer.
+- Number of sequential LMBs in the entry represented by a 32-bit integer.
+- Logical address of the first LMB in the set encoded as a 64-bit integer.
 - DRC index of the first LMB in the set.
 - Associativity list index that is used as an index into
-  ibm,associativity-lookup-arrays property described earlier. This
+  ``ibm,associativity-lookup-arrays`` property described earlier. This
   is used to retrieve the right associativity list to be used for all
   the LMBs in this set.
-- A 32bit flags word that applies to all the LMBs in the set.
-
-[1] http://thread.gmane.org/gmane.linux.ports.ppc.embedded/75350/focus=106867
+- A 32-bit flags word that applies to all the LMBs in the set.
-- 
2.34.1


