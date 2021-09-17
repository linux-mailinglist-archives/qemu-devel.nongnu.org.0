Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5D40FA86
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:42:08 +0200 (CEST)
Received: from localhost ([::1]:53108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRF43-000741-BM
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREu5-0004BL-Eb
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREtz-0000Fc-LO
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2Ij97GHfzcmww4kyjaSrCVaCSnXX6FuAi778pp2OKQ=;
 b=ZeKEGc+8oUtZn06qLzeJJX31Vtu35+Gk42+4V5fYCBCgU0VMDean0JD9JOJl1peIVtAkM0
 8ydAnq0EnApNFsJ67aPHv3pkniUjKON0CfX7wJQ6mwwMdYXuguYAZcCOVQbhwKIoGjFWSs
 U7DNpBRQgVW+uI9V40YRkpAm3Rfekk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-8t8Ko7oKPoC7cw_oLaohiQ-1; Fri, 17 Sep 2021 10:31:41 -0400
X-MC-Unique: 8t8Ko7oKPoC7cw_oLaohiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACA0DBBEE7;
 Fri, 17 Sep 2021 14:31:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F14A60C25;
 Fri, 17 Sep 2021 14:31:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A749D1135A4D; Fri, 17 Sep 2021 16:31:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/23] test-clone-visitor: Correct an accidental rename
Date: Fri, 17 Sep 2021 16:31:34 +0200
Message-Id: <20210917143134.412106-24-armbru@redhat.com>
In-Reply-To: <20210917143134.412106-1-armbru@redhat.com>
References: <20210917143134.412106-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jsnow@redhat.com, michael.roth@amd.com, eblake@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit b359f4b203 "tests: Rename UserDefNativeListUnion to
UserDefListUnion" renamed test_clone_native_list() to
test_clone_list_union().  The function has nothing to do with unions.
Rename it to test_clone_list().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-clone-visitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-clone-visitor.c b/tests/unit/test-clone-visitor.c
index 4048018607..5d48e125b8 100644
--- a/tests/unit/test-clone-visitor.c
+++ b/tests/unit/test-clone-visitor.c
@@ -63,7 +63,7 @@ static void test_clone_alternate(void)
     qapi_free_AltEnumBool(s_dst);
 }
 
-static void test_clone_list_union(void)
+static void test_clone_list(void)
 {
     uint8List *src = NULL, *dst;
     uint8List *tmp = NULL;
@@ -203,7 +203,7 @@ int main(int argc, char **argv)
 
     g_test_add_func("/visitor/clone/struct", test_clone_struct);
     g_test_add_func("/visitor/clone/alternate", test_clone_alternate);
-    g_test_add_func("/visitor/clone/list_union", test_clone_list_union);
+    g_test_add_func("/visitor/clone/list", test_clone_list);
     g_test_add_func("/visitor/clone/empty", test_clone_empty);
     g_test_add_func("/visitor/clone/complex1", test_clone_complex1);
     g_test_add_func("/visitor/clone/complex2", test_clone_complex2);
-- 
2.31.1


