Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD50F2F1945
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:14:14 +0100 (CET)
Received: from localhost ([::1]:47438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyytZ-0006Ad-Tf
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kyyr0-0004gF-PI; Mon, 11 Jan 2021 10:11:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28248
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kyyqy-00035g-5V; Mon, 11 Jan 2021 10:11:34 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BF2XGX011879; Mon, 11 Jan 2021 10:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LZHKzGy66n5FxYxSs+9eaYxA492raEBrFAXxSIo1qLw=;
 b=sFvJAUk66qzxMc3zI6COVNDHSGfN+Eenil1xOlF1KBhteoNY+c+mftX078VylFdgAZCV
 t7I5PqRoP9iLGhW1IGtYjm/dQ9cz6P7dahMYKeXmARLkA2AyjyHc6/eAjXmCqE1hFad4
 MECRlV16O65AqWay/5Ac50lQMIx6R/5/aOkmKyHWU4WUUz9Dj4GCYvAnadAKLRzF+Vn6
 85L6oITFwelwV4VuXTntDzUNNhNNBeg91f2vfaUvA9X973J9y0hfYdLA8Eok1y26mAHu
 qQpL3htWG/XvZuGO/rsxMsvWwIUhenPIm6oTLhfcMFuteA7inSyOI7rHD8zwl8W4ApWT VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 360nnhqckq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 10:11:28 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10BF3Vmr018419;
 Mon, 11 Jan 2021 10:11:28 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 360nnhqcjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 10:11:28 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BF1x7q027032;
 Mon, 11 Jan 2021 15:11:27 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 35y448u5gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 15:11:27 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BFBPfA11600248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 15:11:25 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0B25BE056;
 Mon, 11 Jan 2021 15:11:25 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CC6CBE04F;
 Mon, 11 Jan 2021 15:11:24 +0000 (GMT)
Received: from [9.211.91.107] (unknown [9.211.91.107])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 15:11:24 +0000 (GMT)
Subject: Re: [PATCH v3 2/3] Update linux headers to 5.11-rc2
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-3-farman@linux.ibm.com>
 <20210111135404.52f18200.cohuck@redhat.com>
 <20210111075950-mutt-send-email-mst@kernel.org>
 <20210111144322.32812f16.cohuck@redhat.com>
 <20210111100002-mutt-send-email-mst@kernel.org>
From: Eric Farman <farman@linux.ibm.com>
Message-ID: <5c93b577-7db7-681a-307a-8283bb0ccbe8@linux.ibm.com>
Date: Mon, 11 Jan 2021 10:11:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210111100002-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_26:2021-01-11,
 2021-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110089
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/11/21 10:00 AM, Michael S. Tsirkin wrote:
> On Mon, Jan 11, 2021 at 02:43:22PM +0100, Cornelia Huck wrote:
>> On Mon, 11 Jan 2021 08:00:45 -0500
>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>
>>> On Mon, Jan 11, 2021 at 01:54:04PM +0100, Cornelia Huck wrote:
>>>> On Mon,  4 Jan 2021 21:20:56 +0100
>>>> Eric Farman <farman@linux.ibm.com> wrote:
>>>>    
>>>>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>>>>> ---
>>>>>   .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-
>>>>>   .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |   2 +-
>>>>>   include/standard-headers/drm/drm_fourcc.h     | 175 +++++++++++++++++-
>>>>>   include/standard-headers/linux/const.h        |  36 ++++
>>>>>   include/standard-headers/linux/ethtool.h      |   2 +-
>>>>>   include/standard-headers/linux/fuse.h         |  30 ++-
>>>>>   include/standard-headers/linux/kernel.h       |   9 +-
>>>>>   include/standard-headers/linux/pci_regs.h     |  16 ++
>>>>>   include/standard-headers/linux/vhost_types.h  |   9 +
>>>>>   include/standard-headers/linux/virtio_gpu.h   |  82 ++++++++
>>>>>   include/standard-headers/linux/virtio_ids.h   |  44 +++--
>>>>>   linux-headers/asm-arm64/kvm.h                 |   3 -
>>>>>   linux-headers/asm-generic/unistd.h            |   6 +-
>>>>>   linux-headers/asm-mips/unistd_n32.h           |   1 +
>>>>>   linux-headers/asm-mips/unistd_n64.h           |   1 +
>>>>>   linux-headers/asm-mips/unistd_o32.h           |   1 +
>>>>>   linux-headers/asm-powerpc/unistd_32.h         |   1 +
>>>>>   linux-headers/asm-powerpc/unistd_64.h         |   1 +
>>>>>   linux-headers/asm-s390/unistd_32.h            |   1 +
>>>>>   linux-headers/asm-s390/unistd_64.h            |   1 +
>>>>>   linux-headers/asm-x86/kvm.h                   |   1 +
>>>>>   linux-headers/asm-x86/unistd_32.h             |   1 +
>>>>>   linux-headers/asm-x86/unistd_64.h             |   1 +
>>>>>   linux-headers/asm-x86/unistd_x32.h            |   1 +
>>>>>   linux-headers/linux/kvm.h                     |  56 +++++-
>>>>>   linux-headers/linux/userfaultfd.h             |   9 +
>>>>>   linux-headers/linux/vfio.h                    |   1 +
>>>>>   linux-headers/linux/vhost.h                   |   4 +
>>>>>   28 files changed, 461 insertions(+), 48 deletions(-)
>>>>>   create mode 100644 include/standard-headers/linux/const.h
>>>>>
>>>>> diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
>>>>> index 7b4062a1a1..acd4c8346d 100644
>>>>> --- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
>>>>> +++ b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
>>>>> @@ -68,7 +68,7 @@ static inline int pvrdma_idx_valid(uint32_t idx, uint32_t max_elems)
>>>>>   
>>>>>   static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
>>>>>   {
>>>>> -	const unsigned int idx = qatomic_read(var);
>>>>> +	const unsigned int idx = atomic_read(var);
>>>>
>>>> Hm, what was the state of these qatomic* instances in this header? Is
>>>> it ok to rename them, or do we need to do some munging in the import
>>>> script?
>>>>
>>>> (Sorry, it's been a while.)
>>>
>>>
>>> Yea looks like it was done manually last time:
>>>
>>> commit d73415a315471ac0b127ed3fad45c8ec5d711de1
>>> Author: Stefan Hajnoczi <stefanha@redhat.com>
>>> Date:   Wed Sep 23 11:56:46 2020 +0100
>>>
>>>      qemu/atomic.h: rename atomic_ to qatomic_
>>
>> It seems that this hunk was dropped manually last time:
>>
>> commit 53ba2eee52bff5a746e96835539a1079f6bcadd1
>> Author: Matthew Rosato <mjrosato@linux.ibm.com>
>> Date:   Mon Oct 26 11:34:30 2020 -0400
>>
>>      linux-headers: update against 5.10-rc1
>>      
>>      commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec
>>      
>>      Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>>      [aw: drop pvrdma_ring.h changes to avoid revert of d73415a31547 ("qemu/atomic.h: rename atomic_ to qatomic_")]
>>      Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
>>
>> I can do that as well, but I'm not sure that this is the best way
>> forward.
> 
> Probably as easy as the following:
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> 
> 
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> index 9efbaf2f84..c1b4f468d3 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -70,6 +70,8 @@ cp_portable() {
>           -e 's/__kernel_long_t/long/' \
>           -e 's/__kernel_ulong_t/unsigned long/' \
>           -e 's/struct ethhdr/struct eth_header/' \
> +        -e 's/atomic_read/qatomic_read/' \
> +        -e 's/atomic_set/qatomic_set/' \
>           -e '/\#define _LINUX_ETHTOOL_H/a \\n\#include "net/eth.h"' \
>           "$f" > "$to/$header";
>   }
> 

Possibly, but Paolo mentioned the problem in this space some months ago:

"""
 > It looks like the changes in this file are going to get reverted the
 > next time someone does a linux header sync.

Source code should not be at all imported from Linux.  The hacks that
accomodate pvrdma in update-linux-headers.sh (like s/atomic_t/u32/)
really have no place there; the files in
include/standard-headers/drivers/infiniband/hw/vmw_pvrdma should all be
moved in hw/.

Paolo
"""

https://lore.kernel.org/qemu-devel/45ba3626-0e06-96c7-5ed8-ea561ae20f15@redhat.com/

