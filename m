Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4212D5F58
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:17:53 +0100 (CET)
Received: from localhost ([::1]:60660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNhY-0000D3-Nw
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1knNf0-0007ZX-MC; Thu, 10 Dec 2020 10:15:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52284
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1knNey-0006v4-Og; Thu, 10 Dec 2020 10:15:14 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAF2cSc187464; Thu, 10 Dec 2020 10:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8g8vARb2mjBjBLduNt+uCk9eJ3iqJX3RMRGSGoQ3l+A=;
 b=PhsA6aSaMnb9HZnYWG425DgZC9g75ieV9AAT2gek+TwuBm46yaU93+RWhfAuF3vh+3Ww
 8Wa243w263MN74qvFqiI4oRpt3hGuowxoSwN3tmpEHDZnT6KX+LBotmMgf2Id18bJtlx
 my+FIRFIJlbZhFQ/jITCXQbYgmrUMpdqGxdg1O01m//or1ox8BvIAFoJqSXdyAHPB64D
 BPaFPvS0+32kACdjI655bzaFD5JbU9nXk6FfcD/vcNvTibjsBGsfcQdCNzs68mG2OAfp
 oGSj06AiFjUZKdEmXvyMnyIdStsO/T/Bq1oEvBJg8GuhW6ylACDdwpNJbH7rLnRHmeld mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35bnhn9hv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 10:15:11 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BAF33Gr190970;
 Thu, 10 Dec 2020 10:15:10 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35bnhn9hum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 10:15:10 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAF7k76030363;
 Thu, 10 Dec 2020 15:15:09 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3581u9gg11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 15:15:09 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAFF81T9109892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 15:15:08 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D99A6E075;
 Thu, 10 Dec 2020 15:15:08 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24E476E079;
 Thu, 10 Dec 2020 15:15:07 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.37.122])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Dec 2020 15:15:07 +0000 (GMT)
Subject: Re: [RFC 3/8] s390x/pci: fix pcistb length
To: Cornelia Huck <cohuck@redhat.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
 <1607546066-2240-4-git-send-email-mjrosato@linux.ibm.com>
 <20201210113006.666ce143.cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <84b3a7bf-6a37-bd9f-cd99-8eb969c83bda@linux.ibm.com>
Date: Thu, 10 Dec 2020 10:15:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210113006.666ce143.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_05:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=790
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100092
Received-SPF: pass client-ip=148.163.158.5;
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 schnelle@linux.ibm.com, richard.henderson@linaro.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 5:30 AM, Cornelia Huck wrote:
> On Wed,  9 Dec 2020 15:34:21 -0500
> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> 
>> In pcistb_service_call, we are grabbing 8 bits from a guest register to
>> indicate the length of the store operation -- but per the architecture
>> the length is actually defined by 13 bits of the guest register.
>>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/s390-pci-inst.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
>> index 70bfd91..db86f12 100644
>> --- a/hw/s390x/s390-pci-inst.c
>> +++ b/hw/s390x/s390-pci-inst.c
>> @@ -750,7 +750,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>>       int i;
>>       uint32_t fh;
>>       uint8_t pcias;
>> -    uint8_t len;
>> +    uint16_t len;
>>       uint8_t buffer[128];
>>   
>>       if (env->psw.mask & PSW_MASK_PSTATE) {
>> @@ -760,7 +760,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>>   
>>       fh = env->regs[r1] >> 32;
>>       pcias = (env->regs[r1] >> 16) & 0xf;
>> -    len = env->regs[r1] & 0xff;
>> +    len = env->regs[r1] & 0x1fff;
>>       offset = env->regs[r3];
>>   
>>       if (!(fh & FH_MASK_ENABLE)) {
> 
> Is that a general problem that we just did not notice before?
> 
> If yes, this probably deserves a Fixes: tag and can be queued
> independently of the rest of the series.
> 

Good point.  I can split this out, and same for "s390x/pci: Fix 
memory_region_access_valid call"

