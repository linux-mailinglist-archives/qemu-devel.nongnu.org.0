Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A102B160A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 07:57:29 +0100 (CET)
Received: from localhost ([::1]:34548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdT1U-0007cQ-Da
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 01:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdSww-0003eK-3P
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:52:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdSws-0006FJ-MO
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605250362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RLctlAVT6m71TV/FExcY57hOzH4ilBb5sK2BErLwZJA=;
 b=KFcpPMfgqBPIsDoEOwRNPBzfpzdzHuaOQLvFSeCAjoO2ex9Ln7p2C6G8S+vzDJP/y9k0VT
 iqRSYwLPQKnCtm5n1uxI/lx7dX4igDaG9g/n5Ftz08b6SOQeKhYlbJ8Y2+FyAnE4DXEJGh
 XUjL7TGe5/Miy3A+0QK2qx48Oc9XqQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-bK24xIstP9icetaziRF4CA-1; Fri, 13 Nov 2020 01:52:40 -0500
X-MC-Unique: bK24xIstP9icetaziRF4CA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75835804763
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 06:52:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08EFD60C0F;
 Fri, 13 Nov 2020 06:52:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3239411384A8; Fri, 13 Nov 2020 07:52:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] migration: Fix a few absurdly defective error messages
Date: Fri, 13 Nov 2020 07:52:36 +0100
Message-Id: <20201113065236.2644169-7-armbru@redhat.com>
In-Reply-To: <20201113065236.2644169-1-armbru@redhat.com>
References: <20201113065236.2644169-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

migrate_params_check() has a number of error messages of the form

    Parameter 'NAME' expects is invalid, it should be ...

Fix them to something like

    Parameter 'NAME' expects a ...

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 migration/migration.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3daed2da0e..5f9a10909d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1240,21 +1240,21 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
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
 
@@ -1307,21 +1307,21 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
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
 
@@ -1330,8 +1330,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
          !is_power_of_2(params->xbzrle_cache_size))) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "xbzrle_cache_size",
-                   "is invalid, it should be bigger than target page size"
-                   " and a power of 2");
+                   "a power of two no less than the target page size");
         return false;
     }
 
@@ -1348,21 +1347,21 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
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
@@ -1370,7 +1369,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         params->announce_step > 10000)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    "announce_step",
-                   "is invalid, it must be in the range of 1 to 10000 ms");
+                   "a value between 0 and 10000");
        return false;
     }
 
-- 
2.26.2


