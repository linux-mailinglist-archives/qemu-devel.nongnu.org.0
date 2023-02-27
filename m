Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B866A40C9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWboE-0005Xy-5h; Mon, 27 Feb 2023 06:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboB-0005W2-Uk
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboA-0005g9-7m
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCSd52Fbr0D7r676adp3wM+pVSJrvc7Kl8d9UhYqqXU=;
 b=BQMXRWU8wpTTgXG17rdtZz5yYJvfjWt8xmvf5b24KUUxHDlceBWJs1PXSqxvTUDb/P/Lw1
 BvsJ421sL8vC32gbi4UXDpz2Zn8vHWA27dfptjjiUQSdfRd9wtrmY7lxioGwRkRCUeRXv4
 1vMknjyOy91gzwoHJZXyff1y+Ru+9Yw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-SAO2k0WjNwKSZhZOq0aZ0w-1; Mon, 27 Feb 2023 06:36:38 -0500
X-MC-Unique: SAO2k0WjNwKSZhZOq0aZ0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0328F95D60A;
 Mon, 27 Feb 2023 11:36:38 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B0E11121314;
 Mon, 27 Feb 2023 11:36:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 12/33] target/s390x: Use void* for haddr in S390Access
Date: Mon, 27 Feb 2023 12:36:00 +0100
Message-Id: <20230227113621.58468-13-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

The interface from probe_access_flags is void*, and matching
that will be helpful.  We already rely on the gcc extension
for byte arithmetic on void*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230109201856.3916639-4-richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/mem_helper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 28bf3bd53c..4d157ba9cf 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -114,8 +114,8 @@ static inline void cpu_stsize_data_ra(CPUS390XState *env, uint64_t addr,
 typedef struct S390Access {
     target_ulong vaddr1;
     target_ulong vaddr2;
-    char *haddr1;
-    char *haddr2;
+    void *haddr1;
+    void *haddr2;
     uint16_t size1;
     uint16_t size2;
     /*
@@ -268,8 +268,9 @@ static void access_memset(CPUS390XState *env, S390Access *desta,
                      desta->mmu_idx, ra);
 }
 
-static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
-                                  int offset, int mmu_idx, uintptr_t ra)
+static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr,
+                                  void **haddr, int offset,
+                                  int mmu_idx, uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
     return ldub_p(*haddr + offset);
@@ -301,7 +302,7 @@ static uint8_t access_get_byte(CPUS390XState *env, S390Access *access,
                               offset - access->size1, access->mmu_idx, ra);
 }
 
-static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
+static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, void **haddr,
                                int offset, uint8_t byte, int mmu_idx,
                                uintptr_t ra)
 {
-- 
2.31.1


