Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF5E2A07AA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 15:18:21 +0100 (CET)
Received: from localhost ([::1]:60582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYVES-0000Wb-49
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 10:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kYV8O-0003fp-Qq
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:12:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kYV8M-0007FC-3e
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604067121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3iN6qY5085FKhuB3oQvig3p5w7EA9qYLRFEmWUtLf20=;
 b=G8sHSqy66vielRPCn4oVUl8sNJR3u2fsW7Z60iHSdd4oh/NDdsJWElsgeHoKsLYM27Tv1L
 xu4n7Nu3wI/08sJgT74fb7iBx1WuO4NTz6hIOoiO4mA70IgsNUWsIOeMNLhSGTNmulspar
 ODr9rlX6HC7goPvOQJMha4N7jwSE9QU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-3mFcp4RWNbqkjf_ZY8GhyQ-1; Fri, 30 Oct 2020 10:11:55 -0400
X-MC-Unique: 3mFcp4RWNbqkjf_ZY8GhyQ-1
Received: by mail-wm1-f70.google.com with SMTP id y21so397235wmi.7
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 07:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3iN6qY5085FKhuB3oQvig3p5w7EA9qYLRFEmWUtLf20=;
 b=GejI8WGd6FfV1mpx5qWVnPL78bXvqvu/VjgKDTOjgHTTL/yh3I7ZG5eFiOU4j5uX3k
 v3igLuNGhJLQsmb63q9Yd+SCZ3qAGJDseqzsm+4vKhMQWYQetn2TtnBefkhht2e8sQ4W
 2pumqUruNSRAdzvBPMKcYnsqSYXFJjw83D7Y/oWYdU7OkdcSo/u8yOPYrh+NjrlYUTev
 3qzQH+8rt060TicZ9gHLpDpuGlVkmNqTcVPAr3K/qkdNd1GEmQb6FAt3mbWgsQDNAP3Y
 G3r5K7/o+mR1pWH6Wc6h1JHiHinrxx6IISP6CVdh9hkHO4JPXMLoNLzU+nLyKVJJtkox
 8R8w==
X-Gm-Message-State: AOAM532LTU8cMTCcrxGNTGSSGdnc4Ly8gjGxrw/ItuYZVeAhpt9xUcMT
 Wfkv+bky/IAhhJKPNIy21tUGvwJtqkydFpFVwfmlRiy4FneQBK9mKmtnb7Vy/iZFZE9SO9ig1Zk
 VjezMYFAHK0lRpt4=
X-Received: by 2002:a5d:534d:: with SMTP id t13mr3295093wrv.69.1604067114191; 
 Fri, 30 Oct 2020 07:11:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRswmFwFXfYKNzZjeNymBYTd7pW0k8LdpW4QABK5PwsJB5f3l/VKb+AKj4DKO4QsWQl341yQ==
X-Received: by 2002:a5d:534d:: with SMTP id t13mr3295083wrv.69.1604067114045; 
 Fri, 30 Oct 2020 07:11:54 -0700 (PDT)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id 130sm5151750wmd.18.2020.10.30.07.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:11:53 -0700 (PDT)
Date: Fri, 30 Oct 2020 10:11:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] vhost-vsock: set vhostfd to non-blocking mode
Message-ID: <20201030141136.1013521-3-mst@redhat.com>
References: <20201030141136.1013521-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201030141136.1013521-1-mst@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 02:24:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

vhost IOTLB API uses read()/write() to exchange iotlb messages with
the kernel module.
The QEMU implementation expects a non-blocking fd, indeed commit
c471ad0e9b ("vhost_net: device IOTLB support") set it for vhost-net.

Without this patch, if we enable iommu for the vhost-vsock device,
QEMU can hang when exchanging IOTLB messages.

As commit 894022e616 ("net: check if the file descriptor is valid
before using it") did for tap, let's use qemu_try_set_nonblock()
when fd is provided by the user.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20201029144849.70958-1-sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vsock.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index f9db4beb47..8ddfb9abfe 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "hw/virtio/virtio-access.h"
 #include "qemu/error-report.h"
+#include "qemu/sockets.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-vsock.h"
 #include "monitor/monitor.h"
@@ -148,6 +149,13 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
             error_prepend(errp, "vhost-vsock: unable to parse vhostfd: ");
             return;
         }
+
+        ret = qemu_try_set_nonblock(vhostfd);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "vhost-vsock: unable to set non-blocking mode");
+            return;
+        }
     } else {
         vhostfd = open("/dev/vhost-vsock", O_RDWR);
         if (vhostfd < 0) {
@@ -155,6 +163,8 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
                              "vhost-vsock: failed to open vhost device");
             return;
         }
+
+        qemu_set_nonblock(vhostfd);
     }
 
     vhost_vsock_common_realize(vdev, "vhost-vsock");
-- 
MST


