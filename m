Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55941527646
	for <lists+qemu-devel@lfdr.de>; Sun, 15 May 2022 09:32:57 +0200 (CEST)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nq8kJ-0001eN-RB
	for lists+qemu-devel@lfdr.de; Sun, 15 May 2022 03:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <karthik.poduval@gmail.com>)
 id 1nq8en-0000EL-2p
 for qemu-devel@nongnu.org; Sun, 15 May 2022 03:27:15 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:44595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <karthik.poduval@gmail.com>)
 id 1nq8ek-0001b5-6j
 for qemu-devel@nongnu.org; Sun, 15 May 2022 03:27:12 -0400
Received: by mail-lj1-x230.google.com with SMTP id 4so14739836ljw.11
 for <qemu-devel@nongnu.org>; Sun, 15 May 2022 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=7EljuG7sBUwvI1AKskw6E+17O6mGeTTHEdbY7zdtXPE=;
 b=lDumqdi5veVLLeyoVlwHJcZp4dMYHlQ9DGFvxbw5VlHReq5jusC35VWcqcJGf3k6+N
 ygOXgTdciyQB2t077ScwAyYPVElKLRDROHTOXZsHUNwNi3ZjdmZ6ehqVt+cy9pst8HRZ
 qBl3Gb06xFx6QAR47CKN/NMyh2p67a6tPQ+BUaELIOOuYSp63nqB/mFwm7hbl+ZeOz1F
 Tv/66+YwBeGbx6GWjT5Zac4IYbuWQ+ZBzw1fbJ06LowO8HzO8Tp0JQtG3GHzPConobPg
 Vy0d6k1JMcYQCixknaI+Dy95d81pe8Il8r9PGZjFFFqqEpWmH1s4Y/JBEMQUbX1H580f
 diuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7EljuG7sBUwvI1AKskw6E+17O6mGeTTHEdbY7zdtXPE=;
 b=fh/JwOox0tt2AqqGtivOnOd1uNLZlcW5h50Jst6xXgXDtiJ2/mmFBTBrKgecqxQaFy
 4XbvyuIqgiYueuMoHwC/4Y0pAEoSxXpC3x8Ulf9U9INgHC47OC/1l6a2doLKhijFslMQ
 3cchvBxLPqY91JpfJ6Gi+BkEBZbSXc6GI1KtshOcHPefzSZG6ChHs7hIJ8WU/DL7kwH+
 JgU8iE1wwj58yQ+LVqY5O6wl/vNg8BReTSq9aMlxonG9kPZM5ogZG4TLpa/A+HZAkuBu
 BDAdixMhgFNWyHVgpACdhX7PHvXFu/2tjLbTeATohK+xbSs7LphrlaeqetSfMgBo3fc+
 P5dw==
X-Gm-Message-State: AOAM532ZleJo8SPe6vY1lwZtUH2jVM+PlOLSk6cnAKvId547EaWPYWkg
 hutzNE3pywIiXPZglAJaaOLVoWjiasS0ifULSD7u3l9z5aI=
X-Google-Smtp-Source: ABdhPJz/29wH1v84w5sgcuU6O8tyXw+3VK4LkhoJo2dBlClYr+qYoPZ+xacH5cKXuUJ2hIhNVk+az3mNoizHCsF2vxs=
X-Received: by 2002:a05:651c:d4:b0:24f:255d:c68d with SMTP id
 20-20020a05651c00d400b0024f255dc68dmr7653940ljr.436.1652599623086; Sun, 15
 May 2022 00:27:03 -0700 (PDT)
MIME-Version: 1.0
From: Karthik Poduval <karthik.poduval@gmail.com>
Date: Sun, 15 May 2022 00:26:51 -0700
Message-ID: <CAFP0Ok9Zjav40T39VFfF6bvR8=vCKOM-O8Z-pJ5t3tnc9281Yg@mail.gmail.com>
Subject: QEMU 6.2.0: Segfault while calling address_space_init from emulated
 device
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=karthik.poduval@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

I am trying to create a virtual mem2mem scaler device in QEMU (for the
purposes of writing a mem2mem driver tutorial). I created the mem2mem
device as shown here.
https://github.com/karthikpoduval/qemu/blob/scaler-bringup/hw/misc/m2m_scaler.c

I added this MMIO device to the arm virt.c (as shown here).
https://github.com/karthikpoduval/qemu/blob/scaler-bringup/hw/arm/virt.c#L1306

However while the device is getting created, there is a crash while
launching QEMU.
qemu-system-aarch64 -device
virtio-net-device,netdev=net0,mac=52:54:00:12:35:02 -netdev
user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23,tftp=/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy/images/qemuarm64
-object rng-random,filename=/dev/urandom,id=rng0 -device
virtio-rng-pci,rng=rng0 -drive
id=disk0,file=/home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy/images/qemuarm64/yoe-simple-image-qemuarm64-20220515002944.rootfs.ext4,if=none,format=raw
-device virtio-blk-device,drive=disk0 -device qemu-xhci -device
usb-tablet -device usb-kbd  -machine virt -cpu cortex-a57 -smp 4 -m
1024 -serial mon:stdio -serial null -nographic -device virtio-gpu-pci
-kernel /home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/deploy/images/qemuarm64/Image--5.15.22+git0+2d38a472b2_7f685244af-r0.0-qemua
rm64-20220306152158.bin -append 'root=/dev/vda rw  mem=256M ip=dhcp
console=ttyAMA0 console=hvc0  '

Upon running gdb, the stack trace looks like.
Thread 1 "qemu-system-aar" received signal SIGSEGV, Segmentation fault.
0x0000555555d2f6d6 in memory_region_ref (mr=0x56becae0) at
../git/softmmu/memory.c:3005
3005        memory_region_ref(root);
(gdb) bt
#0  0x0000555555d2f6d6 in memory_region_ref (mr=0x56becae0) at
../git/softmmu/memory.c:3005
#1  address_space_init (as=0x5555570f8bb8, root=0x56becae0,
name=0x5555560a9620 "m2m-scaler-dma") at ../git/softmmu/memory.c:3005
#2  0x0000555555e0d5c8 in object_initialize_with_type
(obj=obj@entry=0x5555570f8750, size=size@entry=1360,
type=type@entry=0x555556a117d0) at ../git/qom/object.c:518
#3  0x0000555555e0d719 in object_new_with_type (type=0x555556a117d0)
at ../git/qom/object.c:733
#4  0x0000555555e08e3a in qdev_new (name=name@entry=0x5555560a95eb
"m2m_scaler") at ../git/hw/core/qdev.c:153
#5  0x000055555595cafa in sysbus_create_varargs
(name=name@entry=0x5555560a95eb "m2m_scaler", addr=addr@entry=0) at
../git/hw/core/sysbus.c:234
#6  0x0000555555adf1a1 in sysbus_create_simple (irq=<optimized out>,
addr=0, name=0x5555560a95eb "m2m_scaler")
    at /home/kpoduval/workspace/yoe-master-kpoduval/build/tmp/work/x86_64-linux/qemu-system-native/6.2.0-r0/git/include/hw/sysbus.h:104
#7  create_m2m_scaler (vms=0x555556c31400) at ../git/hw/arm/virt.c:1317
#8  machvirt_init (machine=0x555556c31400) at ../git/hw/arm/virt.c:2239
#9  0x0000555555959929 in machine_run_board_init
(machine=0x555556c31400) at ../git/hw/core/machine.c:1187
#10 0x0000555555d3576f in qemu_init_board () at ../git/softmmu/vl.c:2656
#11 qmp_x_exit_preconfig (errp=<optimized out>) at ../git/softmmu/vl.c:2746
#12 qmp_x_exit_preconfig (errp=<optimized out>) at ../git/softmmu/vl.c:2739
#13 0x0000555555d38f3b in qemu_init (argc=<optimized out>,
argv=<optimized out>, envp=<optimized out>) at
../git/softmmu/vl.c:3777
#14 0x000055555588e1bd in main (argc=<optimized out>, argv=<optimized
out>, envp=<optimized out>) at ../git/softmmu/main.c:49

I was able to do the same thing in QEMU 5.1.0 do not know why this
does not work in QEMU 6.2.0. Kindly help me resolve this issue. I want
my device to have access to the entire system RAM (as thi emulated
device can read input image from DDR scale it and write back the input
image to DDR so it needs to have access to the entire DDR memory).

-- 
Regards,
Karthik Poduval

