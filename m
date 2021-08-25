Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A523F7EBE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 00:44:59 +0200 (CEST)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ1di-0004NS-Fr
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 18:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJ1c4-000342-G0
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 18:43:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJ1c0-0003uW-OF
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 18:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629931389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aNSpVfcKDwenCE4DzkUSIS6d8NXopGvNy2bA28mLtL4=;
 b=iWBYljSUPtKfEl3yvpmz1jWQjkjbn/UQ437+iVgzMbJIL39z6xOOv7nntZd92Vt+j2ci+0
 OASEjDmk9O+MQ3AKctg7SkI94dgUbSKLfC03ncUECLkH/SsolyjB1myNtW+MLNCE0KyKa/
 RY0SBIP8jbHlYKPmK1IIWOlHAtSfIKA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-9V74RJGYOWK2gKVlZoKAuA-1; Wed, 25 Aug 2021 18:43:07 -0400
X-MC-Unique: 9V74RJGYOWK2gKVlZoKAuA-1
Received: by mail-wm1-f71.google.com with SMTP id
 201-20020a1c01d2000000b002e72ba822dcso3434311wmb.6
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 15:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aNSpVfcKDwenCE4DzkUSIS6d8NXopGvNy2bA28mLtL4=;
 b=TfLLNJmcNil8VXCx3kQwnAcPAuq8nWtR2hQy/wwkFleitRtrzri8brEkpidpr430QM
 6BmDnDQNHnxrDeIxC5a3pMOKMSC3PSo31W7S+Fo/lWBdbGbuQBnJ/q0lzOs7KIdn0zs2
 Abu0o4VPj9O5B9S5Ufk/0aQgTEJG8LO1u6jhIK77Lta8xvLJ36jX3yX/llF0/BOdf3ht
 bXPiWH4M9Y6VMwEKq0xOQN/OJRRNoPGAJXcQ1NkaHl8dKWbGxDMpy1/7Ufzpcow9/bv9
 mSl6OXI2jdK61HL7PuCZGasb7QFqWiqFWP2DvMyLKhUkOQZbxTm8vl1+bS0vN1X8/buk
 yIMg==
X-Gm-Message-State: AOAM531GMVaEgFU4I+RtOm97n41Z08PscZXAbvdjuvQ4oXeBisgoEC07
 K97xIqI18pZYYTwdp2ATxm3BkwRtWlniNHjXQF9RruUIB9yGhMZLZhmazNV1y1FUQnqt3AxSJig
 Z3tOxLzlsXjr237rhmOCj1XFXO4gZP7EFuD6P7GaJWRmlBWCxynpzcsJPWgM8tBBN
X-Received: by 2002:a7b:c318:: with SMTP id k24mr673238wmj.144.1629931383989; 
 Wed, 25 Aug 2021 15:43:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgWzMwKrUBRd0Rf4tAxLWqGufF9NdoXi9Ce9RdkwK/QIAOc1yOYPie3CdZLHGSDLi8m2V8Rw==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr673212wmj.144.1629931383627; 
 Wed, 25 Aug 2021 15:43:03 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d124sm807278wmd.2.2021.08.25.15.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 15:43:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/virtio: Update vring after modifying its queue size
Date: Thu, 26 Aug 2021 00:42:56 +0200
Message-Id: <20210825224256.1750286-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a ring queue size is modified, we need to call
virtio_queue_update_rings() to re-init the memory region
caches. Otherwise the region might have outdated memory
size, and later load/store access might trigger an
assertion, such:

  qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxResult *):
  Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
  Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
  0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
  (gdb) bt
  #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
  #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=0x61300010a7c0, addr=134, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:30
  #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=0x61300010a7c0, addr=134) at include/exec/memory_ldst_phys.h.inc:67
  #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=0x62d00003a680, cache=0x61300010a7c0, pa=134) at include/hw/virtio/virtio-access.h:166
  #7  0x0000555558f300ea in vring_avail_ring (vq=0x7fffdd55d8a0, i=65) at hw/virtio/virtio.c:326
  #8  0x0000555558f33b10 in vring_get_used_event (vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:332
  #9  0x0000555558f33677 in virtio_split_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
  #10 0x0000555558f1859f in virtio_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
  #11 0x0000555558f188cc in virtio_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2565
  #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/input/virtio-input.c:100
  #13 0x0000555558f16df7 in virtio_queue_notify (vdev=0x62d00003a680, n=1) at hw/virtio/virtio.c:2363
  #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=0x62d000032400, addr=7, val=0, size=1) at hw/virtio/virtio-pci.c:1369
  #15 0x0000555558b80b04 in memory_region_write_accessor (mr=0x62d000033190, addr=7, value=0x7fffffff8eb0, size=1, shift=0, mask=255, attrs=...) at softmmu/memory.c:492

Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Fixes: ab223c9518e ("virtio: allow virtio-1 queue layout")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f37a7..04ffe5f420e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2255,6 +2255,7 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
         return;
     }
     vdev->vq[n].vring.num = num;
+    virtio_queue_update_rings(vdev, n);
 }
 
 VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector)
-- 
2.31.1


