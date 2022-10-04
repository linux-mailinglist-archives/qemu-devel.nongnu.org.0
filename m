Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686585F3FE4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:38:02 +0200 (CEST)
Received: from localhost ([::1]:47454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofeNE-0003LR-Tv
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeHl-0005KK-1W
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeHi-00052f-7k
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664875937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NzNom8J7jVkaET+ZhmUNxw57g0LK26fsGkBtMwcDM3Q=;
 b=fQxTSMrQnDSy8L+gSuQnzHZ9XWFF5aJWqhSXwTl9rew1qIfvff/Mrruo8vYDen/xWrpxYk
 lB+XSYfNrZfJZyI1yXOShHr2NzSiSJsEcsbGW24pKulr6N+XQqVFThERR/GVISp4wDzzQR
 MsP4f0vRf4aZdRz2Dp9VX3LlWjIl6ws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-eWUCtJCvNgemP2nfWTMo3A-1; Tue, 04 Oct 2022 05:32:13 -0400
X-MC-Unique: eWUCtJCvNgemP2nfWTMo3A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 517C7101CC62;
 Tue,  4 Oct 2022 09:32:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49910492B04;
 Tue,  4 Oct 2022 09:32:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/4] linux-user: drop conditionals for obsolete kernel header
 versions
Date: Tue,  4 Oct 2022 10:32:06 +0100
Message-Id: <20221004093206.652431-5-berrange@redhat.com>
In-Reply-To: <20221004093206.652431-1-berrange@redhat.com>
References: <20221004093206.652431-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given our newly enforced 4.18 baseline for the kernel headers version,
we can drop any conditional checks for older versions.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 linux-user/linux_loop.h    |  4 ----
 linux-user/syscall.c       | 14 ++------------
 tests/tcg/i386/test-i386.c | 10 +++-------
 3 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/linux-user/linux_loop.h b/linux-user/linux_loop.h
index f80b96f1ff..5a9e0edef2 100644
--- a/linux-user/linux_loop.h
+++ b/linux-user/linux_loop.h
@@ -31,10 +31,6 @@ enum {
 #include <asm/posix_types.h>	/* for __kernel_old_dev_t */
 #include <asm/types.h>		/* for __u64 */
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0) /* This is a guess.  */
-#define __kernel_old_dev_t __kernel_dev_t
-#endif
-
 /* Backwards compatibility version */
 struct loop_info {
 	int		   lo_number;		/* ioctl r/o */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f6a15df69d..377867907a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2540,16 +2540,12 @@ set_timeout:
         case NETLINK_DROP_MEMBERSHIP:
         case NETLINK_BROADCAST_ERROR:
         case NETLINK_NO_ENOBUFS:
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
         case NETLINK_LISTEN_ALL_NSID:
         case NETLINK_CAP_ACK:
-#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0) */
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
         case NETLINK_EXT_ACK:
-#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0) */
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)
         case NETLINK_GET_STRICT_CHK:
-#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0) */
+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0) */
             break;
         default:
             goto unimplemented;
@@ -2918,16 +2914,12 @@ get_timeout:
         case NETLINK_PKTINFO:
         case NETLINK_BROADCAST_ERROR:
         case NETLINK_NO_ENOBUFS:
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
         case NETLINK_LISTEN_ALL_NSID:
         case NETLINK_CAP_ACK:
-#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0) */
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
         case NETLINK_EXT_ACK:
-#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0) */
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0)
         case NETLINK_GET_STRICT_CHK:
-#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0) */
+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0) */
             if (get_user_u32(len, optlen)) {
                 return -TARGET_EFAULT;
             }
@@ -2944,7 +2936,6 @@ get_timeout:
                 return -TARGET_EFAULT;
             }
             break;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
         case NETLINK_LIST_MEMBERSHIPS:
         {
             uint32_t *results;
@@ -2975,7 +2966,6 @@ get_timeout:
             unlock_user(results, optval_addr, 0);
             break;
         }
-#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0) */
         default:
             goto unimplemented;
         }
diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index 864c4e620d..881b45cd19 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -1224,10 +1224,6 @@ static inline int modify_ldt(int func, void * ptr, unsigned long bytecount)
     return syscall(__NR_modify_ldt, func, ptr, bytecount);
 }
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 5, 66)
-#define modify_ldt_ldt_s user_desc
-#endif
-
 #define MK_SEL(n) (((n) << 3) | 7)
 
 uint8_t seg_data1[4096];
@@ -1265,7 +1261,7 @@ uint8_t seg_data2[4096];
 /* NOTE: we use Linux modify_ldt syscall */
 void test_segs(void)
 {
-    struct modify_ldt_ldt_s ldt;
+    struct user_desc ldt;
     long long ldt_table[3];
     int res, res2;
     char tmp;
@@ -1367,7 +1363,7 @@ extern char code16_func3;
 
 void test_code16(void)
 {
-    struct modify_ldt_ldt_s ldt;
+    struct user_desc ldt;
     int res, res2;
 
     /* build a code segment */
@@ -1774,7 +1770,7 @@ void test_exceptions(void)
     }
 
     {
-        struct modify_ldt_ldt_s ldt;
+        struct user_desc ldt;
         ldt.entry_number = 1;
         ldt.base_addr = (unsigned long)&seg_data1;
         ldt.limit = (sizeof(seg_data1) + 0xfff) >> 12;
-- 
2.37.3


