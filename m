Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3902E3BEA78
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:11:54 +0200 (CEST)
Received: from localhost ([::1]:52994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19DN-0004qe-5j
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m197n-0000qp-Ra
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:06:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m197m-0006zA-CC
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gAqW+8N7iMGcapAeP6vWVExIRFMEhdprQula/BM34oc=;
 b=geWp8P+9RcNwQsGeDqkgqu5uJb5XXlqyryA0vlSI0v6fPnA3TfoPpof+qB76wzRRynF59J
 yh+zU+/WbD7CNP4ZrEU5bR4BgMzeuusE6UtDcqSlHTx0jGV+dIDHIkQ8/qI9SvlWtLxiGB
 +cbm/juUyX7zTQQkKJYByKhoko3ImB0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-b6srM__7NXSS-54W7VQQew-1; Wed, 07 Jul 2021 11:02:53 -0400
X-MC-Unique: b6srM__7NXSS-54W7VQQew-1
Received: by mail-wr1-f72.google.com with SMTP id
 j1-20020adfb3010000b02901232ed22e14so887065wrd.5
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gAqW+8N7iMGcapAeP6vWVExIRFMEhdprQula/BM34oc=;
 b=ikTUAr+KbSiElIoEbeNhhqi+dctnrXgZYkY0ZRCnsHK0Lv4PKEN1I61mHucMoiPzab
 aCjo4JGZ69q+eALUN+jii8j26oNpmygEg8iRtFgFuAv1i+jY6SiErLt6cfAcqVnZ1tnx
 dLeBZoMv2/Q5IuRLqXfuvCyV/eK4nAqhs+3efJNJrj6LxSmEaOzsd60ouaxbo0bThdpD
 vkToAqrOjgPw0f7uETTErONpaeUj4Avr5QKFRed9QORnn8JjUbS+fqj/dF79J1IE5xpA
 NyBzFqdG772EXm9xo1HH3RQ1hoT46Xrj4/DSf2Uc8ltf2SaLGw3JhbmnIOrRdGJCKMb/
 XlaA==
X-Gm-Message-State: AOAM531XaEJ2YyWzfQE2KIjS4kao+5SBlcLb8sC4OTMTY8G9pvczsrwe
 tP5i8tWF+N0i2F1iZvvMoMjiC9tb/39/WIRJ/u5vTtgLaW7+gdcbCvxiCShLvATK3pM2s6ErX/n
 ClJEWltKFiKLwxrOZ27/UVvNBqtK/HZ16F5v9gtsD9DuPzzKlaP4Ur1duAx7C
X-Received: by 2002:a7b:c318:: with SMTP id k24mr27401556wmj.144.1625670172124; 
 Wed, 07 Jul 2021 08:02:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEF5shu7RpfGUXtc8eCYCQX2yt+2+b/5HQWW+pW0cV01LKqnNeDk02UsEzx3kX3qBmszAh6Q==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr27401531wmj.144.1625670171943; 
 Wed, 07 Jul 2021 08:02:51 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id f12sm6331193wmg.16.2021.07.07.08.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:02:50 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:02:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] virtio-blk: Fix rollback path in
 virtio_blk_data_plane_start()
Message-ID: <20210514160245.91918-9-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

When dataplane multiqueue support was added in QEMU 2.7, the path
that would rollback guest notifiers assignment in case of error
simply got dropped.

Later on, when Error was added to blk_set_aio_context() in QEMU 4.1,
another error path was introduced, but it ommits to rollback both
host and guest notifiers.

It seems cleaner to fix the rollback path in one go. The patch is
simple enough that it can be adjusted if backported to a pre-4.1
QEMU.

Fixes: 51b04ac5c6a6 ("virtio-blk: dataplane multiqueue support")
Cc: stefanha@redhat.com
Fixes: 97896a4887a0 ("block: Add Error to blk_set_aio_context()")
Cc: kwolf@redhat.com
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210407143501.244343-2-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index e9050c8987..d7b5c95d26 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -207,7 +207,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
                 virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
                 virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
             }
-            goto fail_guest_notifiers;
+            goto fail_host_notifiers;
         }
     }
 
@@ -221,7 +221,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     aio_context_release(old_context);
     if (r < 0) {
         error_report_err(local_err);
-        goto fail_guest_notifiers;
+        goto fail_aio_context;
     }
 
     /* Process queued requests before the ones in vring */
@@ -245,6 +245,13 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     aio_context_release(s->ctx);
     return 0;
 
+  fail_aio_context:
+    for (i = 0; i < nvqs; i++) {
+        virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
+    }
+  fail_host_notifiers:
+    k->set_guest_notifiers(qbus->parent, nvqs, false);
   fail_guest_notifiers:
     /*
      * If we failed to set up the guest notifiers queued requests will be
-- 
MST


