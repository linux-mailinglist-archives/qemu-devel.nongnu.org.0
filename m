Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829B74C41F1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:05:55 +0100 (CET)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXU2-00087q-6X
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:05:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nNWIa-0008QH-If
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:50:00 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:53096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nNWIY-0007aO-8z
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:50:00 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 45BD740B5F;
 Fri, 25 Feb 2022 09:49:55 +0100 (CET)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 1/3] monitor/hmp: add support for flag argument with value
Date: Fri, 25 Feb 2022 09:49:47 +0100
Message-Id: <20220225084949.35746-2-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225084949.35746-1-f.ebner@proxmox.com>
References: <20220225084949.35746-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, dgilbert@redhat.com,
 armbru@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

Adds support for the "-xs" parameter type, where "-x" denotes a flag
name and the "s" suffix indicates that this flag is supposed to take
an arbitrary string parameter.

These parameters are always optional, the entry in the qdict will be
omitted if the flag is not given.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
[FE: fixed typo pointed out by Eric Blake
     use s instead of V to indicate string parameter]
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---

v8 -> v9:
* Use s rather than V to indicate that the flag takes a value.

 monitor/hmp.c              | 19 ++++++++++++++++++-
 monitor/monitor-internal.h |  3 ++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index b20737e63c..569066036d 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -981,6 +981,7 @@ static QDict *monitor_parse_arguments(Monitor *mon,
             {
                 const char *tmp = p;
                 int skip_key = 0;
+                int ret;
                 /* option */
 
                 c = *typestr++;
@@ -1003,11 +1004,27 @@ static QDict *monitor_parse_arguments(Monitor *mon,
                     }
                     if (skip_key) {
                         p = tmp;
+                    } else if (*typestr == 's') {
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
+                } else if (*typestr == 's') {
+                    typestr++;
                 }
             }
             break;
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 3da3f86c6a..caa2e90ef2 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -63,7 +63,8 @@
  * '.'          other form of optional type (for 'i' and 'l')
  * 'b'          boolean
  *              user mode accepts "on" or "off"
- * '-'          optional parameter (eg. '-f')
+ * '-'          optional parameter (eg. '-f'); if followed by a 's', it
+ *              specifies an optional string param (e.g. '-fs' allows '-f foo')
  *
  */
 
-- 
2.30.2



