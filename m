Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29346176E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:04:03 +0100 (CET)
Received: from localhost ([::1]:51950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhGE-0007HO-H3
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:04:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh4N-0003oQ-5L
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mrh48-00033I-DQ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638193890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gmN91jDcIZU9UtpuPrQVYTn7kPEJb0WLyI2q45YuAMw=;
 b=EuYJH8eTzwT8ekezP/kqIBc9NrmoXxTLDFNCs9xSL4VpTJ1Y6yzwlfT7RjI6p/tpSZI1ra
 lPP7AQCj4e+f4GE9YiaUXiUgNUv6HehGP1Bq3GUIUnxnA9JdrwO7cFsqR9rMyqkGUklaqe
 HuR91yMQ1idxAtfyJnsoYfL7PtSRZLE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-jdgSMOYfOfS41T5yjutcWw-1; Mon, 29 Nov 2021 08:51:27 -0500
X-MC-Unique: jdgSMOYfOfS41T5yjutcWw-1
Received: by mail-ed1-f72.google.com with SMTP id
 k7-20020aa7c387000000b003e7ed87fb31so13874384edq.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gmN91jDcIZU9UtpuPrQVYTn7kPEJb0WLyI2q45YuAMw=;
 b=W+fVWtUIBUZqsPRper6vyClLaQf77ohQGKUdNkqbIXjIUhKrhXQW5DxHPBZBLo4F8L
 HSQamKfdwEXVQn1APiVmhmKBpJ7X0RvQ8Uz6VRoDgPtTkIbALq1DNhKVSe8d5nbqYZFV
 DjcNPztOjPjl0KHDQznWw+psDBFN2FtSTCcKWxBc1Lk4++WsyXCgQXvSpngkWbCxcqHd
 fFq5MvzKGZKIwBnR87TBaM55VF+SIpSXtnAZrF+xxtJlDizk5bgdBJthcPNNPlQgCxQm
 4tdIx1LORuHctW4kIn1LmVX0CxSxuOINviA/joj5eEF2/5kEk9/2Qpiy3WvByczjfAPq
 TYCQ==
X-Gm-Message-State: AOAM531CoFpHsTLvVlOFFn4Hws+qzRT03q3ugMIUqK7ScNNYIModFLkW
 5bjrDvHDC3bG5y336kBAye4uaVO7D2kOv0i2dptBvrFeqA4MfiSJr164ufjsv2CTin5PZa5hUy4
 +fM0vwTZJeTf2L9ezPDk8nM2+tRvjittQrlQ8XYjDKfdHrqCExzt6skj7o8BK
X-Received: by 2002:aa7:c783:: with SMTP id n3mr74937302eds.121.1638193885987; 
 Mon, 29 Nov 2021 05:51:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSvgTLFa+cYcVGIz+FfzFIF+ao6OdcPem63+tMn+WTpej1J5PwUvrHYCaPdFt2o2mXkGbdfQ==
X-Received: by 2002:aa7:c783:: with SMTP id n3mr74937280eds.121.1638193885814; 
 Mon, 29 Nov 2021 05:51:25 -0800 (PST)
Received: from redhat.com ([45.15.19.35])
 by smtp.gmail.com with ESMTPSA id i8sm10534211edc.12.2021.11.29.05.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 05:51:25 -0800 (PST)
Date: Mon, 29 Nov 2021 08:51:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] virtio-balloon: correct used length
Message-ID: <20211129135053.560225-6-mst@redhat.com>
References: <20211129135053.560225-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211129135053.560225-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

Spec said:

"and len the total of bytes written into the buffer."

For inflateq, deflateq and statsq, we don't process in_sg so the used
length should be zero. For free_page_vq, tough the pages could be
changed by the device (in the destination), spec said:

"Note: len is particularly useful for drivers using untrusted buffers:
if a driver does not know exactly how much has been written by the
device, the driver would have to zero the buffer in advance to ensure
no data leakage occurs."

So 0 should be used as well here.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211129030841.3611-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 17de2558cb..9a4f491b54 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -231,7 +231,7 @@ static void balloon_stats_poll_cb(void *opaque)
         return;
     }
 
-    virtqueue_push(s->svq, s->stats_vq_elem, s->stats_vq_offset);
+    virtqueue_push(s->svq, s->stats_vq_elem, 0);
     virtio_notify(vdev, s->svq);
     g_free(s->stats_vq_elem);
     s->stats_vq_elem = NULL;
@@ -438,7 +438,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
             memory_region_unref(section.mr);
         }
 
-        virtqueue_push(vq, elem, offset);
+        virtqueue_push(vq, elem, 0);
         virtio_notify(vdev, vq);
         g_free(elem);
         virtio_balloon_pbp_free(&pbp);
@@ -552,7 +552,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
     }
 
 out:
-    virtqueue_push(vq, elem, 1);
+    virtqueue_push(vq, elem, 0);
     g_free(elem);
     return ret;
 }
-- 
MST


