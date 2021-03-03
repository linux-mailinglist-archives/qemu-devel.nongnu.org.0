Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987532B5EF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 09:31:13 +0100 (CET)
Received: from localhost ([::1]:39522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHMuW-0003RV-AH
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 03:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHMtX-0002vx-ET
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:30:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9120
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHMtU-0001eb-Oc
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 03:30:11 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1238RNZu080750; Wed, 3 Mar 2021 03:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=SlibtslHDGIFsXMiWLSGvLQO7K+Op/Bg8hQRtYgnLhk=;
 b=e7sviFuB/qOY5jBBvfZmgojnkdur2ZcYIwgzqN8HTX+NBMvgwoPV+Rm53oVJsMU59nWA
 0DxCwVAsvtmy54BiWCzMxbLWfOLu/M3NjX6kq5mSErPQyZN4YiG+viEJ1ys+y6N8zwt9
 +RyZxQbSlC8fByDiBNbk4m6hfrWZc/Y30iiYIqLXSusn9RFAghBKrpCxWrxOtrg/3/7U
 q2gn3qbaRJ6HIPPxG5PvVYcT+hYORKOwCqo+zeqSOM2oMiwee9etwTKKIwvRKXNxOFaX
 2O9EyA1eaO4rpq1UhT1Z5qyapYKXzSXfMjvXUWDxVRUrw/mi5k06/PjA7qklWjDT7jEW EA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3726y60181-14
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 03:30:05 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 12387VKZ008353;
 Wed, 3 Mar 2021 08:09:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 371162hmf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 08:09:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12388wbp38797676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Mar 2021 08:08:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBAACAE053;
 Wed,  3 Mar 2021 08:08:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 581A8AE051;
 Wed,  3 Mar 2021 08:08:56 +0000 (GMT)
Received: from [9.160.115.38] (unknown [9.160.115.38])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Mar 2021 08:08:56 +0000 (GMT)
Subject: Re: [RFC PATCH 00/26] Confidential guest live migration
To: qemu-devel@nongnu.org
References: <161472028683.13544.5012369094419568504@c667a6b167f6>
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
Message-ID: <c0fbff97-1ab8-8f66-ef6b-77963d1b6826@linux.vnet.ibm.com>
Date: Wed, 3 Mar 2021 10:08:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <161472028683.13544.5012369094419568504@c667a6b167f6>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030061
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 jejb@linux.ibm.com, jon.grimm@amd.com, tobin@ibm.com, tobin@linux.ibm.com,
 frankeh@us.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The errors reported below on patch 02/26 are due to rebasing an older patch
from AMD.  I didn't want to make any changes to the code (except make it compile
and run correctly) because this feature (encrypted pages bitmap) is still
work-in-progress (in KVM and QEMU).

-Dov

On 02/03/2021 23:24, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210302204822.81901-1-dovmurik@linux.vnet.ibm.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20210302204822.81901-1-dovmurik@linux.vnet.ibm.com
> Subject: [RFC PATCH 00/26] Confidential guest live migration
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  - [tag update]      patchew/20210302175524.1290840-1-berrange@redhat.com -> patchew/20210302175524.1290840-1-berrange@redhat.com
>  * [new tag]         patchew/20210302204822.81901-1-dovmurik@linux.vnet.ibm.com -> patchew/20210302204822.81901-1-dovmurik@linux.vnet.ibm.com
> Switched to a new branch 'test'
> f283a35 docs: Add confidential guest live migration documentation
> 08f3c3b target/i386: SEV: Allow migration unless there are no aux vcpus
> 99d1efb migration: Add start-migrate-incoming QMP command
> 6ca0894 target/i386: Re-sync kvm-clock after confidential guest migration
> 47e02a0 hw/isa/lpc_ich9: Allow updating an already-running VM
> af25d7b migration: Call migration handler cleanup routines
> 48db1fb migration: When starting target, don't sync auxiliary vcpus
> 5eb9336 migration: Don't sync vcpus when migrating confidential guests
> af9b2fa migration: Stop non-aux vcpus before copying the last pages
> 2789368 migration: Stop VM after loading confidential RAM
> 4692252 migration: Load confidential guest RAM using migration helper
> e041f58 migration: Save confidential guest RAM using migration helper
> 328a888 migration: Introduce gpa_inside_migration_helper_shared_area
> b71be10 migration: Add helpers to load confidential RAM
> 32bdb2e migration: Add helpers to save confidential RAM
> 8d2fccb softmmu: Add pause_all_vcpus_except_aux
> ed10484 softmmu: Add cpu_synchronize_without_aux_post_init
> e68df04 softmmu: Don't sync aux vcpus in pre_loadvm
> 17bfe19 hw/i386: Set CPUState.aux=true for auxiliary vcpus
> 808eb76 cpu: Add boolean aux field to CPUState
> 34d94b2 hw/acpi: Don't include auxiliary vcpus in ACPI tables
> 2e9bc24 hw/i386: Mark auxiliary vcpus in possible_cpus
> 3d07b10 hw/boards: Add aux flag to CPUArchId
> 0e07c01 machine: Add auxcpus=N suboption to -smp
> 49124f3 kvm: add support to sync the page encryption state bitmap
> 47f202b linux-headers: Add definitions of KVM page encryption bitmap ioctls
> 
> === OUTPUT BEGIN ===
> 1/26 Checking commit 47f202b0bc8c (linux-headers: Add definitions of KVM page encryption bitmap ioctls)
> 2/26 Checking commit 49124f3bf03f (kvm: add support to sync the page encryption state bitmap)
> ERROR: use qemu_real_host_page_size instead of getpagesize()
> #51: FILE: accel/kvm/kvm-all.c:615:
> +    ram_addr_t pages = int128_get64(section->size) / getpagesize();
> 
> ERROR: use qemu_real_host_page_size instead of getpagesize()
> #171: FILE: include/exec/ram_addr.h:398:
> +    unsigned long hpratio = getpagesize() / TARGET_PAGE_SIZE;
> 
> WARNING: line over 80 characters
> #197: FILE: include/exec/ram_addr.h:424:
> +                qatomic_xchg(&blocks[DIRTY_MEMORY_ENCRYPTED][idx][offset], temp);
> 
> total: 2 errors, 1 warnings, 340 lines checked
> 
> Patch 2/26 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> 3/26 Checking commit 0e07c0168e00 (machine: Add auxcpus=N suboption to -smp)
> 4/26 Checking commit 3d07b103b36f (hw/boards: Add aux flag to CPUArchId)
> 5/26 Checking commit 2e9bc24b9064 (hw/i386: Mark auxiliary vcpus in possible_cpus)
> 6/26 Checking commit 34d94b2baa07 (hw/acpi: Don't include auxiliary vcpus in ACPI tables)
> 7/26 Checking commit 808eb7693543 (cpu: Add boolean aux field to CPUState)
> 8/26 Checking commit 17bfe1902081 (hw/i386: Set CPUState.aux=true for auxiliary vcpus)
> WARNING: line over 80 characters
> #26: FILE: hw/i386/x86.c:104:
> +void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, bool aux, Error **errp)
> 
> WARNING: line over 80 characters
> #58: FILE: include/hw/i386/x86.h:88:
> +void x86_cpu_new(X86MachineState *pcms, int64_t apic_id, bool aux, Error **errp);
> 
> total: 0 errors, 2 warnings, 34 lines checked
> 
> Patch 8/26 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 9/26 Checking commit e68df046c12e (softmmu: Don't sync aux vcpus in pre_loadvm)
> 10/26 Checking commit ed104842e25d (softmmu: Add cpu_synchronize_without_aux_post_init)
> 11/26 Checking commit 8d2fccbd9cf9 (softmmu: Add pause_all_vcpus_except_aux)
> WARNING: Block comments use a leading /* on a separate line
> #88: FILE: softmmu/cpus.c:614:
> +    /* We need to drop the replay_lock so any vCPU threads woken up
> 
> total: 0 errors, 1 warnings, 78 lines checked
> 
> Patch 11/26 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 12/26 Checking commit 32bdb2e1c795 (migration: Add helpers to save confidential RAM)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #28: 
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 216 lines checked
> 
> Patch 12/26 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 13/26 Checking commit b71be10a582a (migration: Add helpers to load confidential RAM)
> 14/26 Checking commit 328a888fe8fd (migration: Introduce gpa_inside_migration_helper_shared_area)
> 15/26 Checking commit e041f580a1da (migration: Save confidential guest RAM using migration helper)
> 16/26 Checking commit 4692252e1994 (migration: Load confidential guest RAM using migration helper)
> WARNING: line over 80 characters
> #59: FILE: migration/ram.c:3990:
> +                error_report("%s: failed to get gpa for host %p", __func__, host);
> 
> total: 0 errors, 1 warnings, 43 lines checked
> 
> Patch 16/26 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 17/26 Checking commit 278936890c8d (migration: Stop VM after loading confidential RAM)
> WARNING: line over 80 characters
> #44: FILE: migration/confidential-ram.c:235:
> +static EndOfConfidentialRAMState end_of_confidential_ram_state = { .dummy = false };
> 
> total: 0 errors, 1 warnings, 67 lines checked
> 
> Patch 17/26 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 18/26 Checking commit af9b2fa4e956 (migration: Stop non-aux vcpus before copying the last pages)
> 19/26 Checking commit 5eb933666eda (migration: Don't sync vcpus when migrating confidential guests)
> 20/26 Checking commit 48db1fbc2c51 (migration: When starting target, don't sync auxiliary vcpus)
> 21/26 Checking commit af25d7bee8ac (migration: Call migration handler cleanup routines)
> 22/26 Checking commit 47e02a0e2441 (hw/isa/lpc_ich9: Allow updating an already-running VM)
> 23/26 Checking commit 6ca089420af2 (target/i386: Re-sync kvm-clock after confidential guest migration)
> 24/26 Checking commit 99d1efb7f73c (migration: Add start-migrate-incoming QMP command)
> 25/26 Checking commit 08f3c3b68478 (target/i386: SEV: Allow migration unless there are no aux vcpus)
> 26/26 Checking commit f283a35951da (docs: Add confidential guest live migration documentation)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #20: 
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 154 lines checked
> 
> Patch 26/26 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> The full log is available at
> http://patchew.org/logs/20210302204822.81901-1-dovmurik@linux.vnet.ibm.com/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 

