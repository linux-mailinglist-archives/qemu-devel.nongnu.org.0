Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32002F76B1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:31:07 +0100 (CET)
Received: from localhost ([::1]:50772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MNm-0002Zt-Sq
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHU-0002vI-SV
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHT-0007tN-AO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EO8CiTvkYhxpMMdPMV09i1bJZpLZdUP8OlhSRKWJhOI=;
 b=g9zbk94WxT6NGWulXHp7P6n2gSoN6dr9r+hnXi0fV5WwdzRRCOIF3SyD1EN+aaUQxS5vZ7
 LKXk427/5ycL6a9M6uUNG3SbO/lWlcmgy8riUDQ/tE1YKUSg6X/CjjHMHmU4LuVpUEE73N
 v9YHXor+HDtTMsJ3gvucZ7Su/G7Jzbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-ECzy3WbWPL2xzx_6yZJAcg-1; Fri, 15 Jan 2021 05:24:30 -0500
X-MC-Unique: ECzy3WbWPL2xzx_6yZJAcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75466806662;
 Fri, 15 Jan 2021 10:24:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43E771992D;
 Fri, 15 Jan 2021 10:24:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A6F9C1800633; Fri, 15 Jan 2021 11:24:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] ui/gtk: expose gd_monitor_update_interval
Date: Fri, 15 Jan 2021 11:24:17 +0100
Message-Id: <20210115102424.1360437-5-kraxel@redhat.com>
In-Reply-To: <20210115102424.1360437-1-kraxel@redhat.com>
References: <20210115102424.1360437-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nikola Pavlica <pavlica.nikola@gmail.com>

The gd_egl_refresh function, as the name suggests, is responsible for
refreshing displays when using EGL graphics with QEMU's GTK UI. This is
a perfect candidate for a function to update the refresh rate in.

Since gd_monitor_update_interval is inaccessible from the gd_egl_refresh
function, we need to expose/globalize it in the include/ui/gtk.h file.

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
Message-Id: <20210114140153.301473-2-pavlica.nikola@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/gtk.h | 1 +
 ui/gtk.c         | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 80851fb4c7e1..3f395d7f943b 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -86,6 +86,7 @@ extern bool gtk_use_gl_area;
 
 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
+int gd_monitor_update_interval(GtkWidget *widget);
 
 /* ui/gtk-egl.c */
 void gd_egl_init(VirtualConsole *vc);
diff --git a/ui/gtk.c b/ui/gtk.c
index d2004a4dc162..26665cd2e657 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -752,7 +752,7 @@ static void gd_resize_event(GtkGLArea *area,
  * If available, return the update interval of the monitor in ms,
  * else return 0 (the default update interval).
  */
-static int gd_monitor_update_interval(GtkWidget *widget)
+int gd_monitor_update_interval(GtkWidget *widget)
 {
 #ifdef GDK_VERSION_3_22
     GdkWindow *win = gtk_widget_get_window(widget);
-- 
2.29.2


