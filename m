Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B113909EE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:50:48 +0200 (CEST)
Received: from localhost ([::1]:33724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lld4g-0003EP-Qz
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1lld0X-0006YK-EZ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:46:29 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1lld0R-00073h-5K
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:46:29 -0400
Received: by mail-qk1-x72e.google.com with SMTP id q10so31672510qkc.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 12:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J00AFYHzr+9ngwCXo9aAAPPc/2POf9OmAX8slM/yDBc=;
 b=ixERXFuOJzNGy6UteGxFuVMWL3cBCe0lhHSJdxDUc3TR82/ampD0Eorj6KGX9x9wR6
 Vn9Aurkp3t1vZofdBBRQx6kIwu5+pjp3sjJHnipFDwMKxElx+vr00Xq9Ffb2cvGpGOTs
 yv/ODh/cgknVu40An0ZelHQev2syegimbPa45laFz0r6Gjq9SpELbaMjw/oFlsuPyqjJ
 LSAJ7jyavyJQituMS+rVEfEoycziMshMBp43p3ugEvDqxqqkf56AzHh/ARHnRX4alvqE
 LievYJ0ow0VQp9aZGud4KOuFtL7w+VCU4E7P7HhgHvuUjAJkCWPVw0hz3elKYAwyEFpy
 hPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J00AFYHzr+9ngwCXo9aAAPPc/2POf9OmAX8slM/yDBc=;
 b=XAn7wai20iDPomrxq6CQWEeCMFHb6xz7Z0kCUwZ41eNjPbBo9ZfbzuHXgFKYTiczUq
 j2i55GBaMKdDn7aXRncSaOK1GHxCFl1WfRLt+LOWfZwUn0trhUHIpNvE3VenO+eJMvfm
 Z2dyh/Ul+pKHj82+E+K2W1r0FHTjF1Fp+z7K2l69N1JOVFG4C5q3x2i32Q2gkcGWJe+F
 CQHXONuaFrEdDGC/refVdmpqZ2etNDsAPQwlEJ2qBVJCrYtFZm4eqS3ECUrYI8pEDWgH
 Mi7IOH+9iba+UGh5gAk3nR+l0RV+r5oFxfz8lQ145ufnMYxnhD2IMu+iBqzlZtbcLhv2
 1Pgg==
X-Gm-Message-State: AOAM530RN+zCYQzifwHIwqN+ScxBJQjr5kWAf1X6Z2TVeOc5NWeoUCWo
 mE+sV0SAX3wUYKY9emmSA5a72y0VDCg=
X-Google-Smtp-Source: ABdhPJyFE3Vem7SnGxZRGprLPufg+N9k5/udJMLA1LyaDKbFFhxHNckiADJ59DFKcoqP2mI81heK0g==
X-Received: by 2002:a05:620a:2296:: with SMTP id
 o22mr33443292qkh.408.1621971981498; 
 Tue, 25 May 2021 12:46:21 -0700 (PDT)
Received: from nishikirei.com.com ([104.131.0.80])
 by smtp.gmail.com with ESMTPSA id o5sm87206qtl.85.2021.05.25.12.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 12:46:21 -0700 (PDT)
From: Kit Westneat <kit.westneat@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] tests/qtest/virtio-scsi-test: add unmap large LBA with
 4k blocks test
Date: Tue, 25 May 2021 19:46:06 +0000
Message-Id: <20210525194607.553291-3-kit.westneat@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525194607.553291-1-kit.westneat@gmail.com>
References: <20210525194607.553291-1-kit.westneat@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=kit.westneat@gmail.com; helo=mail-qk1-x72e.google.com
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


