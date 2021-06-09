Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B583A0FDD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:00:19 +0200 (CEST)
Received: from localhost ([::1]:59370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv0U-0006O7-9c
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lquzS-00053w-5P
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:59:14 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:39483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lquzQ-0002tB-5m
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 05:59:13 -0400
Received: by mail-lj1-x229.google.com with SMTP id c11so30904909ljd.6
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I5rIk8UWqTGEV6Rmkzt6tHSaJHcV+PBskMtsqg/NEeA=;
 b=zMHMVQeMzQWLUgw8b1AeQwfuFkjHrpcP1luTs/w/QZi5Fqt6ArR6NSc5eRISicLFgt
 Uvfo5wEPQ5sS91VD+d+v8K85gEIEntvwNW87eL6lhc7xnkzm04XizCpLtODLcUU14t+1
 CRTXJWcLOkt/jeVUxlpkj7GQf4V4tuuN2tYvJ9c60yACmoJuffC8ZAvRN8l7I6IjKZNo
 SyuJUZAgRk9Bl6h1cUkcN1EjaoZI8KyH2A4oEa7jAaRQo7edHoYY7jJ3pooXfc1niNsD
 MNIHW00oRlgG2KSZasqpsRDofZc6MKceSl5Egc4Tu+v6zl3/gx3DFIb88L2GjkI36rDC
 mN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I5rIk8UWqTGEV6Rmkzt6tHSaJHcV+PBskMtsqg/NEeA=;
 b=sk0c5Y8OJ5pOa5zNVLTWdJ/8ldDfIsMVEl6y2ic4sUYifRr3EUDe+NsDNIDKB+amP3
 SZgy/MGQ+zreHCH2JtaE1nRBkLTdtWVhnA8QhOoWJEFTU+8wLx/fDqBvIAn0ILrbhBqw
 hiJwlkdTh7o9Nw7m3z/21i834tKlPhmFnkgcUUoNHYOQQQR9SD/Q4owxwri2vW7F5LF5
 RFaF9bvNRUWXqzh3cVGuwxHUBRqxnGU9x1yUG49rZLwwHGAfokKoxyVMU/aH92jJQNlE
 iK7JIqpBqZFzRxnDGzgLaN0JA7Rsf7dLvZiKixJ2cmX1sUdHlSz0jdhD4um6LfWhIOfX
 3p2w==
X-Gm-Message-State: AOAM533HLaOsOQxJGWm4ji18PZ4AWrsJ0o7SVYrF8OySLa70f4RiprFA
 F1a9sxmHnGW/7XHWvauCMOK1rw==
X-Google-Smtp-Source: ABdhPJwm3iFLk5aOIHzHgpECrobhXPk6alfdP6OZtXFYWo5GXrGQgl27nFgCsme81RsdItFnFGzhUQ==
X-Received: by 2002:a05:651c:17a8:: with SMTP id
 bn40mr22014441ljb.288.1623232749903; 
 Wed, 09 Jun 2021 02:59:09 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id q6sm218751lfj.88.2021.06.09.02.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 02:59:09 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com
Subject: [PATCH 0/3] virtio-pci: Checks for virtio device presence on the bus.
Date: Wed,  9 Jun 2021 12:58:40 +0300
Message-Id: <20210609095843.141378-1-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::229;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At some point, after unplugging virtio-pci the virtio device may be unrealised,
but the memory regions may be present in flatview. So, it's a possible situation
when memory region's callbacks are called for "unplugged" device.

In patches were added checks for virtio device presence on virtio-bus.
Added checks in PCI config callbacks. Also changed return values in memory
regions read if virtio not present.

BZ link https://bugzilla.redhat.com/show_bug.cgi?id=1938042
The issue similar to https://bugzilla.redhat.com/show_bug.cgi?id=1743098

Backtrace:
    at ../hw/virtio/virtio-pci.c:1271
        proxy = 0x560b535f8bf0
        vdev = 0x0
    (mr=<optimized out>, addr=<optimized out>, value=<optimized out>, size=<optimized out>, shift=<optimized out>, mask=<optimized out>, attrs=...) at ../softmmu/memory.c:491
        tmp = <optimized out>
    (addr=addr@entry=22, value=value@entry=0x7fd743dfe518, size=size@entry=2, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x560b513fc500 <memory_region_write_accessor>, mr=0x560b535f95d0, attrs=...) at ../softmmu/memory.c:552
        access_mask = 65535
        access_size = 2
        i = <optimized out>
        r = 0
    (mr=mr@entry=0x560b535f95d0, addr=22, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...) at ../softmmu/memory.c:1501
        size = 2
    (fv=fv@entry=0x7fd6f005d3b0, addr=addr@entry=4246716438, attrs=..., ptr=ptr@entry=0x7fe69b2b0028, len=len@entry=2, addr1=<optimized out>, l=<optimized out>, mr=0x560b535f95d0)
    at /usr/src/debug/qemu-kvm-5.2.0-11.module+el8.4.0+10268+62bcbbed.x86_64/include/qemu/host-utils.h:164
        ram_ptr = <optimized out>
        val = <optimized out>
        result = 0
        release_lock = true
        buf = 0x7fe69b2b0028 ""
    at ../softmmu/physmem.c:2799
        l = 2
        addr1 = 22
        mr = <optimized out>
        result = 0
        _rcu_read_auto = 0x1
        result = 0
        fv = <optimized out>
        attrs = {unspecified = 0, secure = 0, user = 0, requester_id = 0, byte_swap = 0, target_tlb_bit0 = 0, target_tlb_bit1 = 0, target_tlb_bit2 = 0}
        run = <optimized out>
        ret = <optimized out>
        run_ret = 0
        cpu = 0x560b522738d0
        r = <optimized out>
        __clframe = {__cancel_routine = <optimized out>, __cancel_arg = 0x0, __do_it = 1, __cancel_type = <optimized out>}
        qemu_thread_args = 0x560b5229a6f0
        start_routine = 0x560b513faeb0 <kvm_vcpu_thread_fn>
        arg = 0x560b522738d0
        r = <optimized out>
        
Andrew Melnychenko (3):
  virtio-pci: Added check for virtio device presence in mm callbacks.
  virtio-pci: Added check for virtio device in PCI config cbs.
  virtio-pci: Changed return values for "notify", "device" and "isr"
    read.

 hw/virtio/virtio-pci.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

-- 
2.31.1


