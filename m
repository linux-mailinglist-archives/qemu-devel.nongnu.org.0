Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3D844A7AB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:39:12 +0100 (CET)
Received: from localhost ([::1]:60512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLip-00018M-Ty
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:39:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mkLeE-0005Ei-MT
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:34:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3314
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mkLeA-0001tS-51
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 02:34:26 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A96IH24024901; 
 Tue, 9 Nov 2021 07:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VCN/K7wl2XwW6TuhTO1o9dLYEvTVz+042R4CPaX0mJE=;
 b=iku1DGE6N0W/TN6CkTbiqWxT7I+kZLTLo+ZFi3yhJXhByl/yRrWEt0BoKroJqUsLScNh
 3tZiwxy0ZhSysoeRSIfrUT1T1uO9CZ/lnBXI1mc8EGjon+ecZpZhsjtavoUB2nFDFzqw
 ju7s8IjlPjAZmbWCg3jq6yBRfJjMAlU8J5IF9moy8huua2uSCOq4MrV/ksZE8FDV7P1f
 Y/haJrPKASBJr+VcyO7E4FtJuNHaPuHgtt8jeKoLvGg4Vs4MkG84fEEiojoIB1NT8Adi
 6BQN3jyqxNAAw+C/v3BURswo5wP6hSN/MP/D9wmq3r7SVBfON9ev+SmrAmhMp3E4eNja DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7kks9n4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 07:34:11 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A96KTkv000714;
 Tue, 9 Nov 2021 07:34:11 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7kks9n4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 07:34:11 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A97WgrU022150;
 Tue, 9 Nov 2021 07:34:10 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 3c5hbbg8ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 07:34:10 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A97Y8S431981950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 07:34:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD47D7806A;
 Tue,  9 Nov 2021 07:34:08 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E292F78064;
 Tue,  9 Nov 2021 07:34:05 +0000 (GMT)
Received: from [9.160.77.174] (unknown [9.160.77.174])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 07:34:05 +0000 (GMT)
Message-ID: <499d939b-24c6-0ea3-89ea-9501e9afe8b8@linux.ibm.com>
Date: Tue, 9 Nov 2021 09:34:04 +0200
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
 <56fb584f-26c2-5592-e065-5dcf075c72e5@linux.ibm.com>
 <eb6d99f4-f9d1-4cd2-d391-dc3c57c28112@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <eb6d99f4-f9d1-4cd2-d391-dc3c57c28112@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _8pwrN0WEJUSZv0Yif0nbvqwXF3yVq4A
X-Proofpoint-GUID: yLFe1AEL9iqX1SdpvvOouPFeqEx9rt5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_02,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090043
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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



On 08/11/2021 23:22, Brijesh Singh wrote:
> 
> 
> On 11/5/21 1:32 PM, Dov Murik wrote:
>>
>>
>> On 02/11/2021 16:48, Brijesh Singh wrote:
>>>
>>>
>>> On 11/2/21 8:22 AM, Dov Murik wrote:
>>>>
>>>>
>>>> On 02/11/2021 12:52, Brijesh Singh wrote:
>>>>> Hi Dov,
>>>>>
>>>>> Overall the patch looks good, only question I have is that now we are
>>>>> enforce qemu to hash the kernel, initrd and cmdline unconditionally
>>>>> for
>>>>> any of the SEV guest launches. This requires anyone wanting to
>>>>> calculating the expected measurement need to account for it. Should we
>>>>> make the hash page build optional ?
>>>>>
>>>>
>>>> The problem with adding a -enable-add-kernel-hashes QEMU option (or
>>>> suboption) is yet another complexity for the user.  I'd also argue that
>>>> adding these hashes can lead to a more secure VM boot process, so it
>>>> makes sense for it to be the default (and maybe introduce a
>>>> -allow-insecure-unmeasured-kernel-via-fw-cfg option to prevent the
>>>> measurement from changing due to addition of hashes?).
>>>>
>>>> Maybe, on the other hand, OVMF should "report" whether it supports
>>>> hashes verification. If it does, it should have the GUID in the table
>>>> (near the reset vector), like the current OvmfPkg/AmdSev edk2 build. If
>>>> it doesn't support that, then the entry should not appear at all, and
>>>> then QEMU won't add the hashes (with patch 1 from this series).  This
>>>> means that in edk2 we need to remove the SEV Hash Table block from the
>>>> ResetVectorVtf0.asm for OvmfPkg, but include it in the AmdSev build.
>>>>
>>>
>>> By leaving it ON is conveying a wrong message to the user. The library
>>> used for verifying the hash is a NULL library for all the builds of Ovmf
>>> except the AmdSev package. In the NULL library case, OVMF does not
>>> perform any checks and hash table is useless. I will raise this on
>>> concern on your Ovmf patch series.
>>>
>>> IMHO, if you want to turn it ON by default then make sure all the OVMF
>>> package builds supports validating the hash.
>>>
>>>
>>>> But the problem with this approach is that it prevents the future
>>>> unification of AmdSev and OvmfPkg, which is a possibility we discussed
>>>> (at least with Dave Gilbert), though not sure it's a good/feasible
>>>> goal.
>>>>
>>>>
>>>
>>> This is my exact concern, we are auto enabling the features in Qemu that
>>> is supported by AmdSev package only.
>>>
>>>
>>>>
>>>>> I am thinking this more for the SEV-SNP guest. As you may be aware
>>>>> that
>>>>> with SEV-SNP the attestation is performed by the guest, and its
>>>>> possible
>>>>> for the launch flow to pass 512-bits of host_data that gets
>>>>> included in
>>>>> the report. If a user wants to do the hash'e checks for the SNP then
>>>>> they can pass a hash of kernel, initrd and cmdline through a
>>>>> launch_finish.ID_BLOCK.host_data and does not require a special hash
>>>>> page. This it will simplify the expected hash calculation.
>>>>
>>>> That is a new measured boot "protocol" that we can discuss, and see
>>>> whether it's better/easier than the existing one at hand that works on
>>>> SEV and SEV-ES.
>>>>
>>>> What I don't understand in your suggestion is who performs a SHA256 of
>>>> the fw_cfg blobs (kernel/initrd/cmdline) so they can later be verified
>>>> (though ideally earlier is better).  Can you describe the details
>>>> (step-by-step) of an SNP VM boot with -kernel/-initrd/-append and how
>>>> the measurement/attestation is performed?
>>>>
>>>>
>>>
>>> There are a multiple ways on how you can do a measured boot with the
>>> SNP.
>>>
>>> 1) VMPL0 (SVSM) can provide a complete vTPM (see the MSFT proposal on
>>> SNP mailing list).
>>>
>>> 2) Use your existing hashing approach with some changes to provide a bit
>>> more flexibility.
>>>
>>> 3) Use your existing hashing approach but zero out the hash page when
>>> -kernel is not used.
>>>
>>> Let me expand #2.
>>>
>>> While launching the SNP guest, a guest owner can provide a ID block that
>>> KVM will pass to the PSP during the guest launch flow. In the ID block
>>> there is a field called "host_data". A guest owner can do a hash of
>>> kernel/initrd/cmdline and include it in the "host_data" field. During
>>> the hash verification, the OVMF can call the SNP_GET_REPORT. The PSP
>>> will includes the "host_data" passed in the launch process in the report
>>> and OVMF can use it for the verification. Unlike the current
>>> implementation, this enables a guest owner to provides the hash without
>>> requiring any changes in the Qemu and thus affecting the measurement.
>>>
>>
>> Is there a way (in the current NP patches for OVMF) for OVMF to call
>> SNP_GET_REPORT? Or is this something we need to add support for? Will it
>> mess up the sequence numbers that are later going to be used by the
>> kernel as well when managing SNP guest requests?
>>
>>
> 
> The current OVMF patches does not add a library to query the attestation
> report yet. If required it should be possible to add such a libraries.
> The VMGEXIT is available to both Guest OS and Guest BIOS. The sequence
> number should not be an issue. As per the GHCB spec, the guest BIOS will
> save the sequence number in the secrets page reserved area and guest
> kernel can picked the next number from that region (its same as the
> kexec approach).
> 

OK, good to know. *If* we decide to use the host_data field to store the
hashes, then we would have to add the SNP_GET_REPORT functionality to OVMF.

>>
>>> One thing to note that both #2 and #3 requires ovmf to connect to guest
>>> owner to validate the report before using the "host_data" or "hash
>>> page".
>>>
>>
>> For direct boot (with -kernel/-initrd), I don't understand why OVMF
>> needs to contact the GO.  If OVMF can fetch the host_data field, and use
>> that to verify the blobs delivered from QEMU via fw_cfg, it should be
>> enough.
>>
> 
> Well, I am trying to match with the current model in which the Hash's
> are provided through the secrets injection for the comparision. In other
> words, the attestation is completed before OVMF does the hash
> comparison. So, if you want to have the same security property then you
> need to perform the attestation before comparing the hash'es because a
> malicious HV may bypass the guid check.
> 

In the current model (works for SEV and SEV-ES) the hashes are not
provided via secret injection; they are added by QEMU to the designated
hashes area in the guest.

If we only need the secret later (in userspace) then we can use a
similar model.  Hashes are either (a) added to the designated page (by
QEMU), or (b) passed in host_data (by QEMU).  OVMF fetch the hashes: (a)
by reading a memory page, or (b) by using SNP_GET_REPORT.  It will
verify them against the blobs from fw_cfg, and will continue to boot
only if they match.

and then it continues as I previously wrote:

> 
>> Later in userspace a user program will contact the GO with the
>> attestation report (which measures host_data and the OVMF memory). If
>> the measurement is not what the GO expects, then it won't release the
>> secret (which should be necessary for the actual meaningful workload
>> performed in the guest).
>>
>>
>> This should mitigate the following attacks:
>>
>> 1. Rogue CSP replaces OVMF with a rogue-OVMF that doesn't actually check
>> the hashes (the GO won't release the secret due to wrong measurement in
>> attestation report).
>> 2. Rogue CSP uses "good" host_data content (kernel hash) but delivers
>> malicious kernel via fw_cfg (stopped by OVMF verifying the hashes).
>> 3. Rogue CSP uses malicious kernel and its hashes in host_data (the GO
>> won't release the secret due to wrong host_data in attestation report).
>>


-Dov




