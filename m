Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A624F98A0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:51:15 +0200 (CEST)
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpxB-0001sD-5b
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpcr-0002aY-94
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:30:13 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:39440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpcn-0004aE-0r
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:30:12 -0400
Received: by mail-yb1-xb36.google.com with SMTP id x21so15396451ybd.6
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0x6ZF6bBCk8M81aMrSxVBw+PJFakOdUPDVK78OdrTGA=;
 b=sRhdDPJ/d8qcGSOgkxja5vmRu8PnfhiQBQtbkMP5YylNfntZCbIdlqbonr7Qjs3II6
 Ogr3r9G4Cy79I4/2122eOnaZlVzml+fLJEGoFbwFI+3fXaG4xByewA6/rjnChTiLTT+c
 CniNwFbdxb3oOM4xdxqED5kFf+3D4+FUPiCcTeyiCvACb6gCnhx00Mj6/jNHn7BtsgCt
 MV3pQSU31GOUIfX31HcDW7ccNfmO+kj/JxjaSl5mTu+cisaIQ1EViUHZhOg6pyd/kj3W
 4wQSpGLAOdrFEBdhnH4df5cQM4tnrgP5r0Mxnc0eRxQcu/PnnZNmHnBbCE+12WBsfVfA
 ONMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0x6ZF6bBCk8M81aMrSxVBw+PJFakOdUPDVK78OdrTGA=;
 b=2HvJoYSI6SfpwK31tPLlF9Ux1KkrDFDN7bri8PFAmLhCV98ImoIqUOjORLNmgOzMC0
 5Ww0JkZys64m1kc0GmXvbAvKMI7ySCIZkI+l1YMGmo+XYjLEr5+ig+mUUx6GnC4z6V4V
 saNarVWemwWzObmJi3GuPseuTpg2S0+N0bjjYtzf980z3AKyNjautagOWOV9hSnLUHK2
 Sm60fwX8yemekuhTBCtBk+L9ly5A7kK7pB4xQ40tfxfhPMwAJCIrAIKn2VDZf/Pz4pp3
 XiHQDRxJvdLLG60ZS4QpzlicYUJLpkDuQ9O43HBb9W52EhXey2JcFfDjRD4MLvQCrhEE
 OblA==
X-Gm-Message-State: AOAM532xifmrpn2Xa5tSLz5yOFrxCrVjjXHBD8CwPaYlK8fyZgo/46sG
 TWfGOFS4NY/tPj7B1xoC9f0BFRumhlUlxDrox6JUbg==
X-Google-Smtp-Source: ABdhPJxqSnvzI2rN5VyPijUiEoG8VnyOxo35m9aG994pjRPtS62NKHSatC9NJJEieL9l75mJljyRn4VA4l0scDSwmlo=
X-Received: by 2002:a25:3d0:0:b0:63d:c88a:fafa with SMTP id
 199-20020a2503d0000000b0063dc88afafamr13825395ybd.479.1649428207733; Fri, 08
 Apr 2022 07:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Apr 2022 15:29:56 +0100
Message-ID: <CAFEAcA-f77owUfOfrXfu7JjeBVosvNmEuX_3wdPzH-H7fohezQ@mail.gmail.com>
Subject: Re: [PATCH 00/41] arm: Implement GICv4
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Apr 2022 at 15:15, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset implements emulation of GICv4 in our TCG GIC and ITS
> models, and makes the virt board use it where appropriate.

> Tested with a Linux kernel passing through a virtio-blk device
> to an inner Linux VM with KVM/QEMU. (NB that to get the outer
> Linux kernel to actually use the new GICv4 functionality you
> need to pass it "kvm-arm.vgic_v4_enable=1", as the kernel
> will not use it by default.)

I guess I might as well post my notes here about how I set up
that test environment. These are a bit too scrappy (and rather
specific about a niche thing) to be proper documentation, but
having them in the list archives might be helpful in future...

===nested-setup.txt===
How to set up an environment to test QEMU's emulation of virtualization,
with PCI passthrough of a virtio-blk-pci device to the L2 guest

(1) Set up a Debian aarch64 guest (the instructions in the old
blog post
https://translatedcode.wordpress.com/2017/07/24/installing-debian-on-qemus-64-bit-arm-virt-board/
still work; I used Debian bullseye for my testing).

(2) Copy the hda.qcow2 to hda-for-inner.qcow2; run the L1 guest
using the 'runme' script.

Caution: the virtio devices need to be in this order (hda.qcow2,
network,hda-for-inner.qcow2), because systemd in the guest names
the ethernet interface based on which PCI slot it goes in.

(3) In the L1 guest, first we need to fix up the hda-for-inner.qcow2
so that it has different UUIDs and partition UUIDs from hda.qcow2.
You'll need to make sure you have the blkid, gdisk, tune2fs, swaplabel
utilities installed in the guest.

 swapoff -a   # L1 guest might have swapped onto /dev/vdb2 by accident
 # print current partition IDs; you'll see that vda and vdb currently
 # share IDs for their partitions, and we must change those for vdb
 blkid
 # first change the PARTUUIDs with gdisk; this is the answer from
 # https://askubuntu.com/questions/1250224/how-to-change-partuuid
 gdisk /dev/vdb
 x   # change to experts menu
 c   # change partition ID
 1   # for partition 1
 R   # pick a random ID
 c   # ditto for partitions 2, 3
 2
 R
 c
 3
 R
 m   # back to main menu
 w   # write partition table
 q   # quit
 # change UUIDs; from
https://unix.stackexchange.com/questions/12858/how-to-change-filesystem-uuid-2-same-uuid
 tune2fs -U random /dev/vdb1
 tune2fs -U random /dev/vdb2
 swaplabel -U $(uuidgen) /dev/vdb3
 # Check the UUIDs and PARTUUIDs are now all changed:
 blkid
 # Now update the fstab in the L2 filesystem:
 mount /dev/vdb2 /mnt
 # Finally, edit /mnt/etc/fstab to set the UUID values for /, /boot and swap to
 # the new ones for /dev/vdb's partitions
 vi /mnt/etc/fstab # or editor of your choice
 umount /mnt
 # shutdown the L1 guest now, to ensure that all the changes to that
 # qcow2 file are committed
 shutdown -h now

(4) Copy necessary files into the L1 guest's filesystem;
you can run the L1 guest and run scp there to copy from your host machine,
or any other method you like. You'll need:
 - the vmlinuz (same one being used for L1)
 - the initrd
 - some scripts [runme-inner, runme-inner-nopassthru, reassign-vdb]
 - a copy of hda-for-inner.qcow2 (probably best to copy it to a temporary
   file while the L1 guest is not running, then copy that into the guest)
 - the qemu-system-aarch64 you want to use as the L2 QEMU
   (I cross-compiled this on my x86-64 host. The packaged Debian bullseye
   qemu-system-aarch64 will also work if you don't need to use a custom
   QEMU for L2.)

(5) Now you can run the L2 guest without using PCI passthrough like this:
 ./runme-inner-nopassthru ./qemu-system-aarch64

(6) And you can run the L2 guest with PCI passthrough like this:
 # you only need to run reassign-vdb once for any given run of the
 # L1 guest, to give the PCI device to vfio-pci rather than to the
 # L1 virtio driver. After that you can run the L2 QEMU multiple times.
 ./reassign-vdb
 ./runme-inner ./qemu-system-aarch64

Notes:

I have set up the various 'runme' scripts so that L1 has a mux of
stdio and the monitor, which means that you can kill it with ^A-x,
and ^C will be delivered to the L1 guest. The L2 guest has plain
'-serial stdio', which means that ^C will kill the L2 guest.

The 'runme' scripts expect their first argument to be the path to
the QEMU you want to run; any further arguments are extra arguments
to that QEMU. So you can do things like:

   # pass more arguments to QEMU, here disabling the ITS
   ./runme ~/qemu-system-aarch64 -machine its=off
   # run gdb, and run QEMU under gdb
   ./runme gdb --args ~/qemu-system-aarch64 -machine its=off

The 'runme' scripts should be in the same directory as the
kernel etc files they go with; but you don't need to be
in that directory to run them.
===endit===

===runme===
#!/bin/sh -e
TESTDIR="$(cd "$(dirname "$0")"; pwd)"
QEMU="$@"

# Run with GICv3 and the disk image with a nested copy in it
# (for testing EL2/GICv3-virt emulation)

: ${KERNEL:=$TESTDIR/vmlinuz-5.10.0-9-arm64}
: ${INITRD:=$TESTDIR/initrd.img-5.10.0-9-arm64}
: ${DISK:=$TESTDIR/hda.qcow2}
: ${INNERDISK:=$TESTDIR/hda-for-inner.qcow2}

# Note that the virtio-net-pci must be the 2nd PCI device,
# because otherwise the network interface name it gets will
# not match /etc/network/interfaces.

# set up with -serial mon:stdio so we can ^C the inner QEMU

IOMMU_ADDON=',iommu_platform=on,disable-modern=off,disable-legacy=on'

${QEMU} \
  -cpu cortex-a57 \
  -machine type=virt \
  -machine gic-version=max \
  -machine virtualization=true \
  -machine iommu=smmuv3 \
  -m 1024M \
  -kernel "${KERNEL}" -initrd "${INITRD}" \
  -drive if=none,id=mydrive,file="${DISK}",format=qcow2 \
  -device virtio-blk-pci,drive=mydrive \
  -netdev user,id=mynet \
  -device virtio-net-pci,netdev=mynet \
  -drive if=none,id=innerdrive,file="${INNERDISK}",format=qcow2 \
  -device virtio-blk-pci,drive=innerdrive"$IOMMU_ADDON" \
  -append 'console=ttyAMA0,38400 keep_bootcon root=/dev/vda2
kvm-arm.vgic_v4_enable=1' \
  -chardev socket,id=monitor,host=127.0.0.1,port=4444,server=on,wait=off,telnet=on
\
  -mon chardev=monitor,mode=readline \
  -display none -serial mon:stdio
===endit===

===reassign-vdb===
#!/bin/sh -e
# Script to detach the /dev/vdb PCI device from the virtio-blk driver
# and hand it to vfio-pci

PCIDEV=0000:00:03.0

echo -n "$PCIDEV" > /sys/bus/pci/drivers/virtio-pci/unbind
modprobe vfio-pci

echo vfio-pci > /sys/bus/pci/devices/"$PCIDEV"/driver_override

echo -n "$PCIDEV" > /sys/bus/pci/drivers/vfio-pci/bind
===endit===

===runme-inner===
#!/bin/sh -e
TESTDIR="$(cd "$(dirname "$0")"; pwd)"
QEMU="$@"

# run the inner guest, passing it the passthrough PCI device
: ${KERNEL:=$TESTDIR/vmlinuz-5.10.0-9-arm64}
: ${INITRD:=$TESTDIR/initrd.img-5.10.0-9-arm64}

# set up with -serial stdio so we can ^C the inner QEMU
# use -net none to work around the default virtio-net-pci
# network device wanting to load efi-virtio.rom, which the
# L1 guest's debian package puts somewhere other than where
# our locally compiled qemu-system-aarch64 wants to find it.

${QEMU} \
  -cpu cortex-a57 \
  -enable-kvm \
  -machine type=virt \
  -machine gic-version=3 \
  -m 256M \
  -kernel "${KERNEL}" -initrd "${INITRD}" \
  -append 'console=ttyAMA0,38400 keep_bootcon root=/dev/vda2' \
  -display none -serial stdio \
  -device vfio-pci,host=0000:00:03.0,id=pci0 \
  -net none
===endit===

===runme-inner-nopassthru===
#!/bin/sh -e
TESTDIR="$(cd "$(dirname "$0")"; pwd)"
QEMU="$@"

# run the inner guest, passing it a disk image
: ${KERNEL:=$TESTDIR/vmlinuz-5.10.0-9-arm64}
: ${INITRD:=$TESTDIR/initrd.img-5.10.0-9-arm64}
: ${DISK:=$TESTDIR/hda-for-inner.qcow2}

# set up with -serial stdio so we can ^C the inner QEMU
# use -net none to work around the default virtio-net-pci
# network device wanting to load efi-virtio.rom, which the
# L1 guest's debian package puts somewhere other than where
# our locally compiled qemu-system-aarch64 wants to find it.

${QEMU} \
  -cpu cortex-a57 \
  -enable-kvm \
  -machine type=virt \
  -machine gic-version=3 \
  -m 256M \
  -kernel "${KERNEL}" -initrd "${INITRD}" \
  -drive if=none,id=mydrive,file="${DISK}",format=qcow2 \
  -device virtio-blk-pci,drive=mydrive \
  -append 'console=ttyAMA0,38400 keep_bootcon root=/dev/vda2' \
  -display none -serial stdio \
  -net none
===endit===

-- PMM

