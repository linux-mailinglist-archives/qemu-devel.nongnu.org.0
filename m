Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A009489731
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:19:29 +0100 (CET)
Received: from localhost ([::1]:33332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6shz-0008Pe-Fk
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:19:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1n6sfs-0007c3-OU
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:17:16 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13778
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1n6sfq-0004Nr-Pg
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:17:16 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AARMZT019075; 
 Mon, 10 Jan 2022 11:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=egLse0VULs7RXjX47joh+IybEn9mRphMoz2a6j76AZE=;
 b=P2XW8nLQhQSAEkK3n8oPSO9PFl6EgS+CbsGNs1QxwHNQB70o1G630EUKD7Ky8AZ+nkNI
 fCTR5b8QL0E/XTKyiSiNBpxxGCfC7xeidq2l4bhJPmqgtXDE55oiyk4uDi6T40ha/KU7
 vwjO8eBjOpevlbcRQXjVBRNaJQHd9gW5Bq7kmfNZBG6CBv/4ee4F3Jc051k12N2CIPa3
 ANHxpsDHzAkdmKVb8MJXuDxweq3a5DP1K4QrMdpDh6WXrYbq5HpgM6eo1AQM9gYtQQWc
 HYRtf14Jvg21KWP4x4doNo2pkTZ2beAxj1q0SENQAJ6RoBjcR4AHhTiXBdkdKJ9N1L1v vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dfkyrqutg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 11:17:09 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AB6wA9027829;
 Mon, 10 Jan 2022 11:17:08 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dfkyrqut7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 11:17:08 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ABFv6O024556;
 Mon, 10 Jan 2022 11:17:07 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3df289jdqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 11:17:07 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ABH6Y318940270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 11:17:06 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63B92C605B;
 Mon, 10 Jan 2022 11:17:06 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91C02C6055;
 Mon, 10 Jan 2022 11:17:03 +0000 (GMT)
Received: from [9.65.224.158] (unknown [9.65.224.158])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jan 2022 11:17:03 +0000 (GMT)
Message-ID: <534aff1a-914b-b1db-f712-2e2d409b54ce@linux.ibm.com>
Date: Mon, 10 Jan 2022 13:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] docs: Add measurement calculation details to
 amd-memory-encryption.txt
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211214135910.2732101-1-dovmurik@linux.ibm.com>
 <Ybjk6XJUNIyC/LX5@redhat.com>
 <336cbad3-06da-f11c-8cd1-ca058dd9c6b0@linux.ibm.com>
 <YbtkzdpERCnODpft@redhat.com>
 <1c972953-a7b0-f06c-7d78-0e5fbf13b00e@linux.ibm.com>
 <YdigM5W8AnBt2HM4@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YdigM5W8AnBt2HM4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O3PUdmkb6T4wjtVaAoyJpGLWcTSEno8V
X-Proofpoint-ORIG-GUID: TMLLdGH7Niva7K_LQBEGGBkbACR99-aM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_05,2022-01-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100074
Received-SPF: pass client-ip=148.163.158.5;
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/01/2022 22:18, Daniel P. Berrangé wrote:
> On Thu, Dec 16, 2021 at 11:41:27PM +0200, Dov Murik wrote:
>>
>>
>> On 16/12/2021 18:09, Daniel P. Berrangé wrote:
>>> On Thu, Dec 16, 2021 at 12:38:34PM +0200, Dov Murik wrote:
>>>>
>>>>
>>>> On 14/12/2021 20:39, Daniel P. Berrangé wrote:
>>>>> Is there any practical guidance we can give apps on the way the VMSAs
>>>>> can be expected to be initialized ? eg can they assume essentially
>>>>> all fields in vmcb_save_area are 0 initialized except for certain
>>>>> ones ? Is initialization likely to vary at all across KVM or EDK2
>>>>> vesions or something ?
>>>>
>>>> From my own experience, the VMSA of vcpu0 doesn't change; it is basically what QEMU
>>>> sets up in x86_cpu_reset() (which is mostly zeros but not all).  I don't know if it
>>>> may change in newer QEMU (machine types?) or kvm.  As for vcpu1+, in SEV-ES the
>>>> CS:EIP for the APs is taken from a GUIDed table at the end of the OVMF image, and has
>>>> actually changed a few months ago when the memory layout changed to support both TDX
>>>> and SEV.
>>>
>>> That is an unplesantly large number of moving parts that could
>>> potentially impact the expected state :-(  I think we need to
>>> be careful to avoid gratuitous changes, to avoid creating a
>>> combinatorial expansion in the number of possibly valid VMSA
>>> blocks.
>>>
>>> It makes me wonder if we need to think about defining some
>>> standard approach for distro vendors (and/or cloud vendors)
>>> to publish the expected contents for various combinations
>>> of their software pieces.
>>>
>>>>
>>>>
>>>> Here are the VMSAs for my 2-vcpu SEV-ES VM:
>>>>
>>>>
>>>> $ hd vmsa/vmsa_cpu0.bin
>>>
>>> ...snipp...
>>>
>>> was there a nice approach / tool you used to capture
>>> this initial state ?
>>>
>>
>> I wouldn't qualify this as nice: I ended up modifying my
>> host kernel's kvm (see patch below).  Later I wrote a
>> script to parse that hex dump from the kernel log into
>> proper 4096-byte binary VMSA files.
>>
>>
>>
>> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>> index 7fbce342eec4..4e45fe37b93d 100644
>> --- a/arch/x86/kvm/svm/sev.c
>> +++ b/arch/x86/kvm/svm/sev.c
>> @@ -624,6 +624,12 @@ static int sev_launch_update_vmsa(struct kvm *kvm, struct kvm_sev_cmd *argp)
>>                  */
>>                 clflush_cache_range(svm->vmsa, PAGE_SIZE);
>>
>> +                /* dubek */
>> +                pr_info("DEBUG_VMSA - cpu %d START ---------------\n", i);
>> +                print_hex_dump(KERN_INFO, "DEBUG_VMSA", DUMP_PREFIX_OFFSET, 16, 1, svm->vmsa, PAGE_SIZE, true);
>> +                pr_info("DEBUG_VMSA - cpu %d END ---------------\n", i);
>> +                /* ----- */
>> +
>>                 vmsa.handle = sev->handle;
>>                 vmsa.address = __sme_pa(svm->vmsa);
>>                 vmsa.len = PAGE_SIZE;
> 
> FWIW, I made a 1% less hacky solution by writing a systemtap
> script. It will require changing to set the line number for
> every single kernel version, but at least it doesn't require
> building a custom kernel

Thanks, we'll check it out.  It does require a kernel compiled with
debug info (I assume) to be able to hook the exact line number.

-Dov

> 
> $ cat sev-vmsa.stp 
> function dump_vmsa(addr:long) {
>   printf("VMSA\n")
>   for (i = 0; i < 4096 ; i+= 64) {
>     printf("%.64M\n", addr + i);
>   }
> }
> 
> probe module("kvm_amd").statement("__sev_launch_update_vmsa@arch/x86/kvm/svm/sev.c:618") {
>   dump_vmsa($svm->vmsa)
> }
> 
> the line number is that of the 'vmsa.handle = sev->handle' assignment
> 
> Regards,
> Daniel

