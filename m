Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F782192E4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 23:54:20 +0200 (CEST)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtI1D-0006DA-GS
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 17:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtHc2-0000Tw-Su
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:28:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54777
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtHby-00029I-HN
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594243693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zoK81R4kJV8tNqTzKNspwc+x2v7Jqmk5CZRgwV9IlM=;
 b=bsJYVPFBInM/b7aO1oE6+MEeb7FHmUJ9Z/gTjbRPSHaFQlfWsnQwQ8P0OW+2oar2j4k5hZ
 JxaiS7fBdD9Dy1pjvB688Woq1sHXZ/V2vbMznjXqLv4bw2OhrSb/d3AuO6jHs+1Tw7wzac
 KCgYGAX7U6GCc/CFyxMH5wmop4ZaLPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-JJZ7M0HOMRiwOirtFpvadQ-1; Tue, 07 Jul 2020 17:25:23 -0400
X-MC-Unique: JJZ7M0HOMRiwOirtFpvadQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26CC5100CCC1;
 Tue,  7 Jul 2020 21:25:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3DFE60C87;
 Tue,  7 Jul 2020 21:25:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF5E210C4AEE; Tue,  7 Jul 2020 23:25:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 49/53] pflash: Use ERRP_GUARD()
Date: Tue,  7 Jul 2020 23:24:59 +0200
Message-Id: <20200707212503.1495927-50-armbru@redhat.com>
In-Reply-To: <20200707212503.1495927-1-armbru@redhat.com>
References: <20200707212503.1495927-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

If we want to check error after errp-function call, we need to
introduce local_err and then propagate it to errp. Instead, use
the ERRP_GUARD() macro, benefits are:
1. No need of explicit error_propagate call
2. No need of explicit local_err variable: use errp directly
3. ERRP_GUARD() leaves errp as is if it's not NULL or
   &error_fatal, this means that we don't break error_abort
   (we'll abort on error_set, not on error_propagate)

If we want to add some info to errp (by error_prepend() or
error_append_hint()), we must use the ERRP_GUARD() macro.
Otherwise, this info will not be added when errp == &error_fatal
(the program will exit prior to the error_append_hint() or
error_prepend() call).  No such cases are being fixed here.

This commit is generated by command

    sed -n '/^Parallel NOR Flash devices$/,/^$/{s/^F: //p}' \
        MAINTAINERS | \
    xargs git ls-files | grep '\.[hc]$' | \
    xargs spatch \
        --sp-file scripts/coccinelle/errp-guard.cocci \
        --macro-file scripts/cocci-macro-file.h \
        --in-place --no-show-diff --max-width 80

Reported-by: Kevin Wolf <kwolf@redhat.com>
Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[Commit message tweaked]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200707165037.1026246-5-armbru@redhat.com>
[ERRP_AUTO_PROPAGATE() renamed to ERRP_GUARD(), and
auto-propagated-errp.cocci to errp-guard.cocci.  Commit message
tweaked again.]
---
 hw/block/pflash_cfi01.c | 7 +++----
 hw/block/pflash_cfi02.c | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index cddc3a5a0c..8ab1d66310 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -696,12 +696,12 @@ static const MemoryRegionOps pflash_cfi01_ops = {
 
 static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
     uint64_t total_len;
     int ret;
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
-    Error *local_err = NULL;
 
     if (pfl->sector_len == 0) {
         error_setg(errp, "attribute \"sector-length\" not specified or zero.");
@@ -735,9 +735,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         &pfl->mem, OBJECT(dev),
         &pflash_cfi01_ops,
         pfl,
-        pfl->name, total_len, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+        pfl->name, total_len, errp);
+    if (*errp) {
         return;
     }
 
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index b40ce2335a..eb02fccfa5 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -724,9 +724,9 @@ static const MemoryRegionOps pflash_cfi02_ops = {
 
 static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     PFlashCFI02 *pfl = PFLASH_CFI02(dev);
     int ret;
-    Error *local_err = NULL;
 
     if (pfl->uniform_sector_len == 0 && pfl->sector_len[0] == 0) {
         error_setg(errp, "attribute \"sector-length\" not specified or zero.");
@@ -792,9 +792,8 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
                                   &pflash_cfi02_ops, pfl, pfl->name,
-                                  pfl->chip_len, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+                                  pfl->chip_len, errp);
+    if (*errp) {
         return;
     }
 
-- 
2.26.2


