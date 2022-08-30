Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F415A6B3A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 19:50:58 +0200 (CEST)
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT5O4-0001zX-Sg
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 13:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4uB-0006PI-J5
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4u9-0005iz-UW
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661880000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BItsyTMEsiA4TfG65uIPJGnDqTcblD2HJTtqcAX3ric=;
 b=ZhJXpL/B2IRxFlf/IgUTY6Fq2erM5yF6zvDu5s6MffKKCo8eMZMyFcJTrwSrtCNuRc1Bn9
 E9CU2hTRNA3J2uaAvW9xTR+NEVULC0tlWCj6NkhAMX8hMYS0Py1OSRMtbm77kFoIFMhmsN
 pbCfyxQEzz3bpUnbf3Nc/H6lGq2Ex5w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-WZ10aHX_Mayp5UJnFak9xw-1; Tue, 30 Aug 2022 13:19:59 -0400
X-MC-Unique: WZ10aHX_Mayp5UJnFak9xw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DC8C1C05EB4;
 Tue, 30 Aug 2022 17:19:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F22F21121314;
 Tue, 30 Aug 2022 17:19:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 5/6] softmmu/physmem: Remove the ifdef __linux__ around the
 pagesize functions
Date: Tue, 30 Aug 2022 19:19:46 +0200
Message-Id: <20220830171947.71464-6-thuth@redhat.com>
In-Reply-To: <20220830171947.71464-1-thuth@redhat.com>
References: <20220830171947.71464-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Now that host_memory_backend_pagesize() is not depending on the hugetlb
memory path handling anymore, we can also remove the #ifdef and the
TOCTTOU comment from the calling functions - the code should now work
equally well on all host architectures.

Message-Id: <20220810125720.3849835-3-thuth@redhat.com>
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Acked-by: David Hildenbrand <david@redhat.com>
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


