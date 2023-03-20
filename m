Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10ED6C1AF0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peI4f-000136-Lx; Mon, 20 Mar 2023 12:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1peI4c-00012Q-Au
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:09:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1peI4a-0003X1-RV
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679328560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8W48oTg6Ve1Zt7gbqAvdvaVOpixgBES6rvEObdQ6H7s=;
 b=ULgJBT1Yya+FXMLuF2JhGr4mABVx21lHqVzkInDxeqeO7P91kwWZ+2BfNNA8GJr6IMSOfo
 SQ074bj9vbnyZ8yx3d8zgb8nFS6Uhy1BlSTnniR2GF9XI2p5OZQcIiqEqrXIGYDH/ZunXS
 SdYOW5xP7zFGnbo76PXFHfVuYtct5Bo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-EtyIR2gsOGixD8eMxkhl6Q-1; Mon, 20 Mar 2023 12:09:18 -0400
X-MC-Unique: EtyIR2gsOGixD8eMxkhl6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6523C810BCE
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 16:09:17 +0000 (UTC)
Received: from centennial.enunes.eu (unknown [10.43.17.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5E8B2166B29;
 Mon, 20 Mar 2023 16:09:16 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: qemu-devel@nongnu.org
Cc: Erico Nunes <ernunes@redhat.com>
Subject: [PATCH 2/2] ui/gtk-egl: fix scaling for cursor position in scanout
 mode
Date: Mon, 20 Mar 2023 17:08:56 +0100
Message-Id: <20230320160856.364319-2-ernunes@redhat.com>
In-Reply-To: <20230320160856.364319-1-ernunes@redhat.com>
References: <20230320160856.364319-1-ernunes@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=ernunes@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

vc->gfx.w and vc->gfx.h are not updated appropriately in this code path,
which leads to a different scaling factor for rendering the cursor on
some edge cases (e.g. the focus has left and re-entered the gtk window).
This can be reproduced using vhost-user-gpu with the gtk ui on the x11
backend.
Use the surface dimensions which are already updated accordingly.

Signed-off-by: Erico Nunes <ernunes@redhat.com>
---
 ui/gtk-egl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index e84431790c..a4422be837 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -88,8 +88,8 @@ void gd_egl_draw(VirtualConsole *vc)
 #endif
         gd_egl_scanout_flush(&vc->gfx.dcl, 0, 0, vc->gfx.w, vc->gfx.h);
 
-        vc->gfx.scale_x = (double)ww / vc->gfx.w;
-        vc->gfx.scale_y = (double)wh / vc->gfx.h;
+        vc->gfx.scale_x = (double)ww / surface_width(vc->gfx.ds);
+        vc->gfx.scale_y = (double)wh / surface_height(vc->gfx.ds);
 
         glFlush();
 #ifdef CONFIG_GBM
-- 
2.39.2


