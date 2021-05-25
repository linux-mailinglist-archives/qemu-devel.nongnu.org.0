Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D6390201
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:19:21 +0200 (CEST)
Received: from localhost ([::1]:44418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llWxs-0007Sy-Ug
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWv6-0004xA-KR
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:16:28 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:44885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llWv4-0004fF-Ka
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:16:28 -0400
Received: by mail-qv1-xf30.google.com with SMTP id a7so11625049qvf.11
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J00AFYHzr+9ngwCXo9aAAPPc/2POf9OmAX8slM/yDBc=;
 b=fTbXGAY0hkx6KvmWw7radja7auGtH3fX99Dz14gdFV+RiUQK/ErP3bL7pibjKdvOPt
 jzvuBOi24yILQY75ASu4uZWGwi1lmwJWrXt1+S3QffkKskOM3UNi5NFvzlMoVsPeN/jd
 ONOiWnwdPRIkJLzAYPw5c9wQFlC7W0yFNzsd58JplGH5CJ/lGRd7ZPeSJ79jCmGv7wYU
 lzkwIBeVUqxYiRE5yzFstTnEq9AZUUuHGzFDQxWn3Bu5Fq/+aXVvXUsYtgmP9xzQu1bG
 HaHFS4tf4UzntKoA+fCPVdVnYTSEfyaA9GYdpXpQRVy0PpEr+VQyqj9xnZjufAA9Tx1W
 RMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J00AFYHzr+9ngwCXo9aAAPPc/2POf9OmAX8slM/yDBc=;
 b=CXcW+P1LRuYAC5YE7hqbnl+m7sqObuxU17xq8l8oWmOoTJGTpTgjsk5Rh6e2qSJ6CQ
 Di0vRV/KZrB5oetOggkC/jfWozyAHU3JbGTR6GXns/pe6DsGYptSo6F8l/wXCS4lsRnP
 solH4h/ZVoH9JJUAoq0LEGKB5NyBI5WNQPTfyyGkXXoFQeF4j+k3S13VRjijfRaRuOiP
 C9dShWpgGVv0mAAK2k4k2TudDKP7iBKfv8sfsHWQl7bnQPjnVzqier8EbNZ+vAwTeoZ0
 TfAYaDbj4kR2hdL64oIcnkVZi1wC4d+ZsTpReaAmh3ikncIRIqSHCQxFl5fwTo5EGS/M
 ZJkA==
X-Gm-Message-State: AOAM532ItroD6G3I1V4b5a1xtIE67HuTDrIHyEO7xJIiudavAVsULWCq
 58GU0ReLpQHXGBPlmSZa7FtzJ0ydQnQ=
X-Google-Smtp-Source: ABdhPJzYJeHC6YYasbPgQY3dpd3r5Hhz0KmJzd62TmEjYUKtcMl9n+xqYoBkWM0ETAqP/gmF25ncIg==
X-Received: by 2002:a0c:b292:: with SMTP id r18mr37213154qve.57.1621948585456; 
 Tue, 25 May 2021 06:16:25 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id p14sm13213596qki.27.2021.05.25.06.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:16:24 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] tests/qtest/virtio-scsi-test: add unmap large LBA with
 4k blocks test
Date: Tue, 25 May 2021 13:15:44 +0000
Message-Id: <20210525131545.529451-3-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525131545.529451-1-kit.westneat@gmail.com>
References: <20210525131545.529451-1-kit.westneat@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=kit.westneat@gmail.com; helo=mail-qv1-xf30.google.com
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
 tests/qtest/virtio-scsi-test.c | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
index 1b7ecc1c8f..e569bda7d0 100644
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
@@ -293,6 +329,16 @@ static void *virtio_scsi_setup(GString *cmd_line, void *arg)
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
@@ -323,6 +369,10 @@ static void register_virtio_scsi_test(void)
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


