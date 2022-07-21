Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7708957C598
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 09:56:28 +0200 (CEST)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oER2p-0002B2-8j
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 03:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oER0B-0000fS-Gl; Thu, 21 Jul 2022 03:53:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oER09-0000hw-KB; Thu, 21 Jul 2022 03:53:43 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26L7eRxk034615;
 Thu, 21 Jul 2022 07:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vq5pDPzPvdLUSI9qCqjvbn+cTyOSe5YMaE2KsJMB8hs=;
 b=kGzUOy82JLowpgQHNe6PShlU5FIrwlIHJNDW2ihySRmK1Fxs2JfChr3lauuofvsVFVYO
 b5zoOlJtyuBwVdhmIjY5iptusJvq9vgvzq8rjPfb5gwA/Y2BHqIC+Sky4zL2yvU6IRY8
 gk/ViBVGLeMIHtmQ3F6v9KpaQWwVRVgVq3LrN+i4y/0a2N4pyqr5eqS3+Xx4QoQOYYQ+
 bXe1S2nBafmAA5nIeYJU2QFTbTlg1K40LCpqT7bTBUBp1In4S02502/IhDxhRqg/8mym
 VRH58pV45WnBFai80G6Wde6lHs/HraxZ2vtEaqAFTSWOrlbPw/FZKEkT66Nx1JvMm09P IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf2cwgku1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 07:53:36 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26L7maIS032582;
 Thu, 21 Jul 2022 07:53:35 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf2cwgkt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 07:53:35 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26L7p4Li023413;
 Thu, 21 Jul 2022 07:53:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3hbmy8xjqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 07:53:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26L7rVBC19988978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 07:53:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1E84A4060;
 Thu, 21 Jul 2022 07:53:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F03ECA405F;
 Thu, 21 Jul 2022 07:53:29 +0000 (GMT)
Received: from [9.171.89.164] (unknown [9.171.89.164])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 07:53:29 +0000 (GMT)
Message-ID: <3b2f62a7-b526-adfd-e791-f2bc2cae3ccf@linux.ibm.com>
Date: Thu, 21 Jul 2022 09:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v8 08/12] s390x/cpu_topology: implementing numa for the
 s390x topology
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220620140352.39398-1-pmorel@linux.ibm.com>
 <20220620140352.39398-9-pmorel@linux.ibm.com>
 <3a821cd1-b8a0-e737-5279-8ef55e58a77f@linux.ibm.com>
 <b1e89718-232c-2b0b-2133-102ab7b4dad4@linux.ibm.com>
 <b30eb75a-5a0b-3428-b812-95a2884914e4@linux.ibm.com>
 <14afa5dc-80de-c5a2-b57d-867c692b29cf@linux.ibm.com>
 <e497396a-eadf-15ae-e11c-d6a2bbbff7c7@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <e497396a-eadf-15ae-e11c-d6a2bbbff7c7@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: abgnz_KWYZL0k3Yq8EQ8DKGOb4L1bEJs
X-Proofpoint-ORIG-GUID: PoTK9vWExKrSuV91oWNIAdRcQtqNvkaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207210029
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 7/20/22 19:24, Janis Schoetterl-Glausch wrote:
> On 7/15/22 15:07, Pierre Morel wrote:
>>
>>
>> On 7/15/22 11:11, Janis Schoetterl-Glausch wrote:
>>> On 7/14/22 22:17, Pierre Morel wrote:
>>>>
>>>>
>>>> On 7/14/22 16:57, Janis Schoetterl-Glausch wrote:
>>>>> On 6/20/22 16:03, Pierre Morel wrote:
>>>>>> S390x CPU Topology allows a non uniform repartition of the CPU
>>>>>> inside the topology containers, sockets, books and drawers.
>>>>>>
>>>>>> We use numa to place the CPU inside the right topology container
>>>>>> and report the non uniform topology to the guest.
>>>>>>
>>>>>> Note that s390x needs CPU0 to belong to the topology and consequently
>>>>>> all topology must include CPU0.
>>>>>>
>>>>>> We accept a partial QEMU numa definition, in that case undefined CPUs
>>>>>> are added to free slots in the topology starting with slot 0 and going
>>>>>> up.
>>>>>
>>>>> I don't understand why doing it this way, via numa, makes sense for us.
>>>>> We report the topology to the guest via STSI, which tells the guest
>>>>> what the topology "tree" looks like. We don't report any numa distances to the guest.
>>>>> The natural way to specify where a cpu is added to the vm, seems to me to be
>>>>> by specify the socket, book, ... IDs when doing a device_add or via -device on
>>>>> the command line.
>>>>>
>>>>> [...]
>>>>>
>>>>
>>>> It is a choice to have the core-id to determine were the CPU is situated in the topology.
>>>>
>>>> But yes we can chose the use drawer-id,book-id,socket-id and use a core-id starting on 0 on each socket.
>>>>
>>>> It is not done in the current implementation because the core-id implies the socket-id, book-id and drawer-id together with the smp parameters.
>>>>
>>>>
>>> Regardless of whether the core-id or the combination of socket-id, book-id .. is used to specify where a CPU is
>>> located, why use the numa framework and not just device_add or -device ?
>>
>> You are right, at least we should be able to use both.
>> I will work on this.
>>
>>>
>>> That feels way more natural since it should already just work if you can do hotplug.
>>> At least with core-id and I suspect with a subset of your changes also with socket-id, etc.
>>
>> yes, it already works with core-id
>>
>>>
>>> Whereas numa is an awkward fit since it's for specifying distances between nodes, which we don't do,
>>> and you have to use a hack to get it to specify which CPUs to plug (via setting arch_id to -1).
>>>
>>
>> Is it only for this?
>>
> That's what it looks like to me, but I'm not an expert by any means.
> x86 reports distances and more via ACPI, riscv via device tree and power appears to
> calculate hierarchy values which the linux kernel will turn into distances again.
> That's maybe closest to s390x. However, as far as I can tell all of that is static
> and cannot be reconfigured. If we want to have STSI dynamically reflect the topology
> at some point in the future, we should have a roadmap for how to achieve that.
> 
> 


You are right, numa is redundant for us as we specify the topology using 
the core-id.
The roadmap I would like to discuss is using a new:

(qemu) cpu_move src dst

where src is the current core-id and dst is the destination core-id.

I am aware that there are deep implication on current cpu code but I do 
not think it is not possible.
If it is unpossible then we would need a new argument to the device_add 
for cpu to define the "effective_core_id"
But we will still need the new hmp command to update the topology.

-- 
Pierre Morel
IBM Lab Boeblingen

