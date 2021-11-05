Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD24462D6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 12:37:36 +0100 (CET)
Received: from localhost ([::1]:33176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mixXL-0002t5-Gz
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 07:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixS1-0001YD-Cy
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixRy-0007Xi-PR
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636111922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJXL/UmY6ljRpvIvfLf3+K7wjsFA295w8PrPqULNY2c=;
 b=Lyx1sUpY6Tkyp2FGxP3QtojARgGSnEggYnJZAYkbfjPhY52fom3L2WrfTL+bqzWTtxj+zt
 BoQeU/UT9IEuTOFGbzn2JrXyJSMsTDeCounh5J2vVpCU7a5HEO3VOlwKbj71INKrdb94Yd
 VPO1CEhZC9mSS/goVdROo4giRUJqgBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-f762FkPGNT2LNpRH2MihoA-1; Fri, 05 Nov 2021 07:32:00 -0400
X-MC-Unique: f762FkPGNT2LNpRH2MihoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCC3910A8E03;
 Fri,  5 Nov 2021 11:31:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5233D60BF1;
 Fri,  5 Nov 2021 11:31:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 085711805C8A; Fri,  5 Nov 2021 12:30:44 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] ui/gtk-egl: guest fb texture needs to be regenerated when
 reinitializing egl
Date: Fri,  5 Nov 2021 12:30:41 +0100
Message-Id: <20211105113043.4059361-5-kraxel@redhat.com>
In-Reply-To: <20211105113043.4059361-1-kraxel@redhat.com>
References: <20211105113043.4059361-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

If guest fb is backed by dmabuf (blob-resource), the texture bound to the
old context needs to be recreated in case the egl is re-initialized (e.g.
new window for vc is created in case of detaching/reattaching of the tab)

v2: call egl_dmabuf_release_texutre instead of putting 0 to dmabuf->texture
    (Vivek Kasireddy)

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Message-Id: <20211104065153.28897-3-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk-egl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 21649950983f..f2026e4b5c9b 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -155,6 +155,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
             surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
             surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
         }
+        if (vc->gfx.guest_fb.dmabuf) {
+            egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
+            gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
+        }
     }
 
     graphic_hw_update(dcl->con);
-- 
2.31.1


