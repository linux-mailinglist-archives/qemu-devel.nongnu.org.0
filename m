Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A901CFC27
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 19:28:51 +0200 (CEST)
Received: from localhost ([::1]:53316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYYi2-0002lC-0E
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 13:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <masahiroy@kernel.org>)
 id 1jYYg4-00019v-TT
 for qemu-devel@nongnu.org; Tue, 12 May 2020 13:26:48 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:36044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <masahiroy@kernel.org>)
 id 1jYYg2-0002oh-Ri
 for qemu-devel@nongnu.org; Tue, 12 May 2020 13:26:48 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net
 [126.90.202.47]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id 04CHQHnS011056;
 Wed, 13 May 2020 02:26:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 04CHQHnS011056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1589304378;
 bh=B5Ws31Od3yEQ+rB7NQC//QdyGOxLlpdyU074Y3q+seM=;
 h=From:To:Cc:Subject:Date:From;
 b=aVmKAKh322M2sJ8MK0UX4dmE4kPmaZbW4PPkosRESxmydkoQnoV1cP4atZUNO7m1r
 JkY5q8g4z5v5jtHNK6XHIzgPWq85liZ5cZldiiZD9ZmKGAuEou7LWfMl24bej8bzQe
 8S4YvKCr49kLRKOBgezgMOGbeerDc9JoFgpWywdQ2g9T9G08/AbpLv7tu5xQz5ILoI
 7GfK7gumCMTKD+2LziYgVkTr0s5y5nxwVN/VgHo7IEhPVq2DWgfAJZCtcp48pkMit3
 iJ8npdXFgngCoRaSwMYa10o00bEILdiHs9CUXJxAKRXOhx+bTlhm20Nl/WADTdG4DJ
 1WzR/mTC4I05g==
X-Nifty-SrcIP: [126.90.202.47]
From: Masahiro Yamada <masahiroy@kernel.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] qom/object: factor out the initialization of hash table of
 properties
Date: Wed, 13 May 2020 02:26:15 +0900
Message-Id: <20200512172615.2291999-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=210.131.2.74;
 envelope-from=masahiroy@kernel.org; helo=conuserg-07.nifty.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 13:26:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_SOFTFAIL=0.665, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Properties are not related to the initialization of interfaces.

The initialization of the hash table can be moved after the if-block,
and unified.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 qom/object.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index a3ee968b12..e4085d8ae2 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -316,8 +316,6 @@ static void type_initialize(TypeImpl *ti)
         g_assert(parent->instance_size <= ti->instance_size);
         memcpy(ti->class, parent->class, parent->class_size);
         ti->class->interfaces = NULL;
-        ti->class->properties = g_hash_table_new_full(
-            g_str_hash, g_str_equal, NULL, object_property_free);
 
         for (e = parent->class->interfaces; e; e = e->next) {
             InterfaceClass *iface = e->data;
@@ -347,11 +345,11 @@ static void type_initialize(TypeImpl *ti)
 
             type_initialize_interface(ti, t, t);
         }
-    } else {
-        ti->class->properties = g_hash_table_new_full(
-            g_str_hash, g_str_equal, NULL, object_property_free);
     }
 
+    ti->class->properties = g_hash_table_new_full(g_str_hash, g_str_equal, NULL,
+                                                  object_property_free);
+
     ti->class->type = ti;
 
     while (parent) {
-- 
2.25.1


