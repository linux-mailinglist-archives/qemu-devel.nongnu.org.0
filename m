Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD3A2DEE75
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 12:14:59 +0100 (CET)
Received: from localhost ([::1]:43822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqaCQ-0005O8-3Q
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 06:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZu2-0005Nx-S1
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqZtp-0007Ji-Nw
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 05:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608375344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htQZY9xpY70D/Wz35TnpKgq09HOSjfOIwxK58Ld+TMY=;
 b=UZXDq5Mo7di7nP5VXO1J7wPuJCDMDPrC3I52+M0n9YEPk8iD8GlgbqjEIGziU6rk0CYuiA
 cyG0RG8lHsRF1tdW8sbdBvELPVw+xKnmdKxN3w8/jAoCAhALjo8qRe0hKmp9CvmbakurGf
 z04gGiiNtbGgfM066dFpYRJt6moOvEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-XB-6YoueNw-T9E8aHAc_2g-1; Sat, 19 Dec 2020 05:55:39 -0500
X-MC-Unique: XB-6YoueNw-T9E8aHAc_2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8364C801817;
 Sat, 19 Dec 2020 10:55:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8172B6C9;
 Sat, 19 Dec 2020 10:55:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E4D73112564D; Sat, 19 Dec 2020 11:55:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/33] block: Use GString instead of QString to build filenames
Date: Sat, 19 Dec 2020 11:55:31 +0100
Message-Id: <20201219105532.1734134-33-armbru@redhat.com>
In-Reply-To: <20201219105532.1734134-1-armbru@redhat.com>
References: <20201219105532.1734134-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QString supports modifying its string, but it's quite limited: you can
only append.  Just one caller remains:
bdrv_parse_filename_strip_prefix() uses it just for building an
initial string.

Change it to do build the initial string with GString.  This is
another step towards making QString immutable.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201211171152.146877-20-armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 934d1bcc8f..27b2c3ba15 100644
--- a/block.c
+++ b/block.c
@@ -217,7 +217,7 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
         /* Stripping the explicit protocol prefix may result in a protocol
          * prefix being (wrongly) detected (if the filename contains a colon) */
         if (path_has_protocol(filename)) {
-            QString *fat_filename;
+            GString *fat_filename;
 
             /* This means there is some colon before the first slash; therefore,
              * this cannot be an absolute path */
@@ -225,12 +225,13 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
 
             /* And we can thus fix the protocol detection issue by prefixing it
              * by "./" */
-            fat_filename = qstring_from_str("./");
-            qstring_append(fat_filename, filename);
+            fat_filename = g_string_new("./");
+            g_string_append(fat_filename, filename);
 
-            assert(!path_has_protocol(qstring_get_str(fat_filename)));
+            assert(!path_has_protocol(fat_filename->str));
 
-            qdict_put(options, "filename", fat_filename);
+            qdict_put(options, "filename",
+                      qstring_from_gstring(fat_filename));
         } else {
             /* If no protocol prefix was detected, we can use the shortened
              * filename as-is */
-- 
2.26.2


