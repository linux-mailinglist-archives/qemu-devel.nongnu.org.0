Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B14F2F142F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:22:05 +0100 (CET)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyx92-00008W-9p
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kyx6o-0007Ns-AI
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:19:46 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kyx6m-0004wf-7M
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:19:46 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DDvRJ2xjFzj4lV;
 Mon, 11 Jan 2021 21:18:36 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Mon, 11 Jan 2021 21:19:14 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] vnc: fix unfinalized tlscreds for VncDisplay
Date: Mon, 11 Jan 2021 21:19:11 +0800
Message-ID: <20210111131911.805-1-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=changzihao1@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: oscar.zhangbo@huawei.com, changzihao1@huawei.com, armbru@redhat.com,
 xiexiangyou@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In vnc_display_open(), if tls-creds is enabled, do object_ref(object
ref 1->2) for tls-creds. While in vnc_display_close(), object_unparent
sets object ref to 1(2->1) and  unparent the object for root.
Problem:
1. the object can not be found from the objects_root, while the object
is not finalized.
2. the qemu_opts of tls-creds(id: creds0) is not deleted, so new tls
object with the same id(creds0) can not be delete & add.

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
---
 ui/vnc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 7452ac7df2..69e92b1ef3 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3234,7 +3234,7 @@ static void vnc_display_close(VncDisplay *vd)
     vd->auth = VNC_AUTH_INVALID;
     vd->subauth = VNC_AUTH_INVALID;
     if (vd->tlscreds) {
-        object_unparent(OBJECT(vd->tlscreds));
+        object_unref(OBJECT(vd->tlscreds));
         vd->tlscreds = NULL;
     }
     if (vd->tlsauthz) {
-- 
2.23.0


