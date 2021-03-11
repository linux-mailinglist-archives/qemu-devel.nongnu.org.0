Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693C33372E4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:40:23 +0100 (CET)
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKc2-000067-Es
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKWD-0003fk-KH
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKW5-0006Uf-Kc
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JihjGTtofNKogPSCm5rbbenl0j50JTKYUFKe3OPEnaw=;
 b=QWIA/hVm6tyawbZjwDv9EXhaUtSvLqjCVuQdqPcr/VLwe1cWR1BPUUMqcUHbfnJJogCX6Y
 9x+ixKF9l2WTheq/ZkKRvDbJNuwhbUiswWSsqQVlNBxN6YytBjPnRLzE7dlC3Jm1CsT+Ag
 Udgz+y4azofgz/rIpFi0prwl9JSD/t8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-Y9Umt1kPOkOIner9GzapMw-1; Thu, 11 Mar 2021 07:34:07 -0500
X-MC-Unique: Y9Umt1kPOkOIner9GzapMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1683800D55;
 Thu, 11 Mar 2021 12:34:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C2945D9F0;
 Thu, 11 Mar 2021 12:34:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BAFED180090D; Thu, 11 Mar 2021 13:34:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] ui/gtk: Remove NULL checks in gd_switch
Date: Thu, 11 Mar 2021 13:33:54 +0100
Message-Id: <20210311123401.340122-2-kraxel@redhat.com>
In-Reply-To: <20210311123401.340122-1-kraxel@redhat.com>
References: <20210311123401.340122-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

c821a58ee7 ("ui/console: Pass placeholder surface to display")
eliminated the possibility that NULL is passed as surface to
dpy_gfx_switch and removed some NULL checks from gd_switch, but the
removal was not thoroughly. Remaining NULL checks were confusing for
Coverity and probably also for humans. This change removes those NULL
checks.

Reported-by: Coverity (CID 1448421)
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210308140713.17901-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 3edaf041defc..eb1c9658e24f 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -547,9 +547,7 @@ static void gd_switch(DisplayChangeListener *dcl,
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
     bool resized = true;
 
-    trace_gd_switch(vc->label,
-                    surface ? surface_width(surface)  : 0,
-                    surface ? surface_height(surface) : 0);
+    trace_gd_switch(vc->label, surface_width(surface), surface_height(surface));
 
     if (vc->gfx.surface) {
         cairo_surface_destroy(vc->gfx.surface);
@@ -560,7 +558,7 @@ static void gd_switch(DisplayChangeListener *dcl,
         vc->gfx.convert = NULL;
     }
 
-    if (vc->gfx.ds && surface &&
+    if (vc->gfx.ds &&
         surface_width(vc->gfx.ds) == surface_width(surface) &&
         surface_height(vc->gfx.ds) == surface_height(surface)) {
         resized = false;
-- 
2.29.2


