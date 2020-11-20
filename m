Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB3B2BAC14
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 15:42:59 +0100 (CET)
Received: from localhost ([::1]:58420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg7co-00025K-MI
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 09:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kg7ae-00012P-K2; Fri, 20 Nov 2020 09:40:44 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kg7aT-0003gv-1N; Fri, 20 Nov 2020 09:40:43 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKEW2fT187103; Fri, 20 Nov 2020 09:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ynBAShRSwDfBrld04tuSkeXb3BkOTg/CDOMzEi1lQVg=;
 b=dI6r5VQUUsdGGuMY2hl9w4u7jspb2BpbXNIpx/GoenpfNS4Pd9nB76NLDzgOZ0aKa6jK
 fMW1dVx4PW6uV+rwt0p7S+/gqVK8C8FvV22l0FbQfKLDJQEubBLj4WdI2lu+YoWjIgpt
 s6S2D04H/g5SG6sL74JHZ5rrR/S2UXD7lRfyID8X3dt73bMXOSdvEUuc1Ys+D47L61ge
 /4zT3CWFTbCWUWeUJtmq8ERcAYnTPvU1zVekAVdjHWWYxco+cZ1DLaH18kLyYpHRb/Ix
 4CBzv/x+DRlhARzKiJbJB7aDmqniQe3TDWy8TJ6Ujp8XPE9aZz0tV1Gj/dEt9C/UDLQY eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xd7mnawr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 09:40:03 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AKEWCKJ188003;
 Fri, 20 Nov 2020 09:40:03 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xd7mnawe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 09:40:03 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKEb5KL026293;
 Fri, 20 Nov 2020 14:40:02 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 34vgjn5u89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 14:40:02 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKEe0nJ3932792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 14:40:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A30CB205F;
 Fri, 20 Nov 2020 14:40:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BA56B2064;
 Fri, 20 Nov 2020 14:39:58 +0000 (GMT)
Received: from [9.163.28.108] (unknown [9.163.28.108])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 20 Nov 2020 14:39:58 +0000 (GMT)
Subject: Re: [PATCH 1/2] pc-bios: s390x: Ensure Read IPL memory is clean
To: Janosch Frank <frankja@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20201119165729.63351-1-farman@linux.ibm.com>
 <20201119165729.63351-2-farman@linux.ibm.com>
 <a2b38d34-97ce-595a-bf41-094dcadd6776@linux.ibm.com>
From: Eric Farman <farman@linux.ibm.com>
Message-ID: <70ad0d92-eca4-f5ca-65b1-d275cb8fa281@linux.ibm.com>
Date: Fri, 20 Nov 2020 09:39:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <a2b38d34-97ce-595a-bf41-094dcadd6776@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_07:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200096
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Herne <jjherne@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/20/20 3:26 AM, Janosch Frank wrote:
> On 11/19/20 5:57 PM, Eric Farman wrote:
>> If, for example, we boot off a virtio device and chreipl to a vfio-ccw
>> device, the space at lowcore will be non-zero. We build a Read IPL CCW
>> at address zero, but it will have leftover PSW data that will conflict
>> with the Format-0 CCW being generated:
>>
>> 0x0: 00080000 80010000
>>         ------ Ccw0.cda
>>                -- Ccw0.chainData
>>                  -- Reserved bits
>>
>> The data address will be overwritten with the correct value (0x0), but
>> the apparent data chain bit will cause subsequent memory to be used as
>> the target of the data store, which may not be where we expect (0x0).
>>
>> Clear out this space when we boot from DASD, so that we know it exists
>> exactly as we expect.
>>
>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>> Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
>> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> 
> Seems like I should have been more specific with my LGTM:
> Reviewed-by: Janosch Frank <frankja@de.ibm.com>

Thanks, Janosch. I didn't want to put words in your acronym. :)

> 
>> ---
>>   pc-bios/s390-ccw/dasd-ipl.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/pc-bios/s390-ccw/dasd-ipl.c b/pc-bios/s390-ccw/dasd-ipl.c
>> index 0fc879bb8e..71cbae2f16 100644
>> --- a/pc-bios/s390-ccw/dasd-ipl.c
>> +++ b/pc-bios/s390-ccw/dasd-ipl.c
>> @@ -100,6 +100,9 @@ static void make_readipl(void)
>>   {
>>       Ccw0 *ccwIplRead = (Ccw0 *)0x00;
>>   
>> +    /* Clear out any existing data */
>> +    memset(ccwIplRead, 0, sizeof(Ccw0));
>> +
>>       /* Create Read IPL ccw at address 0 */
>>       ccwIplRead->cmd_code = CCW_CMD_READ_IPL;
>>       ccwIplRead->cda = 0x00; /* Read into address 0x00 in main memory */
>>
> 

