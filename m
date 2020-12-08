Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878782D2A3D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:05:04 +0100 (CET)
Received: from localhost ([::1]:42732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmbjr-0006tJ-Hw
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:05:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcr-0001Su-Uq
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcp-00053K-H6
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607428666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54eErFjWzULpBgE1E4/EYUqQQPO1dJmwDPj3VAlTzVk=;
 b=Tuae0oZQUnmA96n6wULap/saFhkrPa+fKtGY7B/JVKO9XmQ45X6lv7ECmjAtQZ4S0uM/qO
 bs9eJwUlIMd2p8wdnIZraLj0IxWnqYNpUPrKP5+KJs0tCa+8RC6/LOFWQ3JrG719SdqUkK
 pZgtj6xaRiiN95mk4b93bu8TyP8gk44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-PjudyFOhP96fO0Gsft3cdA-1; Tue, 08 Dec 2020 06:57:45 -0500
X-MC-Unique: PjudyFOhP96fO0Gsft3cdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B8E6107ACE3
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 11:57:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A3E95D9DD;
 Tue,  8 Dec 2020 11:57:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3DD649D92; Tue,  8 Dec 2020 12:57:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] vnc: use enum for features
Date: Tue,  8 Dec 2020 12:57:31 +0100
Message-Id: <20201208115737.18581-4-kraxel@redhat.com>
In-Reply-To: <20201208115737.18581-1-kraxel@redhat.com>
References: <20201208115737.18581-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use an enum for the vnc feature bits.  That way they are enumerated
automatically and we don't have to do that manually when adding or
removing features.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vnc.h | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/ui/vnc.h b/ui/vnc.h
index 4e2637ce6c5c..262fcf179b44 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -438,18 +438,20 @@ enum {
  *
  *****************************************************************************/
 
-#define VNC_FEATURE_RESIZE                   0
-#define VNC_FEATURE_HEXTILE                  1
-#define VNC_FEATURE_POINTER_TYPE_CHANGE      2
-#define VNC_FEATURE_WMVI                     3
-#define VNC_FEATURE_TIGHT                    4
-#define VNC_FEATURE_ZLIB                     5
-#define VNC_FEATURE_COPYRECT                 6
-#define VNC_FEATURE_RICH_CURSOR              7
-#define VNC_FEATURE_TIGHT_PNG                8
-#define VNC_FEATURE_ZRLE                     9
-#define VNC_FEATURE_ZYWRLE                  10
-#define VNC_FEATURE_LED_STATE               11
+enum VncFeatures {
+    VNC_FEATURE_RESIZE,
+    VNC_FEATURE_HEXTILE,
+    VNC_FEATURE_POINTER_TYPE_CHANGE,
+    VNC_FEATURE_WMVI,
+    VNC_FEATURE_TIGHT,
+    VNC_FEATURE_ZLIB,
+    VNC_FEATURE_COPYRECT,
+    VNC_FEATURE_RICH_CURSOR,
+    VNC_FEATURE_TIGHT_PNG,
+    VNC_FEATURE_ZRLE,
+    VNC_FEATURE_ZYWRLE,
+    VNC_FEATURE_LED_STATE,
+};
 
 #define VNC_FEATURE_RESIZE_MASK              (1 << VNC_FEATURE_RESIZE)
 #define VNC_FEATURE_HEXTILE_MASK             (1 << VNC_FEATURE_HEXTILE)
-- 
2.27.0


