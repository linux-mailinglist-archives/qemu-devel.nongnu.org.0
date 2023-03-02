Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACAE6A81FE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:19:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhtM-00068F-KT; Thu, 02 Mar 2023 07:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pXhtJ-00062S-MI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:18:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pXhtI-0004bm-2V
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:18:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677759510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hLKw2DvFxtJO2P6P5lwBnmgXKGMV6JmxJOlmMQQAMaw=;
 b=fQROQb3C9Ep3oaOw71x385TP6Y2L5HRRF4rUVb5ex8hinBnUsSdGWlUzfnhhUDV58CjX6Y
 iIm/4/xVREynTv0htl3TwCeFaTPveUt/c/Ds4osuEwOXc3KiSPxofLprAcdMYgI6xdgw//
 N5UTw5b/lIRVp/wKJjj2rJ+VD9HEOOY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-K1QQmfelPo-gnhcN0R9UoQ-1; Thu, 02 Mar 2023 07:17:21 -0500
X-MC-Unique: K1QQmfelPo-gnhcN0R9UoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 875873C10247;
 Thu,  2 Mar 2023 12:17:21 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82089C16027;
 Thu,  2 Mar 2023 12:17:20 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Albert Esteve <aesteve@redhat.com>
Subject: [PATCH] hw/virtio/vhost-user: avoid using unitialized errp
Date: Thu,  2 Mar 2023 13:17:19 +0100
Message-Id: <20230302121719.9390-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

During protocol negotiation, when we the QEMU
stub does not support a backend with F_CONFIG,
it throws a warning and supresses the
VHOST_USER_PROTOCOL_F_CONFIG bit.

However, the warning uses warn_reportf_err macro
and passes an unitialized errp pointer. However,
the macro tries to edit the 'msg' member of the
unitialized Error and segfaults.

Instead, just use warn_report, which prints a
warning message directly to the output.

Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when supported")
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 hw/virtio/vhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index e68daa35d4..34c331b3ba 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2031,8 +2031,8 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
         } else {
             if (virtio_has_feature(protocol_features,
                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
-                warn_reportf_err(*errp, "vhost-user backend supports "
-                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
+                warn_report("vhost-user backend supports "
+                            "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
                 protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
             }
         }
-- 
2.39.1


