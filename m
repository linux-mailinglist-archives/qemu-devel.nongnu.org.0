Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9131139A2EF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:21:33 +0200 (CEST)
Received: from localhost ([::1]:40692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looE0-00051l-7J
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1looD1-00043b-Fn
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:20:31 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:33432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1looCz-0003wC-FB
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:20:31 -0400
Received: by mail-qk1-x730.google.com with SMTP id k4so6128276qkd.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iUoSNeDrjU0DRxSO4R6h9hF5BPLSvnfzTWmQEJUap0Q=;
 b=ZSSPp9lMfdpDBXvcJ/fzveXphOFODiNVUFwD8xKpSa2+kwGJ/FeBCP75iFTbDqJZEH
 WL8DsSIcjnh1X85Yky0SQgSynCMRoptMRwda3NnGU/QTgrH/mVj8xzFtn5xYFeQ76b9R
 rfqkJb8xBhDuD+6mtu6cGllzeDXSKcw/xYryCcqmf3LK+3VW63fODAvNUJBUDyHC0080
 rcCU8U1e3W5hLHohZP38+H/i8VwjsCNsMLUUcfTHzml6A6zhIM9kvu8WI1/TfeRGC9IO
 JMjRMOg8OM04rjVj6CA6guZu66BW+iYTbmTr1sHi0RdHn0DB7C/uUM6CXYIHN7MPJRrW
 pjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iUoSNeDrjU0DRxSO4R6h9hF5BPLSvnfzTWmQEJUap0Q=;
 b=DVgfooIPyrcHcw5h/yjraOezdqnoAgjwIYhXlaSBoy9PMwLTMHd7Qy1cyILUDj9QgP
 TLLx49F4PvyrXHT4lmzmbrItKUG7+qlvf3QCQWPgxYuBVhqID5yxtEMCl66zOGnOEmfM
 fRgvwyrT2djKmkY5uftKwlkkMzS++OuSAqq2nx4zudpHBPAaYHSth15PMv+fRuLob1Xa
 LS3EHdkzW6mZpHV+45rxLpdCBd5anANvk6Hwuce3mxWgLezqV47LXDIJrCP3aIJRJSA1
 0BaEMcdJGwmbWQ3sFFf/mQJmNV+JzfF2GhdQM4hYDV5q/3AHlhZ73Gz0DwVNB5K0iq1W
 iOTQ==
X-Gm-Message-State: AOAM531jUyd9HMFb/wo/lec9q6kwJwl15tawJsX15bPrpeNabPdOhvG1
 fbluqVfnKTCPtVtiTVoHfftflIBJjwU=
X-Google-Smtp-Source: ABdhPJy1pAU7hRHhw8q6OE/NhdK7qSDq99wCdJapYjQFYiNvcrmoBevcn+/exlTJogIO5w5CJpVVbg==
X-Received: by 2002:a05:620a:b1b:: with SMTP id
 t27mr32481739qkg.42.1622730026013; 
 Thu, 03 Jun 2021 07:20:26 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id y10sm1823593qtm.17.2021.06.03.07.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:20:25 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] tests/qtest/virtio-scsi-test: add unmap large LBA with 4k
 blocks test
Date: Thu,  3 Jun 2021 14:20:22 +0000
Message-Id: <20210603142022.676395-1-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=kit.westneat@gmail.com; helo=mail-qk1-x730.google.com
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
 tests/qtest/virtio-scsi-test.c | 51 ++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
index 1b7ecc1c8f..8ceb12aacd 100644
--- a/tests/qtest/virtio-scsi-test.c
+++ b/tests/qtest/virtio-scsi-test.c
@@ -200,6 +200,42 @@ static void test_unaligned_write_same(void *obj, void *data,
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
+    /*
+     * Default null-co device size is 2**30
+     * LBA 0x7fff is ~ 1/8 into device, with 4k blocks
+     * if check_lba_range incorrectly using 512 bytes, will trigger sense error
+     */
+    uint8_t unmap_params[0x18] = {
+        0x00, 0x16, /* unmap data length */
+        0x00, 0x10, /* unmap block descriptor data length */
+        0x00, 0x00, 0x00, 0x00, /* reserved */
+        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0xff, /* LBA */
+        0x00, 0x00, 0x03, 0xff, /* sector count */
+        0x00, 0x00, 0x00, 0x00, /* reserved */
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
@@ -293,6 +329,17 @@ static void *virtio_scsi_setup(GString *cmd_line, void *arg)
     return arg;
 }
 
+static void *virtio_scsi_setup_4k(GString *cmd_line, void *arg)
+{
+    g_string_append(cmd_line,
+                    " -drive file=blkdebug::null-co://,"
+                    "file.image.read-zeroes=on,"
+                    "if=none,id=dr1,format=raw "
+                    "-device scsi-hd,drive=dr1,lun=0,scsi-id=1"
+                    ",logical_block_size=4k,physical_block_size=4k");
+    return arg;
+}
+
 static void *virtio_scsi_setup_cd(GString *cmd_line, void *arg)
 {
     g_string_append(cmd_line,
@@ -323,6 +370,10 @@ static void register_virtio_scsi_test(void)
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


