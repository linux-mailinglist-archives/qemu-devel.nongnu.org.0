Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5546C4D8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 21:44:59 +0100 (CET)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muhKc-0001i7-4b
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 15:44:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1muhJ1-00007I-Fr; Tue, 07 Dec 2021 15:43:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12642
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1muhIx-0001gk-Td; Tue, 07 Dec 2021 15:43:18 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7Jej2S031778; 
 Tue, 7 Dec 2021 20:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 reply-to : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=HVMvF70mmGHZZJGMs/rP9yBXhH2PtkeuovRO9d31OFk=;
 b=HyiuajRLbO4tce8Vvv3bzjX5ArD+jSAAVOqkhK/UqTs/BSci++PMtZsfZeZSHZo00zK/
 PZj4wXmDw+5kdb1s6UhOj/1jcFgMDhyv3S7IfHfOVLRdQdUOLD1vBkOIpVXaq9nf4GVN
 fo8Z94tNfLcSnb8vc2Zsb+wdWUvklgZCFg4KvJHdZZ/3QKxhX/y7yfsFkAwh1qV25fgC
 eakUKoPWnt+Rsxi98D215VO6Q1OmFck6VTFBhn0dpf9qU3DRgyAzrVC6j4o+cP1t3LqI
 JMquD0LX3/2DbFhhXRVeE4vmeb6uLS499wJ6iePXovB94jOtC0aemh2K6vgv35cbWVpm 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ctcdbu911-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 20:43:02 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B7KY4xk024633;
 Tue, 7 Dec 2021 20:42:53 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ctcdbu90s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 20:42:53 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7KS0Na007146;
 Tue, 7 Dec 2021 20:42:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3cqyyatq2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 20:42:52 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7KgpOP53805550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 20:42:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1ACAABE04F;
 Tue,  7 Dec 2021 20:42:51 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44DA7BE054;
 Tue,  7 Dec 2021 20:42:49 +0000 (GMT)
Received: from [9.160.64.156] (unknown [9.160.64.156])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 20:42:48 +0000 (GMT)
Message-ID: <f869bb3c-b6f9-7480-9f52-8fbb05e25af0@linux.ibm.com>
Date: Tue, 7 Dec 2021 17:42:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] docs: Introducing pseries documentation.
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <26442e7dd425bb4feca0adb54d3787fd135fffb7.1637180039.git.lagarcia@br.ibm.com>
 <79447f84-c2b9-0841-18c1-785e53fc3345@kaod.org>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?=
 <lagarcia@linux.ibm.com>
Organization: IBM
In-Reply-To: <79447f84-c2b9-0841-18c1-785e53fc3345@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -ejURyPnN6-kqXizmXy8lolokSvZa7pT
X-Proofpoint-ORIG-GUID: y3LkylPaHwhuvpc8Fjz06mnZl8SUpVft
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_08,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070126
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: lagarcia@br.ibm.com
Cc: danielhb413@gmail.com, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Leonardo Garcia <lagarcia@br.ibm.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cédric,

On 11/18/21 05:57, Cédric Le Goater wrote:
> Hello Leonardo,
>
> On 11/17/21 21:14, lagarcia@linux.ibm.com wrote:
>> From: Leonardo Garcia <lagarcia@br.ibm.com>
>>
>> The purpose of this document is to substitute the content currently
>> available in the QEMU wiki at [0]. This initial version does contain
>> some additional content as well. Whenever this documentation gets
>> upstream and is reflected in [1], the QEMU wiki will be edited to point
>> to this documentation, so that we only need to keep it updated in one
>> place.
>>
>> 0. https://wiki.qemu.org/Documentation/Platforms/POWER
>> 1. https://qemu.readthedocs.io/en/latest/system/ppc/pseries.html
>>
>> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
>
>
> Thanks for this update,
>
> Some general comments,
>
> There are other ppc documents :
>
>   docs/specs/ppc-spapr-hcalls.txt
>   docs/specs/ppc-spapr-hotplug.txt
>   docs/specs/ppc-spapr-numa.rst
>   docs/specs/ppc-spapr-uv-hcalls.txt
>   docs/specs/ppc-spapr-xive.rst
>   docs/specs/ppc-xive.rst
>
> that should be moved maybe and/or referenced by this file ? Feel free
> to do a follow up.


Definitely! Thanks for pointing this out. I have included some reference
to these files in v2, but proper reference will need some rework on the
above files as well (such as transforming txt files into rst files).
I'll work on that as a follow up.


>
> On the terminology, I think we should use in the text :
>
>    pSeries, PowerNV, POWER[0-9]


Sure. I updated the terminology according to the above in v2.


>
> When it comes to QEMU machines names, it's 'pseries', 'powernv'
>
> Some small comments,
>
>
>> ---
>>   docs/system/ppc/pseries.rst | 185 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 185 insertions(+)
>>
>> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
>> index 932d4dd17d..2de3fb4d51 100644
>> --- a/docs/system/ppc/pseries.rst
>> +++ b/docs/system/ppc/pseries.rst
>> @@ -1,12 +1,197 @@
>>   pSeries family boards (``pseries``)
>>   ===================================
>>   +The Power machine virtualized environment described by the `Linux
>> on Power
>
> para-virtualized ?


Absolutely. Fixed.


>
>> +Architecture Reference document (LoPAR)
>> +<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf>`_
>>
>> +is called pseries. This environment is also known as sPAPR, System p
>> guests, or
>> +simply Power Linux guests (although it is capable of running other
>> operating
>> +systems, such as AIX).
>> +
>> +Even though pseries is designed to behave as a guest environment, it
>> is also
>> +capable of acting as a hypervisor OS, providing, on that role, nested
>> +virtualization capabilities.
>
> on POWER9 and above processors. Maybe we should start introducing the
> KVM-pseries term.


We can do nested virtualization with the combination of KVM-HV and
KVM-PR on POWER8 machines, for instance. At this point of the text, I
wouldn't like to enter in this kind of detail, as it will be treated
later in the documentation.


>
>> +
>>   Supported devices
>>   -----------------
>>   + * Multi processor support for many Power processors generations:
>> POWER5+,
>> +   POWER7, POWER7+, POWER8, POWER8NVL, Power9, and Power10 (there is
>> no support
>> +   for POWER6 processors).
>
> POWER8NVL is for baremetal only.


You can actually create pseries guests on a POWER8NVL machine using
QEMU/KVM.


>
>> + * Interrupt Controller, XICS (POWER8) and XIVE (Power9 and Power10)
>> + * vPHB PCIe Host bridge.
>> + * vscsi and vnet devices, compatible with the same devices
>> available on a
>> +   PowerVM hypervisor with VIOS managing LPARs.
>> + * Virtio based devices.
>> + * PCIe device pass through.
>> +
>>   Missing devices
>>   ---------------
>>   + * SPICE support.
>>     Firmware
>>   --------
>> +
>> +`SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
>> +implementation of the `IEEE 1275-1994, Standard for Boot
>> (Initialization
>> +Configuration) Firmware: Core Requirements and Practices
>> +<https://standards.ieee.org/standard/1275-1994.html>`_.
>> +
>> +QEMU includes a prebuilt image of SLOF which is updated when a more
>> recent
>> +version is required.
>> +
>> +Build directions
>> +----------------
>> +
>> +.. code-block:: bash
>> +
>> +  ./configure --target-list=ppc64-softmmu && make
>> +
>> +Running instructions
>> +--------------------
>> +
>> +Someone can select the pseries machine type by running QEMU with the
>> following
>> +options:
>> +
>> +.. code-block:: bash
>> +
>> +  qemu-system-ppc64 -M pseries <other QEMU arguments>
>> +
>> +sPAPR devices
>> +-------------
>> +
>> +The sPAPR specification defines a set of para-virtualized devices,
>> which are
>> +also supported by the pseries machine in QEMU and can be
>> instantiated with the
>> +`-device` option:
>> +
>> +* spapr-vlan : A virtual network interface.
>> +* spapr-vscsi : A virtual SCSI disk interface.
>> +* spapr-rng : A pseudo-device for passing random number generator
>> data to the
>> +  guest (see the `H_RANDOM hypercall feature
>> +  <https://wiki.qemu.org/Features/HRandomHypercall>`_ for details).
>
> spapr-vty and tpm.


Added.


>
>> +
>> +These are compatible with the devices historically available for use
>> when
>> +running the IBM PowerVM hypervisor with LPARs.
>> +
>> +However, since these devices have originally been specified with
>> another
>> +hypervisor and non-Linux guests in mind, you should use the virtio
>> counterparts
>> +(virtio-net, virtio-blk/scsi and virtio-rng) if possible instead,
>> since they
>> +will most probably give you better performance with Linux guests in
>> a QEMU
>> +environment.
>> +
>> +The pseries machine in QEMU is always instantiated with a NVRAM device
>> +(``spapr-nvram``), so it is not needed to add this manually. 
>
> also a spapr-vty and a spapr-pci-host-bridge


Added.


>
>> However, if someone
>> +wants to make the contents of the NVRAM device persistent, they will
>> need to
>> +specify a PFLASH device when starting QEMU, i.e. either use
>> +``-drive if=pflash,file=<filename>,format=raw`` to set the default
>> PFLASH
>> +device, or specify one with an ID
>> +(``-drive if=none,file=<filename>,format=raw,id=pfid``) and pass
>> that ID to the
>> +NVRAM device with ``-global spapr-nvram.drive=pfid``.
>> +
>> +Switching between the KVM-PR and KVM-HV kernel module
>> +-----------------------------------------------------
>> +
>> +Currently, there are two implementations of KVM on Power,
>> ``kvm_hv.ko`` and
>> +``kvm_pr.ko``.
>> +
>> +
>> +If a host supports both KVM modes, and both KVM kernel modules are
>> loaded, it is
>> +possible to switch between the two modes with the ``kvm-type``
>> parameter:
>> +
>> +* Use ``qemu-system-ppc64 -M pseries,accel=kvm,kvm-type=PR`` to use the
>> +  ``kvm_pr.ko`` kernel module.
>> +* Use ``qemu-system-ppc64 -M pseries,accel=kvm,kvm-type=HV`` to use
>> ``kvm_hv.ko``
>> +  instead.
>> +
>> +KVM-PR
>> +^^^^^^
>> +
>> +KVM-PR uses the so-called **PR**\ oblem state of the PPC CPUs to run
>> the guests,
>> +i.e. the virtual machine is run in user mode and all privileged
>> instructions
>> +trap and have to be emulated by the host. That means you can run
>> KVM-PR inside
>> +a pseries guest (or a PowerVM LPAR for that matter), and that is
>> where it has
>> +originated, as historically (prior to POWER7) it was not possible to
>> run Linux
>> +on hypervisor mode on a Power processor (this function was
>> restricted to
>> +PowerVM, the IBM proprietary hypervisor).
>> +
>> +Because all privileged instructions are trapped, guests that use a
>> lot of
>> +privileged instructions run quite slow with KVM-PR. On the other
>> hand, because
>> +of that, this kernel module can run on pretty much every PPC
>> hardware, and is
>> +able to emulate a lot of guests CPUs. This module can even be used
>> to run other
>> +PowerPC guests like an emulated PowerMac.
>> +
>> +As KVM-PR can be run inside a pseries guest, it can also provide nested
>> +virtualization capabilities (i.e. running a guest from within a guest).
>> +
>> +KVM-HV
>> +^^^^^^
>> +
>> +KVM-HV uses the hypervisor mode of more recent Power processors,
>> that allow
>> +access to the bare metal hardware directly. Although POWER7 had this
>> capability,
>> +it was only starting with POWER8 that this was officially supported
>> by IBM.
>> +
>> +Originally, KVM-HV was only available when running on a powernv
>> platform (a.k.a.
>> +Power bare metal). Although it runs on a powernv platform, it can
>> only be used
>> +to start pseries guests. As the pseries guest doesn't have access to
>> the
>> +hypervisor mode of the Power CPU, it wasn't possible to run KVM-HV
>> on a guest.
>> +This limitation has been lifted, and now it is possible to run
>> KVM-HV inside
>> +pseries guests as well, making nested virtualization possible with
>> KVM-HV.
>> +
>> +As KVM-HV has access to privileged instructions, guests that use a
>> lot of these
>> +can run much faster than with KVM-PR. On the other hand, the guest
>> CPU has to be
>> +of the same type as the host CPU this way, e.g. it is not possible
>> to specify an
>> +embedded PPC CPU for the guest with KVM-HV. However, there is at
>> least the
>> +possibility to run the guest in a backward-compatibility mode of the
>> previous
>> +CPUs generations, e.g. you can run a POWER7 guest on a POWER8 host
>> by using
>> +``-cpu POWER8,compat=power7`` as parameter to QEMU.
>> +
>> +Modules support
>> +---------------
>> +
>> +As noticed in the sections above, each module can run in a different
>> +environment. The following table shows with which environment each
>> module can
>> +run. As long as you are in a supported environment, you can run
>> KVM-PR or KVM-HV
>> +nested. Combinations not shown in the table are not available.
>> +
>> ++--------------+------------+------+-------------------+----------+--------+
>>
>> +| Platform     | Host type  | Bits | Page table format | KVM-HV   |
>> KVM-PR |
>> ++==============+============+======+===================+==========+========+
>>
>> +| powernv      | bare metal | 32   | hash              | no       |
>> yes    |
>> +|              |            |     
>> +-------------------+----------+--------+
>> +|              |            |      | radix             | N/A      |
>> N/A    |
>> +|              |           
>> +------+-------------------+----------+--------+
>> +|              |            | 64   | hash              | yes      |
>> yes    |
>> +|              |            |     
>> +-------------------+----------+--------+
>> +|              |            |      | radix             | yes      |
>> no     |
>> ++--------------+------------+------+-------------------+----------+--------+
>>
>> +| pseries [*]_ | powernv    | 32   | hash              | no       |
>> yes    |
>> +|              |            |     
>> +-------------------+----------+--------+
>> +|              |            |      | radix             | N/A      |
>> N/A    |
>> +|              |           
>> +------+-------------------+----------+--------+
>> +|              |            | 64   | hash              | no       |
>> yes    |
>> +|              |            |     
>> +-------------------+----------+--------+
>> +|              |            |      | radix             | yes [*]_ |
>> no     |
>> +|             
>> +------------+------+-------------------+----------+--------+
>> +|              | PowerVM    | 32   | hash              | no       |
>> yes    |
>> +|              |            |     
>> +-------------------+----------+--------+
>> +|              |            |      | radix             | N/A      |
>> N/A    |
>> +|              |           
>> +------+-------------------+----------+--------+
>> +|              |            | 64   | hash              | no       |
>> yes    |
>> +|              |            |     
>> +-------------------+----------+--------+
>> +|              |            |      | radix [*]_        | no       |
>> yes    |
>> ++--------------+------------+------+-------------------+----------+--------+
>>
>>
>> +
>> +.. [*] On POWER9 DD2.1 processors, the page table format on the host
>> and guest
>> +   must be the same.
>> +
>> +.. [*] KVM-HV cannot run nested on POWER8 machines.
>> +
>> +.. [*] Introduced on Power10 machines.
>
> Shouldn't we use numbers for the above notes ?


My initial idea was to use numbers, yes. Then I started to change the
order of the rows and numbers became cumbersome to maintain in order. :)
But given that this is more or less stable now, I will revert back to
numbers.


Cheers,

Leo


>
>
>
> you could add references to other pages here.
>
> Thanks,
>
> C.
>
>
>  
>> +Maintainer contact information
>> +------------------------------
>> +
>> +Cédric Le Goater <clg@kaod.org>
>> +
>> +Daniel Henrique Barboza <danielhb413@gmail.com>
>> \ No newline at end of file
>>
>
>

