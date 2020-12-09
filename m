Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0B42D3E11
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:02:35 +0100 (CET)
Received: from localhost ([::1]:56844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvMo-0004od-If
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kmvFV-0002oG-Ck; Wed, 09 Dec 2020 03:55:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kmvFT-0005h9-GL; Wed, 09 Dec 2020 03:55:01 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B98VmqM169667; Wed, 9 Dec 2020 03:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : references :
 from : subject : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nmogp2sZeQdu1o7RWX6+1CpB5ec5Ym1A/5bbhuhSpiM=;
 b=pyvxT19apg5u6t3D4oWkVvHmQGnUoO25DpJW+wobn4/5LkDqYgJle9dL3FFwsdhX4ItO
 omYUNUqWVRQmYqBrrldnXHZ8eYrc+Vwq4wRb2iPmpNtdIyypujpZeyiiTfoAiC0Eo6V/
 zQinaUqtdQCs+bZcb8Bn1xHp6DapXpt1CRfHUS9UIb7NoYpeIt2Egbtzs+sADspbzll7
 ZgLWTqVNdz7gQgFE/RF2n7y/wBgSZE3aBq/tGpMi7lDpu1CnkxaIaT8JL7Mu1GFwXR8T
 2pcNqgNR+p6HmYhRr8LMVuAEwsXpPWd32untv40NiWEhFAkz8bWM27J/7L6ROvdmsfsU vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ahbdxsav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 03:54:54 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B98WQL0172974;
 Wed, 9 Dec 2020 03:54:53 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ahbdxsa6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 03:54:53 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B98riig030591;
 Wed, 9 Dec 2020 08:54:51 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 35958q1bkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 08:54:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B98smsI65208788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 08:54:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCC78A4054;
 Wed,  9 Dec 2020 08:54:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97615A405B;
 Wed,  9 Dec 2020 08:54:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.43.26])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 08:54:48 +0000 (GMT)
To: David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
References: <20201204083655.27946-1-frankja@linux.ibm.com>
 <1c42abcc-b28e-4b6a-d363-ff6daf7b7883@de.ibm.com>
 <e2f69754-6b31-4854-b52a-e0e1c2676d67@redhat.com>
 <66975842-fcf3-013d-9bba-fed5c2c69a67@de.ibm.com>
 <e22f4e78-c996-ed3d-0680-7c33bd480d83@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH] s390x: pv: Fence additional unavailable SCLP facilities
 for PV guests
Message-ID: <65c709d2-b6a1-d8ee-4bcc-de57d98d2b0b@linux.ibm.com>
Date: Wed, 9 Dec 2020 09:54:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e22f4e78-c996-ed3d-0680-7c33bd480d83@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_07:2020-12-08,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090056
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 5:19 PM, David Hildenbrand wrote:
> On 08.12.20 17:11, Christian Borntraeger wrote:
>>
>>
>> On 08.12.20 15:55, David Hildenbrand wrote:
>>> On 08.12.20 14:29, Christian Borntraeger wrote:
>>>>
>>>>
>>>> On 04.12.20 09:36, Janosch Frank wrote:
>>>>> There's no VSIE support for a protected guest, so let's better not
>>>>> advertise it and its support facilities.
>>>>>
>>>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>>>
>>>> Looks sane. Assuming that all features that depend on SIE are named S390_FEAT_SIE_*
>>>> this should take care of everything. (i compared to gen-facilities.c)
>>>
>>> We could add dependency checks to
>>> target/s390x/cpu_models.c:check_consistency()
>>
>> That could be an additional patch, right?
> 
> Yeah sure.
> 
>>
>>>
>>> What about
>>>
>>> DEF_FEAT(ESOP, "esop", SCLP_CONF_CHAR, 46,
>>> "Enhanced-suppression-on-protection facility")
>>
>> ESOP does make sense independent from SIE see chapter 3-15 in the POP
>> in "Suppression on Protection"
>>
> 
> Rings a bell :)
> 
>>
>>> DEF_FEAT(HPMA2, "hpma2", SCLP_CONF_CHAR, 90, "Host page management
>>> assist 2 Facility")
>>
>> Right. We should also fence of hpma2.
> 
> I was also wondering about CMM, but as the guest senses it by executing
> the instruction, protected guests will never see it I assume.
> 

Yep, it's a operation exception.

