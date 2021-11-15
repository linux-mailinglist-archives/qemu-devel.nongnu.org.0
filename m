Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5BB4509D3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:40:10 +0100 (CET)
Received: from localhost ([::1]:37002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf1d-0004AK-Eh
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:40:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezU-0001Z5-Ml
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:37:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezS-0005C2-U4
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:37:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hy/vWSY8IlvPxeCX7j4JnR+xb/lMTd0Fc3iOQKHkO6g=;
 b=UhIEZSfzHoBHffkao4pzMr+EG/rNCMXhFwsN8M7zaN1WnCiiFb6wXl5vQpkLVr2WOX5qPw
 +X/BR1aFrMrGeAWTxJ4JzNbbJM6pvvAOme5oaycHc++UQVl/LxyRLCZwg5oReGYE8jDj8l
 5yJGVMNcc3N/u+zavfIMHaSt2XjFkwo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-OZXEyNkSN867umvIpWybEA-1; Mon, 15 Nov 2021 11:37:52 -0500
X-MC-Unique: OZXEyNkSN867umvIpWybEA-1
Received: by mail-ed1-f69.google.com with SMTP id
 m17-20020aa7d351000000b003e7c0bc8523so2839650edr.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Hy/vWSY8IlvPxeCX7j4JnR+xb/lMTd0Fc3iOQKHkO6g=;
 b=WD6bjf3Z9ooR1qRmdQKqj3ldqieXW96rBgp+vtWbwE0vzoO+fwCyo1qld70hxexzy5
 D3YYT4e78GMmZd0/vYfxivOlbim+iyMsMMkaiMrOuGYO4k92ara/F8dtKgzLIktipRYF
 JjZmkCAFPneIxBK81HkrsV/tR2H8u4Qf2LhfavcUG7AOClLIbHwQnbFdqIQ5ozuRWCh1
 aaYOW7tkCB9E3qIH2fiGQr0aNt3jaV4BjtlWjppQA/OMJzuozCz2IHAZpKt8iFeoy8rF
 hp4vyDqr5ZuRDoEG/WgN4nLA6iIXapFDAMH0lk0d/dg6sQ5nbNZABmOhqWGdktIyKb5H
 73RA==
X-Gm-Message-State: AOAM530ewcVQn3TC2iPozCeVu0Pgn7PqtH00/eN6VHvIyUOalBE3rxXs
 qEXRiMiZ/Ur5PuPofZ32Ot8vreObk9q4DTfEhGqVwe9jH0UKVxVruV7YnUontMXkTFw6SfMw/Br
 5OZJHpiD/SbJFfVKX4qC+L5wGz++4h2f0fgAq0ttZpUgQfeVxh09r7T1JUtfH
X-Received: by 2002:a17:906:b2c7:: with SMTP id
 cf7mr329155ejb.303.1636994270544; 
 Mon, 15 Nov 2021 08:37:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFO6TuV/ifdBOkA9g4lR3KoFi+m65NuJgLmTN6TTFGzRmjP2UfnWKubqY7Wf3hq8ejgI1OUA==
X-Received: by 2002:a17:906:b2c7:: with SMTP id
 cf7mr329111ejb.303.1636994270300; 
 Mon, 15 Nov 2021 08:37:50 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id kx3sm2550405ejc.112.2021.11.15.08.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:37:49 -0800 (PST)
Date: Mon, 15 Nov 2021 11:37:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/20] vhost: Fix last vq queue index of devices with no cvq
Message-ID: <20211115163607.177432-5-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Juan Quintela <quintela@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

The -1 assumes that cvq device model is accounted in data_queue_pairs,
if cvq does not exists, but it's actually the opposite: Devices with
!cvq are ok but devices with cvq does not add the last queue to
data_queue_pairs.

This is not a problem to vhost-net, but it is to vhost-vdpa:
* Devices with cvq gets initialized at last data vq device model, not
at cvq one.
* Devices with !cvq never gets initialized, since last_index is the
first queue of the last device model.

Because of that, the right change in last_index is to actually add the
cvq, not to remove the missing one.

This is not a problem to vhost-net, but it is to vhost-vdpa, which
device model trust to reach the last index to finish starting the
device.

Also, as the previous commit, rename it to index_end.

Tested with vp_vdpa with host's vhost=on and vhost=off, with ctrl_vq=on
and ctrl_vq=off.

Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virtio device")
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20211104085625.2054959-3-eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/vhost_net.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 29f2c4212f..30379d2ca4 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -326,11 +326,11 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     VirtIONet *n = VIRTIO_NET(dev);
     int nvhosts = data_queue_pairs + cvq;
     struct vhost_net *net;
-    int r, e, i, last_index = data_queue_pairs * 2;
+    int r, e, i, index_end = data_queue_pairs * 2;
     NetClientState *peer;
 
-    if (!cvq) {
-        last_index -= 1;
+    if (cvq) {
+        index_end += 1;
     }
 
     if (!k->set_guest_notifiers) {
@@ -347,7 +347,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         }
 
         net = get_vhost_net(peer);
-        vhost_net_set_vq_index(net, i * 2, last_index);
+        vhost_net_set_vq_index(net, i * 2, index_end);
 
         /* Suppress the masking guest notifiers on vhost user
          * because vhost user doesn't interrupt masking/unmasking
-- 
MST


