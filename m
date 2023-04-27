Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8D16F01B3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:28:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prw1z-000517-0N; Thu, 27 Apr 2023 03:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1prw1s-00050p-DR
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:27:00 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1prw1p-0007cO-DD
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:27:00 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxHuu4I0pk1XcBAA--.2531S3;
 Thu, 27 Apr 2023 15:26:48 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Axy7K1I0pk9Ec+AA--.18880S2; 
 Thu, 27 Apr 2023 15:26:45 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn,
 zhaotianrui@loongson.cn, philmd@linaro.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH RFC v2 0/9] Add loongarch kvm accel support
Date: Thu, 27 Apr 2023 15:26:36 +0800
Message-Id: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Axy7K1I0pk9Ec+AA--.18880S2
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXF4DZFykKFWxCF43uw45Wrg_yoW5tw4kpr
 W7urn8Kr48JrZrJws5Xas8Xr45Xr4xGr9Fv3Wft34xCrZ7Zry8Zr92k39FvFW7Aa4UJFyI
 qFyrAw1DW3WUX37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x
 0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
 k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY
 1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=zhaotianrui@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series add loongarch kvm support, mainly implement
some interfaces used by kvm such as kvm_arch_get/set_regs,
kvm_arch_handle_exit, kvm_loongarch_set_interrupt, etc.

Currently, we are able to boot LoongArch KVM Linux Guests.
In loongarch VM, mmio devices and iocsr devices are emulated
in user space such as APIC, IPI, pci devices, etc, other
hardwares such as MMU, timer and csr are emulated in kernel.

It is based on temporarily unaccepted linux kvm:
https://github.com/loongson/linux-loongarch-kvm
And We will remove the RFC flag until the linux kvm patches
are merged.

The running environment of LoongArch virt machine:
1. Get the linux source by the above mentioned link.
   git checkout kvm-loongarch
   make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu- loongson3_defconfig
   make ARCH=loongarch CROSS_COMPILE=loongarch64-unknown-linux-gnu-
2. Get the qemu source: https://github.com/loongson/qemu
   git checkout kvm-loongarch
   ./configure --target-list="loongarch64-softmmu"  --enable-kvm
   make
3. Get uefi bios of LoongArch virt machine:
   Link: https://github.com/tianocore/edk2-platforms/tree/master/Platform/Loongson/LoongArchQemuPkg#readme
4. Also you can access the binary files we have already build:
   https://github.com/yangxiaojuan-loongson/qemu-binary

The command to boot loongarch virt machine:
   $ qemu-system-loongarch64 -machine virt -m 4G -cpu la464 \
   -smp 1 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd ramdisk \
   -serial stdio   -monitor telnet:localhost:4495,server,nowait \
   -append "root=/dev/ram rdinit=/sbin/init console=ttyS0,115200" \
   --nographic

Changes for RFC v2:
1. Mark the "Add KVM headers for loongarch" patch as a placeholder,
as we will use the update-linux-headers.sh to generate the kvm headers
when the linux loongarch KVM patch series are accepted.
2. Remove the DPRINTF macro in kvm.c and use trace events to replace
it, we add some trace functions such as trace_kvm_handle_exit,
trace_kvm_set_intr, trace_kvm_failed_get_csr, etc.
3. Remove the unused functions in kvm_stub.c and move stub function into
the suitable patch.

Tianrui Zhao (9):
  linux-headers: Add KVM headers for loongarch
  target/loongarch: Define some kvm_arch interfaces
  target/loongarch: Supplement vcpu env initial when vcpu reset
  target/loongarch: Implement kvm get/set registers
  target/loongarch: Implement kvm_arch_init function
  target/loongarch: Implement kvm_arch_init_vcpu
  target/loongarch: Implement kvm_arch_handle_exit
  target/loongarch: Implement set vcpu intr for kvm
  target/loongarch: Add loongarch kvm into meson build

 linux-headers/asm-loongarch/kvm.h |  99 ++++++
 linux-headers/linux/kvm.h         |   9 +
 meson.build                       |   3 +
 target/loongarch/cpu.c            |  21 +-
 target/loongarch/cpu.h            |   3 +
 target/loongarch/kvm-stub.c       |  11 +
 target/loongarch/kvm.c            | 540 ++++++++++++++++++++++++++++++
 target/loongarch/kvm_loongarch.h  |  13 +
 target/loongarch/meson.build      |   1 +
 target/loongarch/trace-events     |  15 +
 target/loongarch/trace.h          |   1 +
 11 files changed, 711 insertions(+), 5 deletions(-)
 create mode 100644 linux-headers/asm-loongarch/kvm.h
 create mode 100644 target/loongarch/kvm-stub.c
 create mode 100644 target/loongarch/kvm.c
 create mode 100644 target/loongarch/kvm_loongarch.h
 create mode 100644 target/loongarch/trace-events
 create mode 100644 target/loongarch/trace.h

-- 
2.31.1


