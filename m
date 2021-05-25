Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E339015E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 14:52:05 +0200 (CEST)
Received: from localhost ([::1]:47570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWXU-0006Ed-EC
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 08:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWUA-0001VB-HW
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:48:38 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWU7-00048o-Hk
 for qemu-devel@nongnu.org; Tue, 25 May 2021 08:48:38 -0400
Received: by mail-qt1-x82d.google.com with SMTP id i12so3443503qtr.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N1vErSLPnbM9DSp6U1L0Sbxqjsv59zIXbG3fgAM+mzU=;
 b=FM6F+GDyGWRkJlpws3JjSJ6dH8Q7yrRLQtwoWyxQ6VVdrps1rMuv971BrzLc5iyOPi
 358RD66Zhp+wnoOhqHbh6Lsd6oYPOp3Aj5oU+6aVHSBtFjveL+ZGjKJi92J3Knoow0ds
 JKsjB6W5YwquBJac394P7HH5uB0Ye0Zy2NO9W3wju0mDbU5j7RJ1tK73zEasWX/jXC4Y
 QG+8E1l9M3Et8nAaOVN/eBJKS/Eub6IISaA0c5M3fJU+j9WqeRysmWvWWBt+tWg2KIRA
 6S//KAgPezH58iKtAa+UiBEV+QDxmhJvwLmRXaoy0nX4NkeA6xbYR73vERwx/rxh5bMB
 yfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N1vErSLPnbM9DSp6U1L0Sbxqjsv59zIXbG3fgAM+mzU=;
 b=IEeQpVudQb52HT/LJjXrjmRvZ/KOaJmt/+7vuvzpmSkgkxKYvWfZfRT4DZwt1mTQZR
 m/SAhmivySatDmOvVMmbfC/i1B2DOhde5wupkeaTTqmZGl1UTGqFDLW1esf61Gn6xTNg
 APAaeDoRf3IiwUlW5s4DM5pEsj2ej97X3V1msGRATmI4f1rwV1jQwZ1HrbjMFd2EiUku
 hr7IZkTNlfm+i2PCGSUVdg9lqBLCKRfT78B38fOyLaYwtps1L0kdcFMD6+A2/ugHzlVb
 eizC+jOni0t/tEShzWDkZTzAQB03+MdrsPYBSgXYjb+6oDkdIgPhLsiD22K1vKg3hTIo
 yVCw==
X-Gm-Message-State: AOAM533l0Fug5eG59KJXQ3BrK6OiT8m2yhvrD4aaDEIxV5LLSKZTsE52
 bPszOhE/428ZXQFLGLxcK1hOE9crgpA=
X-Google-Smtp-Source: ABdhPJy6zuKOl3SjpyyAFM7DmQyYZqt99MzLVt9cpHcTGsfH/GUxWgOgEDhCMmRG3T0aUMBJno/PQw==
X-Received: by 2002:a05:622a:15cb:: with SMTP id
 d11mr14313953qty.11.1621946914203; 
 Tue, 25 May 2021 05:48:34 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id a68sm13036749qkd.51.2021.05.25.05.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 05:48:33 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] tests/qtest/virtio-scsi-test: add unmap large LBA with 4k
 blocks test
Date: Tue, 25 May 2021 12:47:52 +0000
Message-Id: <20210525124753.528516-3-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525124753.528516-1-kit.westneat@gmail.com>
References: <20210525124753.528516-1-kit.westneat@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=kit.westneat@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, Kit Westneat <kit.westneat@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add test for issue #345

Signed-off-by: Kit Westneat <kit.westneat@gmail.com>
---
 tests/qtest/virtio-scsi-test.c | 48 ++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
index 1b7ecc1c8f..6557e4f422 100644
--- a/tests/qtest/virtio-scsi-test.c
+++ b/tests/qtest/virtio-scsi-test.c
@@ -200,6 +200,40 @@ static void test_unaligned_write_same(void *obj, void *data,
     qvirtio_scsi_pci_free(vs);
 }
 
+/* Test UNMAP with a large LBA, issue #345 */
+static void test_unmap_large_lba(void *obj, void *data,
+                                      QGuestAllocator *t_alloc)
+{
+    QVirtioSCSI *scsi = obj;
+    QVirtioSCSIQueues *vs;
+    const uint8_t unmap[VIRTIO_SCSI_CDB_SIZE] = {
+        0x42, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00
+    };
+
+    // default null-co device size is 2**30
+    // LBA 0x7fff is ~ 1/8 into device, with 4k blocks
+    // if check_lba_range incorrectly using 512 bytes, will trigger sense error
+    uint8_t unmap_params[0x18] = {
+        0x00, 0x16, // unmap data length
+        0x00, 0x10, // unmap block descriptor data length
+        0x00, 0x00, 0x00, 0x00, // reserved
+        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xff, // LBA
+        0x00, 0x00, 0x03, 0xff, // sector count
+        0x00, 0x00, 0x00, 0x00, //reserved
+    };
+    struct virtio_scsi_cmd_resp resp;
+
+    alloc = t_alloc;
+    vs = qvirtio_scsi_init(scsi->vdev);
+
+    virtio_scsi_do_command(vs, unmap, NULL, 0, unmap_params,
+                           sizeof(unmap_params), &resp);
+    g_assert_cmphex(resp.response, ==, 0);
+    g_assert_cmphex(resp.status, !=, CHECK_CONDITION);
+
+    qvirtio_scsi_pci_free(vs);
+}
+
 static void test_write_to_cdrom(void *obj, void *data,
                                 QGuestAllocator *t_alloc)
 {
@@ -293,6 +327,16 @@ static void *virtio_scsi_setup(GString *cmd_line, void *arg)
     return arg;
 }
 
+static void *virtio_scsi_setup_4k(GString *cmd_line, void *arg)
+{
+    g_string_append(cmd_line,
+                    " -drive file=blkdebug::null-co://,"
+                    "file.image.read-zeroes=on,"
+                    "if=none,id=dr1,format=raw,file.blocksize=4k "
+                    "-device scsi-hd,drive=dr1,lun=0,scsi-id=1");
+    return arg;
+}
+
 static void *virtio_scsi_setup_cd(GString *cmd_line, void *arg)
 {
     g_string_append(cmd_line,
@@ -323,6 +367,10 @@ static void register_virtio_scsi_test(void)
     qos_add_test("unaligned-write-same", "virtio-scsi",
                  test_unaligned_write_same, &opts);
 
+    opts.before = virtio_scsi_setup_4k;
+    qos_add_test("large-lba-unmap", "virtio-scsi",
+                 test_unmap_large_lba, &opts);
+
     opts.before = virtio_scsi_setup_cd;
     qos_add_test("write-to-cdrom", "virtio-scsi", test_write_to_cdrom, &opts);
 
-- 
2.26.3


