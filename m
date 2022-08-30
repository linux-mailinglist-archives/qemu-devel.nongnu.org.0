Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836F25A6B50
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 19:53:46 +0200 (CEST)
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT5Qn-0005II-6e
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 13:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4uC-0006Pi-S7
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4uB-0005jM-5k
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661880001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8h79wOHIduyozIw5k3sBr2NCR28mUsun9GVxHQ/fUo=;
 b=MGNKcFdrOEpxaAUpRU572t2fYL8QeK3pMGphfzgDfz46PguwAg0Gbty/D2xgXQ1POuPNua
 3PiGjwo/eM3O4lUoy9Pg9QF3ia0j+t4Ln05WKPWQFiQrJ7A6tZlZnFX57cYtkk6F8X70RH
 Kg5UlAEodZdY3wEhPmiKVekVOYucHeU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-38HAFJEEPoabkS8XcKq8EQ-1; Tue, 30 Aug 2022 13:19:58 -0400
X-MC-Unique: 38HAFJEEPoabkS8XcKq8EQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4C38803916;
 Tue, 30 Aug 2022 17:19:57 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70A411121314;
 Tue, 30 Aug 2022 17:19:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 4/6] backends/hostmem: Fix support of memory-backend-memfd in
 qemu_maxrampagesize()
Date: Tue, 30 Aug 2022 19:19:45 +0200
Message-Id: <20220830171947.71464-5-thuth@redhat.com>
In-Reply-To: <20220830171947.71464-1-thuth@redhat.com>
References: <20220830171947.71464-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Suggested-by: David Hildenbrand <david@redhat.com>
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2116496
Message-Id: <20220810125720.3849835-2-thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
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


