Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AD25B5B7E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:43:43 +0200 (CEST)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXjiv-0000Bq-Kc
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oXjhF-0006wz-4L; Mon, 12 Sep 2022 09:41:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oXjhD-00022o-64; Mon, 12 Sep 2022 09:41:56 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CDANI8027417;
 Mon, 12 Sep 2022 13:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=8pK2ryRJTunTmapQOoshhW9yABudepjMNzs5+VDOG6s=;
 b=IRlnX3YgtQqq1IEkozV3sPr/oyHcvQ5RMk9Ai4GyUsjQjm5a8OO7YKFTcqiRUeTeutbz
 VNASrJn1wZgb5Hr3CbQJhbDmb8j2xOCyhIkBd5hE8za6ujDvPGUt2CH3kKFROZTYzP26
 b8u2uDLFiEddD8L60X1v3i2XwQcbx5SVYg/IsL7MK5wRgh7+j7ycyRuWD1MJeFFn4v04
 8FwyxJPOVyCgGwPySWGcsnOY9Rz9LpMHpaAAwmlVrRuPIT4eJhHhQdZBWA0bPEaizycK
 nTCBvAO0TqLg9E3sh+CB33yGKSVgg3p2Ka1Khawi/EnvlctPXJ7I7DTUXrBlkog7++1I mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj450m56c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 13:41:50 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28CCHD6s002827;
 Mon, 12 Sep 2022 13:41:50 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj450m55d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 13:41:50 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28CDamvG021626;
 Mon, 12 Sep 2022 13:41:48 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3jgj79jf8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 13:41:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28CDfjij36241830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Sep 2022 13:41:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3081C4207C;
 Mon, 12 Sep 2022 13:41:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72FE44203F;
 Mon, 12 Sep 2022 13:41:44 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.22.70]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Sep 2022 13:41:44 +0000 (GMT)
Message-ID: <f1270e3783e72641a0e8a4ba138a6e858f82cc80.camel@linux.ibm.com>
Subject: Re: [PATCH v9 10/10] docs/s390x: document s390x cpu topology
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
Date: Mon, 12 Sep 2022 15:41:44 +0200
In-Reply-To: <20220902075531.188916-11-pmorel@linux.ibm.com>
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-11-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -jS1BPrrsfVyqzl7TuMAeESzq0jqIWTV
X-Proofpoint-ORIG-GUID: 5mtQyxI8VrYuLjnMsILDJh3FpoZpdm7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_09,2022-09-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120045
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2022-09-02 at 09:55 +0200, Pierre Morel wrote:
> Add some basic examples for the definition of cpu topology
> in s390x.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  docs/system/s390x/cpu_topology.rst | 88 ++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 docs/system/s390x/cpu_topology.rst
> 
> diff --git a/docs/system/s390x/cpu_topology.rst b/docs/system/s390x/cpu_topology.rst
> new file mode 100644
> index 0000000000..00977d4319
> --- /dev/null
> +++ b/docs/system/s390x/cpu_topology.rst
> @@ -0,0 +1,88 @@
> +CPU Topology on s390x
> +=====================
> +
> +CPU Topology on S390x provides up to 4 levels of topology containers:
> +drawers, books, sockets and CPUs.
> +While the three higher level containers, Containers Topology List Entries,
> +(Containers TLE) define a tree hierarchy, the lowest level of topology
> +definition, the CPU Topology List Entry (CPU TLE), provides the placement
> +of the CPUs inside the last container.

inside the parent container
> +
> +Prerequisites
> +-------------
> +
> +To use CPU Topology a Linux QEMU/KVM machine providing the CPU Topology facility
> +(STFLE bit 11) is required.
> +
> +However, since this facility has been enabled by default in an early version,
> +the capability ``KVM_CAP_S390_CPU_TOPOLOGY`` is needed to indicate to KVM
> +that QEMU support CPU Topology.

I don't understand this paragraph. Early version of what?
> +
> +Indicating the CPU topology to the Virtual Machine
> +--------------------------------------------------
> +
> +The CPU Topology, number of drawers, number of books per drawers, number of
> +sockets per book and number of cores per sockets is specified with the
> +``-smp`` qemu command arguments.
> +
> +Like in :
> +
> +.. code-block:: sh
> +    -smp cpus=1,drawers=3,books=4,sockets=2,cores=8,maxcpus=192
> +
> +If drawers or books are not specified, their default to 1.
> +
> +New CPUs can be plugged using the device_add hmp command like in:
> +
> +.. code-block:: sh
> +   (qemu) device_add host-s390x-cpu,core-id=9
> +
> +The core-id defines the placement of the core in the topology by
> +starting with core 0 in socket 0, book 0 and drawer 0 up to the maximum
> +core number of the last socket of the last book in the last drawer.
> +
> +In the example above:
> +
> +* the core with ID 9 will be placed in container (0,0,1), as core 9
> +  of CPU TLE 0 of socket 1 in book 0 from drawer 0.
> +* the core ID 0 is defined by the -smp cpus=1 command and will be
> +  placed as core 0 in CPU TLE 0 of container (0,0,0)
> +
> +Note that the core ID is machine wide and the CPU TLE masks provided
> +by the STSI instruction will be:
> +
> +* in socket 0: 0x80000000 (core id 0)
> +* in socket 1: 0x00400000 (core id 9)
> +
> +Indicating the CPU topology to the Guest
> +----------------------------------------
> +
> +The guest can query for topology changes using the PTF instruction.
> +In case of a topology change it can request the new topology by issuing
> +STSI instructions specifying the level of detail required, drawer with
> +STSI(15.1.4) or books STSI(15.1.3).
> +
> +The virtual machine will fill the provided buffer with the count of
> +drawers (MAG4), books per drawer (MAG3), sockets per book (MAG2) and
> +cores per socket (MAG1).
> +
> +Note that the STSI(15.1.2) is special in two ways:
> +
> +* When the firmware detect a change in the values calculated for STSI(15.1.2)
> +  it will trigger the report of the topology change for the PTF instruction.

I don't know if we need this section, after all documenting this is the
job of the principles of operation. You could just refer to the
relevant sections.
> +
> +Migration
> +---------
> +
> +For virtio-ccw machines older than s390-virtio-ccw-7.2, CPU Topoogy is
> +by default disabled.
> +
> +CPU Topoogy is by default enabled for s390-virtio-ccw-7.2 and newer machines.
> +
> +Enabling the CPU topology on older Machine is done by setting the global
> +option ''topology-disable'' to false before enabling cpu topology with the
> +cpu feature "ctop" like in:
> +
> +.. code-block:: sh
> +   -machine s390-ccw-virtio-3.0,accel=kvm,topology-disable=false
> +   -cpu z14,ctop=on


