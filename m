Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8986138BD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 15:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opVSn-000747-JV; Mon, 31 Oct 2022 10:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1opVSh-0006ym-D4; Mon, 31 Oct 2022 10:08:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1opVSf-0006Ad-2Q; Mon, 31 Oct 2022 10:08:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29VDBjCu016291;
 Mon, 31 Oct 2022 14:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Z7X3CjvupESMLsJ7bhdRsaIkF/tD+gZCn/+FpGq8msM=;
 b=Twjx5qnAMe3U5nTIt1JxZl0XLWrX7GneLsOdaz/rwsAiJPpLs8c0JdDq5O7FdN2nI2Mk
 S5rJx1dG2ilUvTCsX2fqm5wCq5vCzIMFoSy1j7lsUH5lcWMKyF9X/c3ZBmt6KbliLzKb
 2h42YPoHmQhcS0PvMnUixry4pgp4aYt/ySZlpLR61/YPdm4HwTHpFXPPQlobytjaqtfm
 njaSudiRTjao32meQYc4wHvo6kEuwOHd+HsX8/LnFQtEfpW15nX3U1SVQptdDWmocuoS
 AE5IcbAyBbLIrNJjJg/UtXwqPmUEvO3hyGp+vXmGYKzeAc8at6KQRxoGTbJ6NF9JxLNC Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjf1a9t2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 14:08:13 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29VDdb3m013481;
 Mon, 31 Oct 2022 14:08:13 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjf1a9t1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 14:08:13 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29VE6Bih023271;
 Mon, 31 Oct 2022 14:08:12 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3kgut9dw62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 14:08:12 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29VE8FQT65864010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Oct 2022 14:08:15 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DDA55805A;
 Mon, 31 Oct 2022 14:08:11 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DA8F5804E;
 Mon, 31 Oct 2022 14:08:10 +0000 (GMT)
Received: from [9.160.115.44] (unknown [9.160.115.44])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 31 Oct 2022 14:08:10 +0000 (GMT)
Message-ID: <15c04229-0bd3-bfcc-41e8-67c23ce83140@linux.ibm.com>
Date: Mon, 31 Oct 2022 10:08:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] s390x/css: revert SCSW ctrl/flag bits on error
Content-Language: en-US
To: Eric Farman <farman@linux.ibm.com>, Peter Jin <pjin@linux.ibm.com>,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 thuth@redhat.com
Cc: peter@peterjin.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20221027212341.2904795-1-pjin@linux.ibm.com>
 <3a265985495a653b0cb5b4a1cf2cfad29f734dc0.camel@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <3a265985495a653b0cb5b4a1cf2cfad29f734dc0.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AJ6u-abC4z81Z3hjDD3Bv06_0T2Lwu3z
X-Proofpoint-GUID: xiBPi0zWH1H-CzeSl-UbKjGJmfa9cSdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_16,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310088
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 4:22 PM, Eric Farman wrote:
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
> 
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
> 
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

+1 to this re-write

> 
>>
>> Signed-off-by: Peter Jin <pjin@linux.ibm.com>
> 
> We've talked previously about clearing this within the
> do_subchannel_work_passthrough routine in order to keep the _virtual
> paths untouched, but this seems like a reasonable approach to me.
> 
> The commit message is probably fine either way, but as far as the code
> goes:
> 
> Reviewed-by: Eric Farman <farman@linux.ibm.com>

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

Thanks Peter!

> 
>> ---
>>  hw/s390x/css.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++-
>> --
>>  1 file changed, 48 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
>> index 7d9523f811..95d1b3a3ce 100644
>> --- a/hw/s390x/css.c
>> +++ b/hw/s390x/css.c
>> @@ -1522,21 +1522,37 @@ IOInstEnding css_do_xsch(SubchDev *sch)
>>  IOInstEnding css_do_csch(SubchDev *sch)
>>  {
>>      SCHIB *schib = &sch->curr_status;
>> +    uint16_t old_scsw_ctrl;
>> +    IOInstEnding ccode;
>>  
>>      if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV |
>> PMCW_FLAGS_MASK_ENA)) {
>>          return IOINST_CC_NOT_OPERATIONAL;
>>      }
>>  
>> +    /*
>> +     * Save the current scsw.ctrl in case CSCH fails and we need
>> +     * to revert the scsw to the status quo ante.
>> +     */
>> +    old_scsw_ctrl = schib->scsw.ctrl;
>> +
>>      /* Trigger the clear function. */
>>      schib->scsw.ctrl &= ~(SCSW_CTRL_MASK_FCTL |
>> SCSW_CTRL_MASK_ACTL);
>>      schib->scsw.ctrl |= SCSW_FCTL_CLEAR_FUNC | SCSW_ACTL_CLEAR_PEND;
>>  
>> -    return do_subchannel_work(sch);
>> +    ccode = do_subchannel_work(sch);
>> +
>> +    if (ccode != IOINST_CC_EXPECTED) {
>> +        schib->scsw.ctrl = old_scsw_ctrl;
>> +    }
>> +
>> +    return ccode;
>>  }
>>  
>>  IOInstEnding css_do_hsch(SubchDev *sch)
>>  {
>>      SCHIB *schib = &sch->curr_status;
>> +    uint16_t old_scsw_ctrl;
>> +    IOInstEnding ccode;
>>  
>>      if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV |
>> PMCW_FLAGS_MASK_ENA)) {
>>          return IOINST_CC_NOT_OPERATIONAL;
>> @@ -1553,6 +1569,12 @@ IOInstEnding css_do_hsch(SubchDev *sch)
>>          return IOINST_CC_BUSY;
>>      }
>>  
>> +    /*
>> +     * Save the current scsw.ctrl in case HSCH fails and we need
>> +     * to revert the scsw to the status quo ante.
>> +     */
>> +    old_scsw_ctrl = schib->scsw.ctrl;
>> +
>>      /* Trigger the halt function. */
>>      schib->scsw.ctrl |= SCSW_FCTL_HALT_FUNC;
>>      schib->scsw.ctrl &= ~SCSW_FCTL_START_FUNC;
>> @@ -1564,7 +1586,13 @@ IOInstEnding css_do_hsch(SubchDev *sch)
>>      }
>>      schib->scsw.ctrl |= SCSW_ACTL_HALT_PEND;
>>  
>> -    return do_subchannel_work(sch);
>> +    ccode = do_subchannel_work(sch);
>> +
>> +    if (ccode != IOINST_CC_EXPECTED) {
>> +        schib->scsw.ctrl = old_scsw_ctrl;
>> +    }
>> +
>> +    return ccode;
>>  }
>>  
>>  static void css_update_chnmon(SubchDev *sch)
>> @@ -1605,6 +1633,8 @@ static void css_update_chnmon(SubchDev *sch)
>>  IOInstEnding css_do_ssch(SubchDev *sch, ORB *orb)
>>  {
>>      SCHIB *schib = &sch->curr_status;
>> +    uint16_t old_scsw_ctrl, old_scsw_flags;
>> +    IOInstEnding ccode;
>>  
>>      if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV |
>> PMCW_FLAGS_MASK_ENA)) {
>>          return IOINST_CC_NOT_OPERATIONAL;
>> @@ -1626,11 +1656,26 @@ IOInstEnding css_do_ssch(SubchDev *sch, ORB
>> *orb)
>>      }
>>      sch->orb = *orb;
>>      sch->channel_prog = orb->cpa;
>> +
>> +    /*
>> +     * Save the current scsw.ctrl and scsw.flags in case SSCH fails
>> and we need
>> +     * to revert the scsw to the status quo ante.
>> +     */
>> +    old_scsw_ctrl = schib->scsw.ctrl;
>> +    old_scsw_flags = schib->scsw.flags;
>> +
>>      /* Trigger the start function. */
>>      schib->scsw.ctrl |= (SCSW_FCTL_START_FUNC |
>> SCSW_ACTL_START_PEND);
>>      schib->scsw.flags &= ~SCSW_FLAGS_MASK_PNO;
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
>>  }
>>  
>>  static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW
>> *pmcw,
> 


