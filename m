Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAAD33D523
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:47:01 +0100 (CET)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMA2G-0002c4-CG
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lMA0e-0001nJ-RR
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:45:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lMA0X-0003zz-VP
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615902312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XmrJR1dbpW4ikAmC1sweS4Wvl0VfJaS1dCi0Au95l5Q=;
 b=MiWE0gkf148YXta+R7huVua2R2NTVT1pa69rD2fQNxWugJMpqay77Jf1gYEyFSa5KmFydO
 r4h6tV87uIDaht07dbEa83TKNWSgUPaYkrRXYTw6yV9RAKbFo5nR61aJdmv1pTudhbBo7M
 sxF3hHBVFPouaqLCWQA2ryqm0f79W8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-XTadwlzGMj2Mtqqeg0MGuw-1; Tue, 16 Mar 2021 09:45:10 -0400
X-MC-Unique: XTadwlzGMj2Mtqqeg0MGuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 786B380006E;
 Tue, 16 Mar 2021 13:45:09 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F10D19D61;
 Tue, 16 Mar 2021 13:45:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2] util: fix use-after-free in module_load_one
Date: Tue, 16 Mar 2021 17:44:56 +0400
Message-Id: <20210316134456.3243102-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-stable@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

g_hash_table_add always retains ownership of the pointer passed in as
the key. Its return status merely indicates whether the added entry was
new, or replaced an existing entry. Thus key must never be freed after
this method returns.

Spotted by ASAN:

==2407186==ERROR: AddressSanitizer: heap-use-after-free on address 0x6020003ac4f0 at pc 0x7ffff766659c bp 0x7fffffffd1d0 sp 0x7fffffffc980
READ of size 1 at 0x6020003ac4f0 thread T0
    #0 0x7ffff766659b  (/lib64/libasan.so.6+0x8a59b)
    #1 0x7ffff6bfa843 in g_str_equal ../glib/ghash.c:2303
    #2 0x7ffff6bf8167 in g_hash_table_lookup_node ../glib/ghash.c:493
    #3 0x7ffff6bf9b78 in g_hash_table_insert_internal ../glib/ghash.c:1598
    #4 0x7ffff6bf9c32 in g_hash_table_add ../glib/ghash.c:1689
    #5 0x5555596caad4 in module_load_one ../util/module.c:233
    #6 0x5555596ca949 in module_load_one ../util/module.c:225
    #7 0x5555596ca949 in module_load_one ../util/module.c:225
    #8 0x5555596cbdf4 in module_load_qom_all ../util/module.c:349

Typical C bug...

Fixes: 90629122d2e ("module: use g_hash_table_add()")
Cc: qemu-stable@nongnu.org
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index c65060c167..a2ab0bcdbc 100644
--- a/util/module.c
+++ b/util/module.c
@@ -230,10 +230,11 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
         }
     }
 
-    if (!g_hash_table_add(loaded_modules, module_name)) {
+    if (g_hash_table_contains(loaded_modules, module_name)) {
         g_free(module_name);
         return true;
     }
+    g_hash_table_add(loaded_modules, module_name);
 
     search_dir = getenv("QEMU_MODULE_DIR");
     if (search_dir != NULL) {
-- 
2.29.0


