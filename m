Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B42946CBB6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 04:44:24 +0100 (CET)
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1munsV-0002Tw-6m
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 22:44:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1munrX-0001gf-2e; Tue, 07 Dec 2021 22:43:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10376
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1munrU-00005R-IB; Tue, 07 Dec 2021 22:43:22 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7NMvU4030073; 
 Wed, 8 Dec 2021 03:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=qiuCYpgRDBK15rUU3k5i+Lk5r959t17GZaMrxdn4dpk=;
 b=MtYNrbbiy2Vv7QvAa8K3cmQf9O31T76nnWiV2TPakVZxisxkyPjm1qoVR3ZxubOtNU9U
 9eq/1voRmLsfThDZtAT3p5WhuvKa9mquT0TNrDSKPh187TjMawpiXeS3/lxnwCRB93/o
 5NufSjttlyYRFjqXWYDsrpEuQuxKFBFizdiV+B4RdfZ7LSYoGNZ26MGhl86RmZsEYMsW
 zVZKg4+Fxr1Kc65wlgfPBgFZnUrPXTW7P4Uwd2UYvOgE4ThcRUystLeUKTliVhsJip5F
 eQ0lRkflfLuoo2TPN/UhEmoDFfWpGTcZyXDhAAMtkhadElux/iqGP5VjlAmJhG4elo/5 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cth843ndw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 03:43:13 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B83JDY4019794;
 Wed, 8 Dec 2021 03:43:13 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cth843ndn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 03:43:13 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B83Zv4K005271;
 Wed, 8 Dec 2021 03:43:12 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3cqyyc9myv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 03:43:12 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B83hBbx24969972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 03:43:11 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01624BE051;
 Wed,  8 Dec 2021 03:43:11 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78336BE056;
 Wed,  8 Dec 2021 03:43:08 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.160.64.156])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 03:43:08 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH v2] docs: Introducing pseries documentation.
Date: Wed,  8 Dec 2021 00:42:46 -0300
Message-Id: <b29cd5d1ff931a69c3a21b1ac01ed57a533e36ba.1638934914.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R355tYeNdsL5lcVBxU5Cqyerl-41XNmu
X-Proofpoint-GUID: hmgSOert91qghW23cx01tc19wfKBAssa
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_01,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080024
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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

The purpose of this document is to substitute the content currently
available in the QEMU wiki at [0]. This initial version does contain
some additional content as well. Whenever this documentation gets
upstream and is reflected in [1], the QEMU wiki will be edited to point
to this documentation, so that we only need to keep it updated in one
place.

0. https://wiki.qemu.org/Documentation/Platforms/POWER
1. https://qemu.readthedocs.io/en/latest/system/ppc/pseries.html

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 docs/system/ppc/pseries.rst | 226 ++++++++++++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)

diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index 932d4dd17d..13edccbfd8 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -1,12 +1,238 @@
 pSeries family boards (``pseries``)
 ===================================
 
+The Power machine para-virtualized environment described by the `Linux on Power
+Architecture Reference document (LoPAR)
+<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf>`_
+is called pSeries. This environment is also known as sPAPR, System p guests, or
+simply Power Linux guests (although it is capable of running other operating
+systems, such as AIX).
+
+Even though pSeries is designed to behave as a guest environment, it is also
+capable of acting as a hypervisor OS, providing, on that role, nested
+virtualization capabilities.
+
 Supported devices
 -----------------
 
+ * Multi processor support for many Power processors generations: POWER7,
+   POWER7+, POWER8, POWER8NVL, POWER9, and Power10. Support for POWER5+ exists,
+   but its state is unknown.
+ * Interrupt Controller, XICS (POWER8) and XIVE (POWER9 and Power10)
+ * vPHB PCIe Host bridge.
+ * vscsi and vnet devices, compatible with the same devices available on a
+   PowerVM hypervisor with VIOS managing LPARs.
+ * Virtio based devices.
+ * PCIe device pass through.
+
 Missing devices
 ---------------
 
+ * SPICE support.
 
 Firmware
 --------
+
+`SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
+implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
+Configuration) Firmware: Core Requirements and Practices
+<https://standards.ieee.org/standard/1275-1994.html>`_.
+
+QEMU includes a prebuilt image of SLOF which is updated when a more recent
+version is required.
+
+Build directions
+----------------
+
+.. code-block:: bash
+
+  ./configure --target-list=ppc64-softmmu && make
+
+Running instructions
+--------------------
+
+Someone can select the pSeries machine type by running QEMU with the following
+options:
+
+.. code-block:: bash
+
+  qemu-system-ppc64 -M pseries <other QEMU arguments>
+
+sPAPR devices
+-------------
+
+The sPAPR specification defines a set of para-virtualized devices, which are
+also supported by the pSeries machine in QEMU and can be instantiated with the
+``-device`` option:
+
+* ``spapr-vlan`` : a virtual network interface.
+* ``spapr-vscsi`` : a virtual SCSI disk interface.
+* ``spapr-rng`` : a pseudo-device for passing random number generator data to the
+  guest (see the `H_RANDOM hypercall feature
+  <https://wiki.qemu.org/Features/HRandomHypercall>`_ for details).
+* ``spapr-vty``: a virtual teletype.
+* ``spapr-pci-host-bridge``: a PCI host bridge.
+* ``tpm-spapr``: a Trusted Platform Module (TPM).
+* ``spapr-tpm-proxy``: a TPM proxy.
+
+These are compatible with the devices historically available for use when
+running the IBM PowerVM hypervisor with LPARs.
+
+However, since these devices have originally been specified with another
+hypervisor and non-Linux guests in mind, you should use the virtio counterparts
+(virtio-net, virtio-blk/scsi and virtio-rng) if possible instead, since they
+will most probably give you better performance with Linux guests in a QEMU
+environment.
+
+The pSeries machine in QEMU is always instantiated with the following devices:
+
+* A NVRAM device (``spapr-nvram``).
+* A virtual teletype (``spapr-vty``).
+* A PCI host bridge (``spapr-pci-host-bridge``).
+
+Hence, it is not needed to add them manually, unless you use the ``-nodefaults``
+command line option in QEMU.
+
+In the case of the default ``spapr-nvram`` device, if someone wants to make the
+contents of the NVRAM device persistent, they will need to specify a PFLASH
+device when starting QEMU, i.e. either use
+``-drive if=pflash,file=<filename>,format=raw`` to set the default PFLASH
+device, or specify one with an ID
+(``-drive if=none,file=<filename>,format=raw,id=pfid``) and pass that ID to the
+NVRAM device with ``-global spapr-nvram.drive=pfid``.
+
+sPAPR specification
+^^^^^^^^^^^^^^^^^^^
+
+The main source of documentation on the sPAPR standard is the `Linux on Power
+Architecture Reference document (LoPAR)
+<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf>`_.
+However, documentation specific to QEMU's implementation of the specification
+can  also be found in QEMU documentation:
+
+.. toctree::
+   :maxdepth: 1
+
+   ../../specs/ppc-spapr-numa.rst
+   ../../specs/ppc-spapr-xive.rst
+
+Other documentation available in QEMU docs directory:
+
+* Hypervisor calls (a.k.a. hcalls) (``docs/specs/ppc-spapr-hcalls.txt``).
+* Hot plug (``/docs/specs/ppc-spapr-hotplug.txt``).
+* Hypervisor calls needed by the Ultravisor
+  (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
+
+Switching between the KVM-PR and KVM-HV kernel module
+-----------------------------------------------------
+
+Currently, there are two implementations of KVM on Power, ``kvm_hv.ko`` and
+``kvm_pr.ko``.
+
+
+If a host supports both KVM modes, and both KVM kernel modules are loaded, it is
+possible to switch between the two modes with the ``kvm-type`` parameter:
+
+* Use ``qemu-system-ppc64 -M pseries,accel=kvm,kvm-type=PR`` to use the
+  ``kvm_pr.ko`` kernel module.
+* Use ``qemu-system-ppc64 -M pseries,accel=kvm,kvm-type=HV`` to use ``kvm_hv.ko``
+  instead.
+
+KVM-PR
+^^^^^^
+
+KVM-PR uses the so-called **PR**\ oblem state of the PPC CPUs to run the guests,
+i.e. the virtual machine is run in user mode and all privileged instructions
+trap and have to be emulated by the host. That means you can run KVM-PR inside
+a pSeries guest (or a PowerVM LPAR for that matter), and that is where it has
+originated, as historically (prior to POWER7) it was not possible to run Linux
+on hypervisor mode on a Power processor (this function was restricted to
+PowerVM, the IBM proprietary hypervisor).
+
+Because all privileged instructions are trapped, guests that use a lot of
+privileged instructions run quite slow with KVM-PR. On the other hand, because
+of that, this kernel module can run on pretty much every PPC hardware, and is
+able to emulate a lot of guests CPUs. This module can even be used to run other
+PowerPC guests like an emulated PowerMac.
+
+As KVM-PR can be run inside a pSeries guest, it can also provide nested
+virtualization capabilities (i.e. running a guest from within a guest).
+
+It is important to notice that, as KVM-HV provides a much better execution
+performance, maintenance work has been much more focused on it in the past
+years. Maintenance for KVM-PR has been minimal.
+
+In order to run KVM-PR guests with POWER9 processors, someone will need to start
+QEMU with ``kernel_irqchip=off`` command line option.
+
+KVM-HV
+^^^^^^
+
+KVM-HV uses the hypervisor mode of more recent Power processors, that allow
+access to the bare metal hardware directly. Although POWER7 had this capability,
+it was only starting with POWER8 that this was officially supported by IBM.
+
+Originally, KVM-HV was only available when running on a PowerNV platform (a.k.a.
+Power bare metal). Although it runs on a PowerNV platform, it can only be used
+to start pSeries guests. As the pSeries guest doesn't have access to the
+hypervisor mode of the Power CPU, it wasn't possible to run KVM-HV on a guest.
+This limitation has been lifted, and now it is possible to run KVM-HV inside
+pSeries guests as well, making nested virtualization possible with KVM-HV.
+
+As KVM-HV has access to privileged instructions, guests that use a lot of these
+can run much faster than with KVM-PR. On the other hand, the guest CPU has to be
+of the same type as the host CPU this way, e.g. it is not possible to specify an
+embedded PPC CPU for the guest with KVM-HV. However, there is at least the
+possibility to run the guest in a backward-compatibility mode of the previous
+CPUs generations, e.g. you can run a POWER7 guest on a POWER8 host by using
+``-cpu POWER8,compat=power7`` as parameter to QEMU.
+
+Modules support
+---------------
+
+As noticed in the sections above, each module can run in a different
+environment. The following table shows with which environment each module can
+run. As long as you are in a supported environment, you can run KVM-PR or KVM-HV
+nested. Combinations not shown in the table are not available.
+
++--------------+------------+------+-------------------+----------+--------+
+| Platform     | Host type  | Bits | Page table format | KVM-HV   | KVM-PR |
++==============+============+======+===================+==========+========+
+| PowerNV      | bare metal | 32   | hash              | no       | yes    |
+|              |            |      +-------------------+----------+--------+
+|              |            |      | radix             | N/A      | N/A    |
+|              |            +------+-------------------+----------+--------+
+|              |            | 64   | hash              | yes      | yes    |
+|              |            |      +-------------------+----------+--------+
+|              |            |      | radix             | yes      | no     |
++--------------+------------+------+-------------------+----------+--------+
+| pSeries [1]_ | PowerNV    | 32   | hash              | no       | yes    |
+|              |            |      +-------------------+----------+--------+
+|              |            |      | radix             | N/A      | N/A    |
+|              |            +------+-------------------+----------+--------+
+|              |            | 64   | hash              | no       | yes    |
+|              |            |      +-------------------+----------+--------+
+|              |            |      | radix             | yes [2]_ | no     |
+|              +------------+------+-------------------+----------+--------+
+|              | PowerVM    | 32   | hash              | no       | yes    |
+|              |            |      +-------------------+----------+--------+
+|              |            |      | radix             | N/A      | N/A    |
+|              |            +------+-------------------+----------+--------+
+|              |            | 64   | hash              | no       | yes    |
+|              |            |      +-------------------+----------+--------+
+|              |            |      | radix [3]_        | no       | yes    |
++--------------+------------+------+-------------------+----------+--------+
+
+.. [1] On POWER9 DD2.1 processors, the page table format on the host and guest
+   must be the same.
+
+.. [2] KVM-HV cannot run nested on POWER8 machines.
+
+.. [3] Introduced on Power10 machines.
+
+Maintainer contact information
+------------------------------
+
+Cédric Le Goater <clg@kaod.org>
+
+Daniel Henrique Barboza <danielhb413@gmail.com>
\ No newline at end of file
-- 
2.33.1


