Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DEE478002
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 23:30:14 +0100 (CET)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxzGP-0002xK-CD
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 17:30:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mxyVQ-0004UF-Ex
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 16:41:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mxyVO-0005ez-D9
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 16:41:40 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGJE0Z7009912; 
 Thu, 16 Dec 2021 21:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nnQcvrIKZcAtmuCSJtRpH2VcbWvgmS+mGpZ9O1QTZuw=;
 b=GAo7kmcU/USwK1+H+jaHIaNzm/4wKu6lO7Ae5O5NtqQLbfcIzYWx/FT1DufsI+y/q+cc
 WjwLQbqk74MnNBmNx/4fYGdSUaQbY1XXtO94u4tx4jCiP8SNCehIkrlDUV/lBwtcaVqC
 cLz98NM+u9ljpbh6k3riHKJ2si0EaR3B9Uco+YQ1jin7mSo6c9CiOR70Yx3tKwoZk9KD
 1ru1OYjS24yKrio0QUtgK6m8bhiezyzXt2ZZ8nHAOFDES85IqkSQ/YOM3J9+59tmyC/q
 qDmFAWTb0tMTJM1Q6/pHoOsDzeZUPIIVG4+0Y/bYwll5pfpbW3bLFoApAXMfRpsVhUPD aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyn1k8cmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 21:41:35 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BGLVBLL000378;
 Thu, 16 Dec 2021 21:41:34 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyn1k8ckt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 21:41:34 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGLW5vI000847;
 Thu, 16 Dec 2021 21:41:33 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3cy7hfxvga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 21:41:33 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGLfWCL23462258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 21:41:32 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32F05C6059;
 Thu, 16 Dec 2021 21:41:32 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D900C6063;
 Thu, 16 Dec 2021 21:41:29 +0000 (GMT)
Received: from [9.160.32.17] (unknown [9.160.32.17])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 16 Dec 2021 21:41:29 +0000 (GMT)
Message-ID: <1c972953-a7b0-f06c-7d78-0e5fbf13b00e@linux.ibm.com>
Date: Thu, 16 Dec 2021 23:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] docs: Add measurement calculation details to
 amd-memory-encryption.txt
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211214135910.2732101-1-dovmurik@linux.ibm.com>
 <Ybjk6XJUNIyC/LX5@redhat.com>
 <336cbad3-06da-f11c-8cd1-ca058dd9c6b0@linux.ibm.com>
 <YbtkzdpERCnODpft@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YbtkzdpERCnODpft@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bWX6Sb6VdSP1YhElQnSzTuhOWju-FQMs
X-Proofpoint-GUID: BJbXbflXOSCU2I9yXNeueRNAQT-pIgvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160115
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.034,
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



On 16/12/2021 18:09, Daniel P. Berrangé wrote:
> On Thu, Dec 16, 2021 at 12:38:34PM +0200, Dov Murik wrote:
>>
>>
>> On 14/12/2021 20:39, Daniel P. Berrangé wrote:
>>> On Tue, Dec 14, 2021 at 01:59:10PM +0000, Dov Murik wrote:
>>>> Add a section explaining how the Guest Owner should calculate the
>>>> expected guest launch measurement for SEV and SEV-ES.
>>>>
>>>> Also update the name and link to the SEV API Spec document.
>>>>
>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>>>> ---
>>>>  docs/amd-memory-encryption.txt | 50 +++++++++++++++++++++++++++++++---
>>>>  1 file changed, 46 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
>>>> index ffca382b5f..f97727482f 100644
>>>> --- a/docs/amd-memory-encryption.txt
>>>> +++ b/docs/amd-memory-encryption.txt
>>>> @@ -43,7 +43,7 @@ The guest policy is passed as plaintext. A hypervisor may choose to read it,
>>>>  but should not modify it (any modification of the policy bits will result
>>>>  in bad measurement). The guest policy is a 4-byte data structure containing
>>>>  several flags that restricts what can be done on a running SEV guest.
>>>> -See KM Spec section 3 and 6.2 for more details.
>>>> +See SEV API Spec [1] section 3 and 6.2 for more details.
>>>>  
>>>>  The guest policy can be provided via the 'policy' property (see below)
>>>>  
>>>> @@ -88,7 +88,7 @@ expects.
>>>>  LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
>>>>  context.
>>>>  
>>>> -See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
>>>> +See SEV API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
>>>>  complete flow chart.
>>>>  
>>>>  To launch a SEV guest
>>>> @@ -113,6 +113,45 @@ a SEV-ES guest:
>>>>   - Requires in-kernel irqchip - the burden is placed on the hypervisor to
>>>>     manage booting APs.
>>>>  
>>>> +Calculating expected guest launch measurement
>>>> +---------------------------------------------
>>>> +In order to verify the guest launch measurement, The Guest Owner must compute
>>>> +it in the exact same way as it is calculated by the AMD-SP.  SEV API Spec [1]
>>>> +section 6.5.1 describes the AMD-SP operations:
>>>> +
>>>> +    GCTX.LD is finalized, producing the hash digest of all plaintext data
>>>> +    imported into the guest.
>>>> +
>>>> +    The launch measurement is calculated as:
>>>> +
>>>> +    HMAC(0x04 || API_MAJOR || API_MINOR || BUILD || GCTX.POLICY || GCTX.LD || MNONCE; GCTX.TIK)
>>>> +
>>>> +    where "||" represents concatenation.
>>>> +
>>>> +The values of API_MAJOR, API_MINOR, BUILD, and GCTX.POLICY can be obtained
>>>> +from the 'query-sev' qmp command.
>>>> +
>>>> +The value of MNONCE is part of the response of 'query-sev-launch-measure': it
>>>> +is the last 16 bytes of the base64-decoded data field (see SEV API Spec [1]
>>>> +section 6.5.2 Table 52: LAUNCH_MEASURE Measurement Buffer).
>>>> +
>>>> +The value of GCTX.LD is SHA256(firmware_blob || kernel_hashes_blob || vmsas_blob),
>>>> +where:
>>>> +
>>>> +* firmware_blob is the content of the entire firmware flash file (for example,
>>>> +  OVMF.fd).
>>>
>>> Lets add a caveat that the firmware flash should be built to be stateless
>>> ie that it is not secure to attempt to measure a guest where the firmware
>>> uses an NVRAM store.
>>>
>>
>> * firmware_blob is the content of the entire firmware flash file (for   
>>   example, OVMF.fd).  Note that you must build a stateless firmware file    
>>   which doesn't use an NVRAM store, because the NVRAM area is not
>>   measured, and therefore it is not secure to use a firmware which uses 
>>   state from an NVRAM store.
> 
> Looks good to me.
> 
>>>> +* if kernel is used, and kernel-hashes=on, then kernel_hashes_blob is the
>>>> +  content of PaddedSevHashTable (including the zero padding), which itself
>>>> +  includes the hashes of kernel, initrd, and cmdline that are passed to the
>>>> +  guest.  The PaddedSevHashTable struct is defined in target/i386/sev.c .
>>>> +* if SEV-ES is enabled (policy & 0x4 != 0), vmsas_blob is the concatenation of
>>>> +  all VMSAs of the guest vcpus.  Each VMSA is 4096 bytes long; its content is
>>>> +  defined inside Linux kernel code as struct vmcb_save_area, or in AMD APM
>>>> +  Volume 2 [2] Table B-2: VMCB Layout, State Save Area.
>>>
>>> Is there any practical guidance we can give apps on the way the VMSAs
>>> can be expected to be initialized ? eg can they assume essentially
>>> all fields in vmcb_save_area are 0 initialized except for certain
>>> ones ? Is initialization likely to vary at all across KVM or EDK2
>>> vesions or something ?
>>
>> From my own experience, the VMSA of vcpu0 doesn't change; it is basically what QEMU
>> sets up in x86_cpu_reset() (which is mostly zeros but not all).  I don't know if it
>> may change in newer QEMU (machine types?) or kvm.  As for vcpu1+, in SEV-ES the
>> CS:EIP for the APs is taken from a GUIDed table at the end of the OVMF image, and has
>> actually changed a few months ago when the memory layout changed to support both TDX
>> and SEV.
> 
> That is an unplesantly large number of moving parts that could
> potentially impact the expected state :-(  I think we need to
> be careful to avoid gratuitous changes, to avoid creating a
> combinatorial expansion in the number of possibly valid VMSA
> blocks.
> 
> It makes me wonder if we need to think about defining some
> standard approach for distro vendors (and/or cloud vendors)
> to publish the expected contents for various combinations
> of their software pieces.
> 
>>
>>
>> Here are the VMSAs for my 2-vcpu SEV-ES VM:
>>
>>
>> $ hd vmsa/vmsa_cpu0.bin
> 
> ...snipp...
> 
> was there a nice approach / tool you used to capture
> this initial state ?
> 

I wouldn't qualify this as nice: I ended up modifying my
host kernel's kvm (see patch below).  Later I wrote a
script to parse that hex dump from the kernel log into
proper 4096-byte binary VMSA files.



diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 7fbce342eec4..4e45fe37b93d 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -624,6 +624,12 @@ static int sev_launch_update_vmsa(struct kvm *kvm, struct kvm_sev_cmd *argp)
                 */
                clflush_cache_range(svm->vmsa, PAGE_SIZE);

+                /* dubek */
+                pr_info("DEBUG_VMSA - cpu %d START ---------------\n", i);
+                print_hex_dump(KERN_INFO, "DEBUG_VMSA", DUMP_PREFIX_OFFSET, 16, 1, svm->vmsa, PAGE_SIZE, true);
+                pr_info("DEBUG_VMSA - cpu %d END ---------------\n", i);
+                /* ----- */
+
                vmsa.handle = sev->handle;
                vmsa.address = __sme_pa(svm->vmsa);
                vmsa.len = PAGE_SIZE;



