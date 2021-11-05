Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEBE4462CA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 12:35:22 +0100 (CET)
Received: from localhost ([::1]:54946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mixVB-0006yU-Ld
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 07:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixRi-0001It-MB
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:31:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixRf-0006fc-QV
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636111901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXYjACikUidj+AsIdBr61Ue9utUDEhdyOPn+Z22X2pU=;
 b=apfQPZTCo0ISW3gNrP2n08meHWiX7Yu6ycekTOO83rQ219B87CQlfQmFsLW0HgqxfjSxOX
 cRqiG83/CS6xyHL/sbzSD8sX0oDgAm+l9AghNUQvf5E0RgMcViqYdoKaYyKzxqEwt5HHbS
 Se1DOFKFKBySxsE834+AOAEbIvdkjQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-6yOdlHuXNLK1idYMu5I2Lw-1; Fri, 05 Nov 2021 07:31:38 -0400
X-MC-Unique: 6yOdlHuXNLK1idYMu5I2Lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A86C810A8E03;
 Fri,  5 Nov 2021 11:31:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A9EB19739;
 Fri,  5 Nov 2021 11:31:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 135151805C8B; Fri,  5 Nov 2021 12:30:44 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] ui/gtk: gd_draw_event returns FALSE when no cairo surface
 is bound
Date: Fri,  5 Nov 2021 12:30:42 +0100
Message-Id: <20211105113043.4059361-6-kraxel@redhat.com>
In-Reply-To: <20211105113043.4059361-1-kraxel@redhat.com>
References: <20211105113043.4059361-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dongwon Kim <dongwon.kim@intel.com>

gd_draw_event shouldn't try to repaint if surface does not exist
for the VC.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Message-Id: <20211104065153.28897-4-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index 8da673c18c72..d2892ea6b4a9 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -778,6 +778,9 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
     if (!vc->gfx.ds) {
         return FALSE;
     }
+    if (!vc->gfx.surface) {
+        return FALSE;
+    }
 
     vc->gfx.dcl.update_interval =
         gd_monitor_update_interval(vc->window ? vc->window : s->window);
-- 
2.31.1


