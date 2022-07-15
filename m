Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5E575E47
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 11:15:01 +0200 (CEST)
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCHPY-0005pE-Tc
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 05:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oCHMA-0002DO-Pt; Fri, 15 Jul 2022 05:11:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oCHM5-0008Fx-Ji; Fri, 15 Jul 2022 05:11:27 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26F8O6jt021015;
 Fri, 15 Jul 2022 09:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nNzuJKNx9DT772cIKz7KFkA/0xkcciQziL0jJ4U/mCM=;
 b=C2G5aaPZI5y/azeDRPbo+3dJpa8S0w/SpL/i6mXcx0lmXe0xWSXG4AVW/q1V+lPGQekC
 Jj3BwsfynRRSaqYflG14RAWasRgU4RyOVk+Oe8uFIcCsRgembnY/ssHLiKMIxWXMxEZH
 aJRdFJeEv7MGuBGU7AdmuW6426cSSXliKo38YqMc5YOZ4jkXR8log7YM1h9YqvMt4tI7
 SxF6lKhClS+f0aPyAxVYmVtTZC8xtdEia+Wr1/4ZnQrM72qh2nCNtQ4KNNoGmUpgqlJo
 ThUob/d9xqrR4wF4+UXHX3zfxz3dohxNftpgno05kFYl7ErpclZj2KlI4S270lfWq29r Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb4prs01e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 09:11:22 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26F8sJTi025448;
 Fri, 15 Jul 2022 09:11:22 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb4prs00h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 09:11:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26F96IGc014819;
 Fri, 15 Jul 2022 09:11:19 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3h70xj06hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 09:11:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26F99eRE23921092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 09:09:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D22A0A4054;
 Fri, 15 Jul 2022 09:11:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 065A2A405B;
 Fri, 15 Jul 2022 09:11:15 +0000 (GMT)
Received: from [9.171.51.176] (unknown [9.171.51.176])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jul 2022 09:11:12 +0000 (GMT)
Message-ID: <b30eb75a-5a0b-3428-b812-95a2884914e4@linux.ibm.com>
Date: Fri, 15 Jul 2022 11:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 08/12] s390x/cpu_topology: implementing numa for the
 s390x topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
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
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <b1e89718-232c-2b0b-2133-102ab7b4dad4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hgKtMTsKQuZmqD2EcPXJ_zBlpy1RLD2G
X-Proofpoint-ORIG-GUID: TcOnVhb8sBU0OLgraX7h4gTRw2hvtzXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_03,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150039
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On 7/14/22 22:17, Pierre Morel wrote:
> 
> 
> On 7/14/22 16:57, Janis Schoetterl-Glausch wrote:
>> On 6/20/22 16:03, Pierre Morel wrote:
>>> S390x CPU Topology allows a non uniform repartition of the CPU
>>> inside the topology containers, sockets, books and drawers.
>>>
>>> We use numa to place the CPU inside the right topology container
>>> and report the non uniform topology to the guest.
>>>
>>> Note that s390x needs CPU0 to belong to the topology and consequently
>>> all topology must include CPU0.
>>>
>>> We accept a partial QEMU numa definition, in that case undefined CPUs
>>> are added to free slots in the topology starting with slot 0 and going
>>> up.
>>
>> I don't understand why doing it this way, via numa, makes sense for us.
>> We report the topology to the guest via STSI, which tells the guest
>> what the topology "tree" looks like. We don't report any numa distances to the guest.
>> The natural way to specify where a cpu is added to the vm, seems to me to be
>> by specify the socket, book, ... IDs when doing a device_add or via -device on
>> the command line.
>>
>> [...]
>>
> 
> It is a choice to have the core-id to determine were the CPU is situated in the topology.
> 
> But yes we can chose the use drawer-id,book-id,socket-id and use a core-id starting on 0 on each socket.
> 
> It is not done in the current implementation because the core-id implies the socket-id, book-id and drawer-id together with the smp parameters.
> 
> 
Regardless of whether the core-id or the combination of socket-id, book-id .. is used to specify where a CPU is
located, why use the numa framework and not just device_add or -device ?

That feels way more natural since it should already just work if you can do hotplug.
At least with core-id and I suspect with a subset of your changes also with socket-id, etc.

Whereas numa is an awkward fit since it's for specifying distances between nodes, which we don't do,
and you have to use a hack to get it to specify which CPUs to plug (via setting arch_id to -1).

