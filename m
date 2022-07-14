Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7CA57563A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 22:15:07 +0200 (CEST)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC5Eo-00061V-G0
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 16:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oC5Cg-0003qZ-BN; Thu, 14 Jul 2022 16:12:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oC5Cd-0006Uv-2V; Thu, 14 Jul 2022 16:12:54 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EJhsnP022654;
 Thu, 14 Jul 2022 20:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AxiE8eZLk6+hF5R41orUHYuYCg8oS4Y/CWjzWE2Cvjk=;
 b=WNx9UMjqYm193KtOQG2x75p0kXcWqARSxt/d0R20HH1J71T4vvJXjo+gXzYKu88dK0FC
 R+TG0RyCAgvWsFUUzbgOn1tiIetQmJnG+8AMxFs13yix/4iwkd1bfwZi8W0XQncEf1Jz
 zj4T6KLepwpuF12XGWj7VtWEcMG71GrRVzIi3L3bum+xryCWOZiV+o0B4GsPgs2kHY7M
 YbskU+cXRDc1Xs0XzH5p25mg8X92xG9XWJm6+DhWd686PH3Pum6CT4gaaPTOCfGIw8/k
 HtdhNKejAr+I0JK0OTjnAtqX+cgchI8vyZ2GEAVShLGNg1zZ3ZN/5wvRC/yvzdJwwlsG /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hasj58kx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 20:12:49 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26EJisUi024151;
 Thu, 14 Jul 2022 20:12:48 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hasj58kwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 20:12:48 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26EK6roI021239;
 Thu, 14 Jul 2022 20:12:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3h8ncnhc45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 20:12:46 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26EKCh4I25231644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 20:12:43 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 117F6AE04D;
 Thu, 14 Jul 2022 20:12:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2430FAE051;
 Thu, 14 Jul 2022 20:12:42 +0000 (GMT)
Received: from [9.171.80.107] (unknown [9.171.80.107])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jul 2022 20:12:42 +0000 (GMT)
Message-ID: <b1e89718-232c-2b0b-2133-102ab7b4dad4@linux.ibm.com>
Date: Thu, 14 Jul 2022 22:17:24 +0200
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
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <3a821cd1-b8a0-e737-5279-8ef55e58a77f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yNAmarJcmDqNgdmyQf1AIFjXjcF5wBV3
X-Proofpoint-ORIG-GUID: HhSN5O4cQlU1WYE367pZ2tDtnUWajvXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_17,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140088
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



On 7/14/22 16:57, Janis Schoetterl-Glausch wrote:
> On 6/20/22 16:03, Pierre Morel wrote:
>> S390x CPU Topology allows a non uniform repartition of the CPU
>> inside the topology containers, sockets, books and drawers.
>>
>> We use numa to place the CPU inside the right topology container
>> and report the non uniform topology to the guest.
>>
>> Note that s390x needs CPU0 to belong to the topology and consequently
>> all topology must include CPU0.
>>
>> We accept a partial QEMU numa definition, in that case undefined CPUs
>> are added to free slots in the topology starting with slot 0 and going
>> up.
> 
> I don't understand why doing it this way, via numa, makes sense for us.
> We report the topology to the guest via STSI, which tells the guest
> what the topology "tree" looks like. We don't report any numa distances to the guest.
> The natural way to specify where a cpu is added to the vm, seems to me to be
> by specify the socket, book, ... IDs when doing a device_add or via -device on
> the command line.
> 
> [...]
> 

It is a choice to have the core-id to determine were the CPU is situated 
in the topology.

But yes we can chose the use drawer-id,book-id,socket-id and use a 
core-id starting on 0 on each socket.

It is not done in the current implementation because the core-id implies 
the socket-id, book-id and drawer-id together with the smp parameters.


-- 
Pierre Morel
IBM Lab Boeblingen

