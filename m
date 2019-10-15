Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A2CD6D8B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 05:17:13 +0200 (CEST)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKDKi-0007e8-O7
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 23:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iKDJ6-0006rB-CP
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 23:15:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iKDJ5-0006xe-CA
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 23:15:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:34173)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iKDJ3-0006Xv-3F; Mon, 14 Oct 2019 23:15:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 20:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,297,1566889200"; d="scan'208";a="207412350"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 14 Oct 2019 20:14:25 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: kwolf@redhat.com, mreitz@redhat.com, jasowang@redhat.com,
 alex.bennee@linaro.org, dgilbert@redhat.com, richard.henderson@linaro.org
Subject: [PATCH 2/2] core: replace sysconf(_SC_PAGESIZE) with
 qemu_real_host_page_size
Date: Tue, 15 Oct 2019 11:13:50 +0800
Message-Id: <20191015031350.4345-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015031350.4345-1-richardw.yang@linux.intel.com>
References: <20191015031350.4345-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Richard Henderson <richard.henderson@linaro.org>
---
 block/file-posix.c              | 2 +-
 net/l2tpv3.c                    | 2 +-
 tests/tcg/multiarch/test-mmap.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 5d1995a07c..853ed42134 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2562,7 +2562,7 @@ static void check_cache_dropped(BlockDriverState *bs, Error **errp)
     off_t end;
 
     /* mincore(2) page status information requires 1 byte per page */
-    page_size = sysconf(_SC_PAGESIZE);
+    page_size = qemu_real_host_page_size;
     vec = g_malloc(DIV_ROUND_UP(window_size, page_size));
 
     end = raw_getlength(bs);
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index 55fea17c0f..5f843240de 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -41,7 +41,7 @@
  * chosen to be sufficient to accommodate one packet with some headers
  */
 
-#define BUFFER_ALIGN sysconf(_SC_PAGESIZE)
+#define BUFFER_ALIGN qemu_real_host_page_size
 #define BUFFER_SIZE 2048
 #define IOVSIZE 2
 #define MAX_L2TPV3_MSGCNT 64
diff --git a/tests/tcg/multiarch/test-mmap.c b/tests/tcg/multiarch/test-mmap.c
index 9ea49e2307..370842e5c2 100644
--- a/tests/tcg/multiarch/test-mmap.c
+++ b/tests/tcg/multiarch/test-mmap.c
@@ -466,7 +466,7 @@ int main(int argc, char **argv)
     if (argc > 1) {
         qemu_strtoul(argv[1], NULL, 0, &pagesize);
     } else {
-        pagesize = sysconf(_SC_PAGESIZE);
+        pagesize = qemu_real_host_page_size;
     }
 
     /* Assume pagesize is a power of two.  */
-- 
2.17.1


