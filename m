Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D94313BA9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:55:50 +0100 (CET)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AlJ-00035P-3W
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94kV-0001y7-AR
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94kM-0002Qj-CC
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2MXwALsDH8SfU3T1u4oBtPowlnQBSHSYO9aYVFdlVA=;
 b=imZu4pYIbu+zAteWVh52Z/ZHA0jRJfRJcaliegtO/W5JJNyB0RFHLS+GZ+NnWV94eBW0SP
 aUiCurYcKOAwnJjWSRFF8VZPiymdiTHFG19Qnurml5jMs0HJlwA+s3e+17rzAF0meW0m9G
 xBRT3JwHP41uX9D0InNJv52sedXUsVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-bv8X0NLIPMCwwfyr_6BUqQ-1; Mon, 08 Feb 2021 06:30:22 -0500
X-MC-Unique: bv8X0NLIPMCwwfyr_6BUqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EAA15213;
 Mon,  8 Feb 2021 11:30:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBC461002393;
 Mon,  8 Feb 2021 11:30:16 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 12/27] migration: Fix a few absurdly defective error messages
Date: Mon,  8 Feb 2021 11:29:03 +0000
Message-Id: <20210208112918.185058-13-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

migrate_params_check() has a number of error messages of the form

    Parameter 'NAME' expects is invalid, it should be ...

Fix them to something like

    Parameter 'NAME' expects a ...

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210202141734.2488076-5-armbru@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 77b0c39b50..38efaeee94 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1317,21 +1317,21 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
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
 
@@ -1384,21 +1384,21 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
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
 
@@ -1407,8 +1407,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
          !is_power_of_2(params->xbzrle_cache_size))) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "xbzrle_cache_size",
-                   "is invalid, it should be bigger than target page size"
-                   " and a power of 2");
+                   "a power of two no less than the target page size");
         return false;
     }
 
@@ -1425,21 +1424,21 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
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
@@ -1447,7 +1446,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         params->announce_step > 10000)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "announce_step",
-                   "is invalid, it must be in the range of 1 to 10000 ms");
+                   "a value between 0 and 10000");
        return false;
     }
 
-- 
2.29.2


