Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DAA517114
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 15:59:07 +0200 (CEST)
Received: from localhost ([::1]:47570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlWZu-0000fS-Fw
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 09:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1nlWBu-0005Ss-8V; Mon, 02 May 2022 09:34:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7648
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1nlWBs-0001za-59; Mon, 02 May 2022 09:34:18 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 242D0MoL024327;
 Mon, 2 May 2022 13:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YZkxJ/xRG9pEI28ysV+G0YoUyiqe7g9rSovPBnAud90=;
 b=jFg/JsGQ39J5Uw8Pz5uLD4Aakl5gxi5jXtCO3yAMN13VRzcERrBZOL72doP4Sd/LjF3H
 FCXlYP8bNZRni07wk7Ny2lscpg5lBEfzpj0tAWDqtfgw3yqXgwwp2RXi88kfDOggEOXB
 nBzLTGoL/AYVWWDAvKyI0JF9Q5yyTx1sfwPiWkXIv9bPEgDedkbIhRabOXS1wCXO9KCa
 sLiPcIG2yZ1+JbvKmfHB8ollFuBz7WyuzfmeopDroFMnrCr5EFdTwfJzYRIrURJR5cVg
 jXzrWHLSMyMlNcsr07qkaOqAFOCiy8wjqs09zEEJwW2vhY8TU82IlAPxvUttW5T3zRlB Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ftft8gry7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 13:34:14 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 242D0M4a024343;
 Mon, 2 May 2022 13:34:13 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ftft8grxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 13:34:13 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 242DSD92011720;
 Mon, 2 May 2022 13:34:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3frvcj2rxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 13:34:11 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 242DY8Va23593364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 May 2022 13:34:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CB4311C04C;
 Mon,  2 May 2022 13:34:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E5CB11C050;
 Mon,  2 May 2022 13:34:08 +0000 (GMT)
Received: from [9.171.86.251] (unknown [9.171.86.251])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  2 May 2022 13:34:08 +0000 (GMT)
Message-ID: <a4d2d9bc-b5e5-b766-2d4a-c5222ea6109b@linux.ibm.com>
Date: Mon, 2 May 2022 15:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] target/s390x: Check storage keys in the TPROT
 instruction
Content-Language: en-US
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20220502082559.76167-1-thuth@redhat.com>
 <df57eafc-9bbf-b121-8f73-68d473c22262@linux.ibm.com>
In-Reply-To: <df57eafc-9bbf-b121-8f73-68d473c22262@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T0nOGSg_vUmqCHsrSytrfNIAI41uzKja
X-Proofpoint-ORIG-GUID: UY2PBRkiSdXHwUJX60k5Eg-heDp43-KQ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_04,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205020106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 02 May 2022 09:52:36 -0400
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
Cc: qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/22 12:17, Janis Schoetterl-Glausch wrote:
> On 5/2/22 10:25, Thomas Huth wrote:
>> TPROT allows to specify an access key that should be used for checking
>> with the storage key of the destination page, to see whether an access
>> is allowed or not. Honor this storage key checking now in the emulated
>> TPROT instruction, too.
>>
>> Since we need the absolute address of the page (for getting the storage
>> key), we are now also calling mmu_translate() directly instead of
>> going via s390_cpu_virt_mem_check_write/read() - since we're only
>> interested in one page, and since mmu_translate() does not try to inject
>> excetions directly (it reports them via the return code instead), this
>> is likely the better function to use in TPROT anyway.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  This fixes the new TPROT-related storage key checks in this new
>>  kvm-unit-tests patch:
>>  https://lore.kernel.org/kvm/20220425161731.1575742-1-scgl@linux.ibm.com/
> 
> Thanks for having a go at this.
> The key checking logic looks good to me; the expressions get a bit unwieldy,
> but that is a style thing.
> However, I'm wondering whether it would be better to mirror what the kernel
> is doing and address the
> 
>      * TODO: key-controlled protection. Only CPU accesses make use of the
>      *       PSW key. CSS accesses are different - we have to pass in the key.
> 
> in mmu_handle_skey, then tprot emulation would just relay the result of trying
> the translation with store or fetch, passing in the key.
>>
>>  target/s390x/cpu.h            |  1 +
>>  target/s390x/tcg/mem_helper.c | 61 ++++++++++++++++++++++++++++-------
>>  2 files changed, 50 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 7d6d01325b..348950239f 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -328,6 +328,7 @@ extern const VMStateDescription vmstate_s390_cpu;
>>  /* Control register 0 bits */
>>  #define CR0_LOWPROT             0x0000000010000000ULL
>>  #define CR0_SECONDARY           0x0000000004000000ULL
>> +#define CR0_STOR_PROT_OVERRIDE  0x0000000001000000ULL
>>  #define CR0_EDAT                0x0000000000800000ULL
>>  #define CR0_AFP                 0x0000000000040000ULL
>>  #define CR0_VECTOR              0x0000000000020000ULL
>> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
>> index fc52aa128b..1e0309bbe8 100644
>> --- a/target/s390x/tcg/mem_helper.c
>> +++ b/target/s390x/tcg/mem_helper.c
>> @@ -2141,43 +2141,80 @@ uint32_t HELPER(testblock)(CPUS390XState *env, uint64_t real_addr)
>>      return 0;
>>  }
>>  
> 
> [...]
> 
>> +
>>  uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
>>  {
>>      S390CPU *cpu = env_archcpu(env);
>> -    CPUState *cs = env_cpu(env);
>> +    const int tp_acc = (a2 & SK_ACC_MASK) >> 4;
>> +    uint8_t skey;
>> +    int acc, pgm_code, pflags;
>> +    target_ulong abs_addr;
>> +    uint64_t asc = cpu->env.psw.mask & PSW_MASK_ASC;
>> +    uint64_t tec;
>>  
>>      /*
>>       * TODO: we currently don't handle all access protection types
>> -     * (including access-list and key-controlled) as well as AR mode.
>> +     * (including access-list) as well as AR mode.
>>       */
>> -    if (!s390_cpu_virt_mem_check_write(cpu, a1, 0, 1)) {
>> -        /* Fetching permitted; storing permitted */
>> +    pgm_code = mmu_translate(env, a1, true, asc, &abs_addr, &pflags, &tec);

mmu_translate/mmu_handle_skey sets the change bit for stores, whereas TPROT specifies
that it doesn't.
Not sure what the best way to handle this is.
Additional pretend fetch/store access modes?
> 
> I don't like the use of true to indicate a store here, when values other than 0 and 1 are possible.
> Any reason not to use MMU_DATA_STORE?
> 
> A comment about fetch protection override might be nice here:
>        /*
>         * Since fetch protection override may apply to half of page 0 only,
>         * it need not be considered in the following.
>         */

Disregard that, it's not true, TPROT does honor fetch-protection override, I just
made a mistake while adding a test for it to the kvm-unit-test.

[...]

