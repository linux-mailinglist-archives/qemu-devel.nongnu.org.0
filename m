Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7C13665BB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 08:55:55 +0200 (CEST)
Received: from localhost ([::1]:41090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ6mB-0003dT-1m
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 02:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ravi.bangoria@linux.ibm.com>)
 id 1lZ6l4-00030W-T3; Wed, 21 Apr 2021 02:54:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ravi.bangoria@linux.ibm.com>)
 id 1lZ6l2-0008Ui-Fh; Wed, 21 Apr 2021 02:54:46 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13L6acPh018083; Wed, 21 Apr 2021 02:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jPylZZzcYV3O3slKhNhjGFoG0/EfwXlBaWC2MONi4tc=;
 b=sOdQ9dUg4qeXxTwo60sVtms6z5CcqQya45jE2Cuq2cbFBqc6XMgCAQpLkzMwg36QWbT/
 834mMrpvkDJ/T6F8VbkbU/snxJAQOQthqJHYO7gnzFfhy4EUS/q3FQ/4apZm1E3lNhrG
 vzQOgEHtfvkmb6rXkX5MO8warQReO1PkWTk6ltJmQudBHorCQOZ4gycdN6d3m8SXAyuv
 V6paT1LgQFL+qMKUlwUV6kMPQ0kUITxu2PYkFjjANFrERQHlyAiIb8r988/qpIdflVW7
 HaLbUIIV0Vvn/tP9pK+Q7OLn9njiY1U9n+nnUS6Wg/lgBYDQ8DUVwEaGCzURCVUUmgx5 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382dqtt39p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 02:54:36 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13L6abGm018036;
 Wed, 21 Apr 2021 02:54:35 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382dqtt38x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 02:54:35 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13L6qO1s009144;
 Wed, 21 Apr 2021 06:54:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37yqa8j3uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 06:54:33 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13L6sVNh29229420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 06:54:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E04F8AE056;
 Wed, 21 Apr 2021 06:54:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67474AE045;
 Wed, 21 Apr 2021 06:54:24 +0000 (GMT)
Received: from [9.199.37.21] (unknown [9.199.37.21])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Apr 2021 06:54:24 +0000 (GMT)
Subject: Re: [PATCH v5 3/3] ppc: Enable 2nd DAWR support on p10
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20210412114433.129702-1-ravi.bangoria@linux.ibm.com>
 <20210412114433.129702-4-ravi.bangoria@linux.ibm.com>
 <YH0M1YdINJqbdqP+@yekko.fritz.box>
 <ca21d852-4b54-01d3-baab-cc8d0d50e505@linux.ibm.com>
 <8020c404-d8ce-2758-d936-fc5e851017f0@kaod.org>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <0b6e1a4a-eed2-1a45-50bf-2ccab398f4ed@linux.ibm.com>
Date: Wed, 21 Apr 2021 12:24:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8020c404-d8ce-2758-d936-fc5e851017f0@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wdDXaTnWxRZCapqwjUXhUX_crLz-eOD0
X-Proofpoint-ORIG-GUID: chE6iXV9GKD1G0QC8ulg7QNHGaXx3w84
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-21_02:2021-04-20,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104210052
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=ravi.bangoria@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 kvm@vger.kernel.org, mst@redhat.com, mpe@ellerman.id.au, cohuck@redhat.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 pbonzini@redhat.com, paulus@samba.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cedric,

On 4/21/21 12:01 PM, Cédric Le Goater wrote:
> On 4/21/21 8:20 AM, Ravi Bangoria wrote:
>> Hi David,
>>
>> On 4/19/21 10:23 AM, David Gibson wrote:
>>> On Mon, Apr 12, 2021 at 05:14:33PM +0530, Ravi Bangoria wrote:
>>>> As per the PAPR, bit 0 of byte 64 in pa-features property indicates
>>>> availability of 2nd DAWR registers. i.e. If this bit is set, 2nd
>>>> DAWR is present, otherwise not. Use KVM_CAP_PPC_DAWR1 capability to
>>>> find whether kvm supports 2nd DAWR or not. If it's supported, allow
>>>> user to set the pa-feature bit in guest DT using cap-dawr1 machine
>>>> capability. Though, watchpoint on powerpc TCG guest is not supported
>>>> and thus 2nd DAWR is not enabled for TCG mode.
>>>>
>>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>>> Reviewed-by: Greg Kurz <groug@kaod.org>
>>>
>>> So, I'm actually not sure if using an spapr capability is what we want
>>> to do here.  The problem is that presumably the idea is to at some
>>> point make the DAWR1 capability default to on (on POWER10, at least).
>>> But at that point you'll no longer to be able to start TCG guests
>>> without explicitly disabling it.  That's technically correct, since we
>>> don't implement DAWR1 in TCG, but then we also don't implement DAWR0
>>> and we let that slide... which I think is probably going to cause less
>>> irritation on balance.
>>
>> Ok. Probably something like this is what you want?
>>
>> Power10 behavior:
>>    - KVM does not support DAWR1: Boot the guest without DAWR1
>>      support (No warnings). Error out only if user tries with
>>      cap-dawr1=on.
>>    - KVM supports DAWR1: Boot the guest with DAWR1 support, unless
>>      user specifies cap-dawr1=off.
>>    - TCG guest: Ignore cap-dawr1 i.e. boot as if there is only
>>      DAWR0 (Should be fixed in future while adding PowerPC watch-
>>      point support in TCG mode)
>>
>> Power10 predecessor behavior:
>>    - KVM guest: Boot the guest without DAWR1 support. Error out
>>      if user tries with cap-dawr1=on.
>>    - TCG guest: Ignore cap-dawr1 i.e. boot as if there is only
>>      DAWR0 (Should be fixed in future while adding PowerPC watch-
>>      point support in TCG mode)
>>
>>> I'm wondering if we're actually just better off setting the pa feature
>>> just based on the guest CPU model.  TCG will be broken if you try to
>>> use it, but then, it already is.  AFAIK there's no inherent reason we
>>> couldn't implement DAWR support in TCG, it's just never been worth the
>>> trouble.
>>
>> Correct. Probably there is no practical usecase for DAWR in TCG mode.
> 
> What's the expected behavior ? Is it to generate a DSI if we have a DAWR
> match ?

Yes. DSI is the main thing. But many auxiliary stuff, off the top of my
head:
  - DAR needs to be set. Now, DAR value is set differently on p8 vs p10
    (not sure about p9 because there was hw bug and thus we needed to
    fully disable DAWR on p9).
  - DAWR matching criteria for quadword instruction are different for
    p8/p9 vs p10.
  - P10 supports 512 byte unaligned watchpoints but p8/p9 does not.

Kernel is aware of these differences and thus handles these scenarios,
sometimes as special case. i.e. Qemu will need to mimic the exact hw
behavior for the specific revision of processor.

Thanks,
Ravi

