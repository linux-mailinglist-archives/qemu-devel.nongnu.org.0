Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C21327DB2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:56:36 +0100 (CET)
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhAB-0001DV-4a
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGh7X-0005l3-6T
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGh7V-0007aF-IG
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614599628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YDEQgbWck1j5/yNbxcJrrrXZNKuh+ZlCvLLks2REe7U=;
 b=Uxm5DTqu5vZcABQgy/305nehWAoeQYA68U3kWpHMdRMuz4Tp98f9TLaql14WEqHiqOxvnl
 I6uToyMqe2NZ/Bv0w/mqDTDiWhWOAU8A74BrEc2/dP9yokmufoJWKdUztFz+5JdGd65sGv
 cFRNaKfMVyagXsTTNLWDgwHkdKenVGw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-uBXNX-Y7PICC1uv213w1zA-1; Mon, 01 Mar 2021 06:53:47 -0500
X-MC-Unique: uBXNX-Y7PICC1uv213w1zA-1
Received: by mail-wm1-f70.google.com with SMTP id h16so5519635wmq.8
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YDEQgbWck1j5/yNbxcJrrrXZNKuh+ZlCvLLks2REe7U=;
 b=ICL6PTWlcPQe2OK86AtLy/wRYqRxBq4caHid2AjFkzVL2z+aEM/qn4yu+jwm1HIHA2
 z1AXtfMvQSr+eGA0ig+XGJIO5loH/vocH18bMU97fML272ZDCqBY3DxbAVRVATDZ+YcR
 RoBvQZv2oTPE7JJ9fdA7eXz0wFeCGC212bgRXHWtdwmPdpRLGXyufAX/yimMCKvpl/Q0
 oRU+zlB7XvvPrXKTgt1Hr6BDk/4lpqSOtnx6LZ+LZC9SN6MAxuY3Bd7qBZed9B3r4d1J
 KvxfD3iZ/Go3HdLV4QyfSuSAdygGxZyEyjRlU5fFsCOdO5+f4aGGDqVbSO2qnMJwtAQU
 CLVA==
X-Gm-Message-State: AOAM532iVzYTlBIwKW+VC1kfk0UoqlyEmrpIw5F7JIwSunhc+N6ZRu1c
 AFb+NXFxOZ2JP/HtBSiyIGiZ45iNKaVqSZheHfPTGm8yBmKOTTCc4wPOiIUWXQoZ4cnHGhS4Au+
 /H1eeUMH5rQOLFCBGNArLTsIUxRgS2MPcy675vOLA0LEnQIt7bPg00XS17xsdWvQ1
X-Received: by 2002:adf:dbc2:: with SMTP id e2mr15629748wrj.227.1614599626145; 
 Mon, 01 Mar 2021 03:53:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYt96kuiaD+I9OlJAtRoODtoD2cQgKW9T0gdObGflo+M2HoBYw/4GoXiI6mLOXJ//naYaVVQ==
X-Received: by 2002:adf:dbc2:: with SMTP id e2mr15629719wrj.227.1614599625982; 
 Mon, 01 Mar 2021 03:53:45 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z11sm22420878wmf.28.2021.03.01.03.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 03:53:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	David Edmondson <david.edmondson@oracle.com>
Subject: [RFC PATCH v2 3/3] hw/block/pflash: use
 memory_region_init_rom_device_from_file()
Date: Mon,  1 Mar 2021 12:53:29 +0100
Message-Id: <20210301115329.411762-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301115329.411762-1-philmd@redhat.com>
References: <20210301115329.411762-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, haibinzhang <haibinzhang@tencent.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the block drive is read-only we will model a "protected" flash
device. We can thus use memory_region_init_rom_device_from_file()
which mmap the backing file when creating the MemoryRegion.
If the same backing file is used by multiple QEMU instances, this
reduces the memory footprint (this is often the case with the
CODE flash image from OVMF and AAVMF).

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index a5fa8d8b74a..ec290636298 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -702,6 +702,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     int ret;
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
+    bool romd_mr_shared_mapped;
 
     if (pfl->sector_len == 0) {
         error_setg(errp, "attribute \"sector-length\" not specified or zero.");
@@ -743,19 +744,41 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         pfl->ro = 0;
     }
 
-    memory_region_init_rom_device(
-        &pfl->mem, OBJECT(dev),
-        &pflash_cfi01_ops,
-        pfl,
-        pfl->name, total_len, errp);
-    if (*errp) {
-        return;
+    if (pfl->ro && pfl->blk) {
+        BlockDriverState *bs = blk_bs(pfl->blk);
+
+        /* If "raw" driver used, try to mmap the backing file as RAM_SHARED */
+        if (bs->drv == &bdrv_raw) { /* FIXME check offset=0 ? */
+            Error *local_err = NULL;
+
+            memory_region_init_rom_device_from_file(&pfl->mem, OBJECT(dev),
+                                                    &pflash_cfi01_ops, pfl,
+                                                    pfl->name, total_len,
+                                                    qemu_real_host_page_size,
+                                                    RAM_SHARED,
+                                                    bs->exact_filename,
+                                                    true, &local_err);
+            if (local_err) {
+                error_report_err(local_err);
+                /* fall back to memory_region_init_rom_device() */
+            } else {
+                romd_mr_shared_mapped = true;
+            }
+        }
+    }
+    if (!romd_mr_shared_mapped) {
+        memory_region_init_rom_device(&pfl->mem, OBJECT(dev),
+                                      &pflash_cfi01_ops, pfl,
+                                      pfl->name, total_len, errp);
+        if (*errp) {
+            return;
+        }
     }
 
     pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
-    if (pfl->blk) {
+    if (pfl->blk && !romd_mr_shared_mapped) {
         if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
                                          errp)) {
             vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
-- 
2.26.2


