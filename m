Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA495EBCCA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:08:54 +0200 (CEST)
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5e9-0001IH-Bt
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od53J-0003hv-LN
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od53I-0001ia-5b
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664263847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUpRueFXdUTQEFcImJve815g7+VAZ6OTmwxxO6AXHp0=;
 b=JMkoyNcf5XIlQdQkg/h1DfD/zllz3wMzmDidCNngw7XCqrkpsyFBvUmzh8/msw3SDUWjIC
 9ku8Pxv6jFqbFLmtCrbNErXRbWZY3GvfHHaamQQt2ioa0bhtyx/PSR11YB5sQwnXV3wz/b
 a4KWkAI+y/CuxG39Feo/ZO3M4DYj+Fw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-YkfzPV_WMleQVkBrHeFq0A-1; Tue, 27 Sep 2022 03:30:44 -0400
X-MC-Unique: YkfzPV_WMleQVkBrHeFq0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B678038164C4;
 Tue, 27 Sep 2022 07:30:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-192.pek2.redhat.com
 [10.72.13.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 687F02166B26;
 Tue, 27 Sep 2022 07:30:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	stefanha@redhat.com
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 5/8] vdpa: validate MQ CVQ commands
Date: Tue, 27 Sep 2022 15:30:19 +0800
Message-Id: <20220927073022.28378-6-jasowang@redhat.com>
In-Reply-To: <20220927073022.28378-1-jasowang@redhat.com>
References: <20220927073022.28378-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Eugenio Pérez <eperezma@redhat.com>

So we are sure we can update the device model properly before sending to
the device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 3950e4f..c6cbe2f 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -486,6 +486,15 @@ static bool vhost_vdpa_net_cvq_validate_cmd(const void *out_buf, size_t len)
                           __func__, ctrl.cmd);
         };
         break;
+    case VIRTIO_NET_CTRL_MQ:
+        switch (ctrl.cmd) {
+        case VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET:
+            return true;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mq cmd %u\n",
+                          __func__, ctrl.cmd);
+        };
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n",
                       __func__, ctrl.class);
-- 
2.7.4


