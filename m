Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26CE2D7D86
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:01:50 +0100 (CET)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmjl-0007LX-Ju
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxn-0007Tc-Ne
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxa-0003RC-CG
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/eMu2svoHlmpVYmEmm9c+Bi9DvBEDcRHM9OpjEAao8=;
 b=E9IfPykMhEGHCvD7Xg+3doDL9dtJ8QPkUCJS2MSL8m6Bw+t/4z2x9uA406TFkWEfO/lmnW
 p7LnY5V0G8h5yyALUAj8klvlVCLoJ2UGB4dIc3a2FCbdjv5jk/h63iAr+eTEK9gfX3kghr
 0YxAhsYzics+ZfzuxS69LpNqBfI8Svo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-zear8r8fOEO68FIx5ptR3Q-1; Fri, 11 Dec 2020 12:11:58 -0500
X-MC-Unique: zear8r8fOEO68FIx5ptR3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D3B3107ACE8;
 Fri, 11 Dec 2020 17:11:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5883410013C0;
 Fri, 11 Dec 2020 17:11:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E795F112E5DE; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/20] block: Use GString instead of QString to build filenames
Date: Fri, 11 Dec 2020 18:11:51 +0100
Message-Id: <20201211171152.146877-20-armbru@redhat.com>
In-Reply-To: <20201211171152.146877-1-armbru@redhat.com>
References: <20201211171152.146877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Kevin Wolf <kwolf@redhat.com>, mdroth@linux.vnet.ibm.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
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
---
 block.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 94d3a15081..75ffbe9092 100644
--- a/block.c
+++ b/block.c
@@ -216,7 +216,7 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
         /* Stripping the explicit protocol prefix may result in a protocol
          * prefix being (wrongly) detected (if the filename contains a colon) */
         if (path_has_protocol(filename)) {
-            QString *fat_filename;
+            GString *fat_filename;
 
             /* This means there is some colon before the first slash; therefore,
              * this cannot be an absolute path */
@@ -224,12 +224,13 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
 
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


