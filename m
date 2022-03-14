Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F894D7FA6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:17:27 +0100 (CET)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThlW-0006kk-NN
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:17:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nThji-0005pP-Kc; Mon, 14 Mar 2022 06:15:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nThjg-0006tR-HC; Mon, 14 Mar 2022 06:15:34 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22E9E98x010120; 
 Mon, 14 Mar 2022 10:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lWX56iuEJ7qJ/bc7N9fOAsTkKNCZ7zlEjzKu1IRxZlI=;
 b=JpmAv2rf69d1cqWBopDbQ15ub9t7620Utcd0/BI/DuvbwiKUQpgAA8ZHZiO4jBOb1ua2
 chMimBcr45x/ZGLa+9mW+eooIXpOui8Abdw5a0zT8TCicyxJjdKjzUd+fca4Qv+WsRsP
 3JYYF7HdPYkKHsJRiooH6QVAL550fDEa+cRoMcE4pTbuDGtznk7cAVHi23WKBZJt/WdL
 MWwUrDMYdAcRrX6l/BNAh9zUWLJ641ZkUI2e/+jflDXBFqaoKDeWjX7YD1dh2Fueym42
 TRSkZ/yB+ZBYExLMSkQ/KvhbRhudCUMFzmKokOROJ/XflwmF1XGWCEexUIIGgvrrLRh2 Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3es501f3wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 10:15:27 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EA0HVL037334;
 Mon, 14 Mar 2022 10:15:26 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3es501f3w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 10:15:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EA78UI018851;
 Mon, 14 Mar 2022 10:15:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3erk58uun6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 10:15:24 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22EA3wEu41550138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 10:03:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1096BA40A6;
 Mon, 14 Mar 2022 10:15:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D6ABA4065;
 Mon, 14 Mar 2022 10:15:20 +0000 (GMT)
Received: from [9.145.181.26] (unknown [9.145.181.26])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 10:15:20 +0000 (GMT)
Message-ID: <e2e540e6-471b-2304-30cf-17227cf11307@linux.ibm.com>
Date: Mon, 14 Mar 2022 11:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] s390x: pv: Add dump support
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220310112547.3823-1-frankja@linux.ibm.com>
 <20220310112547.3823-6-frankja@linux.ibm.com>
 <0beae502-07b2-481a-3437-bbecc8a99a58@linaro.org>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <0beae502-07b2-481a-3437-bbecc8a99a58@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aHEw7U6NpeBAwDYwoxpGxwT4EQviyOhS
X-Proofpoint-ORIG-GUID: Z2Xilpc0vcsvtr_BfEqr5-Airfaf57zs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_04,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140065
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, borntraeger@linux.ibm.com, cohuck@redhat.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, mhartmay@linux.ibm.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/22 15:52, Richard Henderson wrote:
> On 3/10/22 03:25, Janosch Frank wrote:
>> Sometimes dumping a guest from the outside is the only way to get the
>> data that is needed. This can be the case if a dumping mechanism like
>> KDUMP hasn't been configured or data needs to be fetched at a specific
>> point. Dumping a protected guest from the outside without help from
>> fw/hw doesn't yield sufficient data to be useful. Hence we now
>> introduce PV dump support.
>>
>> The PV dump support works by integrating the firmware into the dump
>> process. New Ultravisor calls are used to initiate the dump process,
>> dump cpu data, dump memory state and lastly complete the dump process.
>> The UV calls are exposed by KVM via the new KVM_PV_DUMP command and
>> its subcommands. The guest's data is fully encrypted and can only be
>> decrypted by the entity that owns the customer communication key for
>> the dumped guest. Also dumping needs to be allowed via a flag in the
>> SE header.
>>
>> On the QEMU side of things we store the PV dump data in the newly
>> introduced architecture ELF sections (storage state and completion
>> data) and the cpu notes (for cpu dump data).
>>
>> Users can use a tool to convert the encrypted QEMU dump to an
>> unencrypted one.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>    dump/dump.c              |  27 -----
>>    include/elf.h            |   1 +
>>    include/sysemu/dump.h    |  27 +++++
>>    target/s390x/arch_dump.c | 247 ++++++++++++++++++++++++++++++++++-----
>>    4 files changed, 244 insertions(+), 58 deletions(-)
>>
>> diff --git a/dump/dump.c b/dump/dump.c
>> index a9d9ea514d..4b7d333866 100644
>> --- a/dump/dump.c
>> +++ b/dump/dump.c
>> @@ -708,33 +708,6 @@ static void dump_begin(DumpState *s, Error **errp)
>>        write_elf_notes(s, errp);
>>    }
>>    
>> -static int get_next_block(DumpState *s, GuestPhysBlock *block)
>> -{
>> -    while (1) {
>> -        block = QTAILQ_NEXT(block, next);
>> -        if (!block) {
>> -            /* no more block */
>> -            return 1;
>> -        }
>> -
>> -        s->start = 0;
>> -        s->next_block = block;
>> -        if (s->has_filter) {
>> -            if (block->target_start >= s->begin + s->length ||
>> -                block->target_end <= s->begin) {
>> -                /* This block is out of the range */
>> -                continue;
>> -            }
>> -
>> -            if (s->begin > block->target_start) {
>> -                s->start = s->begin - block->target_start;
>> -            }
>> -        }
>> -
>> -        return 0;
>> -    }
>> -}
> 
> No reason to make this inline, surely.  Just export it.
> Anyway, this should be it's own patch.

Yeah, will do.

> 
>> @@ -76,9 +77,12 @@ typedef struct noteStruct {
>>            uint64_t todcmp;
>>            uint32_t todpreg;
>>            uint64_t ctrs[16];
>> +        uint8_t dynamic;  /* Real size comes from PV info interface */
> 
> This needs a better comment.  Possibly
> 
>       uint8_t dynamic[1];  /* Would be a flexible array member, if that was legal inside a
> union. Real size comes from PV info interface. */
> 
> Alternately, rewrite everything to work with
> 
> typedef struct noteStruct {
>       Elf64_Nhdr hdr;
>       char name[8];
>       uint8_t contents[];
> } QEMU_PACKED Note;
> 
> which is a better description of what's going on in this file anyway.

I'll have a look at that

> 
> r~
> 


