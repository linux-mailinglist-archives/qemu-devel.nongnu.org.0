Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1DC435E9E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:06:17 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdUxk-0003i3-V6
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdUtQ-0001gw-5f
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:01:48 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:62483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdUtN-0002mZ-57
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:01:47 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 2B8EE468EF;
 Thu, 21 Oct 2021 12:01:41 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v7 1/4] monitor/hmp: add support for flag argument with value
Date: Thu, 21 Oct 2021 12:01:32 +0200
Message-Id: <20211021100135.4146766-2-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021100135.4146766-1-s.reiter@proxmox.com>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
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

Adds support for the "-xV" parameter type, where "-x" denotes a flag
name and the "V" suffix indicates that this flag is supposed to take an
arbitrary string parameter.

These parameters are always optional, the entry in the qdict will be
omitted if the flag is not given.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---

v6:
It wasn't possible to pass the 'connected' parameter to set_password, since the
code to handle optional parameters couldn't live with a different param (not
starting with '-') coming up instead - fix that by advancing over the 'value
flag' modifier in case `*p != '-'`.

Also change the modifier to 'V' instead of 'S' so it can be distinguished from
an actual trailing 'S' type param.

Discovered in testing. I dropped Eric's R-b due to the code change.

 monitor/hmp.c              | 19 ++++++++++++++++++-
 monitor/monitor-internal.h |  3 ++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index d50c3124e1..899e0c990f 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -980,6 +980,7 @@ static QDict *monitor_parse_arguments(Monitor *mon,
             {
                 const char *tmp = p;
                 int skip_key = 0;
+                int ret;
                 /* option */
 
                 c = *typestr++;
@@ -1002,11 +1003,27 @@ static QDict *monitor_parse_arguments(Monitor *mon,
                     }
                     if (skip_key) {
                         p = tmp;
+                    } else if (*typestr == 'V') {
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
+                } else if (*typestr == 'V') {
+                    typestr++;
                 }
             }
             break;
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 9c3a09cb01..9e708b329d 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -63,7 +63,8 @@
  * '.'          other form of optional type (for 'i' and 'l')
  * 'b'          boolean
  *              user mode accepts "on" or "off"
- * '-'          optional parameter (eg. '-f')
+ * '-'          optional parameter (eg. '-f'); if followed by an 'V', it
+ *              specifies an optional string param (e.g. '-fV' allows '-f foo')
  *
  */
 
-- 
2.30.2



