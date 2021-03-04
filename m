Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644CB32D3B7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:55:40 +0100 (CET)
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnVz-000262-E9
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnT2-0007hS-7E
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSy-0005A5-Qk
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQkU7CXwA/lnRznfmg8nccGZS8D8nCFwCExpD8ImfW0=;
 b=HCviX4OMSGmZX4J/ucuPg/Tn8WPQrnAy/KEAjOCO5T4jAVq+hk2ivnAezJg8Q7yGrQqSp0
 7GyiCgDjbghLmuA4ys4fCf2g86mRjOfyIkH9PvOvkgLFjq3MpxFThCIFvUeh6ihetPJcxi
 YrMRAxGTzrKXiOBjJKj1wH6JHsuYdx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-lghfa0AAP3aPqYyNiUCJ7w-1; Thu, 04 Mar 2021 07:52:30 -0500
X-MC-Unique: lghfa0AAP3aPqYyNiUCJ7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 075748143F1;
 Thu,  4 Mar 2021 12:52:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87C875FCAE;
 Thu,  4 Mar 2021 12:52:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6ED7618003B6; Thu,  4 Mar 2021 09:37:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] ui/cocoa: Replace fprintf with error_report
Date: Thu,  4 Mar 2021 09:37:02 +0100
Message-Id: <20210304083705.1046645-6-kraxel@redhat.com>
In-Reply-To: <20210304083705.1046645-1-kraxel@redhat.com>
References: <20210304083705.1046645-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210223131106.21166-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 6a59f87316b8..f27beb30e6ef 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -270,7 +270,7 @@ const int mac_to_qkeycode_map[] = {
 static int cocoa_keycode_to_qemu(int keycode)
 {
     if (ARRAY_SIZE(mac_to_qkeycode_map) <= keycode) {
-        fprintf(stderr, "(cocoa) warning unknown keycode 0x%x\n", keycode);
+        error_report("(cocoa) warning unknown keycode 0x%x", keycode);
         return 0;
     }
     return mac_to_qkeycode_map[keycode];
@@ -1060,7 +1060,7 @@ QemuCocoaView *cocoaView;
         // create a view and add it to the window
         cocoaView = [[QemuCocoaView alloc] initWithFrame:NSMakeRect(0.0, 0.0, 640.0, 480.0)];
         if(!cocoaView) {
-            fprintf(stderr, "(cocoa) can't create a view\n");
+            error_report("(cocoa) can't create a view");
             exit(1);
         }
 
@@ -1069,7 +1069,7 @@ QemuCocoaView *cocoaView;
             styleMask:NSWindowStyleMaskTitled|NSWindowStyleMaskMiniaturizable|NSWindowStyleMaskClosable
             backing:NSBackingStoreBuffered defer:NO];
         if(!normalWindow) {
-            fprintf(stderr, "(cocoa) can't create window\n");
+            error_report("(cocoa) can't create window");
             exit(1);
         }
         [normalWindow setAcceptsMouseMovedEvents:YES];
-- 
2.29.2


