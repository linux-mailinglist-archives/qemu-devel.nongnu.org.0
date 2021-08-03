Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC993DED51
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 14:04:18 +0200 (CEST)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAt9d-0005mR-K4
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 08:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mAt8a-00055L-Ul
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 08:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mAt8X-0006wO-Lt
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 08:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627992187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zeTGGenuEJFewSzNhav8MoDiLcOMjLrFJ3rFTvTCGoM=;
 b=QRQmG2TpB53mTdhOdx0ZrIBMxreXgqiVd0tnn0LboVLGhxGsOsgjiFAth224qwocGnH077
 8hILlDmBY08qS5+pyFF1OvJO0Ji2f9tUrOpD2kHO8SKK29J/DxehkJXut8J/fP3UAzMQoE
 WSbAbBHl/F9QB9D+EAHqHCqRGU8jmHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-Hjyh15FyPeuc9m14mVQIvQ-1; Tue, 03 Aug 2021 08:03:05 -0400
X-MC-Unique: Hjyh15FyPeuc9m14mVQIvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D0751853047;
 Tue,  3 Aug 2021 12:02:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E24584641;
 Tue,  3 Aug 2021 12:02:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] chardev: give some context on chardev-add error
Date: Tue,  3 Aug 2021 16:02:29 +0400
Message-Id: <20210803120229.3453699-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, f4bug@amsat.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Related to:
https://bugzilla.redhat.com/show_bug.cgi?id=1984721

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index d959eec522..f59a61774b 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -1031,27 +1031,26 @@ Chardev *qemu_chardev_new(const char *id, const char *typename,
 ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
                                Error **errp)
 {
+    ERRP_GUARD();
     const ChardevClass *cc;
     ChardevReturn *ret;
-    Chardev *chr;
+    g_autoptr(Chardev) chr = NULL;
 
     cc = char_get_class(ChardevBackendKind_str(backend->type), errp);
     if (!cc) {
-        return NULL;
+        goto err;
     }
 
     chr = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
                       backend, NULL, false, errp);
     if (!chr) {
-        return NULL;
+        goto err;
     }
 
     if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr),
                                        errp)) {
-        object_unref(OBJECT(chr));
-        return NULL;
+        goto err;
     }
-    object_unref(OBJECT(chr));
 
     ret = g_new0(ChardevReturn, 1);
     if (CHARDEV_IS_PTY(chr)) {
@@ -1060,6 +1059,10 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
     }
 
     return ret;
+
+err:
+    error_prepend(errp, "Failed to add chardev '%s': ", id);
+    return NULL;
 }
 
 ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
-- 
2.32.0.264.g75ae10bc75


