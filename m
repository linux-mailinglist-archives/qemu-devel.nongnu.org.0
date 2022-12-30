Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC1B659973
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 15:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBGeO-0003h0-00; Fri, 30 Dec 2022 09:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dengpc12@chinatelecom.cn>)
 id 1pBBpH-0000Q0-P0
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 04:37:19 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dengpc12@chinatelecom.cn>) id 1pBBpF-0000zH-FM
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 04:37:19 -0500
HMM_SOURCE_IP: 172.18.0.188:50172.2056949848
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.221.141.170 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 1F878280094;
 Fri, 30 Dec 2022 17:28:10 +0800 (CST)
X-189-SAVE-TO-SEND: +dengpc12@chinatelecom.cn
Received: from  ([171.221.141.170])
 by app0023 with ESMTP id 1114d16433494f348e07b60204d608ee for
 qemu-devel@nongnu.org; Fri, 30 Dec 2022 17:28:12 CST
X-Transaction-ID: 1114d16433494f348e07b60204d608ee
X-Real-From: dengpc12@chinatelecom.cn
X-Receive-IP: 171.221.141.170
X-MEDUSA-Status: 0
From: dengpc12@chinatelecom.cn
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, huangy81@chinatelecom.cn,
 liuym16@chinatelecom.cn, kraxel@redhat.com,
 "dengpc12@chinatelecom.cn" <dengpc12@chinatelecom.cn>
Subject: [PATCH RFC 1/4] vdagent: fix memory leak when vdagent_disconnect is
 called
Date: Fri, 30 Dec 2022 17:27:55 +0800
Message-Id: <20221230092758.281805-2-dengpc12@chinatelecom.cn>
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

Memory free should be done in vdagent_disconnect using
qemu_input_handler_unregister, replace qemu_input_handler_deactivate
with that.

Signed-off-by: dengpc12@chinatelecom.cn <dengpc12@chinatelecom.cn>
Signed-off-by: liuym16@chinatelecom.cn <liuym16@chinatelecom.cn>
---
 ui/vdagent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 4bf50f0c4d..645383b4ec 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -863,7 +863,7 @@ static void vdagent_disconnect(VDAgentChardev *vd)
     vdagent_reset_bufs(vd);
     vd->caps = 0;
     if (vd->mouse_hs) {
-        qemu_input_handler_deactivate(vd->mouse_hs);
+        qemu_input_handler_unregister(vd->mouse_hs);
     }
     if (vd->cbpeer.notifier.notify) {
         qemu_clipboard_peer_unregister(&vd->cbpeer);
-- 
2.27.0


