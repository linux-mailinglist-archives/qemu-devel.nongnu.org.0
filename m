Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF188310560
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:02:52 +0100 (CET)
Received: from localhost ([::1]:55434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7v8l-0001NM-Q5
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2u-000176-9D
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2m-00014e-Vx
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=evVdQW4ObEtuSt6DmdXIvJEPM7/+jEwBz0UuPhXTUEE=;
 b=FOyG2D39Jx6whmhxAeZER6FV4lvXWe4c1YRE9TKzWm0SDBR1D/wILFyTQq4N2x3pAgHXwb
 PYZqNnVeOTy1sMIRsVClqJCgWXAtLsMQHm0hULQqVmf7WUr6cOZNte2DqD2wMQDIPeMaJv
 aphpb5t1W+Xq4G8nH0jXzLv9wRfG2P4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-sttCXE-KPTaDrf6fHiHqtQ-1; Fri, 05 Feb 2021 01:56:37 -0500
X-MC-Unique: sttCXE-KPTaDrf6fHiHqtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A621107ACED;
 Fri,  5 Feb 2021 06:56:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 726FA62679;
 Fri,  5 Feb 2021 06:56:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7065418000B6; Fri,  5 Feb 2021 07:56:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/24] hw/display/qxl: Fix bad printf format specifiers
Date: Fri,  5 Feb 2021 07:55:57 +0100
Message-Id: <20210205065620.1726554-2-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Chen <alex.chen@huawei.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-id: 20201119025851.56487-1-alex.chen@huawei.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl-logger.c | 4 ++--
 hw/display/qxl.c        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
index c15175bce322..68bfa4756802 100644
--- a/hw/display/qxl-logger.c
+++ b/hw/display/qxl-logger.c
@@ -189,7 +189,7 @@ static void qxl_log_cmd_surface(PCIQXLDevice *qxl, QXLSurfaceCmd *cmd)
             qxl_name(qxl_surface_cmd, cmd->type),
             cmd->surface_id);
     if (cmd->type == QXL_SURFACE_CMD_CREATE) {
-        fprintf(stderr, " size %dx%d stride %d format %s (count %d, max %d)",
+        fprintf(stderr, " size %dx%d stride %d format %s (count %u, max %u)",
                 cmd->u.surface_create.width,
                 cmd->u.surface_create.height,
                 cmd->u.surface_create.stride,
@@ -197,7 +197,7 @@ static void qxl_log_cmd_surface(PCIQXLDevice *qxl, QXLSurfaceCmd *cmd)
                 qxl->guest_surfaces.count, qxl->guest_surfaces.max);
     }
     if (cmd->type == QXL_SURFACE_CMD_DESTROY) {
-        fprintf(stderr, " (count %d)", qxl->guest_surfaces.count);
+        fprintf(stderr, " (count %u)", qxl->guest_surfaces.count);
     }
 }
 
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 431c1070967a..874bb8ad9e30 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -944,7 +944,7 @@ static void interface_async_complete_io(PCIQXLDevice *qxl, QXLCookie *cookie)
         qxl_spice_destroy_surface_wait_complete(qxl, cookie->u.surface_id);
         break;
     default:
-        fprintf(stderr, "qxl: %s: unexpected current_async %d\n", __func__,
+        fprintf(stderr, "qxl: %s: unexpected current_async %u\n", __func__,
                 current_async);
     }
     qxl_send_events(qxl, QXL_INTERRUPT_IO_CMD);
-- 
2.29.2


