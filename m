Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE0330C147
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:19:28 +0100 (CET)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wWd-0005RW-Fg
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6wUz-00048t-FQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:17:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l6wUw-0006n8-UI
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612275461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=897qO8hSWhJs2TE2KsqCGpZiLN7ad/S6H6Ep8TNphY0=;
 b=bZVcvJ3X0DpxjmJxu4osbUeOI88oh2ZFCXjsPy2nJo9K81tHw8QwH0WuucoTKJt17OebaZ
 XjnqpyKQq5cb4Ji4y3IzP6WdBwzhDDib7GV1F9yx4beypYSAc9/NgBdeLcFmy0bln0NYtJ
 GHJOLe4LyRKG0i7N1DIrMcelOSHibNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-nToYtnAIN9uRnxSZGLdmlQ-1; Tue, 02 Feb 2021 09:17:37 -0500
X-MC-Unique: nToYtnAIN9uRnxSZGLdmlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45C98C7403
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:17:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7F5F5D722;
 Tue,  2 Feb 2021 14:17:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A3851132FD3; Tue,  2 Feb 2021 15:17:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] migration: Fix a few absurdly defective error messages
Date: Tue,  2 Feb 2021 15:17:34 +0100
Message-Id: <20210202141734.2488076-5-armbru@redhat.com>
In-Reply-To: <20210202141734.2488076-1-armbru@redhat.com>
References: <20210202141734.2488076-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

migrate_params_check() has a number of error messages of the form

    Parameter 'NAME' expects is invalid, it should be ...

Fix them to something like

    Parameter 'NAME' expects a ...

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 8f28e0af99..55a1a82d7a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1226,21 +1226,21 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
     if (params->has_compress_level &&
         (params->compress_level > 9)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "compress_level",
-                   "is invalid, it should be in the range of 0 to 9");
+                   "a value between 0 and 9");
         return false;
     }
 
     if (params->has_compress_threads && (params->compress_threads < 1)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "compress_threads",
-                   "is invalid, it should be in the range of 1 to 255");
+                   "a value between 1 and 255");
         return false;
     }
 
     if (params->has_decompress_threads && (params->decompress_threads < 1)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "decompress_threads",
-                   "is invalid, it should be in the range of 1 to 255");
+                   "a value between 1 and 255");
         return false;
     }
 
@@ -1293,21 +1293,21 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
     if (params->has_multifd_channels && (params->multifd_channels < 1)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "multifd_channels",
-                   "is invalid, it should be in the range of 1 to 255");
+                   "a value between 1 and 255");
         return false;
     }
 
     if (params->has_multifd_zlib_level &&
         (params->multifd_zlib_level > 9)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "multifd_zlib_level",
-                   "is invalid, it should be in the range of 0 to 9");
+                   "a value between 0 and 9");
         return false;
     }
 
     if (params->has_multifd_zstd_level &&
         (params->multifd_zstd_level > 20)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "multifd_zstd_level",
-                   "is invalid, it should be in the range of 0 to 20");
+                   "a value between 0 and 20");
         return false;
     }
 
@@ -1316,8 +1316,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
          !is_power_of_2(params->xbzrle_cache_size))) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "xbzrle_cache_size",
-                   "is invalid, it should be bigger than target page size"
-                   " and a power of 2");
+                   "a power of two no less than the target page size");
         return false;
     }
 
@@ -1334,21 +1333,21 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         params->announce_initial > 100000) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "announce_initial",
-                   "is invalid, it must be less than 100000 ms");
+                   "a value between 0 and 100000");
         return false;
     }
     if (params->has_announce_max &&
         params->announce_max > 100000) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "announce_max",
-                   "is invalid, it must be less than 100000 ms");
+                   "a value between 0 and 100000");
        return false;
     }
     if (params->has_announce_rounds &&
         params->announce_rounds > 1000) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "announce_rounds",
-                   "is invalid, it must be in the range of 0 to 1000");
+                   "a value between 0 and 1000");
        return false;
     }
     if (params->has_announce_step &&
@@ -1356,7 +1355,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         params->announce_step > 10000)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "announce_step",
-                   "is invalid, it must be in the range of 1 to 10000 ms");
+                   "a value between 0 and 10000");
        return false;
     }
 
-- 
2.26.2


