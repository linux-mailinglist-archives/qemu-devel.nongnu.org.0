Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35DA39BBAD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:21:32 +0200 (CEST)
Received: from localhost ([::1]:33176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBdb-0007u0-VV
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa8-0007tj-9b
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:56 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBa6-0008Fo-GV
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:17:55 -0400
Received: by mail-ej1-x631.google.com with SMTP id c10so15018340eja.11
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K1tL+erQPidZ36ddRBBO4262j1mjJRCxWQU+9QCKKGQ=;
 b=a/NLM2AhJ15m16EdB1eYSIQ+wUpyG8BoVpeUanRPFF9CnlCoMpIdPJF4GKozAeUQJy
 y/HV6unNrYFFcFy2a5SuhlpOl1bAq4l3bTdUvjRIckFhKB++yEonvgZ3JbfIw+ukG/AN
 oTDkf8LPg3wMYnHGIplqnK5C/RX+qyshlxzqysxNmSLFR5+/FPDEVLz/8hgKx+lnhEz5
 YxoDurSVYwp0/w3pjdDLgUgJyZuEexcnQlR+E+eYZbsseqWQE+kAU7AQL9E4m9NiHHeZ
 +B1eAwGyMn2sOrV9EbGdgfLOWUHOlSXQ46x8wKr6tz8zSflAkaR8trVOHyj8YEeRWHGY
 cgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K1tL+erQPidZ36ddRBBO4262j1mjJRCxWQU+9QCKKGQ=;
 b=RcLKb4X80fnmanfy5tQF+0tt9qWak9I6G7729xJl2u5ylYUjJvHq2BhIFtUEROKYN5
 15vZsHziLlQ7sGQjyNq6UmUjoerlTub3F8tolIc+WJQCxQSicrl4fyE0TgwWWitHgBoa
 utKnBinoWnE+psY5zw7bmTnfujJLq8Dn0DK4i6d8gf4lw8ih7kX47a9x4cmlgC7bWiPm
 ynbv6BcJiYlMlVGtrxO0BptLgb04dzL4DLqyGaKrzLO4TXU6qGoRasrOaFWDwVqGJdbf
 uSPWaFqGWhOgT3JsfZ+Ln1Zsgfys8NNbfcFdBKDWi1+oG67gT+XuePRt8OT17coOb3NX
 w4Lg==
X-Gm-Message-State: AOAM53082SFiyuyP28NqFxz9H+aJd0wyVbO53UU+Rf661LdImnUDRocq
 jXZbZAf3jmSmHSF8CLDTCaszgYjlv0whLg==
X-Google-Smtp-Source: ABdhPJxfMOag6/CCgbNag4pw9+YYRGikLotVzmRmMMhWFDkl0uHOx/iZlpIjAt075xtZm/yn6i2YGg==
X-Received: by 2002:a17:906:40ca:: with SMTP id
 a10mr4664362ejk.181.1622819873211; 
 Fri, 04 Jun 2021 08:17:53 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] tests/qtest/virtio-scsi-test: add unmap large LBA with
 4k blocks test
Date: Fri,  4 Jun 2021 17:17:40 +0200
Message-Id: <20210604151745.310318-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kit Westneat <kit.westneat@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kit Westneat <kit.westneat@gmail.com>

Add test for issue #345

Signed-off-by: Kit Westneat <kit.westneat@gmail.com>
Message-Id: <20210603142022.676395-1-kit.westneat@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.31.1



