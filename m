Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B3523BE3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 19:51:26 +0200 (CEST)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noqUe-0000MG-NS
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 13:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1noqRK-0007Ge-Hw; Wed, 11 May 2022 13:47:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24426
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1noqRH-00042S-EA; Wed, 11 May 2022 13:47:58 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BH0jQP031176;
 Wed, 11 May 2022 17:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=RYbwM/tv4NG7+x+NRqGl7+BtobktVk7HGgrH1qUC0rY=;
 b=B26MEWvQserxEqg+lkELwCrgGd7L56p5uKj6AgpMu3r1D6GK3HrpCxFVRSeHW5y8yYgm
 2XwAVcCjcBZyYvrEgqLMY8r69vrO7AB6xcX9SswGdZ75TKKBxJP8goRDq80M0cXGWpwP
 3rl54fFUeO/kP44Vdu02pEZUhv11VjdrFzwYZGjk50cfJSpDh2oDJKWECoDZeAJmKvlQ
 j2WbqOySD/WuZzVU/240wzqs5xFrU1Ra10cV2fqaCXp3y77a+8GquSo+LDKzyZkzybsP
 PmEbr+4HrwIS+nkftY7IbST6S+lCRYZR6wtjj8NJdPkdNFpUhKCQaM5aIxlB3FwyhaY/ 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0ecbd13c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 17:47:45 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24BH6inN020916;
 Wed, 11 May 2022 17:47:45 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0ecbd134-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 17:47:45 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24BHXDou002202;
 Wed, 11 May 2022 17:47:44 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 3fwgdaw7a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 17:47:44 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24BHlhu87930542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 17:47:43 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70A52AC05E;
 Wed, 11 May 2022 17:47:43 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E91FDAC059;
 Wed, 11 May 2022 17:47:42 +0000 (GMT)
Received: from localhost (unknown [9.160.18.128])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 11 May 2022 17:47:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH qemu] spapr: Use address from elf parser for kernel address
In-Reply-To: <1681b697-1ce6-b53c-068a-8728238d3272@ozlabs.ru>
References: <20220504065536.3534488-1-aik@ozlabs.ru>
 <87fslp9khd.fsf@linux.ibm.com>
 <365ad8a7-bfa4-45d5-0fb4-46e295ea75b8@ozlabs.ru>
 <87bkwc9dwi.fsf@linux.ibm.com>
 <1681b697-1ce6-b53c-068a-8728238d3272@ozlabs.ru>
Date: Wed, 11 May 2022 14:47:40 -0300
Message-ID: <87zgjom05f.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GY-P4xPCplRBNE8CmUgIvBapyEdO5UkD
X-Proofpoint-ORIG-GUID: MrcdTlTQlOjEaQizYdaMgUeM_nhDu_MP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110079
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> On 06/05/2022 01:50, Fabiano Rosas wrote:
>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>> 
>>> On 5/5/22 05:16, Fabiano Rosas wrote:
>>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>>
>>>>> tl;dr: This allows Big Endian zImage booting via -kernel + x-vof=on.
>>>>>
>>>>> QEMU loads the kernel at 0x400000 by default which works most of
>>>>> the time as Linux kernels are relocatable, 64bit and compiled with "-pie"
>>>>> (position independent code). This works for a little endian zImage too.
>>>>>
>>>>> However a big endian zImage is compiled without -pie, is 32bit, linked to
>>>>> 0x4000000 so current QEMU ends up loading it at
>>>>> 0x4400000 but keeps spapr->kernel_addr unchanged so booting fails.
>>>>>
>>>>> This uses the kernel address returned from load_elf().
>>>>> If the default kernel_addr is used, there is no change in behavior (as
>>>>> translate_kernel_address() takes care of this), which is:
>>>>> LE/BE vmlinux and LE zImage boot, BE zImage does not.
>>>>> If the VM created with "-machine kernel-addr=0,x-vof=on", then QEMU
>>>>> prints a warning and BE zImage boots.
>>>>
>>>> I think we can fix this without needing a different command line for BE
>>>> zImage (apart from x-vof, which is a separate matter).
>>>>
>>>> If you look at translate_kernel_address, it cannot really work when the
>>>> ELF PhysAddr is != 0. We would always hit this sort of 0x4400000 issue,
>>>> so if we fix that function like this...
>>>>
>>>> static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
>>>> {
>>>>       SpaprMachineState *spapr = opaque;
>>>>
>>>>       return addr ? addr : spapr->kernel_addr;
>>>> }
>>>
>>>
>>> The qemu elf loader is supposed to handle relocations which should be
>>> calling this hook more than once, now I wonder why it is not doing so.
>> 
>> For relocations, it seems to only call translate_fn for s390x.
>
>
> Agrh. You made me read this :) It is quite weird code and yeah 390-only :-/
>
>
>>>> ...then we could always use the ELF PhysAddr if it is different from 0
>>>> and only use the default load addr if the ELF PhysAddr is 0. If the user
>>>> gives kernel_addr on the cmdline, we honor that, even if puts the kernel
>>>> over the firmware (we have code to detect that).
>>>
>>>
>>> ELF address is 0 for LE zImage only, vmlinux BE/LE uses
>>> 0xc000000000000000. And we are already chopping all these tops bits off
>>> in translate_kernel_address() and I do not really know why _exactly_ it
>>> is 0x0fffffff and not let's say 0x7fffffff.
>> 
>> Oh, I am not talking about the ELF entry point. And that is not what
>> load_elf passes to translate_kernel_address either. It is the ELF
>> PhysAddr:
>> 
>> $ powerpc64le-buildroot-linux-gnu-readelf -We vmlinux | tail
>> 
>> Program Headers:
>>    Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
>>    LOAD           0x010000 0xc000000000000000 0x0000000000000000 0x28d84d4 0x2a54ea8 RWE 0x10000
>> 
>> So it is 0x400000 for BE zImage and 0 for vmlinux.
>
> Ah right. Me wrong.
>
> btw potentially there can be more program sections.
>
> [fstn1-p1 ~]$ readelf -l /home/aik/p/slof/board-qemu/llfw/stage1.elf
>
> Elf file type is EXEC (Executable file)
> Entry point 0x100
> There are 2 program headers, starting at offset 64
>
> Program Headers:
>    Type           Offset             VirtAddr           PhysAddr
>                   FileSiz            MemSiz              Flags  Align
>    LOAD           0x0000000000000100 0x0000000000000100 0x0000000000000100
>                   0x0000000000008110 0x0000000000010290  RWE    0x4000
>    LOAD           0x0000000000008210 0x0000000000010400 0x0000000000010400
>                   0x0000000000000010 0x0000000000000010  RW     0x8
>
>
> grub might be similar.
>
>
>> 
>>>>
>>>>> @@ -2988,6 +2990,12 @@ static void spapr_machine_init(MachineState *machine)
>>>>>                exit(1);
>>>>>            }
>>>>>    
>>>>> +        if (spapr->kernel_addr != loaded_addr) {
>>>>
>>>> This could be:
>>>>
>>>>           if (spapr->kernel_addr == KERNEL_LOAD_ADDR &&
>>>> 	    spapr->kernel_addr != loaded_addr) {
>>>>
>>>> So the precedence would be:
>>>>
>>>> 1- ELF PhysAddr, if != 0. After all, that is what it's for. BE zImage
>>>>      falls here;
>>>>       
>>>> 2- KERNEL_LOAD_ADDR. Via translate_kernel_address, LE/BE vmlinux fall
>>>>      here;
>>>>
>>>> 3- kernel_addr. The user is probably hacking something, just use what
>>>>      they gave us. QEMU will yell if they load the kernel over the fw.
>>>
>>>
>>> imho too complicated.
>>>
>>> What if the user runs QEMU with kernel-addr=0x400000? (0x400000 is
>>> KERNEL_LOAD_ADDR noooow but not necessarily forever). Is it 2) or 3)?
>> 
>> Good point. It should always be 3. It is a bad user interface to have a
>> command line option and arbitrarily ignore it. Be it 0x0 or 0x400000.
>> 
>>> I am basically fixing a bug when we ignore where load_elf() loaded the
>>> ELF and just assume it is KERNEL_LOAD_ADDR. Now the code checks if the
>>> ELF was loaded where we want it to be.
>> 
>> That bug is already accounted for, that is why we have
>> translate_kernel_address:
>> 
>>    /* address_offset is hack for kernel images that are
>>       linked at the wrong physical address.  */
>>    if (translate_fn) {
>>        addr = translate_fn(translate_opaque, ph->p_paddr);
>> 
>> So we're actively telling load_elf to load the kernel at the wrong place
>> when we do:
>> 
>> (ph->p_addr & 0x0fffffff) + spapr->kernel_addr
>> 
>> It just happened to work so far because the vmlinux PhysAddr is 0.
>> 
>> When you set kernel-addr=0 you are simply working around this other bug
>> because:
>> 
>> (ph->p_addr & 0x0fffffff) + 0 == ph->p_addr
>> 
>> I just want to remove this indirection and use the ELF PhysAddr
>> directly.
>
>
> That's alright but not in translate_kernel_address(). May be I should 
> rename kernel-addr to kernel-offset (which it really is)  or  hack 
> load_elf() so it would take the desired location and work out the offset 
> inside (and ditch the translate_fn hook) but either way we'll need 
> heuristics (or the user should know) to know if the image is 
> self-relocatable or not as otherwise it just won't boot.
>
>
>
>>> Everything else can be done but on top of this.
>> 
>> If you want to merge this I could send another patch on top of it later,
>> no worries. I realise that this a larger change that will need more
>> testing.
>
>
> I want to have some easy-to-explain way of booting BE zImage :)

Ok, I guess I can live with this kernel-addr=0 ugliness. We can deal
with translate_kernel_address another time.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

