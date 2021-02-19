Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34A1320122
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:03:27 +0100 (CET)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDry-0005qc-M6
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpU-0003TK-7y
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpR-0005dh-96
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613772048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytlRzGU7yo3Dj5Jjb15C/C5CzEpw7ejlHjj6/k5BTAk=;
 b=ZIvwyx0X7fXwarDuXHIDQsbuEixox/TTAScoWwpFPBjg5j/WgaiUAjyFD7QshmmuHJBcJm
 xBHNp6Sloyu3mDVDfIMc0QIjl27yzVTPkcdNDm5ARBSUpG1BPjDlYx5R++PZbFM/fGm1Kq
 At2/fG7ntAfaWnfEvUMcmSeVdcAoDhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-xInW-xbDPhKgEEMYSyEJXA-1; Fri, 19 Feb 2021 17:00:45 -0500
X-MC-Unique: xInW-xbDPhKgEEMYSyEJXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A35C6803648;
 Fri, 19 Feb 2021 22:00:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 771426EF55;
 Fri, 19 Feb 2021 22:00:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DF35F18000B6; Fri, 19 Feb 2021 23:00:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] spice: flush on GL update before notifying client
Date: Fri, 19 Feb 2021 23:00:29 +0100
Message-Id: <20210219220036.100654-2-kraxel@redhat.com>
In-Reply-To: <20210219220036.100654-1-kraxel@redhat.com>
References: <20210219220036.100654-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since the introduction of spice/virgl support in commit
474114b7 ("spice: add opengl/virgl/dmabuf support"), the drawing isn't
being flushed before notifying the client. This results in
outdated/sluggish drawing on client side, in particular when using the
Linux console.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210216092056.2301293-1-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/spice-display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index 6f32b66a6e75..d562c6408405 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1087,6 +1087,7 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
 
     trace_qemu_spice_gl_update(ssd->qxl.id, w, h, x, y);
     qemu_spice_gl_block(ssd, true);
+    glFlush();
     cookie = (uintptr_t)qxl_cookie_new(QXL_COOKIE_TYPE_GL_DRAW_DONE, 0);
     spice_qxl_gl_draw_async(&ssd->qxl, x, y, w, h, cookie);
 }
-- 
2.29.2


