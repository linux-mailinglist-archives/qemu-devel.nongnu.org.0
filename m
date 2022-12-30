Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB367659974
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 15:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBGeU-0003jr-2L; Fri, 30 Dec 2022 09:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dengpc12@chinatelecom.cn>)
 id 1pBBpH-0000Q1-PJ
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 04:37:19 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dengpc12@chinatelecom.cn>) id 1pBBpF-0000zI-FJ
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 04:37:19 -0500
HMM_SOURCE_IP: 172.18.0.188:50172.2056949848
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.221.141.170 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 57CE12800B6;
 Fri, 30 Dec 2022 17:28:16 +0800 (CST)
X-189-SAVE-TO-SEND: +dengpc12@chinatelecom.cn
Received: from  ([171.221.141.170])
 by app0023 with ESMTP id 7075f3dd428d45fea751d59a434975a7 for
 qemu-devel@nongnu.org; Fri, 30 Dec 2022 17:28:19 CST
X-Transaction-ID: 7075f3dd428d45fea751d59a434975a7
X-Real-From: dengpc12@chinatelecom.cn
X-Receive-IP: 171.221.141.170
X-MEDUSA-Status: 0
From: dengpc12@chinatelecom.cn
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, huangy81@chinatelecom.cn,
 liuym16@chinatelecom.cn, kraxel@redhat.com,
 "dengpc12@chinatelecom.cn" <dengpc12@chinatelecom.cn>
Subject: [PATCH RFC 4/4] vdagent: remove migration blocker
Date: Fri, 30 Dec 2022 17:27:58 +0800
Message-Id: <20221230092758.281805-5-dengpc12@chinatelecom.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221230092758.281805-1-dengpc12@chinatelecom.cn>
References: <20221230092758.281805-1-dengpc12@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=dengpc12@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 30 Dec 2022 09:46:08 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "dengpc12@chinatelecom.cn" <dengpc12@chinatelecom.cn>

Now that migration already be supported, so remove the blocker.

Signed-off-by: dengpc12@chinatelecom.cn <dengpc12@chinatelecom.cn>
Signed-off-by: liuym16@chinatelecom.cn <liuym16@chinatelecom.cn>
---
 ui/vdagent.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 1193abe348..f0a7fd5093 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -5,7 +5,6 @@
 #include "qemu/option.h"
 #include "qemu/units.h"
 #include "hw/qdev-core.h"
-#include "migration/blocker.h"
 #include "migration/vmstate.h"
 #include "ui/clipboard.h"
 #include "ui/console.h"
@@ -32,9 +31,6 @@
 struct VDAgentChardev {
     Chardev parent;
 
-    /* TODO: migration isn't yet supported */
-    Error *migration_blocker;
-
     /* config */
     bool mouse;
     bool clipboard;
@@ -675,10 +671,6 @@ static void vdagent_chr_open(Chardev *chr,
     return;
 #endif
 
-    if (migrate_add_blocker(vd->migration_blocker, errp) != 0) {
-        return;
-    }
-
     vd->mouse = VDAGENT_MOUSE_DEFAULT;
     if (cfg->has_mouse) {
         vd->mouse = cfg->mouse;
@@ -950,18 +942,14 @@ static void vdagent_chr_init(Object *obj)
     buffer_init(&vd->outbuf, "vdagent-outbuf");
 
     vmstate_register(NULL, 0, &vmstate_vdagent, vd);
-    error_setg(&vd->migration_blocker,
-               "The vdagent chardev doesn't yet support migration");
 }
 
 static void vdagent_chr_fini(Object *obj)
 {
     VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(obj);
 
-    migrate_del_blocker(vd->migration_blocker);
     vdagent_disconnect(vd);
     buffer_free(&vd->outbuf);
-    error_free(vd->migration_blocker);
 }
 
 static const TypeInfo vdagent_chr_type_info = {
-- 
2.27.0


