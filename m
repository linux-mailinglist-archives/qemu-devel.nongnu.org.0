Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19755258F97
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 15:55:36 +0200 (CEST)
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD6l5-0000Vy-4b
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 09:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kD6jn-0007Zg-50
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 09:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kD6jj-0001Pl-Mo
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 09:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598968450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XyB2C5TmOQEJIB6qidod7+m2ExK2e+nHyJIMJSAWxFU=;
 b=eT1Rf0b8/xI3neUkVX1GU1fk1GwTXt6+w5bt51LciJ4y+k3mRP/oN31rpzL8dy4nZCGCfP
 PbUc9TnWmWoKHTGJdsS9VFc1YFQ38J9qQXbY0hejjXqFyXv/vrOwOHZgmmNjFmgnjmu2Ka
 SCvXfvJCtXKQ1mIbW9fU3HliiqJlbPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-e1TQYtM4PNqWFjIooqCiTQ-1; Tue, 01 Sep 2020 09:54:09 -0400
X-MC-Unique: e1TQYtM4PNqWFjIooqCiTQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 466D3801AB6;
 Tue,  1 Sep 2020 13:54:07 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-114-76.ams2.redhat.com [10.36.114.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BBED7C549;
 Tue,  1 Sep 2020 13:53:45 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>
Subject: [RFC v7 0/5] memory: Delete assertion in
 memory_region_unregister_iommu_notifier
Date: Tue,  1 Sep 2020 15:53:38 +0200
Message-Id: <20200901135343.22136-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 23:17:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am able to hit this assertion when a Red Hat 7 guest virtio_net device
raises an "Invalidation" of all the TLB entries. This happens in the
guest's startup if 'intel_iommu=on' argument is passed to the guest
kernel and right IOMMU/ATS devices are declared in qemu's command line.

Command line:
/home/qemu/x86_64-softmmu/qemu-system-x86_64 -name \
guest=rhel7-test,debug-threads=on -machine \
pc-q35-5.1,accel=kvm,usb=off,dump-guest-core=off,kernel_irqchip=split \
-cpu \
Broadwell,vme=on,ss=on,vmx=on,f16c=on,rdrand=on,hypervisor=on,arat=on,tsc-adjust=on,umip=on,arch-capabilities=on,xsaveopt=on,pdpe1gb=on,abm=on,skip-l1dfl-vmentry=on,rtm=on,hle=on \
-m 8096 -realtime mlock=off -smp 2,sockets=2,cores=1,threads=1 -uuid \
d022ecbf-679e-4755-87ce-eb87fc5bbc5d -display none -no-user-config \
-nodefaults -rtc base=utc,driftfix=slew -global \
kvm-pit.lost_tick_policy=delay -no-hpet -no-shutdown -global \
ICH9-LPC.disable_s3=1 -global ICH9-LPC.disable_s4=1 -boot strict=on \
-device intel-iommu,intremap=on,device-iotlb=on -device \
pcie-root-port,port=0x8,chassis=1,id=pci.1,bus=pcie.0,multifunction=on,addr=0x1 \
-device \
pcie-root-port,port=0x9,chassis=2,id=pci.2,bus=pcie.0,addr=0x1.0x1 \
-device \
pcie-root-port,port=0xa,chassis=3,id=pci.3,bus=pcie.0,addr=0x1.0x2 \
-device \
pcie-root-port,port=0xb,chassis=4,id=pci.4,bus=pcie.0,addr=0x1.0x3 \
-device \
pcie-root-port,port=0xc,chassis=5,id=pci.5,bus=pcie.0,addr=0x1.0x4 \
-device \
pcie-root-port,port=0xd,chassis=6,id=pci.6,bus=pcie.0,addr=0x1.0x5 \
-device \
pcie-root-port,port=0xe,chassis=7,id=pci.7,bus=pcie.0,addr=0x1.0x6 \
-device qemu-xhci,p2=15,p3=15,id=usb,bus=pci.2,addr=0x0 -device \
virtio-serial-pci,id=virtio-serial0,bus=pci.3,addr=0x0 -drive \
file=/home/virtio-test2.qcow2,format=qcow2,if=none,id=drive-virtio-disk0 \
-device \
virtio-blk-pci,scsi=off,bus=pci.4,addr=0x0,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=1 \
-netdev tap,id=hostnet0,vhost=on,vhostforce=on -device \
virtio-net-pci,netdev=hostnet0,id=net0,mac=52:54:00:0d:1d:f2,bus=pci.1,addr=0x0,iommu_platform=on,ats=on \
-device virtio-balloon-pci,id=balloon0,bus=pci.5,addr=0x0 -object \
rng-random,id=objrng0,filename=/dev/urandom -device \
virtio-rng-pci,rng=objrng0,id=rng0,bus=pci.6,addr=0x0 -s -msg \
timestamp=on

Full backtrace:
#0  0x00007ffff521370f in raise () at /lib64/libc.so.6
#1  0x00007ffff51fdb25 in abort () at /lib64/libc.so.6
#2  0x00007ffff51fd9f9 in _nl_load_domain.cold.0 () at /lib64/libc.so.6
#3  0x00007ffff520bcc6 in .annobin_assert.c_end () at /lib64/libc.so.6
#4  0x0000555555888171 in memory_region_notify_one (notifier=0x7ffde0487fa8,

                                                    entry=0x7ffde5dfe200)
                          at /home/qemu/memory.c:1918
#5  0x0000555555888247 in memory_region_notify_iommu (iommu_mr=0x555556f6c0b0,
                                                      iommu_idx=0, entry=...)
                          at /home/qemu/memory.c:1941
#6  0x0000555555951c8d in vtd_process_device_iotlb_desc (s=0x555557609000,
                                                       inv_desc=0x7ffde5dfe2d0)
                          at /home/qemu/hw/i386/intel_iommu.c:2468
#7  0x0000555555951e6a in vtd_process_inv_desc (s=0x555557609000)
                          at /home/qemu/hw/i386/intel_iommu.c:2531
#8  0x0000555555951fa5 in vtd_fetch_inv_desc (s=0x555557609000)
                          at /home/qemu/hw/i386/intel_iommu.c:2563
#9  0x00005555559520e5 in vtd_handle_iqt_write (s=0x555557609000)
                          at /home/qemu/hw/i386/intel_iommu.c:2590
#10 0x0000555555952b45 in vtd_mem_write (opaque=0x555557609000, addr=136,
                                         val=2688, size=4)
                          at /home/qemu/hw/i386/intel_iommu.c:2837
#11 0x0000555555883e17 in memory_region_write_accessor (mr=0x555557609330,
                                                        addr=136,
                                                        value=0x7ffde5dfe478,
                                                        size=4,
                                                        shift=0,
                                                        mask=4294967295,
                                                        attrs=...)
                          at /home/qemu/memory.c:483
#12 0x000055555588401d in access_with_adjusted_size (addr=136,
                       value=0x7ffde5dfe478,
                       size=4,
                       access_size_min=4,
                       access_size_max=8,
                       access_fn=0x555555883d38 <memory_region_write_accessor>,
                       mr=0x555557609330,
                       attrs=...)
                       at /home/qemu/memory.c:544
#13 0x0000555555886f37 in memory_region_dispatch_write (mr=0x555557609330,
                                                       addr=136,
                                                       data=2688,
                                                       op=MO_32,
                                                       attrs=...)
                          at /home/qemu/memory.c:1476
#14 0x0000555555827a03 in flatview_write_continue (fv=0x7ffdd8503150,
                                                   addr=4275634312,
                                                   attrs=...,
                                                   ptr=0x7ffff7ff0028,
                                                   len=4,
                                                   addr1=136,
                                                   l=4,
                                                   mr=0x555557609330)
                          at /home/qemu/exec.c:3146
#15 0x0000555555827b48 in flatview_write (fv=0x7ffdd8503150,

                                          addr=4275634312,
                                          attrs=...,
                                          buf=0x7ffff7ff0028,
                                          len=4)
                          at /home/qemu/exec.c:3186
#16 0x0000555555827e9d in address_space_write (
                                      as=0x5555567ca640 <address_space_memory>,
                                      addr=4275634312,
                                      attrs=...,
                                      buf=0x7ffff7ff0028,
                                      len=4)
                          at /home/qemu/exec.c:3277
#17 0x0000555555827f0a in address_space_rw (
                                      as=0x5555567ca640 <address_space_memory>,
                                      addr=4275634312,
                                      attrs=...,
                                      buf=0x7ffff7ff0028,
                                      len=4,
                                      is_write=true)
                          at /home/qemu/exec.c:3287
#18 0x000055555589b633 in kvm_cpu_exec (cpu=0x555556b65640)
                               at /home/qemu/accel/kvm/kvm-all.c:2511
#19 0x0000555555876ba8 in qemu_kvm_cpu_thread_fn (arg=0x555556b65640)
                               at /home/qemu/cpus.c:1284
#20 0x0000555555dafff1 in qemu_thread_start (args=0x555556b8c3b0)
                               at util/qemu-thread-posix.c:521
#21 0x00007ffff55a62de in start_thread () at /lib64/libpthread.so.0
#22 0x00007ffff52d7e83 in clone () at /lib64/libc.so.6

(gdb) frame 4
#4  0x0000555555888171 in memory_region_notify_one
                      (notifier=0x7ffde0487fa8, entry=0x7ffde5dfe200)
                      at /home/qemu/memory.c:1918
1918        assert(entry->iova >= notifier->start && entry_end <=
notifier->end);
(gdb) p *entry
$1 = {target_as = 0x555556f6c050, iova = 0, translated_addr = 0,
addr_mask = 18446744073709551615, perm = IOMMU_NONE}
--

Tested with vhost-net, host<->guest communication.

v7: Add IOMMUTLBNotification, and move introduced "type" from
    IOMMUTLBEntry to the former.

v6: Introduce "type" field for IOMMUTLBEntry. Fill in all uses.
    Update tests reports with more fine-tuning (CPU, RPS/XPS tunning).

v5: Skip regular IOTLB notifications in dev_iotlb notifiers

v4: Rename IOMMU_NOTIFIER_IOTLB -> IOMMU_NOTIFIER_DEVIOTLB.
    Make vhost-net notifier just IOMMU_NOTIFIER_DEVIOTLB, not
    IOMMU_NOTIFIER_UNMAP

v3: Skip the assertion in case notifier is a IOTLB one, since they can manage
    arbitrary ranges. Using a flag in the notifier for now, as Peter suggested.

v2: Actually delete assertion instead of just commenting out using C99

Eugenio Pérez (5):
  memory: Rename memory_region_notify_one to
    memory_region_notify_iommu_one
  memory: Add IOMMUTLBEvent
  memory: Add IOMMU_DEVIOTLB_UNMAP IOMMUTLBNotificationType
  intel_iommu: Do not notify regular iotlb to device-iotlb notifiers
  memory: Skip bad range assertion if notifier is DEVIOTLB type

 hw/arm/smmu-common.c  | 13 +++---
 hw/arm/smmuv3.c       | 13 +++---
 hw/i386/intel_iommu.c | 94 +++++++++++++++++++++++++------------------
 hw/misc/tz-mpc.c      | 32 ++++++++-------
 hw/ppc/spapr_iommu.c  | 15 +++----
 hw/virtio/vhost.c     |  2 +-
 include/exec/memory.h | 39 ++++++++++--------
 softmmu/memory.c      | 25 +++++++-----
 8 files changed, 133 insertions(+), 100 deletions(-)

-- 
2.18.1


