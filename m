Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735115681BD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:37:51 +0200 (CEST)
Received: from localhost ([::1]:33502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90Xd-0005Kk-Qt
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90KU-0005Uz-8h
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:14 -0400
Received: from mga05.intel.com ([192.55.52.43]:23332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90KQ-0000Hs-Si
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657095850; x=1688631850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kJl1R88jMUFb5Y8ov4QxxubYj5SsjR8PCdbcDnNsdhM=;
 b=RDR2xMMhRcwUrPKW1pg0ymEV4CHGX4YPZCV5Qk9JexzUivIZovSN5j+2
 0rynbCBqP89Pkr7AilEWzinNeAOqOu9HrUdCMdDElOKhxIfEwbFju8gGv
 mnK3e+fndbwXnXSO6Qqxswn4ooSA+bIQuGy1+WYwNcvZGvY/crDxjbb0C
 JG7wI5XsF6g/aAo1rv8JnenP5uSrI/Toer05wSpxw3sSEEaPFPyaZFxeM
 CzwwGUik7R1sjtuxss9CEM0A+LiatANtdv6h2xQxfZtKQYT+OGcsPQXZU
 Ug7/IZi4PiwpWax4iXQTVaMWgIxhIWez8IH2vQwobCacwD/KHgTCsLMkE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="369999427"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="369999427"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="567967851"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga006.jf.intel.com with ESMTP; 06 Jul 2022 01:23:57 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 02/14] selftests/memfd: Add tests for F_SEAL_AUTO_ALLOCATE
Date: Wed,  6 Jul 2022 16:20:04 +0800
Message-Id: <20220706082016.2603916-3-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Add tests to verify sealing memfds with the F_SEAL_AUTO_ALLOCATE works
as expected.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 tools/testing/selftests/memfd/memfd_test.c | 166 +++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index 94df2692e6e4..b849ece295fd 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -9,6 +9,7 @@
 #include <fcntl.h>
 #include <linux/memfd.h>
 #include <sched.h>
+#include <setjmp.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <signal.h>
@@ -232,6 +233,31 @@ static void mfd_fail_open(int fd, int flags, mode_t mode)
 	}
 }
 
+static void mfd_assert_fallocate(int fd)
+{
+	int r;
+
+	r = fallocate(fd, 0, 0, mfd_def_size);
+	if (r < 0) {
+		printf("fallocate(ALLOC) failed: %m\n");
+		abort();
+	}
+}
+
+static void mfd_assert_punch_hole(int fd)
+{
+	int r;
+
+	r = fallocate(fd,
+		      FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+		      0,
+		      mfd_def_size);
+	if (r < 0) {
+		printf("fallocate(PUNCH_HOLE) failed: %m\n");
+		abort();
+	}
+}
+
 static void mfd_assert_read(int fd)
 {
 	char buf[16];
@@ -594,6 +620,94 @@ static void mfd_fail_grow_write(int fd)
 	}
 }
 
+static void mfd_assert_hole_write(int fd)
+{
+	ssize_t l;
+	void *p;
+	char *p1;
+
+	/*
+	 * huegtlbfs does not support write, but we want to
+	 * verify everything else here.
+	 */
+	if (!hugetlbfs_test) {
+		/* verify direct write() succeeds */
+		l = write(fd, "\0\0\0\0", 4);
+		if (l != 4) {
+			printf("write() failed: %m\n");
+			abort();
+		}
+	}
+
+	/* verify mmaped write succeeds */
+	p = mmap(NULL,
+		 mfd_def_size,
+		 PROT_READ | PROT_WRITE,
+		 MAP_SHARED,
+		 fd,
+		 0);
+	if (p == MAP_FAILED) {
+		printf("mmap() failed: %m\n");
+		abort();
+	}
+	p1 = (char *)p + mfd_def_size - 1;
+	*p1 = 'H';
+	if (*p1 != 'H') {
+		printf("mmaped write failed: %m\n");
+		abort();
+
+	}
+	munmap(p, mfd_def_size);
+}
+
+sigjmp_buf jbuf, *sigbuf;
+static void sig_handler(int sig, siginfo_t *siginfo, void *ptr)
+{
+	if (sig == SIGBUS) {
+		if (sigbuf)
+			siglongjmp(*sigbuf, 1);
+		abort();
+	}
+}
+
+static void mfd_fail_hole_write(int fd)
+{
+	ssize_t l;
+	void *p;
+	char *p1;
+
+	/* verify direct write() fails */
+	l = write(fd, "data", 4);
+	if (l > 0) {
+		printf("expected failure on write(), but got %d: %m\n", (int)l);
+		abort();
+	}
+
+	/* verify mmaped write fails */
+	p = mmap(NULL,
+		 mfd_def_size,
+		 PROT_READ | PROT_WRITE,
+		 MAP_SHARED,
+		 fd,
+		 0);
+	if (p == MAP_FAILED) {
+		printf("mmap() failed: %m\n");
+		abort();
+	}
+
+	sigbuf = &jbuf;
+	if (sigsetjmp(*sigbuf, 1))
+		goto out;
+
+	/* Below write should trigger SIGBUS signal */
+	p1 = (char *)p + mfd_def_size - 1;
+	*p1 = 'H';
+	printf("failed to receive SIGBUS for mmaped write: %m\n");
+	abort();
+out:
+	munmap(p, mfd_def_size);
+}
+
 static int idle_thread_fn(void *arg)
 {
 	sigset_t set;
@@ -880,6 +994,57 @@ static void test_seal_resize(void)
 	close(fd);
 }
 
+/*
+ * Test F_SEAL_AUTO_ALLOCATE
+ * Test whether F_SEAL_AUTO_ALLOCATE actually prevents allocation.
+ */
+static void test_seal_auto_allocate(void)
+{
+	struct sigaction act;
+	int fd;
+
+	printf("%s SEAL-AUTO-ALLOCATE\n", memfd_str);
+
+	memset(&act, 0, sizeof(act));
+	act.sa_sigaction = sig_handler;
+	act.sa_flags = SA_SIGINFO;
+	if (sigaction(SIGBUS, &act, 0)) {
+		printf("sigaction() failed: %m\n");
+		abort();
+	}
+
+	fd = mfd_assert_new("kern_memfd_seal_auto_allocate",
+			    mfd_def_size,
+			    MFD_CLOEXEC | MFD_ALLOW_SEALING);
+
+	/* read/write should pass if F_SEAL_AUTO_ALLOCATE not set */
+	mfd_assert_read(fd);
+	mfd_assert_hole_write(fd);
+
+	mfd_assert_has_seals(fd, 0);
+	mfd_assert_add_seals(fd, F_SEAL_AUTO_ALLOCATE);
+	mfd_assert_has_seals(fd, F_SEAL_AUTO_ALLOCATE);
+
+	/* read/write should pass for pre-allocated area */
+	mfd_assert_read(fd);
+	mfd_assert_hole_write(fd);
+
+	mfd_assert_punch_hole(fd);
+
+	/* read should pass, write should fail in hole */
+	mfd_assert_read(fd);
+	mfd_fail_hole_write(fd);
+
+	mfd_assert_fallocate(fd);
+
+	/* read/write should pass after fallocate */
+	mfd_assert_read(fd);
+	mfd_assert_hole_write(fd);
+
+	close(fd);
+}
+
+
 /*
  * Test sharing via dup()
  * Test that seals are shared between dupped FDs and they're all equal.
@@ -1059,6 +1224,7 @@ int main(int argc, char **argv)
 	test_seal_shrink();
 	test_seal_grow();
 	test_seal_resize();
+	test_seal_auto_allocate();
 
 	test_share_dup("SHARE-DUP", "");
 	test_share_mmap("SHARE-MMAP", "");
-- 
2.25.1


