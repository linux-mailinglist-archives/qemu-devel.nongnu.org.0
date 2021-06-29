Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8DB3B6EC3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 09:31:37 +0200 (CEST)
Received: from localhost ([::1]:40870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly8DY-0000o5-1v
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 03:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ly8C2-00005k-PM
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:30:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ly8Bx-00010D-Qs
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:30:02 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15T757be182278; Tue, 29 Jun 2021 03:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BybtnMgiiACuL2ZPf43jbmPV3+dJlpvKEjvKSN+lomU=;
 b=ozkgHZjch0Rx9D/CdQfQs2d3pzV7BbdUNGl1G3XRiB6ByrYjhf0SMmGl6WNOlazqFDLn
 qRR9hhSERgWuEob97M4m6eZclkD4tGao+Z2NF48zU/b1MjpAc55497Udhk5YKUX+rvZ7
 VfIyNYKrKD6Dam9gcUFyKTiw3O0cVc02iNSJ6HysgQ7a/2yr+5U8V58hm19p40l2VnMn
 iPCB17M62CVBvVRHzBu35cslqK2n20APJQ8pIO/dcCh9ysy7eHalu4osN/fYHadHLDbS
 SPxRPpFtPGMIGE0Pi+wAubnBIVSRvxgqzqwSyOXCqbyxzxReCTJK1T0sUEK0YUmV9kHP 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fxq08u8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 03:29:54 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15T75qYW186932;
 Tue, 29 Jun 2021 03:29:53 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fxq08u83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 03:29:53 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15T7SvuI030145;
 Tue, 29 Jun 2021 07:29:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 39duv8h4nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 07:29:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15T7TlEs25428372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 07:29:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63EA5A406A;
 Tue, 29 Jun 2021 07:29:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EE51A4060;
 Tue, 29 Jun 2021 07:29:41 +0000 (GMT)
Received: from [9.160.49.135] (unknown [9.160.49.135])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Jun 2021 07:29:39 +0000 (GMT)
Subject: Re: [PATCH] hw/i386/pc: Document pc_system_ovmf_table_find
From: Dov Murik <dovmurik@linux.ibm.com>
To: Tom Lendacky <thomas.lendacky@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210622124419.3008278-1-dovmurik@linux.ibm.com>
 <838caecc-6d4a-6257-147e-fbef4148f679@redhat.com>
 <d5fbda1c-69dc-35b6-388e-443a697c2fdf@linux.ibm.com>
 <f6eb39fe-50bd-5fae-99a3-11abd2141fea@amd.com>
 <fd154b04-847a-efbd-7ae6-abc54630ac8f@linux.ibm.com>
Message-ID: <3f573ada-9244-9df0-c342-23dab3ba9396@linux.ibm.com>
Date: Tue, 29 Jun 2021 10:29:32 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fd154b04-847a-efbd-7ae6-abc54630ac8f@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pMiDqAm63LqEx3VYGabvtzXZPWybW4ek
X-Proofpoint-GUID: Bn63HW-NNMLgq36Fo31ZGC3WtMBKZaBe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_02:2021-06-25,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290050
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 29/06/2021 8:56, Dov Murik wrote:
> 
> 
> On 29/06/2021 1:03, Tom Lendacky wrote:
>> On 6/22/21 7:58 AM, Dov Murik wrote:
>>> +cc: Tom Lendacky
>>>
>>> On 22/06/2021 15:47, Philippe Mathieu-Daudé wrote:
>>>> On 6/22/21 2:44 PM, Dov Murik wrote:
>>>>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>>> ---
>>>>>  hw/i386/pc_sysfw.c | 14 ++++++++++++++
>>>>>  1 file changed, 14 insertions(+)
>>>>>
>>>>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
>>>>> index 6ce37a2b05..e8d20cb83f 100644
>>>>> --- a/hw/i386/pc_sysfw.c
>>>>> +++ b/hw/i386/pc_sysfw.c
>>>>> @@ -176,6 +176,20 @@ static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>>>>>      ovmf_table += tot_len;
>>>>>  }
>>>>>  
>>>>> +/**
>>>>> + * pc_system_ovmf_table_find - Find the data associated with an entry in OVMF's
>>>>> + * reset vector GUIDed table.
>>>>> + *
>>>>> + * @entry: GUID string of the entry to lookup
>>>>> + * @data: Filled with a pointer to the entry's value (if not NULL)
>>>>> + * @data_len: Filled with the length of the entry's value (if not NULL). Pass
>>>>> + *            NULL here if the length of data is known.
>>>>> + *
>>>>> + * Note that this function must be called after the OVMF table was found and
>>>>> + * copied by pc_system_parse_ovmf_flash().
>>>>
>>>> What about replacing this comment by:
>>>>
>>>>   assert(ovmf_table && ovmf_table_len);
>>>>
>>>
>>> I think this will break things: in target/i386/sev.c we have SEV-ES code
>>> that calls pc_system_ovmf_table_find() and can deal with the case when
>>> there's no OVMF table.  An assert will break it.
>>
>> Right, what would be best is to differentiate between an OVMF table that
>> isn't present in the flash vs the fact that pc_system_parse_ovmf_flash()
>> wasn't called, asserting only on the latter.
>>
> 
> [+cc James who wrote this code]
> 
> 
> Thanks Tom; I agree.  To achieve that, we need one of these:
> 
> (a) add a 'static bool ovmf_table_parsed' which will be set to true at
> the beginning of pc_system_parse_ovmf_flash(). Then, at the beginning of
> pc_system_ovmf_table_find add: assert(ovmf_table_parsed).
> 
> (b) (ab)use our existing ovmf_table_len static variable: initialize it
> to -1 (meaning that we haven't parsed the OVMF flash yet). When looking
> for the table set it to 0 (meaning that OVMF table doesn't exist or is
> invalid). When a proper table is found and copied to ovmf_table, then
> set it to the real length (>= 0).

typo: That should be    (> 0).


> At the beginning of
> pc_system_ovmf_table_find add: assert(ovmf_table_len != -1). (this -1
> can be #define OVMF_FLASH_NOT_PARSED -1).
> 
> 
> Phil, Tom, James: which do you prefer? other options? Rust enum? ;-)
> 
> 
> Thanks,
> Dov
> 
> 
>> Thanks,
>> Tom
>>
>>>
>>>
>>>> Otherwise,
>>>>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>
>>>
>>> Thanks!
>>>
>>> -Dov
>>>
>>>
>>>
>>>> Thanks!
>>>>
>>>>> + *
>>>>> + * Return: true if the entry was found in the OVMF table; false otherwise.
>>>>> + */
>>>>>  bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
>>>>>                                 int *data_len)
>>>>>  {
>>>>>
>>>>

