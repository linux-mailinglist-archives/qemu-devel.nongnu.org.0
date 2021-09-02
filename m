Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27623FEDB4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:22:46 +0200 (CEST)
Received: from localhost ([::1]:55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLljx-0004eu-Rg
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mLlQv-0006aT-0C
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:03:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mLlQs-0008P2-Ry
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:03:04 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 182BYLax054140; Thu, 2 Sep 2021 08:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qr8sWA6IxA0JXHWS2Gr5TE+VpbC9BwK80IBuhFTaYfQ=;
 b=oFNL7CDxUpdPSRbDK3aDOYV33pCufU+Fd4tVGrclNiKZBxT50DcqmAKxtX1mDjkXp+rY
 j7n36WuV4NBbVWKcuJNGxmRf5l2knFzP6xKEZ9yhMzZLxiUXteWDd023kty6aTjbnLd+
 Ky+IkcE2sO9kOzra62NuN4DBrxdTG5dbhazXjhjsJBAwyh0JOMu4YWm31dcJVBeIWfhx
 RfJr3nHRP6gH8XfSs7QzUam368IpINl0Gf+aneYcntfYuy41Lr+9Cy3oZgEMn7ZeY6Th
 FXoQQ1pv3ByfqtQm2fm6MzPsAKAgEr86RGq0TTWAXekIkQLdngegyhb2ZUXDVQx1IZri aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3atwsd8um5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 08:02:59 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 182BZeFw063254;
 Thu, 2 Sep 2021 08:02:58 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3atwsd8uka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 08:02:58 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 182BunZw018907;
 Thu, 2 Sep 2021 12:02:57 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3atdxcshba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 12:02:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 182C2tTb14549286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Sep 2021 12:02:55 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ACF5C6075;
 Thu,  2 Sep 2021 12:02:55 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF0ACC6088;
 Thu,  2 Sep 2021 12:02:49 +0000 (GMT)
Received: from [9.65.84.185] (unknown [9.65.84.185])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Sep 2021 12:02:49 +0000 (GMT)
Subject: Re: [PATCH v3 0/2] [RESEND] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
To: qemu-devel@nongnu.org
References: <20210825073538.959525-1-dovmurik@linux.ibm.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <fa9ceb69-74f3-a2ad-51db-b9d6b12dc15f@linux.ibm.com>
Date: Thu, 2 Sep 2021 15:02:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210825073538.959525-1-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: deW7OGyjbckX5FlAdRj3wPjNcbLqZqCy
X-Proofpoint-ORIG-GUID: G0933MVsZ_SHb7NLYXeu3GapX2U6P4O2
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-02_04:2021-09-02,
 2021-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109020072
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.225,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

All (2) patches of the series have R-b.

Thanks,
-Dov


On 25/08/2021 10:35, Dov Murik wrote:
> (Resending for QEMU 6.2; no code changes since the last round.)
> 
> Currently booting with -kernel/-initrd/-append is not supported in SEV
> confidential guests, because the content of these blobs is not measured
> and therefore not trusted by the SEV guest.
> 
> However, in some cases the kernel, initrd, and cmdline are not secret
> but should not be modified by the host.  In such a case, we want to
> verify inside the trusted VM that the kernel, initrd, and cmdline are
> indeed the ones expected by the Guest Owner, and only if that is the
> case go on and boot them up (removing the need for grub inside OVMF in
> that mode).
> 
> To support that, OVMF adds a special area for hashes of
> kernel/initrd/cmdline; that area is expected to be filled by QEMU and
> encrypted as part of the initial SEV guest launch.  This in turn makes
> the hashes part of the PSP measured content, and OVMF can trust these
> inputs if they match the hashes.
> 
> This series adds an SEV function to generate the table of hashes for
> OVMF and encrypt it (patch 1/2), and calls this function if SEV is
> enabled when the kernel/initrd/cmdline are prepared (patch 2/2).
> 
> Corresponding OVMF support [1] is already available in edk2 (patch series
> "Measured SEV boot with kernel/initrd/cmdline").
> 
> [1] https://edk2.groups.io/g/devel/message/78250
> 
> ---
> 
> v3: https://lore.kernel.org/qemu-devel/20210624102040.2015280-1-dovmurik@linux.ibm.com/
> v3 changes:
>  - initrd hash is now mandatory; if no -initrd is passed, calculate the
>    hash of the empty buffer.  This is now aligned with the OVMF
>    behaviour which verifies the empty initrd (correctly).
>  - make SevHashTable entries fixed: 3 entries for cmdline, initrd, and kernel.
>  - in sev_add_kernel_loader_hashes: first calculate all the hashes, only then
>    fill-in the hashes table in the guest's memory.
>  - Use g_assert_not_reached in sev-stub.c.
>  - Use QEMU_PACKED attribute for structs.
>  - Use QemuUUID type for guids.
>  - in sev_add_kernel_loader_hashes: use ARRAY_SIZE(iov) instead of literal 2.
> 
> v2: https://lore.kernel.org/qemu-devel/20210621190553.1763020-1-dovmurik@linux.ibm.com/
> v2 changes:
>  - Extract main functionality to sev.c (with empty stub in sev-stub.c)
>  - Use sev_enabled() instead of machine->cgs->ready to detect SEV guest
>  - Coding style changes
> 
> v1: https://lore.kernel.org/qemu-devel/20210525065931.1628554-1-dovmurik@linux.ibm.com/
> 
> Dov Murik (2):
>   sev/i386: Introduce sev_add_kernel_loader_hashes for measured linux
>     boot
>   x86/sev: generate SEV kernel loader hashes in x86_load_linux
> 
>  target/i386/sev_i386.h |  12 ++++
>  hw/i386/x86.c          |  25 +++++++-
>  target/i386/sev-stub.c |   5 ++
>  target/i386/sev.c      | 137 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 178 insertions(+), 1 deletion(-)
> 
> 
> base-commit: f9baca549e44791be0dd98de15add3d8452a8af0
> 

