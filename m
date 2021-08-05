Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC3E3E1533
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:58:50 +0200 (CEST)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcxW-00032l-0N
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBctX-0005Cf-U7
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBctW-00042z-EC
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628168081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9d2/YF5dgfR8oQIK2i1GyQ8daIEzdmwVt8l6TxHB9Q=;
 b=CSpMkXhSUSa/OQKwde9RgvoE+BUYMC6UBgw7BjBDLdV917odDEXpYXDv2JLjRhIL7nc17C
 o+NHn+5HH7aQYjDAzO3zoM8jgYy10EpWTLTRIb97QjyCTmAL9pqi72vsa7FGyloGR46NUG
 CiAGv+guJbmpEkcbEUAU9oIk3syCWBk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-FT2c7ZAdOwG_I9nfbcm6wA-1; Thu, 05 Aug 2021 08:54:40 -0400
X-MC-Unique: FT2c7ZAdOwG_I9nfbcm6wA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7549C760C0;
 Thu,  5 Aug 2021 12:54:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BCF527CB1;
 Thu,  5 Aug 2021 12:54:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] chardev: give some context on chardev-add error
Date: Thu,  5 Aug 2021 16:53:30 +0400
Message-Id: <20210805125331.826741-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210805125331.826741-1-marcandre.lureau@redhat.com>
References: <20210805125331.826741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Description from Daniel P. Berrangé:
> The original code reported:
>
>  "attempt to add duplicate property 'char2' to object (type 'container')"
>
> Since adding yank support, the current code reports
>
>  "duplicate yank instance"
>
> With this patch applied it now reports:
>
>  "Failed to add chardev 'char2': duplicate yank instance"
>
> This is marginally better, but still not great, not that the original
> error was great either.
>
> It would be nice if we could report
>
>   "chardev with id 'char2' already exists"

Related to:
https://bugzilla.redhat.com/show_bug.cgi?id=1984721

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


