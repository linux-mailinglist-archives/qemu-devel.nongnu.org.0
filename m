Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E9B4349CB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:10:11 +0200 (CEST)
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9U2-0005df-W1
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8ia-0005O1-Of
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iW-000453-B2
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ai2Qvc212R3zI/Nbr9LDsjvIFwluFt8YV+JlbaRw4oQ=;
 b=gbt0Mj2HTP6+EaKeJax1vQhIaXhcwybveMuUyV9vFgdvRqci1OvGabD9Xvybmlye9WcWZv
 7tjH1CUN5O16aEMYwUp2Es6PwU1DAl8abHvGnUfHdJAOk6tsi0+lZEfrL5CbuQaiBx+irU
 w3mQDIKlvyjieF6G0vXckUaMHDr1R38=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-dcuxVrUiMlSW26ZyYUlMtg-1; Wed, 20 Oct 2021 06:21:02 -0400
X-MC-Unique: dcuxVrUiMlSW26ZyYUlMtg-1
Received: by mail-ed1-f70.google.com with SMTP id
 u10-20020a50d94a000000b003dc51565894so13849965edj.21
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ai2Qvc212R3zI/Nbr9LDsjvIFwluFt8YV+JlbaRw4oQ=;
 b=n+bDhC9J/3abrz6BDH9SkYo3AjMj88gRryx6rC8+3OR+87tnYrKBb3Plw2N+2WwErh
 mMPbSLB2M8R0dnPnfnBHcoTfHkhSYM8q4fLFLq3XWH0mbkpWwR0zcL2VDHe1Hv25UYy/
 gYcVqkfe1/BFJM5jAIxT7CW2mBp6MXKjIk9DcuwDtNLSDXs54DQir53CDAVAAdXHGvbq
 AI7A4q1E006j177MHfLx8XA1g10r1ry9HETeVfGEVU0nroHRGrLGj+MdUeVhzgzq0QD8
 oOt+EBAkn2+uNNexk//G4xCB2Xtoqashi0avuMS9sUuqKJBxAav5FiZ9k8axNXfC/KH5
 /T+w==
X-Gm-Message-State: AOAM5301Jq0w1vtqf4ItF9NHTgxNxPpcdMQJwPmGCi8CFW8+xun/W3FV
 f4/Cs2k27bmJirybmW3sSAkK7E97lLnagP7ihMzivmhCdRWkxbcdLhcIKow68cGCCLTDaLwR0kA
 ROwXOalupz90XUHKmV5VefXbpgzHR8RUUKP4XqV65zqbyul1ColXzJzuSeEGz
X-Received: by 2002:a17:906:8283:: with SMTP id
 h3mr46267206ejx.460.1634725260959; 
 Wed, 20 Oct 2021 03:21:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGz0O/YTz7Bq0Bh4Kr6ooDUD7e7Q9DpKzEe8bcP96p5pn9tUYuP7sNTedH9X1bQbyPnicd3Q==
X-Received: by 2002:a17:906:8283:: with SMTP id
 h3mr46267184ejx.460.1634725260646; 
 Wed, 20 Oct 2021 03:21:00 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id z19sm818212ejw.44.2021.10.20.03.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:21:00 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 38/44] vhost: record the last virtqueue index for the
 virtio device
Message-ID: <20211020101844.988480-39-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch introduces a new field in the vhost_dev structure to record
the last virtqueue index for the virtio device. This will be useful
for the vhost backends with 1:N model to start or stop the device
after all the vhost_dev structures were started or stopped.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211020045600.16082-9-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h |  2 ++
 hw/net/vhost_net.c        | 12 +++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 1a9fc65089..3fa0b554ef 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -74,6 +74,8 @@ struct vhost_dev {
     unsigned int nvqs;
     /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
+    /* the last vq index for the virtio device (not vhost) */
+    int last_index;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
     uint64_t features;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 2b594b4642..3aabab06ea 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -231,9 +231,11 @@ fail:
     return NULL;
 }
 
-static void vhost_net_set_vq_index(struct vhost_net *net, int vq_index)
+static void vhost_net_set_vq_index(struct vhost_net *net, int vq_index,
+                                   int last_index)
 {
     net->dev.vq_index = vq_index;
+    net->dev.last_index = last_index;
 }
 
 static int vhost_net_start_one(struct vhost_net *net,
@@ -324,9 +326,13 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     VirtIONet *n = VIRTIO_NET(dev);
     int nvhosts = data_queue_pairs + cvq;
     struct vhost_net *net;
-    int r, e, i;
+    int r, e, i, last_index = data_qps * 2;
     NetClientState *peer;
 
+    if (!cvq) {
+        last_index -= 1;
+    }
+
     if (!k->set_guest_notifiers) {
         error_report("binding does not support guest notifiers");
         return -ENOSYS;
@@ -341,7 +347,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
 
         net = get_vhost_net(peer);
-        vhost_net_set_vq_index(net, i * 2);
+        vhost_net_set_vq_index(net, i * 2, last_index);
 
         /* Suppress the masking guest notifiers on vhost user
          * because vhost user doesn't interrupt masking/unmasking
-- 
MST


