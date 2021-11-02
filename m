Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B49442F16
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:27:06 +0100 (CET)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtof-00009X-EV
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhtkL-0004oE-Pf
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:22:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mhtkI-0002fM-Gb
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:22:37 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2ClLiW000612; 
 Tue, 2 Nov 2021 13:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kWKnbE9p5aL6s2JnUb4OLTtow6/9rAl27WoHGBLlrcQ=;
 b=LQPVYfDp1H1nzUg0aC9oESNynM6hJMko3+JxtheutzIUFqSRwrt7eicLfzcS2vRkus1c
 t80qXkJC0MaQrCr+D8RjJ9l/kIn1ufgbtH7sqXw619PtNYdoGQq6xXJwFOrP3bZVymGh
 +DWAPWVOdjTduv9AqmEYdSO9tr2+CDKv7fNNYNCWaDx6TSmex7SywfU+YXznWS0P4wnd
 EvZm8PlyN/PyS6zfwzkGdNK0G2eSZx/ORe/v7Krp3kWxPDrZJwSK3bMJoDQarrDTs55m
 /run83FMLAe/krzCcUszY1f2Dn8c0DnVuHzETGDoFgvKSCiKfyDG64V6VaL5+nynoV7w zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c35n38vpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 13:22:31 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A2D8CYM024333;
 Tue, 2 Nov 2021 13:22:30 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c35n38vpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 13:22:30 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A2DDCpF013300;
 Tue, 2 Nov 2021 13:22:29 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3c0wpb79rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 13:22:29 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A2DMSwA41550096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Nov 2021 13:22:28 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02E4F124055;
 Tue,  2 Nov 2021 13:22:28 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EA80124058;
 Tue,  2 Nov 2021 13:22:25 +0000 (GMT)
Received: from [9.65.202.213] (unknown [9.65.202.213])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Nov 2021 13:22:25 +0000 (GMT)
Message-ID: <39de4c3a-4351-3705-0962-7bb8d496fe28@linux.ibm.com>
Date: Tue, 2 Nov 2021 15:22:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 0/3] SEV: fixes for -kernel launch with incompatible OVMF
Content-Language: en-US
To: Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <0291b6fc-b613-5eae-77a0-b344020a8376@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <0291b6fc-b613-5eae-77a0-b344020a8376@amd.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cZKbgDdv8yb6V_HOIzJ-SxQ3qd-72hAY
X-Proofpoint-ORIG-GUID: 9tFfnE6U8tA_CPnUidKBZM2k6dd_XNyd
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020078
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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



On 02/11/2021 12:52, Brijesh Singh wrote:
> Hi Dov,
> 
> Overall the patch looks good, only question I have is that now we are
> enforce qemu to hash the kernel, initrd and cmdline unconditionally for
> any of the SEV guest launches. This requires anyone wanting to
> calculating the expected measurement need to account for it. Should we
> make the hash page build optional ?
> 

The problem with adding a -enable-add-kernel-hashes QEMU option (or
suboption) is yet another complexity for the user.  I'd also argue that
adding these hashes can lead to a more secure VM boot process, so it
makes sense for it to be the default (and maybe introduce a
-allow-insecure-unmeasured-kernel-via-fw-cfg option to prevent the
measurement from changing due to addition of hashes?).

Maybe, on the other hand, OVMF should "report" whether it supports
hashes verification. If it does, it should have the GUID in the table
(near the reset vector), like the current OvmfPkg/AmdSev edk2 build. If
it doesn't support that, then the entry should not appear at all, and
then QEMU won't add the hashes (with patch 1 from this series).  This
means that in edk2 we need to remove the SEV Hash Table block from the
ResetVectorVtf0.asm for OvmfPkg, but include it in the AmdSev build.

But the problem with this approach is that it prevents the future
unification of AmdSev and OvmfPkg, which is a possibility we discussed
(at least with Dave Gilbert), though not sure it's a good/feasible goal.



> I am thinking this more for the SEV-SNP guest. As you may be aware that
> with SEV-SNP the attestation is performed by the guest, and its possible
> for the launch flow to pass 512-bits of host_data that gets included in
> the report. If a user wants to do the hash'e checks for the SNP then
> they can pass a hash of kernel, initrd and cmdline through a
> launch_finish.ID_BLOCK.host_data and does not require a special hash
> page. This it will simplify the expected hash calculation.

That is a new measured boot "protocol" that we can discuss, and see
whether it's better/easier than the existing one at hand that works on
SEV and SEV-ES.

What I don't understand in your suggestion is who performs a SHA256 of
the fw_cfg blobs (kernel/initrd/cmdline) so they can later be verified
(though ideally earlier is better).  Can you describe the details
(step-by-step) of an SNP VM boot with -kernel/-initrd/-append and how
the measurement/attestation is performed?



> Adding a
> special page requires a validation of that page. All the prevalidated
> page need to be excluded by guest BIOS page validation flow to avoid the
> double validation. The hash page is populated only when we pass -kernel
> and it will be tricky to communicate this information to the guest BIOS
> so that it can skip the validation.

So that again comes back to the earlier question of whether we should
always fill the hashes page or only sometimes, and how can OVMF tell.

How about: QEMU always prevalidates this page (either fills it with
zeros or with the hashes table), and the BIOS always excludes it?

-Dov


> 
> Thoughts ?
> 
> thanks
> 
> On 11/1/21 5:21 AM, Dov Murik wrote:
>> Tom Lendacky and Brijesh Singh reported two issues with launching SEV
>> guests with the -kernel QEMU option when an old [1] or wrongly configured [2]
>> OVMF images are used.
>>
>> The fixes in patches 1 and 2 allow such guests to boot by skipping the
>> kernel/initrd/cmdline hashes addition to the initial guest memory (and
>> warning the user).
>>
>> Patch 3 is a refactoring of parts of the same function
>> sev_add_kernel_loader_hashes() to calculate all padding sizes at
>> compile-time.  This patch is not required to fix the issues above, but
>> is suggested as an improvement (no functional change intended).
>>
>> Note that launch measurement security is not harmed by these fixes: a
>> Guest Owner that wants to use measured Linux boot with -kernel, must use
>> (and measure) an OVMF image that designates a proper hashes table area,
>> and that verifies those hashes when loading the binaries from QEMU via
>> fw_cfg.
>>
>> The old OVMFs which don't publish the hashes table GUID or don't reserve
>> a valid area for it in MEMFD cannot support these hashes verification in
>> any case (for measured boot with -kernel).
>>
>>
>> [1] https://lore.kernel.org/qemu-devel/3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com/
>> [2] https://lore.kernel.org/qemu-devel/001dd81a-282d-c307-a657-e228480d4af3@amd.com/
>>
>> Dov Murik (3):
>>   sev/i386: Allow launching with -kernel if no OVMF hashes table found
>>   sev/i386: Warn if using -kernel with invalid OVMF hashes table area
>>   sev/i386: Perform padding calculations at compile-time
>>
>>  target/i386/sev.c | 34 +++++++++++++++++++++++-----------
>>  1 file changed, 23 insertions(+), 11 deletions(-)
>>
>>
>> base-commit: af531756d25541a1b3b3d9a14e72e7fedd941a2e

