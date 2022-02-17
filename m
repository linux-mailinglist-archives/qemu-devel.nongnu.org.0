Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8244BA576
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:11:44 +0100 (CET)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjNc-0000Hm-JD
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:11:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nKj0o-0004Xm-Of; Thu, 17 Feb 2022 10:48:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53158
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nKj0l-0004c2-H0; Thu, 17 Feb 2022 10:48:05 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21HFGigJ022028; 
 Thu, 17 Feb 2022 15:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZHu1I0Fve4PD/cqbRLsOPgjn7ra0gfIaU/IZ95v16JM=;
 b=R5wBSzgG/9v+l0NAxZ+znMjXUWCeQU47c4cJbJdEVeHOwBB0EJtzD8Ex+aE1Sf+bx/bi
 mM3YtY1T5FhpbOJOVP1a7IWOrKHxmG4Gjqv6LU73RurgSSDCwl1SQl57U2IRwQkYFFOS
 L/FrAYHGN9YQNwJxSITc/3ZB+KX3jCiHEY0JqpBrgsvwLkOZs3/IsHxqOyeVvTIXOP4I
 5rixJpJmI1dXT4qpoerNl1n4+mvHUogdKw6GOFZE69pStBFR78iqITPSwUEMxKdUfvlX
 UUirhauP8hv9ri9poFFNWGzovq7ATLE7XYqD8e45JozQZ1VND0rFfLahsIq1HlwnyoHu jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e9rv6grb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 15:48:00 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21HFWpt9031676;
 Thu, 17 Feb 2022 15:47:59 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e9rv6gra8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 15:47:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21HFXSr1029413;
 Thu, 17 Feb 2022 15:47:58 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645kc0nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 15:47:57 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21HFlstN39584140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 15:47:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71DA2A405C;
 Thu, 17 Feb 2022 15:47:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48DF8A4054;
 Thu, 17 Feb 2022 15:47:53 +0000 (GMT)
Received: from [9.171.42.121] (unknown [9.171.42.121])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Feb 2022 15:47:53 +0000 (GMT)
Message-ID: <dc5a7de1-3703-52d6-6bdd-9eb68070534f@linux.ibm.com>
Date: Thu, 17 Feb 2022 16:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 08/11] s390x: topology: Adding drawers to CPU topology
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220217134125.132150-1-pmorel@linux.ibm.com>
 <20220217134125.132150-9-pmorel@linux.ibm.com> <Yg5ZpEisMK1uWqQH@redhat.com>
 <acc9b68e-a456-2136-0371-b815c8585a08@linux.ibm.com>
 <Yg5qnlQrcZPemm+C@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <Yg5qnlQrcZPemm+C@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YmBLo7g9xhqGWn7MjL2v_ymLgpZltSrE
X-Proofpoint-ORIG-GUID: 0A_OJpU_ppn6syMiJbMYtDjmoI8BsGaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_06,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170069
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, nrb@linux.ibm.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, david@redhat.com, philmd@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, seiden@linux.ibm.com, qemu-s390x@nongnu.org,
 mst@redhat.com, pbonzini@redhat.com, eblake@redhat.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/17/22 16:32, Daniel P. Berrangé wrote:
> On Thu, Feb 17, 2022 at 04:30:06PM +0100, Pierre Morel wrote:
>>
>>
>> On 2/17/22 15:20, Daniel P. Berrangé wrote:
>>> On Thu, Feb 17, 2022 at 02:41:22PM +0100, Pierre Morel wrote:
>>>> S390 CPU topology may have up to 5 topology containers.
>>>> The first container above the cores is level 2, the sockets,
>>>> and the level 3, containing sockets are the books.
>>>>
>>>> We introduce here the drawers, drawers is the level containing books.
>>>>
>>>> Let's add drawers, level4, containers to the CPU topology.
>>>>
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> ---
>>>>    hw/core/machine-smp.c      | 33 ++++++++++++++++++++++++++-------
>>>>    hw/core/machine.c          |  2 ++
>>>>    hw/s390x/s390-virtio-ccw.c |  1 +
>>>>    include/hw/boards.h        |  4 ++++
>>>>    qapi/machine.json          |  7 ++++++-
>>>>    softmmu/vl.c               |  3 +++
>>>>    6 files changed, 42 insertions(+), 8 deletions(-)
>>>
>>> Needs to update -smp args in qemu-options.hx too.
>>>
>>
>> Oh, right!
>>
>> Thanks
>>
>>>>
>>
>> ...snip...
>>
>>>> index 73206f811a..fa6bde5617 100644
>>>> --- a/qapi/machine.json
>>>> +++ b/qapi/machine.json
>>>> @@ -866,13 +866,14 @@
>>>>    # a CPU is being hotplugged.
>>>>    #
>>>>    # @node-id: NUMA node ID the CPU belongs to
>>>> +# @drawer-id: drawer number within node/board the CPU belongs to
>>>>    # @book-id: book number within node/board the CPU belongs to
>>>>    # @socket-id: socket number within node/board the CPU belongs to
>>>
>>> So the lack of change here implies that 'socket-id' is unique
>>> across multiple  books/drawers. Is that correct, as its differnt
>>> from semantics for die-id/core-id/thread-id which are scoped
>>> to within the next level of the topology ?
>>
>> Hum, no I forgot to update and it needs a change.
>> What about
>>
>> # @book-id: book number within node/board/drawer the CPU belongs to
>> # @socket-id: socket number within node/board/book the CPU belongs to
>>
>> ?
> 
> Probably   drawer/node/board    and book/node/board to keep a
> low -> high topology ordering

Yes, thanks,

Regards,
Pierre

> 
> Regards,
> Daniel
> 

-- 
Pierre Morel
IBM Lab Boeblingen

