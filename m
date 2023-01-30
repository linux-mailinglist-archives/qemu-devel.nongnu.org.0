Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D64680BE5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:26:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSID-0006Vg-Io; Mon, 30 Jan 2023 06:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSHP-0006Qk-CV
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:24:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSHO-00081r-4a
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jV7bUQx7WiNczJSi/j6dogcwY/26ZVgR2AbJMGU524s=;
 b=TiYf3CDXckvYfXut6caKfaTYUuW/PxqoXNSFqGGqAWzlv0ODCF2K4g8331l2KiHMxBd0CV
 h1oWQOJNbg0h5e00IisK6DaZ1b1qQxGx/C6cZdc4ocUcldhHtpZ1EDgGn2YpVJX5L299L4
 CTgpXUFW+ln2UjPuHcgTdjTKFKacfC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-lTFOgaoaPNGwNH1rwHVsEg-1; Mon, 30 Jan 2023 06:24:51 -0500
X-MC-Unique: lTFOgaoaPNGwNH1rwHVsEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69FAE8030CD
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:24:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0531BC15BAE;
 Mon, 30 Jan 2023 11:24:49 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 04/11] ui/dbus: update the display when switching surface
Date: Mon, 30 Jan 2023 15:24:24 +0400
Message-Id: <20230130112431.69559-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230130112431.69559-1-marcandre.lureau@redhat.com>
References: <20230130112431.69559-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This seems to be the expected behaviour.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus-listener.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index f9fc8eda51..620d9450cc 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -321,6 +321,8 @@ static void dbus_gfx_switch(DisplayChangeListener *dcl,
         /* why not call disable instead? */
         return;
     }
+
+    dbus_gfx_update(dcl, 0, 0, surface_width(ddl->ds), surface_height(ddl->ds));
 }
 
 static void dbus_mouse_set(DisplayChangeListener *dcl,
-- 
2.39.1


