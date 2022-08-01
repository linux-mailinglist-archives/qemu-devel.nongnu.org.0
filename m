Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6895586CD5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:29:13 +0200 (CEST)
Received: from localhost ([::1]:60256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWPw-0004IW-P0
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oIWMM-0007ff-1v; Mon, 01 Aug 2022 10:25:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oIWMJ-0003hq-O8; Mon, 01 Aug 2022 10:25:29 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271DWf3a028931;
 Mon, 1 Aug 2022 14:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : to : cc : references : from : subject : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EOpdTdJoX8WUj1Zj+sv2Oot0KZ6dyBCYvYWvS85+fFg=;
 b=qZAJG1tN2h4Z9/C5gUqJFK+LtBFeh/uUv8yMshrGwp7ay/v7KcoNZotHVLV6cAHpDgLW
 YC4ccEaPPtL8kjk+DftPqeVS9wkGcGdPZvVPhdQkvQgjKp5nmxPifkflQYx9BJ7OXHKh
 VS46mUjHRyV7zlhOvCyZ2cpUHoJTrQByiioo8oANELYK001AmTqqEvdTL3m0UPnCndRZ
 gw7DrqhWiKehhjIDKC8OpWTQzdaaD7i8aDm5aj/TVwfkdy6lCChWfRMy7EuaWOWDECzs
 rHO09+VDP3P/Cv3H0c/7dLtzn09XJqHyK+5lloseZPGEVXdhlN0idw6hKxZeD0hu8C8S jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hpb612cgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 14:25:25 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 271DGvLd018286;
 Mon, 1 Aug 2022 14:25:25 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hpb612cfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 14:25:25 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 271EMVu9025908;
 Mon, 1 Aug 2022 14:25:23 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3hmuwhrvvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 14:25:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 271EPKNO30408988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Aug 2022 14:25:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C2984204D;
 Mon,  1 Aug 2022 14:25:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B60042049;
 Mon,  1 Aug 2022 14:25:19 +0000 (GMT)
Received: from [9.145.41.76] (unknown [9.145.41.76])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  1 Aug 2022 14:25:19 +0000 (GMT)
Message-ID: <add8c171-10e3-46f6-be8c-3c89c5a27845@linux.ibm.com>
Date: Mon, 1 Aug 2022 16:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-12-frankja@linux.ibm.com>
 <971a659e-97cb-ec53-ea7c-cb4b3e022f76@linux.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v4 11/17] dump/dump: Add section string table support
In-Reply-To: <971a659e-97cb-ec53-ea7c-cb4b3e022f76@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 06hEfrOhTjc3LARMJ470w_q2yvm3XCVG
X-Proofpoint-GUID: _9nm0eiB1NMLDkmpaZu7_XYC9_JxsvPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_07,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010070
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/22 21:35, Janis Schoetterl-Glausch wrote:
> On 7/26/22 11:22, Janosch Frank wrote:
>> As sections don't have a type like the notes do we need another way to
> 
> Having a string table seems like a good idea to me, as we don't know
> the requirements any architecture might have, but sections do have sh_type.
> Could we use one of those, e.g. one of the processor specific ones?

I'd like to avoid defining more constants in elf.h if at all possible.

> Is
> 	SHT_PROGBITS
>      		The section holds information defined by the program,
> 		whose format and meaning are determined solely by the program.
> appropriate for us? It seems to me that our program is the guest and
> it doesn't determine the meta information on how to decrypt the dump.

SHT_PROGBITS is being set in the last patch (PV dump) for our arch 
headers. The architecture writes the full shdr into the header buffer 
and can set any type.

> 
>> determine their contents. The string table allows us to assign each
>> section an identification string which architectures can then use to
>> tag their sections with.
>>
>> There will be no string table if the architecture doesn't add custom
>> sections which are introduced in a following patch.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
[...]
>> +    /*
>> +     * String table needs to be last section since strings are added
>> +     * via arch_sections_write_hdr().
>> +     */
>> +    write_elf_section_hdr_string(s, buff_hdr);
>> +    if (dump_is_64bit(s)) {
>> +        hdr64->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
>> +    } else {
>> +        hdr32->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
>>       }
> 
> Might want to assert e_shstrndx < SHN_LORESERVE (0xff00) or handle that case correctly.

Right, more things to worry about

> 
>>   }
>>   
>> @@ -401,11 +453,18 @@ static void write_elf_sections(DumpState *s, Error **errp)
>>   {
>>       int ret;
>>   
>> -    /* Write section zero */
>> +    /* Write section zero and arch sections */
> 
> Since that doesn't concern the string section it seems wrong to change this in this patch.

I'm currently doing another round of cleanups anyway :)


