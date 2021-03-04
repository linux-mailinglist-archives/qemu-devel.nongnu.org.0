Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F232CF51
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 10:12:50 +0100 (CET)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHk2K-0005S0-QK
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 04:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHk0W-0004kb-1f
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 04:10:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHk0Q-00059O-0z
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 04:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614849048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNspSEEEEt1TgxVxApN+4R0rLHM144GklV0nKnHu0ew=;
 b=YyfsEnbVu0AFMtCC4rQfJ4g2TEAhfn8hiOHacOX+m88NML997QN5oJF7J/+x5CgQIgWNOu
 Jzg5uX93vUP0Dod+YS9vb3SMYt+ITIIWyVSnh0gg1jXPN09qFRJ/5pxz8EYWgBWNfZ7JRT
 zz1Ll5HY93Je2ylk1rG8KKBDTjMSDyc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-6TUZ8AKiOTG8natyzk9FWw-1; Thu, 04 Mar 2021 04:10:46 -0500
X-MC-Unique: 6TUZ8AKiOTG8natyzk9FWw-1
Received: by mail-wr1-f69.google.com with SMTP id b15so12460131wrm.1
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 01:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kNspSEEEEt1TgxVxApN+4R0rLHM144GklV0nKnHu0ew=;
 b=aI3hT7z6ITGi/PjP8IkaY7mJzPCXX5bPvYdEK2kdqluq7aQqeV9XjrlCISghESG8Fz
 CUE7fy2cpeIx+k8PqWSaLAo2z3cK/QZQb3Wm0F/Id4oVlomZuvsAOEEwRnTYtCwIJD0g
 2yOO4HA+46zzKBTrq3IbvasrGjW8IZBscgzvvQ+2Qu5rvu7ArVA+m3/G6DNQC0nHV2rm
 VbneIDliMnbkLmkdw2CalDNKZMx+coiEEmBfIP8Kzb+tbtRGZ41z3nWfcFLTk7WfApGy
 Dk+BRAKezhYEFeajtlQyncc7sCwssIW255F5OIW6lVIg7rhML5Ik92ZPi6iyVGkNhyR3
 konw==
X-Gm-Message-State: AOAM533JYKmosPkjq3GCwrmqZVmZvoH0B9ash9h0LzpuCN4ZyF0aNgbp
 /ISBsD85eTY/3yltz6dbD5d8ccY7hwoHB+npY/yw5W6czP+LMJ/0HVfpvTUUdw6VH7YDRbfpbYh
 L5QrBFwnnx3K0Atk=
X-Received: by 2002:adf:ab52:: with SMTP id r18mr2902230wrc.65.1614849045182; 
 Thu, 04 Mar 2021 01:10:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZkvKMpZMyyah5meZkHKmALsuSvGMFPFP3VQz3JSXecEG1Ps1Chrg/cGp26155YDuqn6YWCQ==
X-Received: by 2002:adf:ab52:: with SMTP id r18mr2902202wrc.65.1614849044912; 
 Thu, 04 Mar 2021 01:10:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p18sm29818357wro.18.2021.03.04.01.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 01:10:44 -0800 (PST)
Subject: Re: [RFC PATCH 00/26] Confidential guest live migration
To: Dov Murik <dovmurik@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0b30ef0c-bc00-339b-3c10-85cbf7dfbedf@redhat.com>
Date: Thu, 4 Mar 2021 10:10:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Jon Grimm <jon.grimm@amd.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/21 21:47, Dov Murik wrote:
> In order to allow OVMF to run the migration helper in parallel to the
> guest OS, we introduce the notion of auxiliary vcpus, which are usable
> for OVMF but are hidden from the guest OS.  These might have other
> future uses for in-guest operations/agents.

Hi Dov,

I think the helper approach to migration in general is great, but I'm 
not sure I agree with the concept of auxiliary vCPUs.  I would rather 
have a completely separate VM file descriptor that does not even go 
through the regular KVM run loop.  Patches were posted recently to the 
KVM mailing list to create secondary VMs sharing the encryption context 
(ASID) with a primary VM.

When starting the VM, the firmware would proceed with attestation as 
usual, detect it was running as a migration helper VM during the SEC 
phase, and divert execution to the migration helper instead of 
continuing with PEI.

The main advantage would be that the migration VM would not have to 
share the address space with the primary VM.  This would allow migrating 
encrypted RAM areas that are not visible to the primary VM, for example 
PCI BARs (those areas would be a problem for the kernel migration bitmap 
though; I'll remark on that separately on Ashish's KVM series).

The VM would not even have an interrupt controller, so that HLT exits to 
the host when it's done processing the mailbox.  This would make it much 
simpler to audit both the QEMU and the firmware sides.

Paolo

> In the target VM we need the migration handler running to receive
> incoming RAM pages; to achieve that, we boot the VM into OVMF with a
> special fw_cfg value that causes OVMF to not boot the guest OS; we then
> allow QEMU to receive an incoming migration by issuing a new
> start-migrate-incoming QMP command.
> 
> The confidential RAM migration requires checking whether a given guest
> RAM page is encrypted or not.  This is currently achieved using AMD's
> patches which track the encryption status of guest pages in KVM, using
> hypercalls from OVMF and guest Linux to report changes of such status.
> The QEMU side of these patches is included as the first two patches in
> this series.  The concrete implementation of this page encryption tracking
> is currently in flux in the KVM mailing list, but the underlying
> implementation doesn't affect our confidential RAM migration as long as
> it can check whether a given guest address is encrypted.
> 
> List of patches in this series:
> 
> 1-2: reposting AMD encrypted page bitmap support.
> 3-11: introduce the notion of auxiliary vcpus.
> 12-21: introduce the migration specifics.
> 22-23: fix devices issues when loading state into a live VM
> 24: introduce the start-migrate-incoming QMP command to switch the
> target into accepting the incoming migration.
> 25: remove SEV migration blocker
> 26: add documentation
> 
> 
> Brijesh Singh (1):
>    kvm: add support to sync the page encryption state bitmap
> 
> Dov Murik (21):
>    linux-headers: Add definitions of KVM page encryption bitmap ioctls
>    machine: Add auxcpus=N suboption to -smp
>    hw/boards: Add aux flag to CPUArchId
>    hw/i386: Mark auxiliary vcpus in possible_cpus
>    cpu: Add boolean aux field to CPUState
>    hw/i386: Set CPUState.aux=true for auxiliary vcpus
>    softmmu: Don't sync aux vcpus in pre_loadvm
>    softmmu: Add cpu_synchronize_without_aux_post_init
>    migration: Add helpers to save confidential RAM
>    migration: Add helpers to load confidential RAM
>    migration: Introduce gpa_inside_migration_helper_shared_area
>    migration: Save confidential guest RAM using migration helper
>    migration: Load confidential guest RAM using migration helper
>    migration: Stop VM after loading confidential RAM
>    migration: Don't sync vcpus when migrating confidential guests
>    migration: When starting target, don't sync auxiliary vcpus
>    hw/isa/lpc_ich9: Allow updating an already-running VM
>    target/i386: Re-sync kvm-clock after confidential guest migration
>    migration: Add start-migrate-incoming QMP command
>    target/i386: SEV: Allow migration unless there are no aux vcpus
>    docs: Add confidential guest live migration documentation
> 
> Tobin Feldman-Fitzthum (4):
>    hw/acpi: Don't include auxiliary vcpus in ACPI tables
>    softmmu: Add pause_all_vcpus_except_aux
>    migration: Stop non-aux vcpus before copying the last pages
>    migration: Call migration handler cleanup routines
> 
>   docs/confidential-guest-live-migration.rst | 142 ++++++++++++
>   docs/confidential-guest-support.txt        |   5 +
>   docs/index.rst                             |   1 +
>   qapi/migration.json                        |  26 +++
>   include/exec/ram_addr.h                    | 197 ++++++++++++++++
>   include/exec/ramblock.h                    |   3 +
>   include/exec/ramlist.h                     |   3 +-
>   include/hw/boards.h                        |   3 +
>   include/hw/core/cpu.h                      |   2 +
>   include/hw/i386/x86.h                      |   2 +-
>   include/sysemu/cpus.h                      |   2 +
>   linux-headers/linux/kvm.h                  |  13 ++
>   migration/confidential-ram.h               |  23 ++
>   accel/kvm/kvm-all.c                        |  43 ++++
>   hw/acpi/cpu.c                              |  10 +
>   hw/core/cpu.c                              |   1 +
>   hw/core/machine.c                          |   7 +
>   hw/i386/acpi-build.c                       |   5 +
>   hw/i386/acpi-common.c                      |   5 +
>   hw/i386/pc.c                               |   7 +
>   hw/i386/x86.c                              |  10 +-
>   hw/isa/lpc_ich9.c                          |   3 +-
>   migration/confidential-ram.c               | 258 +++++++++++++++++++++
>   migration/migration.c                      |  18 +-
>   migration/ram.c                            | 135 ++++++++++-
>   migration/savevm.c                         |  13 +-
>   softmmu/cpus.c                             |  68 +++++-
>   softmmu/runstate.c                         |   1 +
>   softmmu/vl.c                               |   3 +
>   target/i386/machine.c                      |   9 +
>   target/i386/sev.c                          |  25 +-
>   migration/meson.build                      |   6 +-
>   migration/trace-events                     |   4 +
>   33 files changed, 1027 insertions(+), 26 deletions(-)
>   create mode 100644 docs/confidential-guest-live-migration.rst
>   create mode 100644 migration/confidential-ram.h
>   create mode 100644 migration/confidential-ram.c
> 
> 
> base-commit: 00d8ba9e0d62ea1c7459c25aeabf9c8bb7659462
> 


