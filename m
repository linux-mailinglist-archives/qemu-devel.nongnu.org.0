Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0272A3692FB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:24:09 +0200 (CEST)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvmy-0006S4-35
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lZvl8-00053j-Au; Fri, 23 Apr 2021 09:22:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lZvl3-0004DN-SB; Fri, 23 Apr 2021 09:22:14 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13ND4Gnd143901; Fri, 23 Apr 2021 09:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=I0dm86pxCdbGqARXrBox/bnIMZMGUbyFkHkChUNPl/M=;
 b=h5Tk17bY2tB4yoEsxvwZ0h8t1ms1Y3XqA+kjyFaun7AeBJ/o6BBso4lW+VdvewpX+41/
 pD7wTl6d28lR6qi0XOg8NKY6UJZBIxXSklIUWrBTvT+tuaaziv65NJd5dm21cnDBvQmV
 od7W+m9dB2Kwbej0m4blYR2mvxGkfZAU8GrRYrUZ5kWWXo4auWCXmMVAicB9ZssSq+xx
 ze4117Npg58EVgHvFT9xo/w38WmLgPCLm+Gqzr5xSyPK6uNxskpNB7kRbL7M73YwxQjx
 USjXcz+wmm7yNaX7ZHsw6r5iJ3qz+0R0dbLG2nAYzGjD2NpA8Q0DH1UqKJf2IMc1Uhq1 sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3838hmajc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 09:22:05 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13ND4soD147848;
 Fri, 23 Apr 2021 09:22:04 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3838hmajbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 09:22:04 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13NDCqFK017311;
 Fri, 23 Apr 2021 13:22:03 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 37yqaanans-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 13:22:03 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13NDM28t33227228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 13:22:02 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 333D013605D;
 Fri, 23 Apr 2021 13:22:02 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90B06136055;
 Fri, 23 Apr 2021 13:22:01 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.139.211])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 23 Apr 2021 13:22:01 +0000 (GMT)
Subject: Re: [PATCH v2] vfio-ccw: Permit missing IRQs
To: Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>
References: <20210421152053.2379873-1-farman@linux.ibm.com>
 <20210423134252.264059e5.cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <7be02ac9-c5d7-1263-ea0e-e0e0a2894521@linux.ibm.com>
Date: Fri, 23 Apr 2021 09:22:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210423134252.264059e5.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SS64GUZ66vFleoJUKkESAlGIqLrf7Ql-
X-Proofpoint-GUID: FdZQM-yD4hmZ6ryaqBolYS1sogSqLL_p
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-23_04:2021-04-23,
 2021-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104230084
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: qemu-s390x@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 7:42 AM, Cornelia Huck wrote:
> On Wed, 21 Apr 2021 17:20:53 +0200
> Eric Farman <farman@linux.ibm.com> wrote:
> 
>> Commit 690e29b91102 ("vfio-ccw: Refactor ccw irq handler") changed
>> one of the checks for the IRQ notifier registration from saying
>> "the host needs to recognize the only IRQ that exists" to saying
>> "the host needs to recognize ANY IRQ that exists."
>>
>> And this worked fine, because the subsequent change to support the
>> CRW IRQ notifier doesn't get into this code when running on an older
>> kernel, thanks to a guard by a capability region. The later addition
>> of the REQ(uest) IRQ by commit b2f96f9e4f5f ("vfio-ccw: Connect the
>> device request notifier") broke this assumption because there is no
>> matching capability region. Thus, running new QEMU on an older
>> kernel fails with:
>>
>>    vfio: unexpected number of irqs 2
>>
>> Let's adapt the message here so that there's a better clue of what
>> IRQ is missing.
>>
>> Furthermore, let's make the REQ(uest) IRQ not fail when attempting
>> to register it, to permit running vfio-ccw on a newer QEMU with an
>> older kernel.
>>
>> Fixes: b2f96f9e4f5f ("vfio-ccw: Connect the device request notifier")
>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>> ---
>>
>> Notes:
>>      v1->v2:
>>       - Keep existing "invalid number of IRQs" message with adapted text [CH]
>>       - Move the "is this an error" test to the registration of the IRQ in
>>         question, rather than making it allowable for any IRQ mismatch [CH]
>>       - Drop Fixes tag for initial commit [EF]
>>      
>>      v1: https://lore.kernel.org/qemu-devel/20210419184906.2847283-1-farman@linux.ibm.com/
>>
>>   hw/vfio/ccw.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
>> index b2df708e4b..400bc07fe2 100644
>> --- a/hw/vfio/ccw.c
>> +++ b/hw/vfio/ccw.c
>> @@ -412,8 +412,8 @@ static void vfio_ccw_register_irq_notifier(VFIOCCWDevice *vcdev,
>>       }
>>   
>>       if (vdev->num_irqs < irq + 1) {
>> -        error_setg(errp, "vfio: unexpected number of irqs %u",
>> -                   vdev->num_irqs);
>> +        error_setg(errp, "vfio: IRQ %u not available (number of irqs %u)",
>> +                   irq, vdev->num_irqs);
>>           return;
>>       }
>>   
>> @@ -696,13 +696,15 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
>>   
>>       vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX, &err);
>>       if (err) {
>> -        goto out_req_notifier_err;
>> +        /*
>> +         * Report this error, but do not make it a failing condition.
>> +         * Lack of this IRQ in the host does not prevent normal operation.
>> +         */
>> +        error_report_err(err);
>>       }
>>   
>>       return;
>>   
>> -out_req_notifier_err:
>> -    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
>>   out_crw_notifier_err:
>>       vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
>>   out_io_notifier_err:
> 
> Patch looks good to me, but now I'm wondering: Is calling
> vfio_ccw_unregister_irq_notifier() for an unregistered irq actually
> safe? I think it is (our notifiers are always present, and we should

So the unregister really does 4 things of interest:

1) vfio_set_irq_signaling(VFIO_IRQ_SET_ACTION_TRIGGER)
This will drive VFIO_DEVICE_SET_IRQS ioctl, and it looks to me like the 
VFIO_DEVICE_SET_IRQS ioctl should return -EINVAL if it's not registered 
with the kernel, which will in turn cause the vfio_set_irq_signaling to 
fast-path out on a return 0.  That seems correct.

2) qemu_set_fd_handler
If we never registered (or it was already unregistered) then fd should 
not show up in find_aio_handler() so we should also bail out fast on 
qemu_set_fd_handler()

3) event_notifier_cleanup
Should bail out right away if already cleaned up before (!initialized)

So, this looks OK to me.


> handle any ioctl failure gracefully), but worth a second look. In fact,
> we already unregister the crw irq unconditionally, so we would likely
> already have seen any problems for that one, so I assume all is good.
> 

But +1 on driving the path and making sure it works anyway (do a 
double-unregister?)

