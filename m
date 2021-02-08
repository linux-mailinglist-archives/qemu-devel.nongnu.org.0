Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C4314289
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:07:55 +0100 (CET)
Received: from localhost ([::1]:48946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EhG-0005Ne-8W
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCQ-00039t-CW
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:50 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCO-00068K-Qj
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:50 -0500
Received: by mail-wr1-x431.google.com with SMTP id b3so18382209wrj.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+gYBA8EOP9voo6st9l/tKav/btWR7A0x68POX4fuYnY=;
 b=KSFRiRzSCcTb7KhJzJZ746g1L0bHQMoEO2I2fcSPp5kXxxMnNfOZExDWEC4GHtsoOu
 zrM1Pt+Dk+D4Lw0sfXPHCMA/O74FzrpXVY8PKi302hIAF6Mz/5DkOJV+UfjzWlUQcuuc
 EPMg6z1XlRm+m7H+lIP1A8dZIrfPnXfXfbWX3TU6Hs4De0qAQuu/bD5plr5PrqZOAw3p
 mv3zMopdi873m1ugly6kRWtJBGhAAYLRMYZwqYV4ri7Rfx2X5NBf/lS/8fbFyHChhV9h
 wFwbG1FVDsw4iEb0C8xGq9b5OfUs4pfaKEoV+msq9W8fxB9jvg3GfLfvjLLzADhy64Ld
 Pi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+gYBA8EOP9voo6st9l/tKav/btWR7A0x68POX4fuYnY=;
 b=o9VHbZ+eqktNDimkjMIKZ9wrciTmcwYy9/dkWTC77kNdS9EykQuXrwF68AdxjC+FUd
 FIpUvWr9zk+VxQtoQ7SmJDMiUeCay5OJP8u+MbsSD16Rfcu/rfGF/NJQscYNUfzj53v3
 ediF8BItkqkuXVRld4lzGn5+3sRjcvbfQ173APToI75DtpeAsHMsAsVTjJ2l7xDQtVyV
 JrJ6OnnXx/5Gjln1eRgPRLk3NHgb/W6lGpJyAWCvhqb15I9cxgLhRAtwwgJly/etvXz4
 Q24aTBVp8FLmlypG+/pCzyhpbRTw7XaMUw9jdyfI0Q3XWlHZisg2kaACCVGzRo0gIhJq
 lwQg==
X-Gm-Message-State: AOAM533j59eJ5pNGQ5rCZvToqDcoIg3yXg2NRO8XL7WZB4eiJBsoPO33
 Sgqfc3r/CfoVFMhwxlhBQqWwghywOeOEeg==
X-Google-Smtp-Source: ABdhPJyNdbgmQv1yK+MpgE7dMpqmNKLUBg3VaA8FGQlJP8YwlrVY3D7+2TBJvbJWOAAOw8V+mthAXQ==
X-Received: by 2002:adf:a196:: with SMTP id u22mr2669895wru.416.1612808627580; 
 Mon, 08 Feb 2021 10:23:47 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/46] virtio-scsi: don't uninitialize queues that we didn't
 initialize
Date: Mon,  8 Feb 2021 19:23:00 +0100
Message-Id: <20210208182331.58897-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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

Count number of queues that we initialized and only deinitialize these that we
initialized successfully.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20201217150040.906961-3-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/virtio-scsi-dataplane.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index b995bab3a2..2c83a0ab1f 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -126,6 +126,7 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 {
     int i;
     int rc;
+    int vq_init_count = 0;
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
     VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(vdev);
@@ -153,17 +154,22 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     if (rc) {
         goto fail_vrings;
     }
+
+    vq_init_count++;
     rc = virtio_scsi_vring_init(s, vs->event_vq, 1,
                                 virtio_scsi_data_plane_handle_event);
     if (rc) {
         goto fail_vrings;
     }
+
+    vq_init_count++;
     for (i = 0; i < vs->conf.num_queues; i++) {
         rc = virtio_scsi_vring_init(s, vs->cmd_vqs[i], i + 2,
                                     virtio_scsi_data_plane_handle_cmd);
         if (rc) {
             goto fail_vrings;
         }
+        vq_init_count++;
     }
 
     s->dataplane_starting = false;
@@ -174,7 +180,7 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 fail_vrings:
     aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
     aio_context_release(s->ctx);
-    for (i = 0; i < vs->conf.num_queues + 2; i++) {
+    for (i = 0; i < vq_init_count; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
-- 
2.29.2



