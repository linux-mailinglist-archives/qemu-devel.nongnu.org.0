Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33B325EA5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:09:37 +0100 (CET)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYBr-0003kl-0a
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY80-0001jt-Sw
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:37 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7x-00045V-N0
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:36 -0500
Received: by mail-wm1-x32c.google.com with SMTP id w7so6658473wmb.5
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64+qLzbR7jvwBqNVOtzEvyCauEYMhO+b3frI3ilwn84=;
 b=Lr3PLcIDK4+efv4NC0MloF6vce/Op6UaZAULpSt/zMr3h1ZvzjkqRcrVbhOAXUeC6x
 VPLv3JR8kfBZURa9Rs0eF121QNvxxoFcN4XCi8WNiX3znPOxXQaSevfoMJ/NK6XsuJsV
 YJMIB9giIC7zOYTnbeJMAMCQX6CYJXKFK4Y6rWsnoBfAIrMpaZE2OaE832Ku+91dOkod
 NNiDsgkCzCld0dZS+/S0MNi2ITx3Vz3wk+/JmNWcbqDGZG3N7cs4DfAMTeRk6raAiogM
 7s0tjkAPRwH5/s0MRqUfhIdVpOuqqnaBZC1eEFFxMFtsZyYSgWl0pMHbvCc/9RyYbYLI
 ZgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=64+qLzbR7jvwBqNVOtzEvyCauEYMhO+b3frI3ilwn84=;
 b=F8jPoJo1zCeC33wyYm2geOa36+nl3Yk0GuhBAgeTgx3woMTavMqP4UGqcqA+7TQ3Jv
 H5pzpduDL9pjNjecMoLOMcHkvBl+IWqN+FuvNyH0F7SKcMy0Hrzyux/x7iDDjo7p8rtr
 uzA0l8cnxXsRtpUUNfs1wHKZh0uQC5UYuhgGf59JHeAi89xrXVt+ou9g1JMQg1xRO1d8
 9ImFYGYmIMRLOoUuRCD0UMPjifCYLHNyrgFXORiGfq2XirnmFavx07u4Fun/XGxaUQ14
 QwFDhymsQ/yFkE3zBfd43/L/MPmtrPuCWVAylzqogt860zQ9CVflgdb3TS93PMjGK5UV
 EfZw==
X-Gm-Message-State: AOAM533aZF/mPKGZsfvj9XW292uVGGM6fa7EWrB9LTOWuNa8jQz0bm8c
 Be9kajrBr5ECAG4TButOTvcIFjv4mjs=
X-Google-Smtp-Source: ABdhPJzjeUsOJaIDQs9LPdcyB32UhjimXVWHZVNfpT0I85huldhYiGizV+06GZNKyE3EC9DFdXLuBQ==
X-Received: by 2002:a1c:1bc4:: with SMTP id b187mr1530061wmb.18.1614326732464; 
 Fri, 26 Feb 2021 00:05:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/29] virtio-scsi: don't process IO on fenced dataplane
Date: Fri, 26 Feb 2021 09:05:04 +0100
Message-Id: <20210226080526.651705-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

If virtio_scsi_dataplane_start fails, there is a small window when it drops the
aio lock (in aio_wait_bh_oneshot) and the dataplane's AIO handler can
still run during that window.

This is done after the dataplane was marked as fenced, thus we use this flag
to avoid it doing any IO.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20201217150040.906961-2-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/virtio-scsi-dataplane.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 2c83a0ab1f..4ad8793406 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -52,12 +52,14 @@ void virtio_scsi_dataplane_setup(VirtIOSCSI *s, Error **errp)
 static bool virtio_scsi_data_plane_handle_cmd(VirtIODevice *vdev,
                                               VirtQueue *vq)
 {
-    bool progress;
+    bool progress = false;
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
-    assert(s->ctx && s->dataplane_started);
-    progress = virtio_scsi_handle_cmd_vq(s, vq);
+    if (!s->dataplane_fenced) {
+        assert(s->ctx && s->dataplane_started);
+        progress = virtio_scsi_handle_cmd_vq(s, vq);
+    }
     virtio_scsi_release(s);
     return progress;
 }
@@ -65,12 +67,14 @@ static bool virtio_scsi_data_plane_handle_cmd(VirtIODevice *vdev,
 static bool virtio_scsi_data_plane_handle_ctrl(VirtIODevice *vdev,
                                                VirtQueue *vq)
 {
-    bool progress;
+    bool progress = false;
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
-    assert(s->ctx && s->dataplane_started);
-    progress = virtio_scsi_handle_ctrl_vq(s, vq);
+    if (!s->dataplane_fenced) {
+        assert(s->ctx && s->dataplane_started);
+        progress = virtio_scsi_handle_ctrl_vq(s, vq);
+    }
     virtio_scsi_release(s);
     return progress;
 }
@@ -78,12 +82,14 @@ static bool virtio_scsi_data_plane_handle_ctrl(VirtIODevice *vdev,
 static bool virtio_scsi_data_plane_handle_event(VirtIODevice *vdev,
                                                 VirtQueue *vq)
 {
-    bool progress;
+    bool progress = false;
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
-    assert(s->ctx && s->dataplane_started);
-    progress = virtio_scsi_handle_event_vq(s, vq);
+    if (!s->dataplane_fenced) {
+        assert(s->ctx && s->dataplane_started);
+        progress = virtio_scsi_handle_event_vq(s, vq);
+    }
     virtio_scsi_release(s);
     return progress;
 }
-- 
2.29.2



