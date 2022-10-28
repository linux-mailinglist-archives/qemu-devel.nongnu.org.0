Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE6611B88
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 22:27:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVwA-0000wB-Kt; Fri, 28 Oct 2022 16:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjin@linux.ibm.com>)
 id 1ooVvl-0000ss-2h; Fri, 28 Oct 2022 16:26:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjin@linux.ibm.com>)
 id 1ooVvi-0005es-RH; Fri, 28 Oct 2022 16:26:16 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SJwvEV030270;
 Fri, 28 Oct 2022 20:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MVoJ9noinafoxHwUtcD0Aw4ocHd7vGBJoRiC35ESrZA=;
 b=kp9TQ/1wpOJMkBp1Uthd7462q0osaqk2YwT6Fzzsq2VlyKfFFyRbsLeV6f5SEJ1nJjlE
 efsIDh7NqrbRfBfkzXPTpO8XpMNzyFK98frsFgGC46T8Aym3U6fibVL5n0hPXUG36Mjo
 qEHZby2WlvwOUPVCEGo1xPOX6ET/4MFoTZu8od/6jJZCQWd+xhjJKHKfKfsFueHEK59d
 GTYAxSd/IL68YBj6JXLSgGVh/kt+IjVJvL9gOmTYd3W1vMwoYCAbvVPu/LtCVvQoqOZh
 dBRSX9p1H1/a6V22XAuSAnND8D4NUG6JBWo50nbPiiXgSvL8swDXMVqzqTPdI2ULtKuJ uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgnqf0u8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 20:26:07 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SK1oPu007302;
 Fri, 28 Oct 2022 20:26:07 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgnqf0u8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 20:26:07 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SKK8ND022448;
 Fri, 28 Oct 2022 20:26:06 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 3kfah7wr17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 20:26:06 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29SKQ5pB18350844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 20:26:05 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1D4B58052;
 Fri, 28 Oct 2022 20:26:04 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C80F58045;
 Fri, 28 Oct 2022 20:26:03 +0000 (GMT)
Received: from [9.160.113.2] (unknown [9.160.113.2])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 20:26:03 +0000 (GMT)
Message-ID: <f1abceef-d85a-217d-09d1-88e7a023b48a@linux.ibm.com>
Date: Fri, 28 Oct 2022 16:26:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] s390x/css: revert SCSW ctrl/flag bits on error
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, cohuck@redhat.com, thuth@redhat.com,
 mjrosato@linux.ibm.com
Cc: peter@peterjin.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20221027212341.2904795-1-pjin@linux.ibm.com>
 <3a265985495a653b0cb5b4a1cf2cfad29f734dc0.camel@linux.ibm.com>
From: Peter Jin <pjin@linux.ibm.com>
In-Reply-To: <3a265985495a653b0cb5b4a1cf2cfad29f734dc0.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J901SOOTkAEu-oJ3t1j1nVVAboj01zP1
X-Proofpoint-ORIG-GUID: xlaEpTy2SEnbV_nrz7zkgulJTLpdQsQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280126
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pjin@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 10/28/22 16:22, Eric Farman wrote:
> On Thu, 2022-10-27 at 23:23 +0200, Peter Jin wrote:
>> Revert the control and flag bits in the subchannel status word in
>> case
>> the SSCH operation fails with non-zero CC (ditto for CSCH and HSCH).
>> According to POPS, the control and flag bits are only changed if
>> SSCH,
>> CSCH, and HSCH return CC 0, and no other action should be taken
>> otherwise.
>> In order to simulate that after the fact, the bits need to be
>> reverted on
>> non-zero CC.
>>
> I'm okay to this point...
>
>> This change is necessary due to the fact that the pwrite() in vfio-
>> ccw
>> which triggers the SSCH can fail at any time. Previously, there was
>> only virtio-ccw, whose do_subchannel_work function was only able to
>> return CC0. However, once vfio-ccw went into the mix, it has become
>> necessary to handle errors in code paths that were previously assumed
>> to always return success.
>>
>> In our case, we found that in case of pwrite() failure (which was
>> discovered by strace injection), the subchannel could be stuck in
>> start
>> pending state, which could be problematic if the pwrite() call
>> returns
>> CC2. Experimentation shows that the guest tries to retry the SSCH
>> call as
>> normal for CC2, but it actually continously fails due to the fact
>> that
>> the subchannel is stuck in start pending state even though no start
>> function is actually taking place.
> ...but the two paragraphs above are a bit cumbersome to digest. Maybe
> it's just too late in the week for me. What about something like this?
>
> """
> While the do_subchannel_work logic for virtual (virtio) devices will
> return condition code 0, passthrough (vfio) devices may encounter
> errors from either the host kernel or real hardware that need to be
> accounted for after this point. This includes restoring the state of
> the Subchannel Status Word to reflect the subchannel, as these bits
> would not be set in the event of a non-zero condition code from the
> affected instructions.
>
> Experimentation has shown that a failure on a START SUBCHANNEL (SSCH)
> to a passthrough device would leave the subchannel with the START
> PENDING activity control bit set, thus blocking subsequent SSCH
> operations in css_do_ssch() until some form of error recovery was
> undertaken since no interrupt would be expected.
> """
>
>> Signed-off-by: Peter Jin <pjin@linux.ibm.com>
> We've talked previously about clearing this within the
> do_subchannel_work_passthrough routine in order to keep the _virtual
> paths untouched, but this seems like a reasonable approach to me.
>
> The commit message is probably fine either way, but as far as the code
> goes:
>
> Reviewed-by: Eric Farman <farman@linux.ibm.com>
Okay, that sounds much better :)
>> ---
>>   hw/s390x/css.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++-
>> --
>>   1 file changed, 48 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
>> index 7d9523f811..95d1b3a3ce 100644
>> --- a/hw/s390x/css.c
>> +++ b/hw/s390x/css.c
>> @@ -1522,21 +1522,37 @@ IOInstEnding css_do_xsch(SubchDev *sch)
>>   IOInstEnding css_do_csch(SubchDev *sch)
>>   {
>>       SCHIB *schib = &sch->curr_status;
>> +    uint16_t old_scsw_ctrl;
>> +    IOInstEnding ccode;
>>   
>>       if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV |
>> PMCW_FLAGS_MASK_ENA)) {
>>           return IOINST_CC_NOT_OPERATIONAL;
>>       }
>>   
>> +    /*
>> +     * Save the current scsw.ctrl in case CSCH fails and we need
>> +     * to revert the scsw to the status quo ante.
>> +     */
>> +    old_scsw_ctrl = schib->scsw.ctrl;
>> +
>>       /* Trigger the clear function. */
>>       schib->scsw.ctrl &= ~(SCSW_CTRL_MASK_FCTL |
>> SCSW_CTRL_MASK_ACTL);
>>       schib->scsw.ctrl |= SCSW_FCTL_CLEAR_FUNC | SCSW_ACTL_CLEAR_PEND;
>>   
>> -    return do_subchannel_work(sch);
>> +    ccode = do_subchannel_work(sch);
>> +
>> +    if (ccode != IOINST_CC_EXPECTED) {
>> +        schib->scsw.ctrl = old_scsw_ctrl;
>> +    }
>> +
>> +    return ccode;
>>   }
>>   
>>   IOInstEnding css_do_hsch(SubchDev *sch)
>>   {
>>       SCHIB *schib = &sch->curr_status;
>> +    uint16_t old_scsw_ctrl;
>> +    IOInstEnding ccode;
>>   
>>       if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV |
>> PMCW_FLAGS_MASK_ENA)) {
>>           return IOINST_CC_NOT_OPERATIONAL;
>> @@ -1553,6 +1569,12 @@ IOInstEnding css_do_hsch(SubchDev *sch)
>>           return IOINST_CC_BUSY;
>>       }
>>   
>> +    /*
>> +     * Save the current scsw.ctrl in case HSCH fails and we need
>> +     * to revert the scsw to the status quo ante.
>> +     */
>> +    old_scsw_ctrl = schib->scsw.ctrl;
>> +
>>       /* Trigger the halt function. */
>>       schib->scsw.ctrl |= SCSW_FCTL_HALT_FUNC;
>>       schib->scsw.ctrl &= ~SCSW_FCTL_START_FUNC;
>> @@ -1564,7 +1586,13 @@ IOInstEnding css_do_hsch(SubchDev *sch)
>>       }
>>       schib->scsw.ctrl |= SCSW_ACTL_HALT_PEND;
>>   
>> -    return do_subchannel_work(sch);
>> +    ccode = do_subchannel_work(sch);
>> +
>> +    if (ccode != IOINST_CC_EXPECTED) {
>> +        schib->scsw.ctrl = old_scsw_ctrl;
>> +    }
>> +
>> +    return ccode;
>>   }
>>   
>>   static void css_update_chnmon(SubchDev *sch)
>> @@ -1605,6 +1633,8 @@ static void css_update_chnmon(SubchDev *sch)
>>   IOInstEnding css_do_ssch(SubchDev *sch, ORB *orb)
>>   {
>>       SCHIB *schib = &sch->curr_status;
>> +    uint16_t old_scsw_ctrl, old_scsw_flags;
>> +    IOInstEnding ccode;
>>   
>>       if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV |
>> PMCW_FLAGS_MASK_ENA)) {
>>           return IOINST_CC_NOT_OPERATIONAL;
>> @@ -1626,11 +1656,26 @@ IOInstEnding css_do_ssch(SubchDev *sch, ORB
>> *orb)
>>       }
>>       sch->orb = *orb;
>>       sch->channel_prog = orb->cpa;
>> +
>> +    /*
>> +     * Save the current scsw.ctrl and scsw.flags in case SSCH fails
>> and we need
>> +     * to revert the scsw to the status quo ante.
>> +     */
>> +    old_scsw_ctrl = schib->scsw.ctrl;
>> +    old_scsw_flags = schib->scsw.flags;
>> +
>>       /* Trigger the start function. */
>>       schib->scsw.ctrl |= (SCSW_FCTL_START_FUNC |
>> SCSW_ACTL_START_PEND);
>>       schib->scsw.flags &= ~SCSW_FLAGS_MASK_PNO;
>>   
>> -    return do_subchannel_work(sch);
>> +    ccode = do_subchannel_work(sch);
>> +
>> +    if (ccode != IOINST_CC_EXPECTED) {
>> +        schib->scsw.ctrl = old_scsw_ctrl;
>> +        schib->scsw.flags = old_scsw_flags;
>> +    }
>> +
>> +    return ccode;
>>   }
>>   
>>   static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW
>> *pmcw,

