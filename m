Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EB26A9644
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:30:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3bd-0007BT-SO; Fri, 03 Mar 2023 06:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pY3ba-00077C-Vf; Fri, 03 Mar 2023 06:29:43 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pY3bY-0005FQ-Vx; Fri, 03 Mar 2023 06:29:42 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323BHL3R015553; Fri, 3 Mar 2023 11:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5MJa0x5D+KZsaZ3Wmx67GBx2xJ/ptt8NGl9TxxnPTPY=;
 b=ru+xVZfwf2ptf5tFeO7Gj4wLCoMKQ7c01ATZFjkkcOz4wjkS1oYek/VAuW2mJsqndBq6
 Bbae6NtMOpyJ7XQ24H7eUc656XBu+XVN0zyrmp6BgqC2/cm/JC+rVOeQlA++0Y633F+s
 +wBcCa/TxnQpX7+VRO+O52GCHfjXkjXJoxVy0glHpjvwKH1HLEjKuMUXWpca2OZbTGLL
 kyIzu+3RQ3o2eb4uC24RPvsnH2qZ9Rm/FKZqeBhTNzTSb6EV0bddU0+HzbT6Hr4E5HEs
 s+ZG1+oKPzENlde9UBikvChCRxEyOzIZWc5d7Iuml5zTPayIV/SU1kj9wY0/+FLKSq8x bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p3fvyr7fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 11:29:31 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 323BIfiU020500;
 Fri, 3 Mar 2023 11:29:31 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p3fvyr7es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 11:29:31 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 322KFilY028691;
 Fri, 3 Mar 2023 11:29:29 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3nybab59wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 11:29:29 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 323BTQGI47579402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Mar 2023 11:29:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92BA120040;
 Fri,  3 Mar 2023 11:29:26 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D9F22004B;
 Fri,  3 Mar 2023 11:29:26 +0000 (GMT)
Received: from [9.171.6.198] (unknown [9.171.6.198])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  3 Mar 2023 11:29:26 +0000 (GMT)
Message-ID: <345cee46-ba36-eb0c-a758-c7f50cbace7c@linux.ibm.com>
Date: Fri, 3 Mar 2023 12:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] pnv_phb4_pec: Keep track of instantiated PHBs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, clg@kaod.org, 
 danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
 <20230302163715.129635-2-fbarrat@linux.ibm.com>
 <e6ea9eda-51be-df8e-5711-73b944b52944@linaro.org>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <e6ea9eda-51be-df8e-5711-73b944b52944@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OVCDgHPeZkhOofWN6mMd0hKcvrNq66EU
X-Proofpoint-ORIG-GUID: sw_GihAEPUyp5ygvb50E6gdSn_T7SOzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_01,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=887
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 02/03/2023 23:21, Philippe Mathieu-Daudé wrote:
> Hi Frederic,
> 
> On 2/3/23 17:37, Frederic Barrat wrote:
>> Add an array on the PEC object to keep track of the PHBs which are
>> instantiated. The array can be sparsely populated when using
>> user-created PHBs. It will be useful for the next patch to only export
>> instantiated PHBs in the device tree.
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>   hw/pci-host/pnv_phb4_pec.c     | 12 +++++++-----
>>   hw/ppc/pnv.c                   |  1 +
>>   include/hw/pci-host/pnv_phb4.h |  2 ++
>>   3 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
>> index 43267a428f..97c06bb0a0 100644
>> --- a/hw/pci-host/pnv_phb4_pec.c
>> +++ b/hw/pci-host/pnv_phb4_pec.c
> 
>> +static PnvPHB *pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>> +                                           int stack_no,
>> +                                           Error **errp)
>>   {
>>       PnvPHB *phb = PNV_PHB(qdev_new(TYPE_PNV_PHB));
>>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
>> @@ -128,8 +128,9 @@ static void 
>> pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>>                               &error_fatal);
>>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>> -        return;
>> +        return NULL;
>>       }
>> +    return phb;
>>   }
> 
> 
>> diff --git a/include/hw/pci-host/pnv_phb4.h 
>> b/include/hw/pci-host/pnv_phb4.h
>> index 28d61b96c7..0b72ef1471 100644
>> --- a/include/hw/pci-host/pnv_phb4.h
>> +++ b/include/hw/pci-host/pnv_phb4.h
>> @@ -185,6 +185,8 @@ struct PnvPhb4PecState {
>>       /* PHBs */
>>       uint32_t num_phbs;
>> +#define MAX_PHBS_PER_PEC        3
>> +    PnvPHB *phbs[MAX_PHBS_PER_PEC];
>>       PnvChip *chip;
>>   };
> 
>  From QOM PoV, better would be to 'embed' the PnvPHB structure (not only
> a pointer to it), and initialize the PnvPHB instance calling
> object_initialize_child() instead of qdev_new().

Hi Phil,
Daniel beat me to it, but we used to do precisely that but went the
opposite direction (see 0d512c7120a2), because we can now specify from 
the command line what PHB to implement so we don't want to allocate all 
of them.

   Fred


> 
> See for example the recent conversion of OHCISysBusState in commit
> 01c400ae43 ("hw/display/sm501: Embed OHCI QOM child in chipset").
> 
> Regards,
> 
> Phil.

