Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD471F6E94
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:14:35 +0200 (CEST)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTas-0002KY-2k
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8u-0007u8-R0
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:40 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40262
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8n-00010i-8X
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DTgJDuuIDwGebdq2tlxLGDaJzw2bFUqN/vNtfp59ni4=;
 b=HCkI4v32vW0AVmiLTJn57VLcmliQadEXQi+UyfL3XbqCgZHviXK4TIAZt2WuDyGRoMuHA9
 v9Ug7J8Ad9KKh7OAGQTGcf5AAFqYFgYn9ngEjsqEUqZcOYJaBAKDR0qgy82f3Y1+Tel1Mj
 m1HAxW5sTOERcfN6Fb7+e4T2aBCjYuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-wTJgzl4KPEqbItVk2jGkNg-1; Thu, 11 Jun 2020 15:45:28 -0400
X-MC-Unique: wTJgzl4KPEqbItVk2jGkNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45F22872FEC;
 Thu, 11 Jun 2020 19:45:27 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 014775C1B2;
 Thu, 11 Jun 2020 19:45:26 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 041/115] qom/object: factor out the initialization of hash
 table of properties
Date: Thu, 11 Jun 2020 15:43:35 -0400
Message-Id: <20200611194449.31468-42-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 14:57:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Masahiro Yamada <masahiroy@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Masahiro Yamada <masahiroy@kernel.org>

Properties are not related to the initialization of interfaces.

The initialization of the hash table can be moved after the if-block,
and unified.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Message-Id: <20200512172615.2291999-1-masahiroy@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index ea16680051..a4094a6bb5 100644
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
2.26.2



