Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F0C3FDECE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:38:32 +0200 (CEST)
Received: from localhost ([::1]:43914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSJr-000584-Ln
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mLS0i-0007dd-KX
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:45 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:18542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mLS0e-0004j7-NV
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:44 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 9AAE24449E;
 Wed,  1 Sep 2021 17:18:29 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v2 1/3] monitor/hmp: correctly invert password argument
 detection again
Date: Wed,  1 Sep 2021 17:17:46 +0200
Message-Id: <20210901151748.1712048-2-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901151748.1712048-1-s.reiter@proxmox.com>
References: <20210901151748.1712048-1-s.reiter@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cfb5387a1d 'hmp: remove "change vnc TARGET" command' claims to
remove the HMP "change vnc" command, but doesn't actually do that.
Instead it rewires it to use 'qmp_change_vnc_password', and in the
process inverts the argument detection - ignoring the first issue, this
inversion is wrong, as this will now ask the user for a password if one
is already provided, and simply fail if none is given.

Fixes: cfb5387a1d ("hmp: remove "change vnc TARGET" command")
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e00255f7ee..a7e197a90b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1496,7 +1496,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
         }
         if (strcmp(target, "passwd") == 0 ||
             strcmp(target, "password") == 0) {
-            if (arg) {
+            if (!arg) {
                 MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
                 monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
                 return;
-- 
2.30.2



