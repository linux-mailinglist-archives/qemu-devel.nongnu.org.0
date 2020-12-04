Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6652CE9A5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 09:32:54 +0100 (CET)
Received: from localhost ([::1]:43940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl6WM-0001nM-20
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 03:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kl6Tr-0000aC-KA; Fri, 04 Dec 2020 03:30:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kl6Tp-0004dK-6j; Fri, 04 Dec 2020 03:30:19 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B48Qvm4184852; Fri, 4 Dec 2020 03:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oqA02l3IZKy3A3AOVhc40iHjOOQTkiRQG2p5nUe0Iz8=;
 b=iqoCv9j/+i+QuCj8mHUUMKNBw99m7XHR1KRaRa9b7J9N9dVtZV4S4clklBpJdqj02Xc2
 bYwOaCZMG9oIkNo2ZVCTe8iVmlw2szwrGyw3lkuCpr6S75lxyoB0fSvJx/t4ku+HMntc
 /Q391n5eqQfqu2bM4d2g8uMHELH2owxheoy4njKC3PIMKVnu9o4BqB4PC8ir7ydoaf13
 W66GmF1POOzUSUc3tX7FJdTDIe7TUxlWDMkciDLcgcz3vd4SxLGh6F4iU0hO1GBslXk4
 ilylyWx7uHbtjRUjYDWZTUdB4D4qFY++Nv7TVyZYpwxpi2cRBaDV3jSgUG//8CHKozn6 /w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357734x70d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 03:30:09 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B48E2Dr145842;
 Fri, 4 Dec 2020 03:30:07 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357734x6x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 03:30:07 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B48LxLe021388;
 Fri, 4 Dec 2020 08:30:04 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3573v9rkfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 08:30:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B48U14D27263402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 08:30:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3291B52065;
 Fri,  4 Dec 2020 08:30:01 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.4.55])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8E1C952050;
 Fri,  4 Dec 2020 08:29:59 +0000 (GMT)
Subject: Re: [for-6.0 v5 12/13] securable guest memory: Alter virtio default
 properties for protected guests
To: Cornelia Huck <cohuck@redhat.com>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-13-david@gibson.dropbear.id.au>
 <d739cae2-9197-76a5-1c19-057bfe832187@de.ibm.com>
 <20201204091706.4432dc1e.cohuck@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <038214d1-580d-6692-cd1e-701cd41b5cf8@de.ibm.com>
Date: Fri, 4 Dec 2020 09:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201204091706.4432dc1e.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_02:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040046
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, dgilbert@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 berrange@redhat.com, thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04.12.20 09:17, Cornelia Huck wrote:
> On Fri, 4 Dec 2020 09:10:36 +0100
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
>> On 04.12.20 06:44, David Gibson wrote:
>>> The default behaviour for virtio devices is not to use the platforms normal
>>> DMA paths, but instead to use the fact that it's running in a hypervisor
>>> to directly access guest memory.  That doesn't work if the guest's memory
>>> is protected from hypervisor access, such as with AMD's SEV or POWER's PEF.
>>>
>>> So, if a securable guest memory mechanism is enabled, then apply the
>>> iommu_platform=on option so it will go through normal DMA mechanisms.
>>> Those will presumably have some way of marking memory as shared with
>>> the hypervisor or hardware so that DMA will work.
>>>
>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> ---
>>>  hw/core/machine.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index a67a27d03c..d16273d75d 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -28,6 +28,8 @@
>>>  #include "hw/mem/nvdimm.h"
>>>  #include "migration/vmstate.h"
>>>  #include "exec/securable-guest-memory.h"
>>> +#include "hw/virtio/virtio.h"
>>> +#include "hw/virtio/virtio-pci.h"
>>>  
>>>  GlobalProperty hw_compat_5_1[] = {
>>>      { "vhost-scsi", "num_queues", "1"},
>>> @@ -1169,6 +1171,17 @@ void machine_run_board_init(MachineState *machine)
>>>           * areas.
>>>           */
>>>          machine_set_mem_merge(OBJECT(machine), false, &error_abort);
>>> +
>>> +        /*
>>> +         * Virtio devices can't count on directly accessing guest
>>> +         * memory, so they need iommu_platform=on to use normal DMA
>>> +         * mechanisms.  That requires also disabling legacy virtio
>>> +         * support for those virtio pci devices which allow it.
>>> +         */
>>> +        object_register_sugar_prop(TYPE_VIRTIO_PCI, "disable-legacy",
>>> +                                   "on", true);
>>> +        object_register_sugar_prop(TYPE_VIRTIO_DEVICE, "iommu_platform",
>>> +                                   "on", false);  
>>
>> I have not followed all the history (sorry). Should we also set iommu_platform
>> for virtio-ccw? Halil?
>>
> 
> That line should add iommu_platform for all virtio devices, shouldn't
> it?

Yes, sorry. Was misreading that with the line above. 

