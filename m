Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8731CC60A
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 03:34:00 +0200 (CEST)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXaqt-0000Zr-5O
	for lists+qemu-devel@lfdr.de; Sat, 09 May 2020 21:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <masahiroy@kernel.org>)
 id 1jXaq7-0008K9-NX
 for qemu-devel@nongnu.org; Sat, 09 May 2020 21:33:11 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:47399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <masahiroy@kernel.org>)
 id 1jXaq5-0001Ir-Me
 for qemu-devel@nongnu.org; Sat, 09 May 2020 21:33:11 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net
 [126.90.202.47]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id 04A1WcoN012946;
 Sun, 10 May 2020 10:32:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 04A1WcoN012946
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1589074358;
 bh=KbpFI1jAE6OftW1TG+fD7c5LM9KgQP75oygUNcgET2w=;
 h=From:To:Cc:Subject:Date:From;
 b=H4MdutyzKaK6veMO4/4OQeYJOJyD9S4mvwGFLA6AOGkEa0GJ8+jP2ziwxm2zIJRwc
 AtLfojoCziDZxpyJxNBFspirc9uICNLvmiIV2wdzwJ+fwrEuBYvLn11Vo/QN28GwpG
 c0Ejjd6RWFG/J+jSTGxmNpCkYeC8ZuDqc64kQPfNJM8y98N6g671eoKRb/g379n5qG
 1I1IYspA55YFzXC02+x48FGEl8i2C/2m8yNdxhzTOEdmCmPgszhYhX5q7ZQWnN1QnE
 UiLzGb/6sxut5TIvihBrYuIPL1vsI6RwJzl8DnIZOxVoAF7Ctv3Az+jBA5JE5dwDL+
 Nr4PYZvH5aThQ==
X-Nifty-SrcIP: [126.90.202.47]
From: Masahiro Yamada <masahiroy@kernel.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] qom: remove index from object_resolve_abs_path()
Date: Sun, 10 May 2020 10:32:35 +0900
Message-Id: <20200510013235.954906-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=210.131.2.74;
 envelope-from=masahiroy@kernel.org; helo=conuserg-07.nifty.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/09 21:33:05
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_SOFTFAIL=0.665,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Masahiro Yamada <masahiroy@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You can advance 'parts' to track the current path fragment.
The 'index' parameter is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 qom/object.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index aa8a3f24e6..a3ee968b12 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -2012,25 +2012,24 @@ Object *object_resolve_path_component(Object *parent, const gchar *part)
 
 static Object *object_resolve_abs_path(Object *parent,
                                           gchar **parts,
-                                          const char *typename,
-                                          int index)
+                                          const char *typename)
 {
     Object *child;
 
-    if (parts[index] == NULL) {
+    if (*parts == NULL) {
         return object_dynamic_cast(parent, typename);
     }
 
-    if (strcmp(parts[index], "") == 0) {
-        return object_resolve_abs_path(parent, parts, typename, index + 1);
+    if (strcmp(*parts, "") == 0) {
+        return object_resolve_abs_path(parent, parts + 1, typename);
     }
 
-    child = object_resolve_path_component(parent, parts[index]);
+    child = object_resolve_path_component(parent, *parts);
     if (!child) {
         return NULL;
     }
 
-    return object_resolve_abs_path(child, parts, typename, index + 1);
+    return object_resolve_abs_path(child, parts + 1, typename);
 }
 
 static Object *object_resolve_partial_path(Object *parent,
@@ -2042,7 +2041,7 @@ static Object *object_resolve_partial_path(Object *parent,
     GHashTableIter iter;
     ObjectProperty *prop;
 
-    obj = object_resolve_abs_path(parent, parts, typename, 0);
+    obj = object_resolve_abs_path(parent, parts, typename);
 
     g_hash_table_iter_init(&iter, parent->properties);
     while (g_hash_table_iter_next(&iter, NULL, (gpointer *)&prop)) {
@@ -2087,7 +2086,7 @@ Object *object_resolve_path_type(const char *path, const char *typename,
             *ambiguousp = ambiguous;
         }
     } else {
-        obj = object_resolve_abs_path(object_get_root(), parts, typename, 1);
+        obj = object_resolve_abs_path(object_get_root(), parts + 1, typename);
     }
 
     g_strfreev(parts);
-- 
2.25.1


