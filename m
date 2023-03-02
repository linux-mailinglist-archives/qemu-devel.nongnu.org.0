Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2596A8238
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:31:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5N-0007QS-55; Thu, 02 Mar 2023 07:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi53-0007Q1-9Y
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:30:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi51-0002nC-5C
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:30:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QOAFfyzK3LYtV3U6IqCUZ6v6cUw+epOurmn/9832ugI=;
 b=dvOpomdZJR/COzX0OmWJ3STwGdCrmIrup9pnlSuMMFSYTVA9CeeZ/SitHQFbUZwQ/yvn92
 50YAcGIwKlJkX0+r/dwKc8n+Rr1BwKy+gN9rCIMe5lmaOBS4L1vhwrP9UXG6w3XCqeLYKb
 l1wW4lsXovkmIIus3Pg+1QWBKQ8eZTo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-SEMYKkEaOsisOxY41a3DnQ-1; Thu, 02 Mar 2023 07:30:35 -0500
X-MC-Unique: SEMYKkEaOsisOxY41a3DnQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 u19-20020a05600c00d300b003eb24ce58ceso5684782wmm.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QOAFfyzK3LYtV3U6IqCUZ6v6cUw+epOurmn/9832ugI=;
 b=5xWlVhOqw+dSvTm9IX61B3nu7KVKUBWl3PNB4OtWwc3G2vErvfG8Q/ht3aUMw0bBcn
 1+9kqgb9wRAVim2zecuP9GE5mzUKFVMj+xOLze8B1rCo39xW4j4o5LnyLq1AoKsqYCQy
 NUbOUx4tf4XB8Ewb6YTvrVw7kVybyoVbKFLT5Kc8aNINGL6sswVHBsCekoi+M/FAwL+D
 23HfHLCYU4vlr6wqFK8sqSDlEBbZFs+CzAXY4dtvv3Afah+fcUNeP73Y9+R20QA9i9zo
 DUm62mu3V9/lwkhq5B07HDiv/Pg158SMs+0wGNM9hWMmOJqBS1Dt4KBbgM7VtXubUjFf
 OfZA==
X-Gm-Message-State: AO0yUKUqPkpcazVtZi/i4uPZs8C2Vfs4T01cOj6FabTNOW2rfU6F0U+0
 oz236u3vg5DDD3IyA2wUVBUmW/KH3LVqJEFhTO55TdlDpa+MnAcH/di2XBVREkxaK2nXZBavXDw
 ZVBUWBnuzv1vbNBs2rfB5WI7Ln2IX2ATecXPODDdXrYCEhDa8l4Akl4k8Xnhx0I00pavplUlqSC
 w=
X-Received: by 2002:a5d:6388:0:b0:2c5:4cd0:4b86 with SMTP id
 p8-20020a5d6388000000b002c54cd04b86mr7297811wru.68.1677760233470; 
 Thu, 02 Mar 2023 04:30:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+t8ybnXa7ug0PnRbZzf4WN1qKufT/WMiIKb+sacD7QR1Omk49BURB9dYmC4Yyt1simJaAOBQ==
X-Received: by 2002:a5d:6388:0:b0:2c5:4cd0:4b86 with SMTP id
 p8-20020a5d6388000000b002c54cd04b86mr7297793wru.68.1677760232972; 
 Thu, 02 Mar 2023 04:30:32 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s17-20020adff811000000b002c758fe9689sm15130617wrp.52.2023.03.02.04.30.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:30:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/62] i386, misc changes for QEMU 8.0 soft freeze
Date: Thu,  2 Mar 2023 13:29:27 +0100
Message-Id: <20230302123029.153265-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:

  Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 526947e496e4447d74b8d42415e2847481c5043d:

  Merge branch 'xenfv-kvm-15' of git://git.infradead.org/users/dwmw2/qemu into HEAD (2023-03-01 15:02:13 +0100)

----------------------------------------------------------------
* bugfixes
* Core Xen emulation support for KVM/x86

----------------------------------------------------------------
Ankur Arora (2):
      i386/xen: implement HVMOP_set_evtchn_upcall_vector
      i386/xen: implement HVMOP_set_param

David Woodhouse (40):
      xen: add CONFIG_XEN_BUS and CONFIG_XEN_EMU options for Xen emulation
      xen: Add XEN_DISABLED mode and make it default
      i386/kvm: Add xen-version KVM accelerator property and init KVM Xen support
      i386/kvm: Set Xen vCPU ID in KVM
      i386/xen: Implement SCHEDOP_poll and SCHEDOP_yield
      hw/xen: Add xen_overlay device for emulating shared xenheap pages
      i386/xen: add pc_machine_kvm_type to initialize XEN_EMULATE mode
      i386/xen: manage and save/restore Xen guest long_mode setting
      i386/xen: implement XENMEM_add_to_physmap_batch
      hw/xen: Add xen_evtchn device for event channel emulation
      i386/xen: Add support for Xen event channel delivery to vCPU
      hw/xen: Implement EVTCHNOP_status
      hw/xen: Implement EVTCHNOP_close
      hw/xen: Implement EVTCHNOP_unmask
      hw/xen: Implement EVTCHNOP_bind_virq
      hw/xen: Implement EVTCHNOP_bind_ipi
      hw/xen: Implement EVTCHNOP_send
      hw/xen: Implement EVTCHNOP_alloc_unbound
      hw/xen: Implement EVTCHNOP_bind_interdomain
      hw/xen: Implement EVTCHNOP_bind_vcpu
      hw/xen: Implement EVTCHNOP_reset
      hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback
      hw/xen: Support HVM_PARAM_CALLBACK_TYPE_PCI_INTX callback
      kvm/i386: Add xen-gnttab-max-frames property
      hw/xen: Add xen_gnttab device for grant table emulation
      hw/xen: Support mapping grant frames
      i386/xen: Implement HYPERVISOR_grant_table_op and GNTTABOP_[gs]et_verson
      hw/xen: Implement GNTTABOP_query_size
      i386/xen: Reserve Xen special pages for console, xenstore rings
      hw/xen: Add backend implementation of interdomain event channel support
      hw/xen: Add xen_xenstore device for xenstore emulation
      hw/xen: Add basic ring handling to xenstore
      hw/xen: Automatically add xen-platform PCI device for emulated Xen guests
      i386/xen: Implement HYPERVISOR_physdev_op
      hw/xen: Implement emulated PIRQ hypercall support
      hw/xen: Support GSI mapping to PIRQ
      hw/xen: Support MSI mapping to PIRQ
      kvm/i386: Add xen-evtchn-max-pirq property
      i386/xen: Document Xen HVM emulation
      hw/xen: Subsume xen_be_register_common() into xen_be_init()

Joao Martins (17):
      include: import Xen public headers to hw/xen/interface
      i386/kvm: handle Xen HVM cpuid leaves
      xen-platform: exclude vfio-pci from the PCI platform unplug
      xen-platform: allow its creation with XEN_EMULATE mode
      i386/xen: handle guest hypercalls
      i386/xen: implement HYPERVISOR_xen_version
      i386/xen: implement HYPERVISOR_sched_op, SCHEDOP_shutdown
      i386/xen: implement HYPERVISOR_memory_op
      i386/xen: implement HYPERVISOR_hvm_op
      i386/xen: implement HYPERVISOR_vcpu_op
      i386/xen: handle VCPUOP_register_vcpu_info
      i386/xen: handle VCPUOP_register_vcpu_time_info
      i386/xen: handle VCPUOP_register_runstate_memory_area
      i386/xen: implement HYPERVISOR_event_channel_op
      i386/xen: add monitor commands to test event injection
      i386/xen: handle PV timer hypercalls
      i386/xen: handle HVMOP_get_param

Juan Quintela (1):
      Makefile: qemu-bundle is a directory

Paolo Bonzini (1):
      Merge branch 'xenfv-kvm-15' of git://git.infradead.org/users/dwmw2/qemu into HEAD

Paul Durrant (1):
      xen: Permit --xen-domid argument when accel is KVM

Peter Krempa (1):
      qapi: Add 'acpi' field to 'query-machines' output

 Makefile                                       |    4 +-
 accel/kvm/kvm-all.c                            |    3 +
 accel/xen/xen-all.c                            |    2 +
 docs/system/i386/xen.rst                       |   76 +
 docs/system/target-i386.rst                    |    1 +
 hmp-commands.hx                                |   29 +
 hw/Kconfig                                     |    1 +
 hw/core/machine-qmp-cmds.c                     |    1 +
 hw/i386/Kconfig                                |    5 +
 hw/i386/kvm/meson.build                        |   13 +
 hw/i386/kvm/trace-events                       |    5 +
 hw/i386/kvm/trace.h                            |    1 +
 hw/i386/kvm/xen-stubs.c                        |   44 +
 hw/i386/kvm/xen_evtchn.c                       | 2341 ++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h                       |   88 +
 hw/i386/kvm/xen_gnttab.c                       |  232 +++
 hw/i386/kvm/xen_gnttab.h                       |   25 +
 hw/i386/kvm/xen_overlay.c                      |  272 +++
 hw/i386/kvm/xen_overlay.h                      |   26 +
 hw/i386/kvm/xen_xenstore.c                     |  500 +++++
 hw/i386/kvm/xen_xenstore.h                     |   20 +
 hw/i386/pc.c                                   |   26 +
 hw/i386/x86.c                                  |   16 +
 hw/i386/xen/meson.build                        |    5 +-
 hw/i386/xen/xen-hvm.c                          |    8 +-
 hw/i386/xen/xen_platform.c                     |   57 +-
 hw/pci/msi.c                                   |   11 +
 hw/pci/msix.c                                  |    9 +
 hw/pci/pci.c                                   |   17 +
 hw/xen/Kconfig                                 |    3 +
 hw/xen/xen-legacy-backend.c                    |   56 +-
 hw/xenpv/xen_machine_pv.c                      |    6 +-
 include/hw/i386/pc.h                           |    3 +
 include/hw/pci/msi.h                           |    1 +
 include/hw/xen/interface/arch-arm.h            |  510 ++++++
 include/hw/xen/interface/arch-x86/cpuid.h      |  118 ++
 include/hw/xen/interface/arch-x86/xen-x86_32.h |  194 ++
 include/hw/xen/interface/arch-x86/xen-x86_64.h |  241 +++
 include/hw/xen/interface/arch-x86/xen.h        |  398 ++++
 include/hw/xen/interface/event_channel.h       |  388 ++++
 include/hw/xen/interface/features.h            |  143 ++
 include/hw/xen/interface/grant_table.h         |  650 +++++++
 include/hw/xen/interface/hvm/hvm_op.h          |  395 ++++
 include/hw/xen/interface/hvm/params.h          |  318 ++++
 include/hw/xen/interface/io/blkif.h            |   14 +-
 include/hw/xen/interface/io/console.h          |   10 +
 include/hw/xen/interface/io/fbif.h             |   20 +
 include/hw/xen/interface/io/kbdif.h            |   10 +
 include/hw/xen/interface/io/netif.h            |   94 +-
 include/hw/xen/interface/io/ring.h             |   99 +-
 include/hw/xen/interface/io/usbif.h            |  353 +++-
 include/hw/xen/interface/io/xenbus.h           |   10 +
 include/hw/xen/interface/io/xs_wire.h          |  153 ++
 include/hw/xen/interface/memory.h              |  754 ++++++++
 include/hw/xen/interface/physdev.h             |  383 ++++
 include/hw/xen/interface/sched.h               |  202 ++
 include/hw/xen/interface/trace.h               |  341 ++++
 include/hw/xen/interface/vcpu.h                |  248 +++
 include/hw/xen/interface/version.h             |  113 ++
 include/hw/xen/interface/xen-compat.h          |   46 +
 include/hw/xen/interface/xen.h                 | 1049 +++++++++++
 include/hw/xen/xen-legacy-backend.h            |    3 +-
 include/hw/xen/xen.h                           |   21 +-
 include/monitor/hmp.h                          |    2 +
 include/sysemu/kvm_int.h                       |    4 +
 include/sysemu/kvm_xen.h                       |   43 +
 meson.build                                    |    2 +
 qapi/machine.json                              |    4 +-
 qapi/misc-target.json                          |  116 ++
 softmmu/globals.c                              |    2 +-
 softmmu/vl.c                                   |    2 +-
 target/i386/cpu.c                              |    1 +
 target/i386/cpu.h                              |   19 +
 target/i386/kvm/kvm.c                          |  259 ++-
 target/i386/kvm/kvm_i386.h                     |    2 +
 target/i386/kvm/meson.build                    |    2 +
 target/i386/kvm/trace-events                   |    7 +
 target/i386/kvm/xen-compat.h                   |   70 +
 target/i386/kvm/xen-emu.c                      | 1897 +++++++++++++++++++
 target/i386/kvm/xen-emu.h                      |   33 +
 target/i386/machine.c                          |   25 +
 tests/qtest/qmp-cmd-test.c                     |    1 +
 82 files changed, 13465 insertions(+), 211 deletions(-)
 create mode 100644 docs/system/i386/xen.rst
 create mode 100644 hw/i386/kvm/trace-events
 create mode 100644 hw/i386/kvm/trace.h
 create mode 100644 hw/i386/kvm/xen-stubs.c
 create mode 100644 hw/i386/kvm/xen_evtchn.c
 create mode 100644 hw/i386/kvm/xen_evtchn.h
 create mode 100644 hw/i386/kvm/xen_gnttab.c
 create mode 100644 hw/i386/kvm/xen_gnttab.h
 create mode 100644 hw/i386/kvm/xen_overlay.c
 create mode 100644 hw/i386/kvm/xen_overlay.h
 create mode 100644 hw/i386/kvm/xen_xenstore.c
 create mode 100644 hw/i386/kvm/xen_xenstore.h
 create mode 100644 hw/xen/Kconfig
 create mode 100644 include/hw/xen/interface/arch-arm.h
 create mode 100644 include/hw/xen/interface/arch-x86/cpuid.h
 create mode 100644 include/hw/xen/interface/arch-x86/xen-x86_32.h
 create mode 100644 include/hw/xen/interface/arch-x86/xen-x86_64.h
 create mode 100644 include/hw/xen/interface/arch-x86/xen.h
 create mode 100644 include/hw/xen/interface/event_channel.h
 create mode 100644 include/hw/xen/interface/features.h
 create mode 100644 include/hw/xen/interface/hvm/hvm_op.h
 create mode 100644 include/hw/xen/interface/hvm/params.h
 create mode 100644 include/hw/xen/interface/io/xs_wire.h
 create mode 100644 include/hw/xen/interface/memory.h
 create mode 100644 include/hw/xen/interface/physdev.h
 create mode 100644 include/hw/xen/interface/sched.h
 create mode 100644 include/hw/xen/interface/trace.h
 create mode 100644 include/hw/xen/interface/vcpu.h
 create mode 100644 include/hw/xen/interface/version.h
 create mode 100644 include/hw/xen/interface/xen-compat.h
 create mode 100644 include/hw/xen/interface/xen.h
 create mode 100644 include/sysemu/kvm_xen.h
 create mode 100644 target/i386/kvm/xen-compat.h
 create mode 100644 target/i386/kvm/xen-emu.c
 create mode 100644 target/i386/kvm/xen-emu.h
-- 
2.39.1


