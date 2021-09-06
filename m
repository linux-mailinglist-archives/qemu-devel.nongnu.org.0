Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C8401C7B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:39:41 +0200 (CEST)
Received: from localhost ([::1]:40014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEqa-0006ic-5n
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNERG-00069L-5C
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:13:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNERD-0000ls-2X
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630934005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JAZIUusdaTCGHxSHpxbiW+xC+QInLYiAqjVq8O1dBEs=;
 b=XBPjTqRs+2N8fXjow195JiAInU8ZAG/8GTF9F2fHJLOCrVRI5ds5SNZTJilBjIhuPtcyqK
 zbLqEAr3XYcQ0H+uU5NT2W+TMI7cT/TsxZzdALUsLoMEmJUh8j185Wo1v80yb39mRzPXv9
 dozLw2crOLbaMOSPTiV8MbQ1pSb4QdA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-XXbQ7m8qNWqU8wNDI0LHrw-1; Mon, 06 Sep 2021 09:13:21 -0400
X-MC-Unique: XXbQ7m8qNWqU8wNDI0LHrw-1
Received: by mail-pg1-f198.google.com with SMTP id
 v33-20020a634821000000b002530e4cca7bso4939456pga.10
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JAZIUusdaTCGHxSHpxbiW+xC+QInLYiAqjVq8O1dBEs=;
 b=hj9MqiL2niLB4KWvXBTmoDkWDucQ+gNnDHe1IWuWQB2UXY09Q7be5+wdyXK7e+8BCt
 gShUR88yoeVx7a5N19Ibt9aP2ySey5xHWcDAgwyJ42Xd5kDMyUyYEk6s/sDoY4MzDQKk
 DZb+8RdKgqXuaF/yJj5vmBvJlgUg34lBkRsyv+AT9aMCUysFuhzJqHBjO4Y2i3chMRhu
 B5VC0Nmz0E+vVBd5125WjMOBW5WiJztYMsA8d57P72CJkfD5Cm/PL0GA8SH+F2JsDSHu
 BoVZrUR8HJ5MmYv8zj7AxgMFefnHirKD9BC79e3HfAJ0uzIUbyfi8/rc4cyAVOqUw+uU
 4mRw==
X-Gm-Message-State: AOAM531lqTUE35tL9uu+vZLYn6dABelrhhYg8HHyHhMOY5Yv3O/WOllR
 ttqxgTPNmW0fhl9ToBz0rkWIRfqLEE80vWjf8PDNrEZ/46D/oTqgmJyH9S1Z9Y9DmuFZYKKjWeU
 tDQE1FDAMmcf/YFk975AS4k1oWCI5W4Q=
X-Received: by 2002:a63:d10b:: with SMTP id k11mr12485273pgg.26.1630934000395; 
 Mon, 06 Sep 2021 06:13:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX8pYXoEYfoeHBDP84pYaFz3xGUcb2OcwyZYVbUcakb/X6vXPIOwqJNajCC5iXdGG0tygxopGWi2PXVu+0/GY=
X-Received: by 2002:a63:d10b:: with SMTP id k11mr12485249pgg.26.1630933999968; 
 Mon, 06 Sep 2021 06:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210719112136.57018-1-yang.zhong@intel.com>
In-Reply-To: <20210719112136.57018-1-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 6 Sep 2021 15:13:08 +0200
Message-ID: <CABgObfYSXDvif5Rd8Bz-9VOjhj4sBai5msnwVySbXj6e1=Wa4A@mail.gmail.com>
Subject: Re: [PATCH v4 00/33] Qemu SGX virtualization
To: Yang Zhong <yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Sean Christopherson <seanjc@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, "Blake, Eric" <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Huang, Kai" <kai.huang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

the monitor patches did not pass the test-hmp qtest, and also they
should be in target/i386/monitor.c (see other commands that were
implemented there for SEV).  However, I've sent a pull request with
the rest.

Thanks,

Paolo

On Mon, Jul 19, 2021 at 1:27 PM Yang Zhong <yang.zhong@intel.com> wrote:
>
> Since Sean Christopherson has left Intel and i am responsible for Qemu SGX
> upstream work. His @intel.com address will be bouncing and his new email(
> seanjc@google.com) is also in CC lists.
>
> This series is Qemu SGX virtualization implementation rebased on latest
> Qemu release. The numa support for SGX will be sent in another patchset
> once this basic SGX patchset are merged.
>
> You can find Qemu repo here:
>
>     https://github.com/intel/qemu-sgx.git upstream
>
> If you want to try SGX, you can directly install the linux release(at least 5.13.0-rc1+)
> since kvm SGX has been merged into linux release.
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>
> To simplify, you'd better install linux on host and guest, which can support
> SGX on host and guest kernel. And to me, use below reference command to boot
> SGX guest:
>
>     #qemu-system-x86_64 \
>         ...... \
>         -cpu host,+sgx-provisionkey \
>         -object memory-backend-epc,id=mem1,size=64M,prealloc=on \
>         -object memory-backend-epc,id=mem2,size=28M \
>         -M sgx-epc.0.memdev=mem1,sgx-epc.1.memdev=mem2
>
> Overview
> ========
>
> Intel Software Guard eXtensions (SGX) is a set of instructions and mechanisms
> for memory accesses in order to provide security accesses for sensitive
> applications and data. SGX allows an application to use it's pariticular
> address space as an *enclave*, which is a protected area provides confidentiality
> and integrity even in the presence of privileged malware. Accesses to the
> enclave memory area from any software not resident in the enclave are prevented,
> including those from privileged software.
>
> SGX virtaulization
> ==================
>
> The KVM SGX creates one new misc device, sgx_vepc, and Qemu will open '/dev/sgx_vepc'
> device node to mmap() host EPC memory to guest. The Qemu also adds 'sgx-epc' device
> to expose EPC sections to guest through CPUID and ACPI table.  The Qemu SGX also
> supports multiple virtual EPC sections to guest, we just put them together physically
> contiguous for the sake of simplicity. The kernel SGX NUMA has been merged into Linux
> tip tree, we will support this function in the next phase.
>
> Although the current host SGX subsystem can not support SGX2 feature, the KVM/Qemu
> implementation still expose this feature to guest. Guest SGX2 support doesn't have
> interaction with host kernel SGX driver, the SGX guest can normally use those new
> instructions.
>
> As for SGX virtualization detailed infomation, please reference docs/intel-sgx.txt
> docuement(patch 33).
>
> Changelog:
> =========
>
> (Changelog here is for global changes, please see each patch's changelog for changes
> made to specific patch.)
>
> v3-->v4:
>    - Rebased the sgx patches into latest Qemu release.
>    - Moved sgx compound property setter/getter from MachineState to X86MachineState(Paolo).
>    - Re-defined struct SgxEPC, removed 'id' property and added struct SgxEPCList for
>      sgx-epc.0.{memdev}(Paolo).
>    - Removed g_malloc0(), and changed the 'SGXEPCState *sgx_epc' to 'SGXEPCState sgx_epc'
>      in struct PCMachineState(Paolo).
>    - Changed the SGX compound property cmdline from sgx-epc.{memdev}.0 to
>      sgx-epc.0.{memdev}(Paolo).
>    - Removed the signature from the 'git format-patch' command(Jarkko).
>
> v2-->v3:
>    - Rebased the sgx patches into latest Qemu release.
>    - Implemented the compound property for SGX, ref patch5, the command from '-sgx-epc'
>      to '-M'(Paolo).
>    - Moved the sgx common code from sgx-epc.c to sgx.c. The sgx-epc.c is
>      only responsible for virtual epc device.
>    - Removed the previous patch13(linux-headers: Add placeholder for KVM_CAP_SGX_ATTRIBUTE)
>      because ehabkost@redhat.com updated Linux headers to 5.13-rc4 with commit 278f064e452.
>    - Updated the patch1 because ram_flags were changed by David Hildenbra.
>    - Added one patch24, which avoid reset operation caused by bios reset.
>    - Added one patch25, which make prealloc property consistent with Qemu cmdline during VM
>      reset.
>
> v1-->v2:
>    - Rebased the sgx patches into latest Qemu release.
>    - Unified the "share" and "protected" arguments with ram_flags in the
>      memory_region_init_ram_from_fd()(Paolo).
>    - Added the new MemoryBackendEpcProperties and related documents(Eric Blake).
>    - Changed the KVM_CAP_SGX_ATTRIBUTE from 195 to 196(Kai).
>    - Changed the version and some grammar issues(Eric Blake).
>
> Sean Christopherson (21):
>   memory: Add RAM_PROTECTED flag to skip IOMMU mappings
>   hostmem: Add hostmem-epc as a backend for SGX EPC
>   i386: Add 'sgx-epc' device to expose EPC sections to guest
>   vl: Add sgx compound properties to expose SGX EPC sections to guest
>   i386: Add primary SGX CPUID and MSR defines
>   i386: Add SGX CPUID leaf FEAT_SGX_12_0_EAX
>   i386: Add SGX CPUID leaf FEAT_SGX_12_0_EBX
>   i386: Add SGX CPUID leaf FEAT_SGX_12_1_EAX
>   i386: Add get/set/migrate support for SGX_LEPUBKEYHASH MSRs
>   i386: Add feature control MSR dependency when SGX is enabled
>   i386: Update SGX CPUID info according to hardware/KVM/user input
>   i386: kvm: Add support for exposing PROVISIONKEY to guest
>   i386: Propagate SGX CPUID sub-leafs to KVM
>   Adjust min CPUID level to 0x12 when SGX is enabled
>   hw/i386/fw_cfg: Set SGX bits in feature control fw_cfg accordingly
>   hw/i386/pc: Account for SGX EPC sections when calculating device
>     memory
>   i386/pc: Add e820 entry for SGX EPC section(s)
>   i386: acpi: Add SGX EPC entry to ACPI tables
>   q35: Add support for SGX EPC
>   i440fx: Add support for SGX EPC
>   doc: Add the SGX doc
>
> Yang Zhong (12):
>   qom: Add memory-backend-epc ObjectOptions support
>   hostmem-epc: Add the reset interface for EPC backend reset
>   sgx-epc: Add the reset interface for sgx-epc virt device
>   sgx-epc: Avoid bios reset during sgx epc initialization
>   hostmem-epc: Make prealloc consistent with qemu cmdline during reset
>   qmp: Add query-sgx command
>   hmp: Add 'info sgx' command
>   i386: Add sgx_get_info() interface
>   bitops: Support 32 and 64 bit mask macro
>   qmp: Add the qmp_query_sgx_capabilities()
>   Kconfig: Add CONFIG_SGX support
>   sgx-epc: Add the fill_device_info() callback support
>
>  backends/hostmem-epc.c                   | 118 ++++++++++
>  backends/meson.build                     |   1 +
>  configs/devices/i386-softmmu/default.mak |   1 +
>  docs/intel-sgx.txt                       | 167 ++++++++++++++
>  hmp-commands-info.hx                     |  15 ++
>  hw/i386/Kconfig                          |   5 +
>  hw/i386/acpi-build.c                     |  22 ++
>  hw/i386/fw_cfg.c                         |  10 +-
>  hw/i386/meson.build                      |   2 +
>  hw/i386/pc.c                             |  15 +-
>  hw/i386/pc_piix.c                        |   4 +
>  hw/i386/pc_q35.c                         |   3 +
>  hw/i386/sgx-epc.c                        | 265 +++++++++++++++++++++++
>  hw/i386/sgx-stub.c                       |  13 ++
>  hw/i386/sgx.c                            | 170 +++++++++++++++
>  hw/i386/x86.c                            |  29 +++
>  hw/vfio/common.c                         |   1 +
>  include/exec/memory.h                    |  15 +-
>  include/hw/i386/pc.h                     |  10 +
>  include/hw/i386/sgx-epc.h                |  68 ++++++
>  include/hw/i386/x86.h                    |   1 +
>  include/monitor/hmp.h                    |   1 +
>  include/qemu/bitops.h                    |   7 +
>  monitor/hmp-cmds.c                       |  32 +++
>  monitor/qmp-cmds.c                       |  19 ++
>  qapi/machine.json                        |  52 ++++-
>  qapi/misc.json                           |  61 ++++++
>  qapi/qom.json                            |  19 ++
>  qemu-options.hx                          |  10 +-
>  softmmu/memory.c                         |   5 +
>  softmmu/physmem.c                        |   3 +-
>  stubs/meson.build                        |   1 +
>  stubs/sgx-stub.c                         |  12 +
>  target/i386/cpu.c                        | 168 +++++++++++++-
>  target/i386/cpu.h                        |  16 ++
>  target/i386/kvm/kvm.c                    |  75 +++++++
>  target/i386/kvm/kvm_i386.h               |   2 +
>  target/i386/machine.c                    |  20 ++
>  tests/qtest/qmp-cmd-test.c               |   2 +
>  39 files changed, 1430 insertions(+), 10 deletions(-)
>  create mode 100644 backends/hostmem-epc.c
>  create mode 100644 docs/intel-sgx.txt
>  create mode 100644 hw/i386/sgx-epc.c
>  create mode 100644 hw/i386/sgx-stub.c
>  create mode 100644 hw/i386/sgx.c
>  create mode 100644 include/hw/i386/sgx-epc.h
>  create mode 100644 stubs/sgx-stub.c
>


