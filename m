Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8006D2174C1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 19:09:19 +0200 (CEST)
Received: from localhost ([::1]:35002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsr5q-00073d-KQ
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 13:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsqoJ-0003qq-C4
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:51:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44067
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsqoH-0006jX-IX
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594140669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdaTtnXzRdmtkraOf3fJnKW205wPYgtaTPC/KbxTb9A=;
 b=TGr00+yTDXOHFHXzUUhSGVhWcNj6GObrm7dakTcvcESyWyB3neaHpXrUvmNOyv2sxTNi+Q
 WCdJXWI1ATaz0EE0NYBLlyP+zCgwqgEDj8vODY6Omrfo4brKN+sd4EYXY3Xpx4KwIo4gIs
 3g9nSZAc85Z+wmTCsjtstk/hhQDPzbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-CKUKUa5lMlaT6ynxi7hKYw-1; Tue, 07 Jul 2020 12:51:02 -0400
X-MC-Unique: CKUKUa5lMlaT6ynxi7hKYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5205D804001;
 Tue,  7 Jul 2020 16:51:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8857B512FE;
 Tue,  7 Jul 2020 16:50:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2D1D711326EC; Tue,  7 Jul 2020 18:50:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 5/8] fw_cfg: Use ERRP_AUTO_PROPAGATE()
Date: Tue,  7 Jul 2020 18:50:34 +0200
Message-Id: <20200707165037.1026246-6-armbru@redhat.com>
In-Reply-To: <20200707165037.1026246-1-armbru@redhat.com>
References: <20200707165037.1026246-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laszlo Ersek <lersek@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, groug@kaod.org,
 Max Reitz <mreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

If we want to add some info to errp (by error_prepend() or
error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
Otherwise, this info will not be added when errp == &error_fatal
(the program will exit prior to the error_append_hint() or
error_prepend() call).  Fix such cases.

If we want to check error after errp-function call, we need to
introduce local_err and then propagate it to errp. Instead, use
ERRP_AUTO_PROPAGATE macro, benefits are:
1. No need of explicit error_propagate call
2. No need of explicit local_err variable: use errp directly
3. ERRP_AUTO_PROPAGATE leaves errp as is if it's not NULL or
   &error_fatal, this means that we don't break error_abort
   (we'll abort on error_set, not on error_propagate)

This commit is generated by command

    sed -n '/^Firmware configuration (fw_cfg)$/,/^$/{s/^F: //p}' \
        MAINTAINERS | \
    xargs git ls-files | grep '\.[hc]$' | \
    xargs spatch \
        --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
        --macro-file scripts/cocci-macro-file.h \
        --in-place --no-show-diff --max-width 80

Reported-by: Kevin Wolf <kwolf@redhat.com>
Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[Commit message tweaked]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/nvram/fw_cfg.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 0408a31f8e..d5386c3235 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1231,12 +1231,11 @@ static Property fw_cfg_io_properties[] = {
 
 static void fw_cfg_io_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     FWCfgIoState *s = FW_CFG_IO(dev);
-    Error *local_err = NULL;
 
-    fw_cfg_file_slots_allocate(FW_CFG(s), &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    fw_cfg_file_slots_allocate(FW_CFG(s), errp);
+    if (*errp) {
         return;
     }
 
@@ -1282,14 +1281,13 @@ static Property fw_cfg_mem_properties[] = {
 
 static void fw_cfg_mem_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     FWCfgMemState *s = FW_CFG_MEM(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     const MemoryRegionOps *data_ops = &fw_cfg_data_mem_ops;
-    Error *local_err = NULL;
 
-    fw_cfg_file_slots_allocate(FW_CFG(s), &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    fw_cfg_file_slots_allocate(FW_CFG(s), errp);
+    if (*errp) {
         return;
     }
 
-- 
2.26.2


