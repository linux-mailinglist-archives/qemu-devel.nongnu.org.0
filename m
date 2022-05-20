Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC04252E604
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 09:15:51 +0200 (CEST)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrwrW-0003Lq-V9
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 03:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nrwn9-0001P0-RK
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:11:19 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nrwn3-0002kU-QF
 for qemu-devel@nongnu.org; Fri, 20 May 2022 03:11:16 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c2so6682632plh.2
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8UjG0o5nMa5Xyc82qdtjuxq129pWxy4iyjYulNwlNyA=;
 b=FvCeZJA8to5GxS3vQ+6fEvcNONch1qOBkoX5suR+8ddUyYlJGtARJLZxz+JH/IUMkB
 WzdFCPBBFVH0Kw7QBKqmnA76Xq3DyDJuJ83IjvJhLHrZWuaR7nTmavaZq+wA9z9kAufw
 9ObahDXqdskxgzCq2Az+G/kXC7yoV8vkmgL28dcC95bPcjUl2OgsjvY5cyKsfPchKwLt
 wSwc3aRZ0KQYCcoztiAPb3hWP6fBEuSOHBCZTVYfHLlI3PU+WBHhgCMYrUg7dAnYxsPc
 wlYqP422pmULChg9jq/rMp7aI3PnP8y/um8J2Zu88mD9Ip5pWM9xTXFaPYIGnaY+pQLV
 gZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8UjG0o5nMa5Xyc82qdtjuxq129pWxy4iyjYulNwlNyA=;
 b=sz/Y3wYRV07UvWgQyjBTLbOUwak/24VGa5PKblIE9at1zRuE/7pB634apY2aQuJKTh
 M+bIbCZoui13mLiBIOK9L6HcyIt8potRK0WFkvoz9iwRZ0R1a+Q/lYnsU2lQZZqdULNr
 0i2zCYUbHp5zR30mOF258p+YKua/ABqZnqus7TJtDAkrk5IJiSwL8GlYFbjB90xrccKF
 TmsBVoszE7GzOmaoeT6orGPPZlDcwjoh5D/I0ppJMn9eNoe3Y68xO55u6kl1U77G0Q4L
 o+qj7Gd1Z9lAVbUP2R9vu6fjF808lsrPlWlzyNVymZE0QHhj3Z24zzNIpxkV0p/O7QyA
 3VcQ==
X-Gm-Message-State: AOAM5302uypdh9N47aoPRZOMQnd74X5fmqxWme8RWGhNhHND6hGq0D/A
 tky3j0zQTfJ+519FT0PG7Bn+Yg==
X-Google-Smtp-Source: ABdhPJy7dN6W1unJEUkIMo5mIF8IIbhU7NS+eo2bgsyEgDOQL52VpJ/gWLWzofZM6zyA0hz0bJY9iQ==
X-Received: by 2002:a17:902:b703:b0:158:2667:7447 with SMTP id
 d3-20020a170902b70300b0015826677447mr8337607pls.92.1653030672217; 
 Fri, 20 May 2022 00:11:12 -0700 (PDT)
Received: from always-x1.www.tendawifi.com ([139.177.225.255])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a170902d21200b00161b3d5e3e4sm4965168ply.304.2022.05.20.00.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 00:11:11 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: akpm@linux-foundation.org, naoya.horiguchi@nec.com, mst@redhat.com,
 david@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH 2/3] mm/memory-failure.c: support reset PTE during unpoison
Date: Fri, 20 May 2022 15:06:47 +0800
Message-Id: <20220520070648.1794132-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520070648.1794132-1-pizhenwei@bytedance.com>
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Origianlly, unpoison_memory() is only used by hwpoison-inject, and
unpoisons a page which is poisoned by hwpoison-inject too. The kernel PTE
entry has no change during software poison/unpoison.

On a virtualization platform, it's possible to fix hardware corrupted page
by hypervisor, typically the hypervisor remaps the error HVA(host virtual
address). So add a new parameter 'const char *reason' to show the reason
called by.

Once the corrupted page gets fixed, the guest kernel needs put page to
buddy. Reuse the page and hit the following issue(Intel Platinum 8260):
 BUG: unable to handle page fault for address: ffff888061646000
 #PF: supervisor write access in kernel mode
 #PF: error_code(0x0002) - not-present page
 PGD 2c01067 P4D 2c01067 PUD 61aaa063 PMD 10089b063 PTE 800fffff9e9b9062
 Oops: 0002 [#1] PREEMPT SMP NOPTI
 CPU: 2 PID: 31106 Comm: stress Kdump: loaded Tainted: G   M       OE     5.18.0-rc6.bm.1-amd64 #6
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
 RIP: 0010:clear_page_erms+0x7/0x10

The kernel PTE entry of the fixed page is still uncorrected, kernel hits
page fault during prep_new_page. So add 'bool reset_kpte' to get a change
to fix the PTE entry if the page is fixed by hypervisor.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 include/linux/mm.h   |  2 +-
 mm/hwpoison-inject.c |  2 +-
 mm/memory-failure.c  | 26 +++++++++++++++++++-------
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 665873c2788c..7ba210e86401 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3191,7 +3191,7 @@ enum mf_flags {
 extern int memory_failure(unsigned long pfn, int flags);
 extern void memory_failure_queue(unsigned long pfn, int flags);
 extern void memory_failure_queue_kick(int cpu);
-extern int unpoison_memory(unsigned long pfn);
+extern int unpoison_memory(unsigned long pfn, bool reset_kpte, const char *reason);
 extern int sysctl_memory_failure_early_kill;
 extern int sysctl_memory_failure_recovery;
 extern void shake_page(struct page *p);
diff --git a/mm/hwpoison-inject.c b/mm/hwpoison-inject.c
index 5c0cddd81505..0dd17ba98ade 100644
--- a/mm/hwpoison-inject.c
+++ b/mm/hwpoison-inject.c
@@ -57,7 +57,7 @@ static int hwpoison_unpoison(void *data, u64 val)
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	return unpoison_memory(val);
+	return unpoison_memory(val, false, "hwpoison-inject");
 }
 
 DEFINE_DEBUGFS_ATTRIBUTE(hwpoison_fops, NULL, hwpoison_inject, "%lli\n");
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 95c218bb0a37..a46de3be1dd7 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -2132,21 +2132,26 @@ core_initcall(memory_failure_init);
 /**
  * unpoison_memory - Unpoison a previously poisoned page
  * @pfn: Page number of the to be unpoisoned page
+ * @reset_kpte: Reset the PTE entry for kmap
+ * @reason: The callers tells why unpoisoning the page
  *
- * Software-unpoison a page that has been poisoned by
- * memory_failure() earlier.
+ * Unpoison a page that has been poisoned by memory_failure() earlier.
  *
- * This is only done on the software-level, so it only works
- * for linux injected failures, not real hardware failures
+ * For linux injected failures, there is no need to reset PTE entry.
+ * It's possible to fix hardware memory failure on a virtualization platform,
+ * once hypervisor fixes the failure, guest needs put page back to buddy and
+ * reset the PTE entry in kernel.
  *
  * Returns 0 for success, otherwise -errno.
  */
-int unpoison_memory(unsigned long pfn)
+int unpoison_memory(unsigned long pfn, bool reset_kpte, const char *reason)
 {
 	struct page *page;
 	struct page *p;
 	int ret = -EBUSY;
 	int freeit = 0;
+	pte_t *kpte;
+	unsigned long addr;
 	static DEFINE_RATELIMIT_STATE(unpoison_rs, DEFAULT_RATELIMIT_INTERVAL,
 					DEFAULT_RATELIMIT_BURST);
 
@@ -2208,8 +2213,15 @@ int unpoison_memory(unsigned long pfn)
 	mutex_unlock(&mf_mutex);
 	if (!ret || freeit) {
 		num_poisoned_pages_dec();
-		unpoison_pr_info("Unpoison: Software-unpoisoned page %#lx\n",
-				 page_to_pfn(p), &unpoison_rs);
+		pr_info("Unpoison: Unpoisoned page %#lx by %s\n",
+				 page_to_pfn(p), reason);
+		if (reset_kpte) {
+			preempt_disable();
+			addr = (unsigned long)page_to_virt(p);
+			kpte = virt_to_kpte(addr);
+			set_pte_at(&init_mm, addr, kpte, pfn_pte(pfn, PAGE_KERNEL));
+			preempt_enable();
+		}
 	}
 	return ret;
 }
-- 
2.20.1


