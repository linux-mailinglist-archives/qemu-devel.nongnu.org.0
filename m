Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EB9A7B02
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 07:54:07 +0200 (CEST)
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5OF2-0006HS-IB
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 01:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i5ODx-0005rX-6J
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 01:52:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i5ODv-0003D6-9S
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 01:52:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42952)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i5ODv-0003Cb-4M
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 01:52:55 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9360AC0718BD
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 05:52:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 135BD19C4F;
 Wed,  4 Sep 2019 05:52:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 34323937E; Wed,  4 Sep 2019 07:52:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 07:52:50 +0200
Message-Id: <20190904055250.22421-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 04 Sep 2019 05:52:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] vnc: fix websocket field in events
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

Just need to fill VncClientInfo.websocket in vnc_client_cache_addr().

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1748175
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/vnc.c b/ui/vnc.c
index 649ce93cd24c..e318bfc1ed2f 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -278,6 +278,7 @@ static void vnc_client_cache_addr(VncState *client)
     vnc_init_basic_info_from_remote_addr(client->sioc,
                                          qapi_VncClientInfo_base(client->info),
                                          &err);
+    client->info->websocket = client->websocket;
     if (err) {
         qapi_free_VncClientInfo(client->info);
         client->info = NULL;
-- 
2.18.1


