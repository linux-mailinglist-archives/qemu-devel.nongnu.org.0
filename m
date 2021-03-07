Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC3E330482
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 21:28:19 +0100 (CET)
Received: from localhost ([::1]:56358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ00g-00085c-Rw
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 15:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <5ccafdd8ed4dcffe44d693298a2113b3f5f182e2@lizzy.crudebyte.com>)
 id 1lIzzK-0006Lt-7f
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 15:26:54 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:56381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <5ccafdd8ed4dcffe44d693298a2113b3f5f182e2@lizzy.crudebyte.com>)
 id 1lIzzH-0006kj-6k
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 15:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=s2Ufl7ucv2PgkvE1z5bgmBvZ3WlH8evk1G5HAtPJZ1Q=; b=aELks
 DdruhoDPfrcWEekb0jsg/O+j4Iq4bv5PpjXVclDxDhnc0JXDbqtEpqZFJmt+NOCtInq6K9gTa/ORm
 DlhKoTcc+Tnlg/YSip4ziSkgmJpsPyRyycBHQ2rY/VtZMiNeBoAMnVC1bW6+PB98itMWvd/bmydSL
 w728YK6jPSwzCz5akyXOfB47jforxuZtyhtSTrN/pBekhlvC81QN02ni4fEbZnqfgzjZZAHkn6hX7
 D4FoGZo/Um6Oi9tKbIDA+dC6/FWtTTLuteBiNxrnG1kwT1lA6Eqv6YpeyUhcTa0dU86Wn8SOKiMZZ
 BXwetaScUHZhzwHCH/INfodr68V8A==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 7 Mar 2021 20:38:53 +0100
Subject: [PATCH] ui/gtk: fix NULL pointer dereference
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=5ccafdd8ed4dcffe44d693298a2113b3f5f182e2@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DisplaySurface pointer passed to gd_switch() can be NULL, so check this
before trying to dereference it.

Fixes: c821a58ee7 ("ui/console: Pass placeholder surface to display")
Reported-by: Coverity (CID 1448421)
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 ui/gtk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 3edaf041de..a27b27d004 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -567,7 +567,7 @@ static void gd_switch(DisplayChangeListener *dcl,
     }
     vc->gfx.ds = surface;
 
-    if (surface->format == PIXMAN_x8r8g8b8) {
+    if (surface && surface->format == PIXMAN_x8r8g8b8) {
         /*
          * PIXMAN_x8r8g8b8 == CAIRO_FORMAT_RGB24
          *
@@ -580,7 +580,7 @@ static void gd_switch(DisplayChangeListener *dcl,
              surface_width(surface),
              surface_height(surface),
              surface_stride(surface));
-    } else {
+    } else if (surface) {
         /* Must convert surface, use pixman to do it. */
         vc->gfx.convert = pixman_image_create_bits(PIXMAN_x8r8g8b8,
                                                    surface_width(surface),
-- 
2.20.1


