Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E9433C75
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:36:37 +0200 (CEST)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcs6M-0007Y6-O2
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mcrSH-00042R-U8
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:55:09 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:50751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mcrSE-0002KU-6l
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:55:09 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 0F2CF46908;
 Tue, 19 Oct 2021 17:54:55 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v5 1/4] monitor/hmp: add support for flag argument with value
Date: Tue, 19 Oct 2021 17:54:40 +0200
Message-Id: <20211019155443.1447372-2-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019155443.1447372-1-s.reiter@proxmox.com>
References: <20211019155443.1447372-1-s.reiter@proxmox.com>
MIME-Version: 1.0
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

Adds support for the "-xS" parameter type, where "-x" denotes a flag
name and the "S" suffix indicates that this flag is supposed to take an
arbitrary string parameter.

These parameters are always optional, the entry in the qdict will be
omitted if the flag is not given.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 monitor/hmp.c              | 17 ++++++++++++++++-
 monitor/monitor-internal.h |  3 ++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index d50c3124e1..a32dce7a35 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -980,6 +980,7 @@ static QDict *monitor_parse_arguments(Monitor *mon,
             {
                 const char *tmp = p;
                 int skip_key = 0;
+                int ret;
                 /* option */
 
                 c = *typestr++;
@@ -1002,8 +1003,22 @@ static QDict *monitor_parse_arguments(Monitor *mon,
                     }
                     if (skip_key) {
                         p = tmp;
+                    } else if (*typestr == 'S') {
+                        /* has option with string value */
+                        typestr++;
+                        tmp = p++;
+                        while (qemu_isspace(*p)) {
+                            p++;
+                        }
+                        ret = get_str(buf, sizeof(buf), &p);
+                        if (ret < 0) {
+                            monitor_printf(mon, "%s: value expected for -%c\n",
+                                           cmd->name, *tmp);
+                            goto fail;
+                        }
+                        qdict_put_str(qdict, key, buf);
                     } else {
-                        /* has option */
+                        /* has boolean option */
                         p++;
                         qdict_put_bool(qdict, key, true);
                     }
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 9c3a09cb01..c848ba5bcf 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -63,7 +63,8 @@
  * '.'          other form of optional type (for 'i' and 'l')
  * 'b'          boolean
  *              user mode accepts "on" or "off"
- * '-'          optional parameter (eg. '-f')
+ * '-'          optional parameter (eg. '-f'); if followed by an 'S', it
+ *              specifies an optional string param (e.g. '-fS' allows '-f foo')
  *
  */
 
-- 
2.30.2



