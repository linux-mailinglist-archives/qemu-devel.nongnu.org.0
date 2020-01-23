Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF5146338
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 09:18:50 +0100 (CET)
Received: from localhost ([::1]:52726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuXhR-0003HM-KO
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 03:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1iuXfw-00020Z-Nj
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 03:17:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1iuXfv-0005lK-LN
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 03:17:16 -0500
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:35502
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1iuXfv-0005iz-EJ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 03:17:15 -0500
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1iuXft-00FGF5-Bb; Thu, 23 Jan 2020 09:17:13 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/6] libvhost-user-glib: use
 g_main_context_get_thread_default()
Date: Thu, 23 Jan 2020 09:17:05 +0100
Message-Id: <20200123081708.7817-4-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123081708.7817-1-johannes@sipsolutions.net>
References: <20200123081708.7817-1-johannes@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
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
 Stefan Hajnoczi <stefanha@redhat.com>, Johannes Berg <johannes.berg@intel.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Johannes Berg <johannes.berg@intel.com>

If we use NULL, we just get the main program default mainloop
here. Using g_main_context_get_thread_default() has basically
the same effect, but it lets us start different devices in
different threads with different mainloops, which can be useful.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 contrib/libvhost-user/libvhost-user-glib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/libvhost-user/libvhost-user-glib.c b/contrib/libvhost-user/libvhost-user-glib.c
index 824c7780de61..53f1ca4cdd73 100644
--- a/contrib/libvhost-user/libvhost-user-glib.c
+++ b/contrib/libvhost-user/libvhost-user-glib.c
@@ -89,7 +89,7 @@ vug_source_new(VugDev *gdev, int fd, GIOCondition cond,
     src->gfd.events = cond;
 
     g_source_add_poll(gsrc, &src->gfd);
-    id = g_source_attach(gsrc, NULL);
+    id = g_source_attach(gsrc, g_main_context_get_thread_default());
     g_assert(id);
 
     return gsrc;
-- 
2.24.1


