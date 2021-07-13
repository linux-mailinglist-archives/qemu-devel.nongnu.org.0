Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991FA3C6BE1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 10:07:17 +0200 (CEST)
Received: from localhost ([::1]:46568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3DRk-0003PO-KX
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 04:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1m3DQU-0002d0-3Y
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:05:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1m3DQS-0007R7-8X
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:05:57 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16D83NvG061557; Tue, 13 Jul 2021 04:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=JCbYkbmxpcl4s3hpG8rFjTAfqObviZZhKack65HfRaQ=;
 b=stQGKBkTErktHREmyqQLHQPvqCSe4VDX+VLYrgs3rXa5RV/d9pecEgPX+1tWRuGdM/bz
 eL7Ry4bTKHMdQviCUy1CEljNyGtRGP3rG4JjRvlcp/TD41Pb8lWPmeFIdDi8VgIaAItT
 Y2Vt0SxbJxIaCJo8kayoSpUFoLZor1J2mMy4tByIpmLv7MFgVTKrGJVRZPvSHQlqvq8x
 V8ekH5MTfa1yOH1JcJRk4QKO08U1yaDCUTwSeAD6TGn14BJ8DaMU2biA7HaIJQa6HKS4
 q2m6kCOpP2zdy2Fc2mjfRW5ItXmR89pGPWNLDrp4zhuLE1N5FhioLBo6nRbA3NzKp6ZL MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrudbgwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 04:05:48 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16D83eBZ063155;
 Tue, 13 Jul 2021 04:05:47 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrudbgvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 04:05:47 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16D83Lra015077;
 Tue, 13 Jul 2021 08:05:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 39q368958w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 08:05:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16D83bQl31326536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 08:03:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FF38A405C;
 Tue, 13 Jul 2021 08:05:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B2FDA406A;
 Tue, 13 Jul 2021 08:05:38 +0000 (GMT)
Received: from [9.160.8.119] (unknown [9.160.8.119])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 08:05:38 +0000 (GMT)
Subject: Re: [RFC PATCH 0/6] Add AMD Secure Nested Paging (SEV-SNP) support
To: Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org
References: <20210709215550.32496-1-brijesh.singh@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <e68a9760-121f-72ee-f8ae-193b92bde403@linux.ibm.com>
Date: Tue, 13 Jul 2021 11:05:37 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210709215550.32496-1-brijesh.singh@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cff8pOgg45Q5genl7gyk6eH65UPTJqbS
X-Proofpoint-ORIG-GUID: _H61TdGLiXZXC6XpSW7Ldy814GkD5ilY
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_03:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130051
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.479,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Michael Roth <michael.roth@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Brijesh,

On 10/07/2021 0:55, Brijesh Singh wrote:
> SEV-SNP builds upon existing SEV and SEV-ES functionality while adding
> new hardware-based memory protections. SEV-SNP adds strong memory integrity
> protection to help prevent malicious hypervisor-based attacks like data
> replay, memory re-mapping and more in order to create an isolated memory
> encryption environment.
> 
> The patches to support the SEV-SNP in Linux kernel and OVMF are available:
> https://lore.kernel.org/kvm/20210707181506.30489-1-brijesh.singh@amd.com/
> https://lore.kernel.org/kvm/20210707183616.5620-1-brijesh.singh@amd.com/
> https://edk2.groups.io/g/devel/message/77335?p=,,,20,0,0,0::Created,,posterid%3A5969970,20,2,20,83891508
> 
> The Qemu patches uses the command id added by the SEV-SNP hypervisor
> patches to bootstrap the SEV-SNP VMs.
> 
> TODO:
>  * Add support to filter CPUID values through the PSP.
> 
> Additional resources
> ---------------------
> SEV-SNP whitepaper
> https://www.amd.com/system/files/TechDocs/SEV-SNP-strengthening-vm-isolation-with-integrity-protection-and-more.pdf
> 
> APM 2: https://www.amd.com/system/files/TechDocs/24593.pdf (section 15.36)
> 
> GHCB spec:
> https://developer.amd.com/wp-content/resources/56421.pdf
> 
> SEV-SNP firmware specification:
> https://www.amd.com/system/files/TechDocs/56860.pdf
> 
> Brijesh Singh (6):
>   linux-header: add the SNP specific command
>   i386/sev: extend sev-guest property to include SEV-SNP
>   i386/sev: initialize SNP context
>   i386/sev: add the SNP launch start context
>   i386/sev: add support to encrypt BIOS when SEV-SNP is enabled
>   i386/sev: populate secrets and cpuid page and finalize the SNP launch
> 
>  docs/amd-memory-encryption.txt |  81 +++++-
>  linux-headers/linux/kvm.h      |  47 ++++
>  qapi/qom.json                  |   6 +
>  target/i386/sev.c              | 498 ++++++++++++++++++++++++++++++++-
>  target/i386/sev_i386.h         |   1 +
>  target/i386/trace-events       |   4 +
>  6 files changed, 628 insertions(+), 9 deletions(-)
> 

It might be useful to allow the user to view SNP-related status/settings
in HMP's `info sev` and QMP's qom-list/qom-get under
/machine/confidential-guest-support .

(Not sure whether HMP is deprecated and new stuff should not be added
there.)

Particularly confusing is the `policy` attribute which is only relevant
for SEV / SEV-ES, while there's a new `snp.policy` attribute for SNP...
Maybe the irrelevant attributes should not be added to the tree when not
in SNP.

-Dov

