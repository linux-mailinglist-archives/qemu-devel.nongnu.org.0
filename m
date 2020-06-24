Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2031A206F28
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 10:44:59 +0200 (CEST)
Received: from localhost ([::1]:36690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo11e-0005CB-4l
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 04:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0uk-0000hD-Od
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:37:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58690
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0uh-00025c-1y
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592987866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=As3JZoFtAhiSaGSopnIMBYeiN2lsvdg3Az/2QnJSpVs=;
 b=V5rG2NOcmfGLHmHPzJsGT4bo2vpebNHXSH0WmhivuBuRi4i/q9FZFKq3Xoxy/1LBwXbHZA
 HmDp6hxb6ESYBKhQrLdh/ccHdJs08PEfi/qclq8lAkqJqYCWLTCsJKwa4JUFTF8TFq6bSt
 j1SCY5+Ku+9cWrWUphtwQyEqxKvZThY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-ssTdKHTqOxW1LWaEg4rhPQ-1; Wed, 24 Jun 2020 04:37:42 -0400
X-MC-Unique: ssTdKHTqOxW1LWaEg4rhPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B216AEC1A1;
 Wed, 24 Jun 2020 08:37:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56A2C5D9C5;
 Wed, 24 Jun 2020 08:37:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 996221138477; Wed, 24 Jun 2020 10:37:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/25] sd/milkymist-memcard: Plug minor memory leak in
 realize
Date: Wed, 24 Jun 2020 10:37:21 +0200
Message-Id: <20200624083737.3086768-10-armbru@redhat.com>
In-Reply-To: <20200624083737.3086768-1-armbru@redhat.com>
References: <20200624083737.3086768-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

milkymist_memcard_realize() leaks an Error object when realization of
its "sd-card" device fails.  Quite harmless, since we only ever
realize this once, in milkymist_init() via milkymist_memcard_create().

Plug the leak.

Fixes: 3d0369ba499866cc6a839f71212d97876500762d
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/sd/milkymist-memcard.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 482e97191e..afdb8aa0c0 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -280,9 +280,8 @@ static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
     blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
     carddev = qdev_new(TYPE_SD_CARD);
     qdev_prop_set_drive(carddev, "drive", blk);
-    qdev_realize_and_unref(carddev, BUS(&s->sdbus), &err);
-    if (err) {
-        error_setg(errp, "failed to init SD card: %s", error_get_pretty(err));
+    if (!qdev_realize_and_unref(carddev, BUS(&s->sdbus), &err)) {
+        error_propagate_prepend(errp, err, "failed to init SD card: %s");
         return;
     }
     s->enabled = blk && blk_is_inserted(blk);
-- 
2.26.2


