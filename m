Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0776D57E75F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:26:51 +0200 (CEST)
Received: from localhost ([::1]:45954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyIU-0000SV-2G
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richy.liu.2002@gmail.com>)
 id 1oEyDf-0002sH-RG
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:21:51 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richy.liu.2002@gmail.com>)
 id 1oEyDd-0003LL-IF
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:21:51 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 v16-20020a17090abb9000b001f25244c65dso1599460pjr.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 12:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gqVMMsXfA7B31E39jHQeupuq+8wMcq0SSeSlJMjkwdw=;
 b=MYnhdQ6k0KRg6weacgfbSK/gmBFUYuHVTqaZ/v3ZFPtlWTlEKlwQxjIJcF5cK8xIfd
 RD11dlgzyx1oF5K2cJoK+51PH+tkJBhydr9QQw4h9LXjWsuKoChIS8FVttn9d88o28gn
 qBPY75EY60m6rBADDwzCDWpUCarjxGQAnWDxWEkBZ92A4hfVPmyQvpOV/RpM196ecJme
 ltZ3f5D4w3MTXFvkSiFmJtp4O2mlAvOXdnGGZ8VrghoAONkNlrgBrawZVPhcsnnVqMnQ
 qWFoGVk01k3sL1V5t0y32lCfAecsrI5pw1Dm71Rqk67Jg5JAZE9fHHpsO8TqEUnfhMYP
 cjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gqVMMsXfA7B31E39jHQeupuq+8wMcq0SSeSlJMjkwdw=;
 b=GBZAo547X4tJ1Fz17CbbBqzRQujA5ggeRmTZg7ozL864DdfvdYb6mtEoSvVB8L829s
 jGROxw5II2bNBPRg1bZ8amivYUwdCzKtrv9XpcaevI6yyp+ZoEfWeKGrN/yswPi+bNp6
 ZtnwXx1bQ/N7BlnR67NBuoh5Dh2Xz40noakGUMWtQ8tLTv8j8UBjzF9Bqnc1PV+03GqU
 aYVO3ElL1E1Z2+4VWL9DwnRZ9b48uHqp5SlQetZcOzuzGR8FouuE1ogIgSnWDtLACKza
 P1UHnappT896vXGk7B8B4QDgzpnG1d+y1sYBOTq9e7Sr33OsXle/BQjrorKdpgX2c/iq
 trnA==
X-Gm-Message-State: AJIora+plLuFIxmH/zC23l4V4sTWni1m3LpjNT8XFYtCma4NDmBou7/j
 0KjzsdLbIsnRKWvKs51blQljilQq/KeAKA==
X-Google-Smtp-Source: AGRyM1u9chOlvrerxR6kJFwoTBRqEM6NTsgsx70T9rsGnzdXed10lTgFZXFWXNdnHZW80aAZA+/meQ==
X-Received: by 2002:a17:903:2055:b0:16d:2156:7f98 with SMTP id
 q21-20020a170903205500b0016d21567f98mr1301199pla.24.1658517708012; 
 Fri, 22 Jul 2022 12:21:48 -0700 (PDT)
Received: from localhost.localdomain ([76.132.29.156])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a17090a2ec500b001f246f2a423sm2006394pjs.17.2022.07.22.12.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 12:21:47 -0700 (PDT)
From: Richard Liu <richy.liu.2002@gmail.com>
To: qemu-devel@nongnu.org
Cc: alxndr@bu.edu, bsd@redhat.com, darren.kenny@oracle.com,
 Richard Liu <richy.liu.2002@gmail.com>
Subject: [RFC 2/3] implement ram save/restore
Date: Fri, 22 Jul 2022 12:20:40 -0700
Message-Id: <20220722192041.93006-3-richy.liu.2002@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220722192041.93006-1-richy.liu.2002@gmail.com>
References: <20220722192041.93006-1-richy.liu.2002@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richy.liu.2002@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Use a file-backed copy-on-write mmap region for snapshots. Restores are
handled by remmaping the fixed region. Currently, the snapshot file save
path (`filepath`) is hardcoded (to a path that is memory-backed on my
machine).

Signed-off-by: Richard Liu <richy.liu.2002@gmail.com>
---
 hw/misc/snapshot.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/hw/misc/snapshot.c b/hw/misc/snapshot.c
index 2690b331fd..510bf59dce 100644
--- a/hw/misc/snapshot.c
+++ b/hw/misc/snapshot.c
@@ -18,8 +18,63 @@ DECLARE_INSTANCE_CHECKER(SnapshotState, SNAPSHOT,
 struct SnapshotState {
     PCIDevice pdev;
     MemoryRegion mmio;
+
+    // track saved stated to prevent re-saving
+    bool is_saved;
+
+    // saved cpu and devices state
+    QIOChannelBuffer *ioc;
 };
 
+// memory save location (for better performance, use tmpfs)
+const char *filepath = "/Volumes/RAMDisk/snapshot_0";
+
+static void save_snapshot(struct SnapshotState *s) {
+    if (s->is_saved) {
+        return;
+    }
+    s->is_saved = true;
+
+    // save memory state to file
+    int fd = -1;
+    uint8_t *guest_mem = current_machine->ram->ram_block->host;
+    size_t guest_size = current_machine->ram->ram_block->max_length;
+
+    fd = open(filepath, O_RDWR | O_CREAT | O_TRUNC, (mode_t)0600);
+    ftruncate(fd, guest_size);
+
+    char *map = mmap(0, guest_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+    memcpy(map, guest_mem, guest_size);
+    msync(map, guest_size, MS_SYNC);
+    munmap(map, guest_size);
+    close(fd);
+
+    // unmap the guest, we will now use a MAP_PRIVATE
+    munmap(guest_mem, guest_size);
+
+    // map as MAP_PRIVATE to avoid carrying writes back to the saved file
+    fd = open(filepath, O_RDONLY);
+    mmap(guest_mem, guest_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_FIXED, fd, 0);
+}
+
+static void restore_snapshot(struct SnapshotState *s) {
+    int fd = -1;
+    uint8_t *guest_mem = current_machine->ram->ram_block->host;
+    size_t guest_size = current_machine->ram->ram_block->max_length;
+
+    if (!s->is_saved) {
+        fprintf(stderr, "[QEMU] ERROR: attempting to restore but state has not been saved!\n");
+        return;
+    }
+
+    munmap(guest_mem, guest_size);
+
+    // remap the snapshot at the same location
+    fd = open(filepath, O_RDONLY);
+    mmap(guest_mem, guest_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_FIXED, fd, 0);
+    close(fd);
+}
+
 static uint64_t snapshot_mmio_read(void *opaque, hwaddr addr, unsigned size)
 {
     return 0;
@@ -28,6 +83,21 @@ static uint64_t snapshot_mmio_read(void *opaque, hwaddr addr, unsigned size)
 static void snapshot_mmio_write(void *opaque, hwaddr addr, uint64_t val,
                 unsigned size)
 {
+    SnapshotState *snapshot = opaque;
+    (void)snapshot;
+
+    switch (addr) {
+    case 0x00:
+        switch (val) {
+        case 0x101:
+            save_snapshot(snapshot);
+            break;
+        case 0x102:
+            restore_snapshot(snapshot);
+            break;
+        }
+        break;
+    }
 }
 
 static const MemoryRegionOps snapshot_mmio_ops = {
@@ -48,6 +118,8 @@ static const MemoryRegionOps snapshot_mmio_ops = {
 static void pci_snapshot_realize(PCIDevice *pdev, Error **errp)
 {
     SnapshotState *snapshot = SNAPSHOT(pdev);
+    snapshot->is_saved = false;
+    snapshot->ioc = NULL;
 
     memory_region_init_io(&snapshot->mmio, OBJECT(snapshot), &snapshot_mmio_ops, snapshot,
                     "snapshot-mmio", 1 * MiB);
-- 
2.35.1


