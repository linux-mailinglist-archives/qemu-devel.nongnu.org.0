Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8659D4004AA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:12:06 +0200 (CEST)
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDfZ-00006G-Iu
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHK-00016o-Qb
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHH-0001zO-3L
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2TJ5bgBbqJh6moqyxGQ53K360Y/vHE7RhxA+Q/Y7Gk=;
 b=OdLizQlnKCZvb1BHzj0lHC7wZqQ2cKPrwciy4IBWfFDhuzW4+lyy+Va8MRSq/BvF/yBsyG
 1BD9q5m2N3o10TdUN4l0xlpYI4yh5zqhGlOjrUfXgTIJFBwEEGegct5R7UHCXEVDNWlchs
 73Oc1jTTC92k/Cu9N16tOFsJh3DaLQ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-QDJW5ljcPjqtHz75O_R5LA-1; Fri, 03 Sep 2021 13:46:56 -0400
X-MC-Unique: QDJW5ljcPjqtHz75O_R5LA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so61181wmd.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2TJ5bgBbqJh6moqyxGQ53K360Y/vHE7RhxA+Q/Y7Gk=;
 b=EJpIQ8Ds3S6rP3n77LTVsq56Yryiphxiqo12tN3pmnHDpw9+KerR1oS6VyTiVR2Mym
 2aQrO6C81nWLcE2wBviL4SwiF5Hjaznutn7RuDBicAZqXgAeL/YMlluy1nxFGt+SVueL
 SVuZc14wJiti/4rVtMhl6p4XxxnIDmmuH9wZ9zH8h5tHSSNzyck+Bf30TglZt2OkVuCq
 M4teNywmgeFAqcvt5vXL0EN9Vbca9rYa0ITybGMkIEzRGDsiLWTHewXf0izyyFFQNseg
 W9y8ESZnFDJCMkHVH/LUVvvpUz/QiEcUrgxyRBieHxwAO9JRrfxwbB/koyAfNNuIZM8q
 zeyw==
X-Gm-Message-State: AOAM530f/VPSpQCq44EfXSNcBUFDLw1Vj7sN3rhtMUoYVomDVSQ8k5sR
 sZ9li2y/2yRf0Oo/Y8nOQyH1sw83MQ8HJhAG1VQV5wxA3YcjObLlQSYF0oBCOL95HHZN6fjmQE9
 efRwPdR6xCb29kry0dTiFcEyeYifFzfk4xTVNaaooV7gabzOEwWWYJ1iTWhSqr65X
X-Received: by 2002:a05:600c:3b0e:: with SMTP id
 m14mr43410wms.118.1630691215141; 
 Fri, 03 Sep 2021 10:46:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwW59MQVKIujC3QxI8hOMGARHeRzbm1pMLdPaJFA3rYa2qY9RNUZufFPWaRQw0L8ldNpu53w==
X-Received: by 2002:a05:600c:3b0e:: with SMTP id
 m14mr43368wms.118.1630691214854; 
 Fri, 03 Sep 2021 10:46:54 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y15sm94518wmi.18.2021.09.03.10.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 19/28] hw/virtio: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:01 +0200
Message-Id: <20210903174510.751630-20-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Should we check in_num/out_num in range?
---
 hw/net/virtio-net.c       | 3 ++-
 hw/virtio/virtio-crypto.c | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cdee52..338fbeb8c57 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1449,7 +1449,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         iov_cnt = elem->out_num;
-        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
+        iov2 = iov = g_memdup2(elem->out_sg,
+                               sizeof(struct iovec) * elem->out_num);
         s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
         iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
         if (s != sizeof(ctrl)) {
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb789c..59886c1790d 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -242,7 +242,7 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         out_num = elem->out_num;
-        out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+        out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
         out_iov = out_iov_copy;
 
         in_num = elem->in_num;
@@ -605,11 +605,11 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
     }
 
     out_num = elem->out_num;
-    out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+    out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
     out_iov = out_iov_copy;
 
     in_num = elem->in_num;
-    in_iov_copy = g_memdup(elem->in_sg, sizeof(in_iov[0]) * in_num);
+    in_iov_copy = g_memdup2(elem->in_sg, sizeof(in_iov[0]) * in_num);
     in_iov = in_iov_copy;
 
     if (unlikely(iov_to_buf(out_iov, out_num, 0, &req, sizeof(req))
-- 
2.31.1


