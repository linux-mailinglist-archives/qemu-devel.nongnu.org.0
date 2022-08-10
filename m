Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053DA58ECC9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:09:46 +0200 (CEST)
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlSz-0000JD-3h
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLlHF-0000IS-D2
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:57:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLlHD-0000b9-Sb
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:57:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660136255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7FalK2RvLkWsOsYtdYaaTP3cQYbPtubc2HJwoCazis=;
 b=btXbxeZ2UzX+OqxH9rHEs98+/asABvnu+pqw6UR72w8/xGQeD1LZ4rUuN5/jbvj91mKVCh
 hxPBFsEr3s9v4OGMm7sfy30zmdxtOdMW6muAO8Ursm1/uLKjcPaIqbNHabyoTf7Zanvbkb
 zo6OAAwEWfIl+iE3a1PztqUZ+iThGlw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-_M-cUURrN22KzFXES5PKIw-1; Wed, 10 Aug 2022 08:57:29 -0400
X-MC-Unique: _M-cUURrN22KzFXES5PKIw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 502FE1019C93;
 Wed, 10 Aug 2022 12:57:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 998F5492C3B;
 Wed, 10 Aug 2022 12:57:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: [PATCH v2 2/3] softmmu/physmem: Remove the ifdef __linux__ around the
 pagesize functions
Date: Wed, 10 Aug 2022 14:57:19 +0200
Message-Id: <20220810125720.3849835-3-thuth@redhat.com>
In-Reply-To: <20220810125720.3849835-1-thuth@redhat.com>
References: <20220810125720.3849835-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that host_memory_backend_pagesize() is not depending on the hugetlb
memory path handling anymore, we can also remove the #ifdef and the
TOCTTOU comment from the calling functions - the code should now work
equally well on all host architectures.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/physmem.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dc3c3e5f2e..50231bab30 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1331,13 +1331,6 @@ GString *ram_block_format(void)
     return buf;
 }
 
-#ifdef __linux__
-/*
- * FIXME TOCTTOU: this iterates over memory backends' mem-path, which
- * may or may not name the same files / on the same filesystem now as
- * when we actually open and map them.  Iterate over the file
- * descriptors instead, and use qemu_fd_getpagesize().
- */
 static int find_min_backend_pagesize(Object *obj, void *opaque)
 {
     long *hpsize_min = opaque;
@@ -1391,16 +1384,6 @@ long qemu_maxrampagesize(void)
     object_child_foreach(memdev_root, find_max_backend_pagesize, &pagesize);
     return pagesize;
 }
-#else
-long qemu_minrampagesize(void)
-{
-    return qemu_real_host_page_size();
-}
-long qemu_maxrampagesize(void)
-{
-    return qemu_real_host_page_size();
-}
-#endif
 
 #ifdef CONFIG_POSIX
 static int64_t get_file_size(int fd)
-- 
2.31.1


