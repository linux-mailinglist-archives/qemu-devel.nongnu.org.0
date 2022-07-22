Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB857E75E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 21:26:50 +0200 (CEST)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyIT-0000NG-Df
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 15:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richy.liu.2002@gmail.com>)
 id 1oEyE4-0003Cx-0z
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:22:16 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richy.liu.2002@gmail.com>)
 id 1oEyDe-0003LQ-KH
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 15:22:05 -0400
Received: by mail-pf1-x42e.google.com with SMTP id c3so5211546pfb.13
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SopgYvM+0FjAMmCKhAHP9BuulNAc3Rfbvq2zx2MdjDk=;
 b=bBIpFmx+H9bwtgbI+0nb8bICbdT0jSrmquwzCymqqDU49cb3rdjKKUebZnaCuPah80
 At/ToGme235ukdZucrd3eBTMCW42my1aj0bb1sjQbxy6R/5hc9S/klZGjNEEvBZfdfZh
 emFBuEKpisSQnQ/ZjJn8KUpTKDYkSJ2TMPRJ8uitrzEDetwpH9yXcgXBnx05JKAYE+C+
 R78YlfdC360d6omDZExR+onL+ef1ee0JCAq2JjdOMx6EHJEpMqSLnrWiA24D1Wh/CzHj
 J8uBI7giCKjFA5vf1WpNzFY0tRzPYOusXruaHf0q+HWQOGbq7xj4zyhpguc6Y9+V6xu7
 E1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SopgYvM+0FjAMmCKhAHP9BuulNAc3Rfbvq2zx2MdjDk=;
 b=liRpzLyH/jdQt0h+y7p6u82Q5KdtXIOKDG/9oGtNpQ2cLvPkmpAY/qKrJWg/GeR4rA
 D8BXrAJ+VOL6pHWiWDoMVMWWZaMM33oiH3SbVbr//WWy7zfAopQRRbC0GFP9Yefk7GmJ
 V+zFxAJ/Cr7zJJk76MpywMFvsUyPRsjc9Ao/N40IeZHkJEb/7rFuElIlTyQ0Ld+NX9j7
 1VopDJ10v9F4aQ5BChX6oiHI/qZmPO09c5vg7ARngpSm2aSV4zrz3FsoDvSsxyHeZ78J
 cBoQntoW7fgt4lqWkyyPtAVar7+sZc14cL3xXPEO4fUt1AbY1EgKI2YtwxPcdLSe4mMU
 5y9w==
X-Gm-Message-State: AJIora/quST56tXXQeFRuSvYFZOLmuk/k2iq3eG6XtB2IGoMbnB7zDiw
 kl42oLejUUuWIZUcU49HFw6YFnyUgcvkpA==
X-Google-Smtp-Source: AGRyM1tY6oYbWM3YXEyzbvRm2+ftZwSwmDV89aofaofSUdESB+DuXgOoDiaZx2x+0WTun5j9ZSJ4zA==
X-Received: by 2002:a63:e547:0:b0:419:8146:1f4f with SMTP id
 z7-20020a63e547000000b0041981461f4fmr1017325pgj.507.1658517709057; 
 Fri, 22 Jul 2022 12:21:49 -0700 (PDT)
Received: from localhost.localdomain ([76.132.29.156])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a17090a2ec500b001f246f2a423sm2006394pjs.17.2022.07.22.12.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 12:21:48 -0700 (PDT)
From: Richard Liu <richy.liu.2002@gmail.com>
To: qemu-devel@nongnu.org
Cc: alxndr@bu.edu, bsd@redhat.com, darren.kenny@oracle.com,
 Richard Liu <richy.liu.2002@gmail.com>
Subject: [RFC 3/3] use migration code for cpu and device save/restore
Date: Fri, 22 Jul 2022 12:20:41 -0700
Message-Id: <20220722192041.93006-4-richy.liu.2002@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220722192041.93006-1-richy.liu.2002@gmail.com>
References: <20220722192041.93006-1-richy.liu.2002@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richy.liu.2002@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Reused device migration code for cpu and device state snapshots. In this
initial version, I used several hacks to get the device code working.

vm_stop doesn't have the intended effect (for qemu_save_device_state)
unless called outside the vcpu thread. I trick the function into
thinking it is outside the vcpu thread by temporarily setting
`current_cpu` to be null.

The restore code (qemu_loadvm_state in particular) needs to be called
in a bottom half or a coroutine. I am not sure why.

Signed-off-by: Richard Liu <richy.liu.2002@gmail.com>
---
 hw/misc/snapshot.c |  6 ++++
 migration/savevm.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++
 migration/savevm.h |  3 ++
 3 files changed, 93 insertions(+)

diff --git a/hw/misc/snapshot.c b/hw/misc/snapshot.c
index 510bf59dce..afdc5b7f15 100644
--- a/hw/misc/snapshot.c
+++ b/hw/misc/snapshot.c
@@ -55,6 +55,9 @@ static void save_snapshot(struct SnapshotState *s) {
     // map as MAP_PRIVATE to avoid carrying writes back to the saved file
     fd = open(filepath, O_RDONLY);
     mmap(guest_mem, guest_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_FIXED, fd, 0);
+
+    // save cpu and device state
+    s->ioc = qemu_snapshot_save_cpu_state();
 }
 
 static void restore_snapshot(struct SnapshotState *s) {
@@ -73,6 +76,9 @@ static void restore_snapshot(struct SnapshotState *s) {
     fd = open(filepath, O_RDONLY);
     mmap(guest_mem, guest_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_FIXED, fd, 0);
     close(fd);
+
+    // restore cpu and device state
+    qemu_snapshot_load_cpu_state(s->ioc);
 }
 
 static uint64_t snapshot_mmio_read(void *opaque, hwaddr addr, unsigned size)
diff --git a/migration/savevm.c b/migration/savevm.c
index 48e85c052c..62e5e5b564 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3309,3 +3309,87 @@ void qmp_snapshot_delete(const char *job_id,
 
     job_start(&s->common);
 }
+
+// saves the cpu and devices state
+QIOChannelBuffer* qemu_snapshot_save_cpu_state(void)
+{
+    QEMUFile *f;
+    QIOChannelBuffer *ioc;
+    MigrationState *ms = migrate_get_current();
+    int ret;
+
+    /* This is a hack to trick vm_stop() into thinking it is not in vcpu thread.
+     * This is needed to properly stop the VM for a snapshot.
+     */
+    CPUState *cpu = current_cpu;
+    current_cpu = NULL;
+    vm_stop(RUN_STATE_SAVE_VM);
+    current_cpu = cpu;
+
+    global_state_store_running();
+
+    ioc = qio_channel_buffer_new(0x10000);
+    qio_channel_set_name(QIO_CHANNEL(ioc), "snapshot-buffer");
+    f = qemu_file_new_output(QIO_CHANNEL(ioc));
+
+    /* We need to initialize migration otherwise qemu_save_device_state() will
+     * complain.
+     */
+    migrate_init(ms);
+    ms->state = MIGRATION_STATUS_NONE;
+    ms->send_configuration = false;
+
+    cpu_synchronize_all_states();
+
+    ret = qemu_save_device_state(f);
+    if (ret < 0) {
+        fprintf(stderr, "[QEMU] save device err: %d\n", ret);
+    }
+
+    // clean up and restart vm
+    qemu_fflush(f);
+    g_free(f);
+
+    vm_start();
+
+    /* Needed so qemu_loadvm_state does not error with:
+     * qemu-system-x86_64: Expected vmdescription section, but got 0
+     */
+    ms->state = MIGRATION_STATUS_POSTCOPY_ACTIVE;
+
+    return ioc;
+}
+
+// loads the cpu and devices state
+static void do_snapshot_load(void* opaque) {
+    QIOChannelBuffer *ioc = opaque;
+    QEMUFile *f;
+    int ret;
+
+    vm_stop(RUN_STATE_RESTORE_VM);
+
+    // seek back to beginning of file
+    qio_channel_io_seek(QIO_CHANNEL(ioc), 0, 0, NULL);
+    f = qemu_file_new_input(QIO_CHANNEL(ioc));
+
+    ret = qemu_loadvm_state(f);
+    if (ret < 0) {
+        fprintf(stderr, "[QEMU] loadvm err: %d\n", ret);
+    }
+
+    vm_start();
+
+    g_free(f);
+
+    // print time to debug speed
+    struct timespec ts;
+    clock_gettime(CLOCK_MONOTONIC, &ts);
+    fprintf(stderr, "loaded snapshot at %ld.%ld\n", ts.tv_sec, ts.tv_nsec);
+}
+
+void qemu_snapshot_load_cpu_state(QIOChannelBuffer *ioc) {
+    /* Run in a bh because otherwise qemu_loadvm_state won't work
+     */
+    QEMUBH *bh = qemu_bh_new(do_snapshot_load, ioc);
+    qemu_bh_schedule(bh);
+}
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342cb4..990bcddd2f 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -68,4 +68,7 @@ int qemu_load_device_state(QEMUFile *f);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy, bool inactivate_disks);
 
+QIOChannelBuffer* qemu_snapshot_save_cpu_state(void);
+void qemu_snapshot_load_cpu_state(QIOChannelBuffer *ioc);
+
 #endif
-- 
2.35.1


