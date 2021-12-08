Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DFC46D7B2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 17:06:34 +0100 (CET)
Received: from localhost ([::1]:50530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muzSi-0007aG-Vw
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 11:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@br.ibm.com>)
 id 1muzPi-00064T-Du; Wed, 08 Dec 2021 11:03:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8320
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@br.ibm.com>)
 id 1muzPc-0002RS-CD; Wed, 08 Dec 2021 11:03:26 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8FmZWw020288; 
 Wed, 8 Dec 2021 16:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : reply-to : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=FLXNKTWGomXPiJkKzzx04OfnOBQnOCfUCXFzdjiUIb4=;
 b=NsYpQf0hLi1DidIzA2aEUyVNo7LD7Jt30AwlaKea/noNH1aF8DwZ+7BWOX9vjvDoNVeG
 bpkphjMB/Vcq/Td547Q/y6NRxAYG656d1Id7dLjNNhzfiaGo/TgW6+NRf1A6vAUWCn4A
 CX8AuMC6wxDoDWH5EXOS3J5KfQLRWraYAZd/XhWD5kVjpM2P5e+O24RsKPi+9u16hoOj
 6wX1M2adMVeHp7mDl4InVPz/Y9ils4KQghPOQRbcKMjV3tXoYeCLHNx10fsTwJRZS5Hp
 0qtERDE7sJjDnsgdI5CpU5D8PAcXXoVes5Y2tmWypZ1CJYMDA7zHo+fahmk2rZx9VjQx /w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ctynvg9dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 16:03:06 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8FpI0E029119;
 Wed, 8 Dec 2021 16:03:05 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ctynvg9cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 16:03:05 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8FwS69023694;
 Wed, 8 Dec 2021 16:03:04 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3cqyyb580q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 16:03:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8G339X22151986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 16:03:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85DE3AC060;
 Wed,  8 Dec 2021 16:03:02 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91B77AC073;
 Wed,  8 Dec 2021 16:03:00 +0000 (GMT)
Received: from [9.65.76.184] (unknown [9.65.76.184])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 16:02:59 +0000 (GMT)
Message-ID: <976fdd68-1880-9ffe-371e-c15c6b266120@linux.ibm.com>
Date: Wed, 8 Dec 2021 13:00:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] docs: Introducing pseries documentation.
Content-Language: en-US
To: qemu-ppc@nongnu.org
References: <254c7beacff48d6bf160e52c091bafb9b367fc08.1638978401.git.lagarcia@br.ibm.com>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?=
 <lagarcia@linux.ibm.com>
Organization: IBM
In-Reply-To: <254c7beacff48d6bf160e52c091bafb9b367fc08.1638978401.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FZc0zrzydHfy0MSlCxyK4x4FIC58k991
X-Proofpoint-ORIG-GUID: jX6fiBglcqR4ASuHto0uphyZGbyPaZew
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_06,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080096
Received-SPF: pass client-ip=148.163.158.5; envelope-from=lagarcia@br.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: lagarcia@br.ibm.com
Cc: danielhb413@gmail.com, lagarcia@linux.ibm.com, groug@kaod.org,
 qemu-devel@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Argh! Disregard this patch. It fails to build. I'll send v4 fixing this.

On 12/8/21 12:47, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
>
> The purpose of this document is to substitute the content currently
> available in the QEMU wiki at [0]. This initial version does contain
> some additional content as well. Whenever this documentation gets
> upstream and is reflected in [1], the QEMU wiki will be edited to point
> to this documentation, so that we only need to keep it updated in one
> place.
>
> 0. https://wiki.qemu.org/Documentation/Platforms/POWER
> 1. https://qemu.readthedocs.io/en/latest/system/ppc/pseries.html
>
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>
> Changelog:
> v2->v3:
>  - Updating LoPAR link.
>  - Minor clarifications in the text.
>
> v1->v2:
> - Addressing David Gibson and Cédric's comments. Thanks!
>
>  docs/system/ppc/pseries.rst | 226 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 226 insertions(+)
>
> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
> index 932d4dd17d..f072f4a935 100644
> --- a/docs/system/ppc/pseries.rst
> +++ b/docs/system/ppc/pseries.rst
> @@ -1,12 +1,238 @@
>  pSeries family boards (``pseries``)
>  ===================================
>
> +The Power machine para-virtualized environment described by the `Linux on Power
> +Architecture Reference document (LoPAR)
> +<https://cdn.openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_
> +is called pSeries. This environment is also known as sPAPR, System p guests, or
> +simply Power Linux guests (although it is capable of running other operating
> +systems, such as AIX).
> +
> +Even though pSeries is designed to behave as a guest environment, it is also
> +capable of acting as a hypervisor OS, providing, on that role, nested
> +virtualization capabilities.
> +
>  Supported devices
>  -----------------
>
> + * Multi processor support for many Power processors generations: POWER7,
> +   POWER7+, POWER8, POWER8NVL, POWER9, and Power10. Support for POWER5+ exists,
> +   but its state is unknown.
> + * Interrupt Controller, XICS (POWER8) and XIVE (POWER9 and Power10)
> + * vPHB PCIe Host bridge.
> + * vscsi and vnet devices, compatible with the same devices available on a
> +   PowerVM hypervisor with VIOS managing LPARs.
> + * Virtio based devices.
> + * PCIe device pass through.
> +
>  Missing devices
>  ---------------
>
> + * SPICE support.
>
>  Firmware
>  --------
> +
> +`SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
> +implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
> +Configuration) Firmware: Core Requirements and Practices
> +<https://standards.ieee.org/standard/1275-1994.html>`_.
> +
> +QEMU includes a prebuilt image of SLOF which is updated when a more recent
> +version is required.
> +
> +Build directions
> +----------------
> +
> +.. code-block:: bash
> +
> +  ./configure --target-list=ppc64-softmmu && make
> +
> +Running instructions
> +--------------------
> +
> +Someone can select the pSeries machine type by running QEMU with the following
> +options:
> +
> +.. code-block:: bash
> +
> +  qemu-system-ppc64 -M pseries <other QEMU arguments>
> +
> +sPAPR devices
> +-------------
> +
> +The sPAPR specification defines a set of para-virtualized devices, which are
> +also supported by the pSeries machine in QEMU and can be instantiated with the
> +``-device`` option:
> +
> +* ``spapr-vlan`` : a virtual network interface.
> +* ``spapr-vscsi`` : a virtual SCSI disk interface.
> +* ``spapr-rng`` : a pseudo-device for passing random number generator data to the
> +  guest (see the `H_RANDOM hypercall feature
> +  <https://wiki.qemu.org/Features/HRandomHypercall>`_ for details).
> +* ``spapr-vty``: a virtual teletype.
> +* ``spapr-pci-host-bridge``: a PCI host bridge.
> +* ``tpm-spapr``: a Trusted Platform Module (TPM).
> +* ``spapr-tpm-proxy``: a TPM proxy.
> +
> +These are compatible with the devices historically available for use when
> +running the IBM PowerVM hypervisor with LPARs.
> +
> +However, since these devices have originally been specified with another
> +hypervisor and non-Linux guests in mind, you should use the virtio counterparts
> +(virtio-net, virtio-blk/scsi and virtio-rng for instance) if possible instead,
> +since they will most probably give you better performance with Linux guests in a
> +QEMU environment.
> +
> +The pSeries machine in QEMU is always instantiated with the following devices:
> +
> +* A NVRAM device (``spapr-nvram``).
> +* A virtual teletype (``spapr-vty``).
> +* A PCI host bridge (``spapr-pci-host-bridge``).
> +
> +Hence, it is not needed to add them manually, unless you use the ``-nodefaults``
> +command line option in QEMU.
> +
> +In the case of the default ``spapr-nvram`` device, if someone wants to make the
> +contents of the NVRAM device persistent, they will need to specify a PFLASH
> +device when starting QEMU, i.e. either use
> +``-drive if=pflash,file=<filename>,format=raw`` to set the default PFLASH
> +device, or specify one with an ID
> +(``-drive if=none,file=<filename>,format=raw,id=pfid``) and pass that ID to the
> +NVRAM device with ``-global spapr-nvram.drive=pfid``.
> +
> +sPAPR specification
> +^^^^^^^^^^^^^^^^^^^
> +
> +The main source of documentation on the sPAPR standard is the `Linux on Power
> +Architecture Reference document (LoPAR)
> +<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf>`_.
> +However, documentation specific to QEMU's implementation of the specification
> +can  also be found in QEMU documentation:
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   ../../specs/ppc-spapr-numa.rst
> +   ../../specs/ppc-spapr-xive.rst
> +
> +Other documentation available in QEMU docs directory:
> +
> +* Hypervisor calls (a.k.a. hcalls) (``docs/specs/ppc-spapr-hcalls.txt``).
> +* Hot plug (``/docs/specs/ppc-spapr-hotplug.txt``).
> +* Hypervisor calls needed by the Ultravisor
> +  (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
> +
> +Switching between the KVM-PR and KVM-HV kernel module
> +-----------------------------------------------------
> +
> +Currently, there are two implementations of KVM on Power, ``kvm_hv.ko`` and
> +``kvm_pr.ko``.
> +
> +
> +If a host supports both KVM modes, and both KVM kernel modules are loaded, it is
> +possible to switch between the two modes with the ``kvm-type`` parameter:
> +
> +* Use ``qemu-system-ppc64 -M pseries,accel=kvm,kvm-type=PR`` to use the
> +  ``kvm_pr.ko`` kernel module.
> +* Use ``qemu-system-ppc64 -M pseries,accel=kvm,kvm-type=HV`` to use ``kvm_hv.ko``
> +  instead.
> +
> +KVM-PR
> +^^^^^^
> +
> +KVM-PR uses the so-called **PR**\ oblem state of the PPC CPUs to run the guests,
> +i.e. the virtual machine is run in user mode and all privileged instructions
> +trap and have to be emulated by the host. That means you can run KVM-PR inside
> +a pSeries guest (or a PowerVM LPAR for that matter), and that is where it has
> +originated, as historically (prior to POWER7) it was not possible to run Linux
> +on hypervisor mode on a Power processor (this function was restricted to
> +PowerVM, the IBM proprietary hypervisor).
> +
> +Because all privileged instructions are trapped, guests that use a lot of
> +privileged instructions run quite slow with KVM-PR. On the other hand, because
> +of that, this kernel module can run on pretty much every PPC hardware, and is
> +able to emulate a lot of guests CPUs. This module can even be used to run other
> +PowerPC guests like an emulated PowerMac.
> +
> +As KVM-PR can be run inside a pSeries guest, it can also provide nested
> +virtualization capabilities (i.e. running a guest from within a guest).
> +
> +It is important to notice that, as KVM-HV provides a much better execution
> +performance, maintenance work has been much more focused on it in the past
> +years. Maintenance for KVM-PR has been minimal.
> +
> +In order to run KVM-PR guests with POWER9 processors, someone will need to start
> +QEMU with ``kernel_irqchip=off`` command line option.
> +
> +KVM-HV
> +^^^^^^
> +
> +KVM-HV uses the hypervisor mode of more recent Power processors, that allow
> +access to the bare metal hardware directly. Although POWER7 had this capability,
> +it was only starting with POWER8 that this was officially supported by IBM.
> +
> +Originally, KVM-HV was only available when running on a PowerNV platform (a.k.a.
> +Power bare metal). Although it runs on a PowerNV platform, it can only be used
> +to start pSeries guests. As the pSeries guest doesn't have access to the
> +hypervisor mode of the Power CPU, it wasn't possible to run KVM-HV on a guest.
> +This limitation has been lifted, and now it is possible to run KVM-HV inside
> +pSeries guests as well, making nested virtualization possible with KVM-HV.
> +
> +As KVM-HV has access to privileged instructions, guests that use a lot of these
> +can run much faster than with KVM-PR. On the other hand, the guest CPU has to be
> +of the same type as the host CPU this way, e.g. it is not possible to specify an
> +embedded PPC CPU for the guest with KVM-HV. However, there is at least the
> +possibility to run the guest in a backward-compatibility mode of the previous
> +CPUs generations, e.g. you can run a POWER7 guest on a POWER8 host by using
> +``-cpu POWER8,compat=power7`` as parameter to QEMU.
> +
> +Modules support
> +---------------
> +
> +As noticed in the sections above, each module can run in a different
> +environment. The following table shows with which environment each module can
> +run. As long as you are in a supported environment, you can run KVM-PR or KVM-HV
> +nested. Combinations not shown in the table are not available.
> +
> ++--------------+------------+------+-------------------+----------+--------+
> +| Platform     | Host type  | Bits | Page table format | KVM-HV   | KVM-PR |
> ++==============+============+======+===================+==========+========+
> +| PowerNV      | bare metal | 32   | hash              | no       | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix             | N/A      | N/A    |
> +|              |            +------+-------------------+----------+--------+
> +|              |            | 64   | hash              | yes      | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix             | yes      | no     |
> ++--------------+------------+------+-------------------+----------+--------+
> +| pSeries [1]_ | PowerNV    | 32   | hash              | no       | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix             | N/A      | N/A    |
> +|              |            +------+-------------------+----------+--------+
> +|              |            | 64   | hash              | no       | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix             | yes [2]_ | no     |
> +|              +------------+------+-------------------+----------+--------+
> +|              | PowerVM    | 32   | hash              | no       | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix             | N/A      | N/A    |
> +|              |            +------+-------------------+----------+--------+
> +|              |            | 64   | hash              | no       | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix [3]_        | no       | yes    |
> ++--------------+------------+------+-------------------+----------+--------+
> +
> +.. [1] On POWER9 DD2.1 processors, the page table format on the host and guest
> +   must be the same.
> +
> +.. [2] KVM-HV cannot run nested on POWER8 machines.
> +
> +.. [3] Introduced on Power10 machines.
> +
> +Maintainer contact information
> +------------------------------
> +
> +Cédric Le Goater <clg@kaod.org>
> +
> +Daniel Henrique Barboza <danielhb413@gmail.com>
> \ No newline at end of file

