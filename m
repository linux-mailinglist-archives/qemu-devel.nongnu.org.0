Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7790830889A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:53:18 +0100 (CET)
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SKz-0003la-GS
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnM-0004S7-DN
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:32 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnK-0005yw-Ld
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:32 -0500
Received: by mail-ej1-x629.google.com with SMTP id hs11so12457776ejc.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+gYBA8EOP9voo6st9l/tKav/btWR7A0x68POX4fuYnY=;
 b=XSLGuDFsCtuC2kyiBrfhrxAQO/ulbqz822K6yRmoY6sjzYL43QaNmteiaYHvvWGT7s
 zkK8bBR210cGHTip9xtDi9gYua0kaq71uNPR0GRaAcsUDnu7TbvCU7omC0AR7OEyr2/Q
 hHe4C/9OXP7LcUHKGgyVkD412a9eE4K+ycWgYCs3p/WL/uVNlCw+1A3vrDCTXQrRzME5
 pUAsPOLjNKudDrccpNF5Z4Qbe5UF6WBSeCEoA2ewEcVBDeSaVsT+OMAxznSgrrXwR0+V
 sNkUuE9dhMpneq2kiHQLFGim+3i22S9fJGrSto87Kt8F6IOg2/V2uv430Qc4jrq5WD8k
 gIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+gYBA8EOP9voo6st9l/tKav/btWR7A0x68POX4fuYnY=;
 b=gq+Osdgz0JzUB0k8lHnaRBfh20A3L9tki7nuahVncaqu5fQnomW4gWE/+VWZvmjICq
 WhpTFZ6CxCda6ngTxXZBPDZrfvhczypvQuNE/8R8Y4KDe2gIujgisrs/f34h7WGzkhej
 qZ8drMr/GZ6iG617xhf6UO5xFj/zcVV6ruq8GktdIsKjU+rcjMmd65b1UHJVM3tMHV6n
 OW9ugBMliXcSKb1CDZ2dA31ln/5oet84au9AINCpGsahV0D3Y2THTCFQ5Bzcppc8XXkV
 xKm9k5uKETf/TYRjH9xCEQaNMZgMuiJZ9kyRNJpqCaPUrQXEe6o0hdUTbwLhMXSSs1fu
 5Ong==
X-Gm-Message-State: AOAM532Bog1MLesu07uAoplJYp91ixbtvBZ3l2gOSPaAJAcIJYY7/q/g
 c0nqoyRfd7NI9SpE05lUnx8cs2dQCDSFtw==
X-Google-Smtp-Source: ABdhPJymsVZhrLpliz/XHMzaXvApLYQVkAfuke1PLOjRNZM04YVG164UwD8eniKW0N5c3glrGHM4+w==
X-Received: by 2002:a17:906:5958:: with SMTP id
 g24mr3940004ejr.377.1611919109409; 
 Fri, 29 Jan 2021 03:18:29 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/36] virtio-scsi: don't uninitialize queues that we didn't
 initialize
Date: Fri, 29 Jan 2021 12:17:53 +0100
Message-Id: <20210129111814.566629-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



