Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA47459743D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:34:44 +0200 (CEST)
Received: from localhost ([::1]:60410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOM0C-00082R-1F
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLgp-0007dS-5r
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:14:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLgl-0001Of-OG
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660752879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PribNfOmPzTedqCM8ic9b/oy5lpMAXpt9o3tsirrg3k=;
 b=IKq+Bd9sHsJIVXKHVyT13Vv6CdSXeYf2hEr5SwwadVm14g83uIRKgMrnjEhbYlJoag/xGS
 EN+ahj7ijAG7I+m5edPy3VxKmGsf091ti6Dzd5EYBk7HTyRhyfFU5dBA0kDBFcJWj2cqqV
 gAB59GxKR/3PI1cmx/1iyPqp9N8gOjA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-qRFuEBRGNCOv12_U4t_QaA-1; Wed, 17 Aug 2022 12:14:37 -0400
X-MC-Unique: qRFuEBRGNCOv12_U4t_QaA-1
Received: by mail-wr1-f71.google.com with SMTP id
 g11-20020adfa48b000000b002250d091f76so1900157wrb.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=PribNfOmPzTedqCM8ic9b/oy5lpMAXpt9o3tsirrg3k=;
 b=MN19nDcaEnIskWPp+5HtLNs1dSllx1XlY4nw3CnGVOcL+qVSppr+Vdr+Olp8mDKbYd
 eIiGCQNxdiBNbUHOdMLD6ml9z28HUzmqSTJeXI/JzCrJImrQEbWrHoxAw4QTyWfAPf1n
 ZLfkxPOADIz2xJVYQOPbU7C7n3RQVh1cOiuwN9V+epfz03b5bMqGc2EtKllA2XHyv0yE
 BwLhVXUOexb9LPxI8MMh2lXykeMwQK10p3ZHdGm6v6/FxyrfnECwITF1GsBM0vM4KeI1
 k53u3Wg8rIEt3b+VUZFcReQQZ2vo0kj9Rnx51KXWnG4dQdwsfd7dZYnbmG4SwjSOeTrV
 uRdQ==
X-Gm-Message-State: ACgBeo1hGffRtxrNI4ZMn5YAqKt/NDvc6xvLYPkhy9gbq7pFxVVpp1n9
 jZLXWP9VD+CwflU/7fyZjKNiMrYBz2nso9BBxCrfP8kalQp2m1COWjMjCMWBRfoaO64J4O0QoBn
 lY9Xr90NqIUHt5UCrTo3wCJDzefpN03Q75EXbX2rfxSrB9i1i0B+rv7/SxY78
X-Received: by 2002:a5d:5a96:0:b0:223:8131:e4f2 with SMTP id
 bp22-20020a5d5a96000000b002238131e4f2mr14881255wrb.345.1660752876161; 
 Wed, 17 Aug 2022 09:14:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5YeLhWwuglMdG4X4k8vdAkq0CflO2XxzwgWm+gJfF8PvR7cSSkak/+PTxarIQPa7z2Zwhv5g==
X-Received: by 2002:a5d:5a96:0:b0:223:8131:e4f2 with SMTP id
 bp22-20020a5d5a96000000b002238131e4f2mr14881228wrb.345.1660752875727; 
 Wed, 17 Aug 2022 09:14:35 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 c5-20020adffb05000000b0021e4f595590sm13354180wrr.28.2022.08.17.09.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:14:35 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:14:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Qing Wang <qinwang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org
Subject: [PULL 01/10] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Message-ID: <20220817161342.240674-2-mst@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817161342.240674-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Stefan Hajnoczi <stefanha@redhat.com>

As soon as virtio_scsi_data_plane_start() attaches host notifiers the
IOThread may start virtqueue processing. There is a race between
IOThread virtqueue processing and virtio_scsi_data_plane_start() because
it only assigns s->dataplane_started after attaching host notifiers.

When a virtqueue handler function in the IOThread calls
virtio_scsi_defer_to_dataplane() it may see !s->dataplane_started and
attempt to start dataplane even though we're already in the IOThread:

  #0  0x00007f67b360857c __pthread_kill_implementation (libc.so.6 + 0xa257c)
  #1  0x00007f67b35bbd56 raise (libc.so.6 + 0x55d56)
  #2  0x00007f67b358e833 abort (libc.so.6 + 0x28833)
  #3  0x00007f67b358e75b __assert_fail_base.cold (libc.so.6 + 0x2875b)
  #4  0x00007f67b35b4cd6 __assert_fail (libc.so.6 + 0x4ecd6)
  #5  0x000055ca87fd411b memory_region_transaction_commit (qemu-kvm + 0x67511b)
  #6  0x000055ca87e17811 virtio_pci_ioeventfd_assign (qemu-kvm + 0x4b8811)
  #7  0x000055ca87e14836 virtio_bus_set_host_notifier (qemu-kvm + 0x4b5836)
  #8  0x000055ca87f8e14e virtio_scsi_set_host_notifier (qemu-kvm + 0x62f14e)
  #9  0x000055ca87f8dd62 virtio_scsi_dataplane_start (qemu-kvm + 0x62ed62)
  #10 0x000055ca87e14610 virtio_bus_start_ioeventfd (qemu-kvm + 0x4b5610)
  #11 0x000055ca87f8c29a virtio_scsi_handle_ctrl (qemu-kvm + 0x62d29a)
  #12 0x000055ca87fa5902 virtio_queue_host_notifier_read (qemu-kvm + 0x646902)
  #13 0x000055ca882c099e aio_dispatch_handler (qemu-kvm + 0x96199e)
  #14 0x000055ca882c1761 aio_poll (qemu-kvm + 0x962761)
  #15 0x000055ca880e1052 iothread_run (qemu-kvm + 0x782052)
  #16 0x000055ca882c562a qemu_thread_start (qemu-kvm + 0x96662a)

This patch assigns s->dataplane_started before attaching host notifiers
so that virtqueue handler functions that run in the IOThread before
virtio_scsi_data_plane_start() returns correctly identify that dataplane
does not need to be started. This fix is taken from the virtio-blk
dataplane code and it's worth adding a comment in virtio-blk as well to
explain why it works.

Note that s->dataplane_started does not need the AioContext lock because
it is set before attaching host notifiers and cleared after detaching
host notifiers. In other words, the IOThread always sees the value true
and the main loop thread does not modify it while the IOThread is
active.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2099541
Reported-by: Qing Wang <qinwang@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220808162134.240405-1-stefanha@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/dataplane/virtio-blk.c |  5 +++++
 hw/scsi/virtio-scsi-dataplane.c | 11 ++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 49276e46f2..26f965cabc 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -219,6 +219,11 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
 
     memory_region_transaction_commit();
 
+    /*
+     * These fields are visible to the IOThread so we rely on implicit barriers
+     * in aio_context_acquire() on the write side and aio_notify_accept() on
+     * the read side.
+     */
     s->starting = false;
     vblk->dataplane_started = true;
     trace_virtio_blk_data_plane_start(s);
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index 8bb6e6acfc..20bb91766e 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -136,6 +136,14 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 
     memory_region_transaction_commit();
 
+    /*
+     * These fields are visible to the IOThread so we rely on implicit barriers
+     * in aio_context_acquire() on the write side and aio_notify_accept() on
+     * the read side.
+     */
+    s->dataplane_starting = false;
+    s->dataplane_started = true;
+
     aio_context_acquire(s->ctx);
     virtio_queue_aio_attach_host_notifier(vs->ctrl_vq, s->ctx);
     virtio_queue_aio_attach_host_notifier_no_poll(vs->event_vq, s->ctx);
@@ -143,9 +151,6 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     for (i = 0; i < vs->conf.num_queues; i++) {
         virtio_queue_aio_attach_host_notifier(vs->cmd_vqs[i], s->ctx);
     }
-
-    s->dataplane_starting = false;
-    s->dataplane_started = true;
     aio_context_release(s->ctx);
     return 0;
 
-- 
MST


