Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF04465E2D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 07:20:59 +0100 (CET)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msfSl-0007Cb-2A
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 01:20:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1msfQ0-0005WK-MT
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:18:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1msfPx-00046m-BS
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638425883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKTQ0SS8hUM8MB8W2wsdNFEf0ww3bT4PH02PNzlISyk=;
 b=Wx/okfBl7Sm9bxr3H7iB4FfDyBklwkRAr6Us6DA09mS0cgbetMG9e3/28dgAFKzOWgXShg
 DRh+cKMTPYLxNI1r42nSIsHXKLbSWGAnUOt92Yp1Qefv3HiacVhWjJAXYWgEIe+Q3yrOXw
 4ogkRIPFFpcwzoCMxjcvauNDGrM2lfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-m6_0sXToMYSNrihC1c_XNw-1; Thu, 02 Dec 2021 01:18:02 -0500
X-MC-Unique: m6_0sXToMYSNrihC1c_XNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F1F2185302A;
 Thu,  2 Dec 2021 06:18:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E7945D9CA;
 Thu,  2 Dec 2021 06:18:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.2 1/3] hw/block/fdc: Extract blk_create_empty_drive()
Date: Thu,  2 Dec 2021 01:17:54 -0500
Message-Id: <20211202061756.35224-2-jsnow@redhat.com>
In-Reply-To: <20211202061756.35224-1-jsnow@redhat.com>
References: <20211202061756.35224-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We are going to re-use this code in the next commit,
so extract it as a new blk_create_empty_drive() function.

Inspired-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20211124161536.631563-2-philmd@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/block/fdc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index fa933cd326..1dbf3f6028 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -61,6 +61,12 @@
     } while (0)
 
 
+/* Anonymous BlockBackend for empty drive */
+static BlockBackend *blk_create_empty_drive(void)
+{
+    return blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
+}
+
 /********************************************************/
 /* qdev floppy bus                                      */
 
@@ -486,8 +492,7 @@ static void floppy_drive_realize(DeviceState *qdev, Error **errp)
     }
 
     if (!dev->conf.blk) {
-        /* Anonymous BlockBackend for an empty drive */
-        dev->conf.blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
+        dev->conf.blk = blk_create_empty_drive();
         ret = blk_attach_dev(dev->conf.blk, qdev);
         assert(ret == 0);
 
-- 
2.31.1


