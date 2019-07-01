Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E78D3866C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 10:38:18 +0200 (CEST)
Received: from localhost ([::1]:46880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZAO9-00045o-8i
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 04:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58772)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hZAKe-0001Nk-4l
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:34:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hZAKd-0002Lc-72
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:34:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55110)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hZAKc-0002JQ-Sp
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:34:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 26BD3308FC20
 for <qemu-devel@nongnu.org>; Fri,  7 Jun 2019 08:34:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-25.ams2.redhat.com
 [10.36.117.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC2645D707;
 Fri,  7 Jun 2019 08:34:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DE85D16E1A; Fri,  7 Jun 2019 10:34:32 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 10:34:29 +0200
Message-Id: <20190607083429.31943-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 07 Jun 2019 08:34:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] edid: add xmax + ymax properties
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new properties to allow setting the maximum display resolution.
Resolutions larger than that will not be included in the mode list.
In linux guests xrandr can be used to list modes.

Note: The existing xres and yres properties set the preferred display
resolution, i.e. the mode should be first in the mode list and guests
should use it by default.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/display/edid.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/display/edid.h b/include/hw/display/edid.h
index bacf1708894b..7948bd2c40f8 100644
--- a/include/hw/display/edid.h
+++ b/include/hw/display/edid.h
@@ -22,6 +22,8 @@ void qemu_edid_region_io(MemoryRegion *region, Object *owner,
 
 #define DEFINE_EDID_PROPERTIES(_state, _edid_info)              \
     DEFINE_PROP_UINT32("xres", _state, _edid_info.prefx, 0),    \
-    DEFINE_PROP_UINT32("yres", _state, _edid_info.prefy, 0)
+    DEFINE_PROP_UINT32("yres", _state, _edid_info.prefy, 0),    \
+    DEFINE_PROP_UINT32("xmax", _state, _edid_info.maxx, 0),     \
+    DEFINE_PROP_UINT32("ymax", _state, _edid_info.maxy, 0)
 
 #endif /* EDID_H */
-- 
2.18.1


