Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F404857F7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 19:10:40 +0100 (CET)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5AkB-0002lx-LI
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 13:10:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n5AiN-0001uP-8C; Wed, 05 Jan 2022 13:08:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n5AiJ-0002vo-FZ; Wed, 05 Jan 2022 13:08:46 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205GaaVG021960; 
 Wed, 5 Jan 2022 18:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=XEeZGgz9TQsCN+2R1Aubnfjg6Ird96E+s79h0HHlw1k=;
 b=SoAdJVK/R9HjyHiNvE7YNA++qWz2hVl8P7hItswtLO1NKb7PVvaipdzDiUxBZLGOC3Ps
 1te6i/y40IQw41xBhu1QS6DDGT6+Zr5/3Tduas36ztKeszOqbuGplVmQHUJK/R4JENcr
 Zxevvy2welj06+QiC5yf5JLtQKlIF0i0ecWq08K0gshakoqbgjZzkfQiwFj9cDhga2tF
 UV4WloaXDbqYVueKCgCBL9HMAfwuVc9zqI9O3/W1Tu2G5v8IRoDG8cQPxy0Zg02RDL02
 PRrTIiqeVTotnQxPzEha7rcve11qQAAGEdnDY3kxznjG8q9/dUnbukftpBCuaFK618NU XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dck05rjsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 18:08:27 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 205HmqT7011561;
 Wed, 5 Jan 2022 18:08:26 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dck05rjrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 18:08:26 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205I4DID021238;
 Wed, 5 Jan 2022 18:08:25 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3dcv2raa14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 18:08:25 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205I8Ofa28836112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 18:08:24 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05DCFBE05F;
 Wed,  5 Jan 2022 18:08:24 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0188FBE04F;
 Wed,  5 Jan 2022 18:08:21 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.79.38])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 18:08:21 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH] docs: Clarifications and formatting changes in ppc docs.
Date: Wed,  5 Jan 2022 15:08:06 -0300
Message-Id: <3b228af4785241c7fb4a2c70f0c495d2a9adea83.1641405872.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QOCHXn9NHt3urXnqZqYZDwll7NcLiceL
X-Proofpoint-GUID: NV6O_vnRlo1EWY0T7Q97Iy6162LvEl4o
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_05,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050118
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
Cc: danielhb413@gmail.com, groug@kaod.org, qemu-devel@nongnu.org, clg@kaod.org,
 Leonardo Garcia <lagarcia@br.ibm.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 docs/specs/ppc-spapr-hcalls.rst | 22 ++++++++---------
 docs/system/ppc/pseries.rst     | 43 +++++++++++++++++----------------
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/docs/specs/ppc-spapr-hcalls.rst b/docs/specs/ppc-spapr-hcalls.rst
index 28daf9734a..b4a18a01e6 100644
--- a/docs/specs/ppc-spapr-hcalls.rst
+++ b/docs/specs/ppc-spapr-hcalls.rst
@@ -1,13 +1,12 @@
+======================
 sPAPR hypervisor calls
-----------------------
+======================
 
 When used with the ``pseries`` machine type, ``qemu-system-ppc64`` implements
-a set of hypervisor calls (a.k.a. hcalls) defined in the `Linux on Power
-Architecture Reference document (LoPAR)
-<https://cdn.openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_.
-This document is a subset of the Power Architecture Platform Reference (PAPR+)
-specification (IBM internal only), which is what PowerVM, the IBM proprietary
-hypervisor, adheres to.
+a set of hypervisor calls (a.k.a. hcalls) defined in the Linux on Power
+Architecture Reference ([LoPAR]_) document. This document is a subset of the
+Power Architecture Platform Reference (PAPR+) specification (IBM internal only),
+which is what PowerVM, the IBM proprietary hypervisor, adheres to.
 
 The subset in LoPAR is selected based on the requirements of Linux as a guest.
 
@@ -18,8 +17,8 @@ running in the guest and QEMU.
 All those hypercalls start at hcall number 0xf000 which correspond
 to an implementation specific range in PAPR.
 
-H_RTAS (0xf000)
-^^^^^^^^^^^^^^^
+``H_RTAS (0xf000)``
+===================
 
 RTAS stands for Run-Time Abstraction Sercies and is a set of runtime services
 generally provided by the firmware inside the guest to the operating system. It
@@ -44,8 +43,8 @@ Returns:
 
   ``H_PARAMETER``: Unknown token.
 
-H_LOGICAL_MEMOP (0xf001)
-^^^^^^^^^^^^^^^^^^^^^^^^
+``H_LOGICAL_MEMOP (0xf001)``
+============================
 
 When the guest runs in "real mode" (in powerpc terminology this means with MMU
 disabled, i.e. guest effective address equals to guest physical address), it
@@ -98,3 +97,4 @@ Returns:
   ``H_SUCCESS``: Success.
 
   ``H_PARAMETER``: Invalid argument.
+
diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index 72e315eff6..ead33e6764 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -1,19 +1,18 @@
+===================================
 pSeries family boards (``pseries``)
 ===================================
 
-The Power machine para-virtualized environment described by the `Linux on Power
-Architecture Reference document (LoPAR)
-<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_
-is called pSeries. This environment is also known as sPAPR, System p guests, or
-simply Power Linux guests (although it is capable of running other operating
-systems, such as AIX).
+The Power machine para-virtualized environment described by the Linux on Power
+Architecture Reference ([LoPAR]_) document is called pSeries. This environment
+is also known as sPAPR, System p guests, or simply Power Linux guests (although
+it is capable of running other operating systems, such as AIX).
 
 Even though pSeries is designed to behave as a guest environment, it is also
 capable of acting as a hypervisor OS, providing, on that role, nested
 virtualization capabilities.
 
 Supported devices
------------------
+=================
 
  * Multi processor support for many Power processors generations: POWER7,
    POWER7+, POWER8, POWER8NVL, POWER9, and Power10. Support for POWER5+ exists,
@@ -26,12 +25,12 @@ Supported devices
  * PCIe device pass through.
 
 Missing devices
----------------
+===============
 
  * SPICE support.
 
 Firmware
---------
+========
 
 `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
 implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
@@ -42,14 +41,14 @@ QEMU includes a prebuilt image of SLOF which is updated when a more recent
 version is required.
 
 Build directions
-----------------
+================
 
 .. code-block:: bash
 
   ./configure --target-list=ppc64-softmmu && make
 
 Running instructions
---------------------
+====================
 
 Someone can select the pSeries machine type by running QEMU with the following
 options:
@@ -59,7 +58,7 @@ options:
   qemu-system-ppc64 -M pseries <other QEMU arguments>
 
 sPAPR devices
--------------
+=============
 
 The sPAPR specification defines a set of para-virtualized devices, which are
 also supported by the pSeries machine in QEMU and can be instantiated with the
@@ -102,11 +101,9 @@ device, or specify one with an ID
 NVRAM device with ``-global spapr-nvram.drive=pfid``.
 
 sPAPR specification
-^^^^^^^^^^^^^^^^^^^
+-------------------
 
-The main source of documentation on the sPAPR standard is the `Linux on Power
-Architecture Reference document (LoPAR)
-<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_.
+The main source of documentation on the sPAPR standard is the [LoPAR]_ document.
 However, documentation specific to QEMU's implementation of the specification
 can  also be found in QEMU documentation:
 
@@ -124,7 +121,7 @@ Other documentation available in QEMU docs directory:
   (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
 
 Switching between the KVM-PR and KVM-HV kernel module
------------------------------------------------------
+=====================================================
 
 Currently, there are two implementations of KVM on Power, ``kvm_hv.ko`` and
 ``kvm_pr.ko``.
@@ -139,7 +136,7 @@ possible to switch between the two modes with the ``kvm-type`` parameter:
   instead.
 
 KVM-PR
-^^^^^^
+------
 
 KVM-PR uses the so-called **PR**\ oblem state of the PPC CPUs to run the guests,
 i.e. the virtual machine is run in user mode and all privileged instructions
@@ -166,7 +163,7 @@ In order to run KVM-PR guests with POWER9 processors, someone will need to start
 QEMU with ``kernel_irqchip=off`` command line option.
 
 KVM-HV
-^^^^^^
+------
 
 KVM-HV uses the hypervisor mode of more recent Power processors, that allow
 access to the bare metal hardware directly. Although POWER7 had this capability,
@@ -188,7 +185,7 @@ CPUs generations, e.g. you can run a POWER7 guest on a POWER8 host by using
 ``-cpu POWER8,compat=power7`` as parameter to QEMU.
 
 Modules support
----------------
+===============
 
 As noticed in the sections above, each module can run in a different
 environment. The following table shows with which environment each module can
@@ -231,8 +228,12 @@ nested. Combinations not shown in the table are not available.
 .. [3] Introduced on Power10 machines.
 
 Maintainer contact information
-------------------------------
+==============================
 
 Cédric Le Goater <clg@kaod.org>
 
 Daniel Henrique Barboza <danielhb413@gmail.com>
+
+.. [LoPAR] `Linux on Power Architecture Reference document (LoPAR) revision
+   2.9 <https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_.
+
-- 
2.33.1


