Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0754B51C46C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:59:41 +0200 (CEST)
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdtD-0000pP-JZ
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nmdl2-00014U-HB; Thu, 05 May 2022 11:51:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nmdl0-0006Wr-Ew; Thu, 05 May 2022 11:51:12 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245FbAtl033394;
 Thu, 5 May 2022 15:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Nh+4WO8zL9gyzJtOytfUHCkNUKjmYVybz5kyQmozVAM=;
 b=DtOz8HBpDN2u6jKaO04jrhfhnf/nnTNm9jB+Q8MHWIyFPvbDGab1o9mjX66R925N2IFn
 FF3yJfqhN6WptHCS6mmUxJLE/xAYWc/FFRllpF63mUgtFgC6mf9r0wkD1ZN1dt4QIsCN
 XtpzA3Z63s1sgPVgAMCAUDvIMOd3RSsimLffjrQ7wRwUsss1tOr9nc2SKCPwx9LdPvYf
 cdY9ip/Op3A+oCanoQTG63W8y8W/wAi0xwS+hWLRO61AUkk6CIS6pxFN2BazasVNMnHR
 Rr3lhj6bvTu8z/9S+KwQJbmdDcQsiFnUvW/4cIwVtXzAnHj6MUvlxlAH9/WYVqzhaXqr kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvh2t0q4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 15:51:02 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 245FbEqb034008;
 Thu, 5 May 2022 15:51:02 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvh2t0q4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 15:51:02 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245FmYRZ020191;
 Thu, 5 May 2022 15:51:01 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3frvra2hb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 15:51:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 245Fp1Jl36110790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 15:51:01 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CBCD78063;
 Thu,  5 May 2022 15:51:01 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 343BD78060;
 Thu,  5 May 2022 15:51:00 +0000 (GMT)
Received: from localhost (unknown [9.160.34.58])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu,  5 May 2022 15:50:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH qemu] spapr: Use address from elf parser for kernel address
In-Reply-To: <365ad8a7-bfa4-45d5-0fb4-46e295ea75b8@ozlabs.ru>
References: <20220504065536.3534488-1-aik@ozlabs.ru>
 <87fslp9khd.fsf@linux.ibm.com>
 <365ad8a7-bfa4-45d5-0fb4-46e295ea75b8@ozlabs.ru>
Date: Thu, 05 May 2022 12:50:53 -0300
Message-ID: <87bkwc9dwi.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cDKQ-V4HAhGIKRxFr8ueaN8wreoPXra4
X-Proofpoint-GUID: wfCa39GMY-yJmG_2MX-PER8bxAWNOUf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_06,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050111
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> On 5/5/22 05:16, Fabiano Rosas wrote:
>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>> 
>>> tl;dr: This allows Big Endian zImage booting via -kernel + x-vof=on.
>>>
>>> QEMU loads the kernel at 0x400000 by default which works most of
>>> the time as Linux kernels are relocatable, 64bit and compiled with "-pie"
>>> (position independent code). This works for a little endian zImage too.
>>>
>>> However a big endian zImage is compiled without -pie, is 32bit, linked to
>>> 0x4000000 so current QEMU ends up loading it at
>>> 0x4400000 but keeps spapr->kernel_addr unchanged so booting fails.
>>>
>>> This uses the kernel address returned from load_elf().
>>> If the default kernel_addr is used, there is no change in behavior (as
>>> translate_kernel_address() takes care of this), which is:
>>> LE/BE vmlinux and LE zImage boot, BE zImage does not.
>>> If the VM created with "-machine kernel-addr=0,x-vof=on", then QEMU
>>> prints a warning and BE zImage boots.
>> 
>> I think we can fix this without needing a different command line for BE
>> zImage (apart from x-vof, which is a separate matter).
>> 
>> If you look at translate_kernel_address, it cannot really work when the
>> ELF PhysAddr is != 0. We would always hit this sort of 0x4400000 issue,
>> so if we fix that function like this...
>> 
>> static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
>> {
>>      SpaprMachineState *spapr = opaque;
>> 
>>      return addr ? addr : spapr->kernel_addr;
>> }
>
>
> The qemu elf loader is supposed to handle relocations which should be 
> calling this hook more than once, now I wonder why it is not doing so.

For relocations, it seems to only call translate_fn for s390x.

>> ...then we could always use the ELF PhysAddr if it is different from 0
>> and only use the default load addr if the ELF PhysAddr is 0. If the user
>> gives kernel_addr on the cmdline, we honor that, even if puts the kernel
>> over the firmware (we have code to detect that).
>
>
> ELF address is 0 for LE zImage only, vmlinux BE/LE uses 
> 0xc000000000000000. And we are already chopping all these tops bits off 
> in translate_kernel_address() and I do not really know why _exactly_ it 
> is 0x0fffffff and not let's say 0x7fffffff.

Oh, I am not talking about the ELF entry point. And that is not what
load_elf passes to translate_kernel_address either. It is the ELF
PhysAddr:

$ powerpc64le-buildroot-linux-gnu-readelf -We vmlinux | tail

Program Headers:
  Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
  LOAD           0x010000 0xc000000000000000 0x0000000000000000 0x28d84d4 0x2a54ea8 RWE 0x10000

So it is 0x400000 for BE zImage and 0 for vmlinux.

>> 
>>> @@ -2988,6 +2990,12 @@ static void spapr_machine_init(MachineState *machine)
>>>               exit(1);
>>>           }
>>>   
>>> +        if (spapr->kernel_addr != loaded_addr) {
>> 
>> This could be:
>> 
>>          if (spapr->kernel_addr == KERNEL_LOAD_ADDR &&
>> 	    spapr->kernel_addr != loaded_addr) {
>> 
>> So the precedence would be:
>> 
>> 1- ELF PhysAddr, if != 0. After all, that is what it's for. BE zImage
>>     falls here;
>>      
>> 2- KERNEL_LOAD_ADDR. Via translate_kernel_address, LE/BE vmlinux fall
>>     here;
>> 
>> 3- kernel_addr. The user is probably hacking something, just use what
>>     they gave us. QEMU will yell if they load the kernel over the fw.
>
>
> imho too complicated.
>
> What if the user runs QEMU with kernel-addr=0x400000? (0x400000 is 
> KERNEL_LOAD_ADDR noooow but not necessarily forever). Is it 2) or 3)?

Good point. It should always be 3. It is a bad user interface to have a
command line option and arbitrarily ignore it. Be it 0x0 or 0x400000.

> I am basically fixing a bug when we ignore where load_elf() loaded the 
> ELF and just assume it is KERNEL_LOAD_ADDR. Now the code checks if the 
> ELF was loaded where we want it to be.

That bug is already accounted for, that is why we have
translate_kernel_address:

  /* address_offset is hack for kernel images that are
     linked at the wrong physical address.  */
  if (translate_fn) {
      addr = translate_fn(translate_opaque, ph->p_paddr);

So we're actively telling load_elf to load the kernel at the wrong place
when we do:

(ph->p_addr & 0x0fffffff) + spapr->kernel_addr

It just happened to work so far because the vmlinux PhysAddr is 0.

When you set kernel-addr=0 you are simply working around this other bug
because:

(ph->p_addr & 0x0fffffff) + 0 == ph->p_addr

I just want to remove this indirection and use the ELF PhysAddr
directly.

> Everything else can be done but on top of this.

If you want to merge this I could send another patch on top of it later,
no worries. I realise that this a larger change that will need more
testing.

>>> +            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
>>> +                        spapr->kernel_addr, loaded_addr);
>>> +            spapr->kernel_addr = loaded_addr;
>>> +        }
>>> +
>>>           /* load initrd */
>>>           if (initrd_filename) {
>>>               /* Try to locate the initrd in the gap between the kernel

