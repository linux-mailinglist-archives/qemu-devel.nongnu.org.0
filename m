Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFD16FE093
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:40:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkyz-0000Sv-Ul; Wed, 10 May 2023 10:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwkyv-0000CQ-GR
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwkys-00044C-Pu
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683729580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9hiUmnlH3IN5vtioxH+PDvNRJlU/W8IlSnnG8nCjRaY=;
 b=NVSHWS7awNwGWMnW+D7K97Ku3frIRv3qXJJZcgUtC+9OiPJmC23Kvmmg1n5KQHUBsN8AHt
 dlEb5OcfEeC2WA63eHOp+M1f+MuNqSW2TBrv8lYM4uQ6Odlh8viHn5U60Q934zhThWYq/k
 Q5pwZ1oHsqlCILc3PKYgeyNTe8PMyjY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-3ToN_oMnM16CvM8V3Tmusw-1; Wed, 10 May 2023 10:39:35 -0400
X-MC-Unique: 3ToN_oMnM16CvM8V3Tmusw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DA2A80269A;
 Wed, 10 May 2023 14:39:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C8C24078906;
 Wed, 10 May 2023 14:39:32 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC 2/3] linux-user: Drop uint and ulong
Date: Wed, 10 May 2023 16:39:24 +0200
Message-Id: <20230510143925.4094-3-quintela@redhat.com>
In-Reply-To: <20230510143925.4094-1-quintela@redhat.com>
References: <20230510143925.4094-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I know I am getting into trouble and into big depths, but there is any
reason why we can't use regular type names?

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 linux-user/mmap.c    | 2 +-
 linux-user/syscall.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 0aa8ae7356..51d40c77e4 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -859,7 +859,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
 
 static bool can_passthrough_madvise(abi_ulong start, abi_ulong end)
 {
-    ulong addr;
+    unsigned long addr;
 
     if ((start | end) & ~qemu_host_page_mask) {
         return false;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 69f740ff98..dd0349712b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -309,16 +309,16 @@ _syscall0(int, sys_gettid)
 #endif
 
 #if defined(TARGET_NR_getdents) && defined(EMULATE_GETDENTS_WITH_GETDENTS)
-_syscall3(int, sys_getdents, uint, fd, struct linux_dirent *, dirp, uint, count);
+_syscall3(int, sys_getdents, unsigned int, fd, struct linux_dirent *, dirp, unsigned int, count);
 #endif
 #if (defined(TARGET_NR_getdents) && \
       !defined(EMULATE_GETDENTS_WITH_GETDENTS)) || \
     (defined(TARGET_NR_getdents64) && defined(__NR_getdents64))
-_syscall3(int, sys_getdents64, uint, fd, struct linux_dirent64 *, dirp, uint, count);
+_syscall3(int, sys_getdents64, unsigned int, fd, struct linux_dirent64 *, dirp, unsigned int, count);
 #endif
 #if defined(TARGET_NR__llseek) && defined(__NR_llseek)
-_syscall5(int, _llseek,  uint,  fd, ulong, hi, ulong, lo,
-          loff_t *, res, uint, wh);
+_syscall5(int, _llseek,  unsigned int,  fd, unsigned long, hi, unsigned long, lo,
+          loff_t *, res, unsigned int, wh);
 #endif
 _syscall3(int, sys_rt_sigqueueinfo, pid_t, pid, int, sig, siginfo_t *, uinfo)
 _syscall4(int, sys_rt_tgsigqueueinfo, pid_t, pid, pid_t, tid, int, sig,
-- 
2.40.1


