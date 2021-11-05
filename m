Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63644687F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 19:35:27 +0100 (CET)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj43f-0006jV-JA
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 14:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mj40p-0005hC-CA
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:32:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mj40n-0000PS-9D
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:32:27 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A5IPAjl030488; 
 Fri, 5 Nov 2021 18:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/h7v2/PQMx/Li6/TuugZvQGoj0MNK9Ed3EyDIDmgdgI=;
 b=MjHVgAsjJVHkfPsikeBnyiyDJDgskwPKDeGbxDEnuhgpNZy43W/zJE/fmwWKtcRMoqQm
 Ag12y5BZnLj4UvKgoePbuBk4xap5L9MRTSuicsJB9FEzI0yZEHHgyf6Ov4gihOpPpUZL
 M8xl1bs1i5HxoN8XFQCw0v2U+jQ15sNd5Koy7iu5TcCZ7TyY+D5LewMeIi6ZaoJ3WQqT
 qyuuApgtFeiQwPYNIp2Lw4aJXWJ5Yq1QWfGeG8EQ6DWR+r7TtDr5R1duor6hHv+sd+kd
 knQFMPnC+ScbQSS7asmcsYyVxHmk9QYp+qafuGs9KpGfHeNKnXpqzcNiqvCDtOVNVmAJ CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c59tq06gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 18:32:15 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A5IWEVK023379;
 Fri, 5 Nov 2021 18:32:14 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c59tq06g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 18:32:14 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A5INM3H018748;
 Fri, 5 Nov 2021 18:32:14 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3c4t4ekh8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 18:32:13 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A5IWCdR38207792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Nov 2021 18:32:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFC91AE06F;
 Fri,  5 Nov 2021 18:32:12 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E6E6AE05C;
 Fri,  5 Nov 2021 18:32:10 +0000 (GMT)
Received: from [9.65.75.52] (unknown [9.65.75.52])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  5 Nov 2021 18:32:10 +0000 (GMT)
Message-ID: <56fb584f-26c2-5592-e065-5dcf075c72e5@linux.ibm.com>
Date: Fri, 5 Nov 2021 20:32:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] SEV: fixes for -kernel launch with incompatible OVMF
Content-Language: en-US
To: Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <0291b6fc-b613-5eae-77a0-b344020a8376@amd.com>
 <39de4c3a-4351-3705-0962-7bb8d496fe28@linux.ibm.com>
 <9e4c0415-4153-e234-7c59-872e903e6567@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <9e4c0415-4153-e234-7c59-872e903e6567@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -npoJgSCZiQvhixkTPsxZ1MfE6fnJ229
X-Proofpoint-GUID: xfTSt2Lwlg4xt2yo211HidbsVOCQBAUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-05_02,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050102
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
 Eduardo Habkost <ehabkost@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/11/2021 16:48, Brijesh Singh wrote:
> 
> 
> On 11/2/21 8:22 AM, Dov Murik wrote:
>>
>>
>> On 02/11/2021 12:52, Brijesh Singh wrote:
>>> Hi Dov,
>>>
>>> Overall the patch looks good, only question I have is that now we are
>>> enforce qemu to hash the kernel, initrd and cmdline unconditionally for
>>> any of the SEV guest launches. This requires anyone wanting to
>>> calculating the expected measurement need to account for it. Should we
>>> make the hash page build optional ?
>>>
>>
>> The problem with adding a -enable-add-kernel-hashes QEMU option (or
>> suboption) is yet another complexity for the user.  I'd also argue that
>> adding these hashes can lead to a more secure VM boot process, so it
>> makes sense for it to be the default (and maybe introduce a
>> -allow-insecure-unmeasured-kernel-via-fw-cfg option to prevent the
>> measurement from changing due to addition of hashes?).
>>
>> Maybe, on the other hand, OVMF should "report" whether it supports
>> hashes verification. If it does, it should have the GUID in the table
>> (near the reset vector), like the current OvmfPkg/AmdSev edk2 build. If
>> it doesn't support that, then the entry should not appear at all, and
>> then QEMU won't add the hashes (with patch 1 from this series).  This
>> means that in edk2 we need to remove the SEV Hash Table block from the
>> ResetVectorVtf0.asm for OvmfPkg, but include it in the AmdSev build.
>>
> 
> By leaving it ON is conveying a wrong message to the user. The library
> used for verifying the hash is a NULL library for all the builds of Ovmf
> except the AmdSev package. In the NULL library case, OVMF does not
> perform any checks and hash table is useless. I will raise this on
> concern on your Ovmf patch series.
> 
> IMHO, if you want to turn it ON by default then make sure all the OVMF
> package builds supports validating the hash.
> 
> 
>> But the problem with this approach is that it prevents the future
>> unification of AmdSev and OvmfPkg, which is a possibility we discussed
>> (at least with Dave Gilbert), though not sure it's a good/feasible goal.
>>
>>
> 
> This is my exact concern, we are auto enabling the features in Qemu that
> is supported by AmdSev package only.
> 
> 
>>
>>> I am thinking this more for the SEV-SNP guest. As you may be aware that
>>> with SEV-SNP the attestation is performed by the guest, and its possible
>>> for the launch flow to pass 512-bits of host_data that gets included in
>>> the report. If a user wants to do the hash'e checks for the SNP then
>>> they can pass a hash of kernel, initrd and cmdline through a
>>> launch_finish.ID_BLOCK.host_data and does not require a special hash
>>> page. This it will simplify the expected hash calculation.
>>
>> That is a new measured boot "protocol" that we can discuss, and see
>> whether it's better/easier than the existing one at hand that works on
>> SEV and SEV-ES.
>>
>> What I don't understand in your suggestion is who performs a SHA256 of
>> the fw_cfg blobs (kernel/initrd/cmdline) so they can later be verified
>> (though ideally earlier is better).  Can you describe the details
>> (step-by-step) of an SNP VM boot with -kernel/-initrd/-append and how
>> the measurement/attestation is performed?
>>
>>
> 
> There are a multiple ways on how you can do a measured boot with the SNP.
> 
> 1) VMPL0 (SVSM) can provide a complete vTPM (see the MSFT proposal on
> SNP mailing list).
> 
> 2) Use your existing hashing approach with some changes to provide a bit
> more flexibility.
> 
> 3) Use your existing hashing approach but zero out the hash page when
> -kernel is not used.
> 
> Let me expand #2.
> 
> While launching the SNP guest, a guest owner can provide a ID block that
> KVM will pass to the PSP during the guest launch flow. In the ID block
> there is a field called "host_data". A guest owner can do a hash of
> kernel/initrd/cmdline and include it in the "host_data" field. During
> the hash verification, the OVMF can call the SNP_GET_REPORT. The PSP
> will includes the "host_data" passed in the launch process in the report
> and OVMF can use it for the verification. Unlike the current
> implementation, this enables a guest owner to provides the hash without
> requiring any changes in the Qemu and thus affecting the measurement.
> 

Is there a way (in the current NP patches for OVMF) for OVMF to call
SNP_GET_REPORT? Or is this something we need to add support for? Will it
mess up the sequence numbers that are later going to be used by the
kernel as well when managing SNP guest requests?



> One thing to note that both #2 and #3 requires ovmf to connect to guest
> owner to validate the report before using the "host_data" or "hash page".
> 

For direct boot (with -kernel/-initrd), I don't understand why OVMF
needs to contact the GO.  If OVMF can fetch the host_data field, and use
that to verify the blobs delivered from QEMU via fw_cfg, it should be
enough.

Later in userspace a user program will contact the GO with the
attestation report (which measures host_data and the OVMF memory). If
the measurement is not what the GO expects, then it won't release the
secret (which should be necessary for the actual meaningful workload
performed in the guest).


This should mitigate the following attacks:

1. Rogue CSP replaces OVMF with a rogue-OVMF that doesn't actually check
the hashes (the GO won't release the secret due to wrong measurement in
attestation report).
2. Rogue CSP uses "good" host_data content (kernel hash) but delivers
malicious kernel via fw_cfg (stopped by OVMF verifying the hashes).
3. Rogue CSP uses malicious kernel and its hashes in host_data (the GO
won't release the secret due to wrong host_data in attestation report).


-Dov

