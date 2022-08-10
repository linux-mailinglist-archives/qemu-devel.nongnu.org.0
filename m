Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA058ED22
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:26:58 +0200 (CEST)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLljd-0008EZ-DV
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLlH9-0000AP-JW
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:57:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLlH7-0000Zy-Fd
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660136248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmbpZNyavQxKDGbXfYJjxOfxf3liXSQeUKOUnbr0AeI=;
 b=f7i536CmvBzaPNlM3HsFi/NakVse7ASs7TFZ8oW3ENvxXYrJU4ei9s+zs29gKidvkNE/Xm
 nGQJKSfDcgiDKWC+3NObm0IMRKeFudMDHVoe0C3TElhJuXtpp58I3PWok6ybCn0RoAuSmr
 kGkIqMat2LQ+HyNtMHGDQwYtIWmBDYQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-RgecRYx4MKKWmBku0-HBPA-1; Wed, 10 Aug 2022 08:57:27 -0400
X-MC-Unique: RgecRYx4MKKWmBku0-HBPA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4255629ABA14;
 Wed, 10 Aug 2022 12:57:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 635EA40315F;
 Wed, 10 Aug 2022 12:57:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: [PATCH v2 1/3] backends/hostmem: Fix support of memory-backend-memfd
 in qemu_maxrampagesize()
Date: Wed, 10 Aug 2022 14:57:18 +0200
Message-Id: <20220810125720.3849835-2-thuth@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It is currently not possible yet to use "memory-backend-memfd" on s390x
with hugepages enabled. This problem is caused by qemu_maxrampagesize()
not taking memory-backend-memfd objects into account yet, so the code
in s390_memory_init() fails to enable the huge page support there via
s390_set_max_pagesize(). Fix it by generalizing the code, so that it
looks at qemu_ram_pagesize(memdev->mr.ram_block) instead of re-trying
to get the information from the filesystem.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2116496
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 backends/hostmem.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 624bb7ecd3..4428e06738 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -306,22 +306,12 @@ bool host_memory_backend_is_mapped(HostMemoryBackend *backend)
     return backend->is_mapped;
 }
 
-#ifdef __linux__
 size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
 {
-    Object *obj = OBJECT(memdev);
-    char *path = object_property_get_str(obj, "mem-path", NULL);
-    size_t pagesize = qemu_mempath_getpagesize(path);
-
-    g_free(path);
+    size_t pagesize = qemu_ram_pagesize(memdev->mr.ram_block);
+    g_assert(pagesize >= qemu_real_host_page_size());
     return pagesize;
 }
-#else
-size_t host_memory_backend_pagesize(HostMemoryBackend *memdev)
-{
-    return qemu_real_host_page_size();
-}
-#endif
 
 static void
 host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
-- 
2.31.1


