Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E291299A1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 18:55:18 +0100 (CET)
Received: from localhost ([::1]:59820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijRvJ-0000d7-Rv
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 12:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <a13xp0p0v88@gmail.com>) id 1ijRu5-0007xe-JZ
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 12:54:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <a13xp0p0v88@gmail.com>) id 1ijRu4-0001Ci-CR
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 12:54:01 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39026)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <a13xp0p0v88@gmail.com>)
 id 1ijRu1-00017h-Fm; Mon, 23 Dec 2019 12:53:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id l2so18505319lja.6;
 Mon, 23 Dec 2019 09:53:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gjl2jrKVMsz9MrQbtYG/IruMaBFXQ98Mmvqj+RGEwG8=;
 b=oxNIoI81oVyoARe240eqPJIUBgMgDtkCA4WhTYc84xkwfSo8F01UdrdLDd5hiTT7US
 4XTF4kN4lBJwdhhAI2I2YD7b53zL5jA8x5U25w1l3xwU5UvB1vk/X8T87U9NyCADHSkH
 CrnQSfpuHts4PVhSemqd3nMtMUOgEf2JzvhzH/KcWR4MsMLqGymE/BKr+d8fJ3/Dc6cb
 hidwJ4qydHftV58EEUXyEBDyAjfFoGnpU3JsuAOpboFW/4RrD7SsGoWx8SoaDDbQ3twD
 3clT8VFPv1aLxL/QNE2QAfNv6jIayFQj5DgZ33GSm94ZBbhpkpfYcD1VR7NetG/9BGRP
 iGbQ==
X-Gm-Message-State: APjAAAXo45/64dWoQnjWE3YxKq3/hTgy/hAa1Sc8wYSUpy813xrJNFHy
 YAJKayn/Rl7Mj7lbyksiGQs=
X-Google-Smtp-Source: APXvYqxe9BF4ZMQSE/OQuC4P7j9BUxtn4etGtMnvwt3t/mYiQTX4ScDzgwCUYnP20kZxjJsxJ5SPmA==
X-Received: by 2002:a2e:3a13:: with SMTP id h19mr18940411lja.16.1577123636195; 
 Mon, 23 Dec 2019 09:53:56 -0800 (PST)
Received: from localhost.localdomain ([213.87.155.175])
 by smtp.gmail.com with ESMTPSA id y14sm8892345ljk.46.2019.12.23.09.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 09:53:55 -0800 (PST)
From: Alexander Popov <alex.popov@linux.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 pmatouse@redhat.com, sstabellini@kernel.org, mdroth@linux.vnet.ibm.com,
 pjp@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Kashyap Chamarthy <kashyap.cv@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Alexander Popov <alex.popov@linux.com>
Subject: [PATCH v3 1/2] ide: Fix incorrect handling of some PRDTs in
 ide_dma_cb()
Date: Mon, 23 Dec 2019 20:51:16 +0300
Message-Id: <20191223175117.508990-2-alex.popov@linux.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191223175117.508990-1-alex.popov@linux.com>
References: <20191223175117.508990-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.196
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The commit a718978ed58a from July 2015 introduced the assertion which
implies that the size of successful DMA transfers handled in ide_dma_cb()
should be multiple of 512 (the size of a sector). But guest systems can
initiate DMA transfers that don't fit this requirement.

For fixing that let's check the number of bytes prepared for the transfer
by the prepare_buf() handler. The code in ide_dma_cb() must behave
according to the Programming Interface for Bus Master IDE Controller
(Revision 1.0 5/16/94):
1. If PRDs specified a smaller size than the IDE transfer
   size, then the Interrupt and Active bits in the Controller
   status register are not set (Error Condition).
2. If the size of the physical memory regions was equal to
   the IDE device transfer size, the Interrupt bit in the
   Controller status register is set to 1, Active bit is set to 0.
3. If PRDs specified a larger size than the IDE transfer size,
   the Interrupt and Active bits in the Controller status register
   are both set to 1.

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---
 hw/ide/core.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 754ff4dc34..80000eb766 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -849,6 +849,7 @@ static void ide_dma_cb(void *opaque, int ret)
     int64_t sector_num;
     uint64_t offset;
     bool stay_active = false;
+    int32_t prep_size = 0;
 
     if (ret == -EINVAL) {
         ide_dma_error(s);
@@ -863,13 +864,15 @@ static void ide_dma_cb(void *opaque, int ret)
         }
     }
 
-    n = s->io_buffer_size >> 9;
-    if (n > s->nsector) {
-        /* The PRDs were longer than needed for this request. Shorten them so
-         * we don't get a negative remainder. The Active bit must remain set
-         * after the request completes. */
+    if (s->io_buffer_size > s->nsector * 512) {
+        /*
+         * The PRDs were longer than needed for this request.
+         * The Active bit must remain set after the request completes.
+         */
         n = s->nsector;
         stay_active = true;
+    } else {
+        n = s->io_buffer_size >> 9;
     }
 
     sector_num = ide_get_sector(s);
@@ -892,9 +895,20 @@ static void ide_dma_cb(void *opaque, int ret)
     n = s->nsector;
     s->io_buffer_index = 0;
     s->io_buffer_size = n * 512;
-    if (s->bus->dma->ops->prepare_buf(s->bus->dma, s->io_buffer_size) < 512) {
-        /* The PRDs were too short. Reset the Active bit, but don't raise an
-         * interrupt. */
+    prep_size = s->bus->dma->ops->prepare_buf(s->bus->dma, s->io_buffer_size);
+    /* prepare_buf() must succeed and respect the limit */
+    assert(prep_size >= 0 && prep_size <= n * 512);
+
+    /*
+     * Now prep_size stores the number of bytes in the sglist, and
+     * s->io_buffer_size stores the number of bytes described by the PRDs.
+     */
+
+    if (prep_size < n * 512) {
+        /*
+         * The PRDs are too short for this request. Error condition!
+         * Reset the Active bit and don't raise the interrupt.
+         */
         s->status = READY_STAT | SEEK_STAT;
         dma_buf_commit(s, 0);
         goto eot;
-- 
2.23.0


