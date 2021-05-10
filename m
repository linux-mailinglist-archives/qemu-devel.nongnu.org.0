Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE8378C81
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:58:04 +0200 (CEST)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5U3-00028n-Qj
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lg5Q2-00058h-El
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:53:54 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:29307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lg5Q0-0002LF-Ik
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1620651232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qxnni0A9eL6zKhHtldQizgIwzPgiDEvjSI22O1dRui0=;
 b=YqUGlJXCjXoh0tFVy1aUSqTzWypJSJC7F/WZFFE3fXy7Wd0EMwJG1pdv
 kGd3RR6LrbJkyLlq2YLfjY/X4ctRoZLsPXuhDes/sFnbYsq0+zuRYpkHp
 6O5izd5+mZfrLPciWjxOy6Ne9yYVN6d52dyNxHD9X79txM+hRDi4sURcO 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PkKXSDtAjaDFOOQRbZn0k9IaLjO3BMQWCnzZ85V1fHRFwePEEdABWzUO+LbkP83ZVQg6tJ8lJs
 +Q7DZ5yE1JttZ72LgzK2SehRl30S+hCwMW5tWLM/Fklrr989sIkeb3MYw8K7jv+HgzcvDdMTdV
 fTg7YbsCP42ww1HzOxFW4XZlDRl3YKI0uXLvU+0dGSFzD19slg7IC4Z1FY3sC7WESG3M6xd+Jq
 NVUE0eAhZ6GT1UNo2A/R/tfQNrLV/dxvgdskWzAne2r3kqUFXWo42h9wHlTvE6xBQHGC83b0+l
 gN8=
X-SBRS: 5.1
X-MesageID: 43429923
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:vHHm6aCSYganiFLlHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.82,287,1613451600"; d="scan'208";a="43429923"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Igor Druzhinin
 <igor.druzhinin@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 1/3] xen-mapcache: avoid a race on memory map while using
 MAP_FIXED
Date: Mon, 10 May 2021 13:53:38 +0100
Message-ID: <20210510125340.903323-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510125340.903323-1-anthony.perard@citrix.com>
References: <20210510125340.903323-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=anthony.perard@citrix.com; helo=esa2.hc3370-68.iphmx.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

From: Igor Druzhinin <igor.druzhinin@citrix.com>

When we're replacing the existing mapping there is possibility of a race
on memory map with other threads doing mmap operations - the address being
unmapped/re-mapped could be occupied by another thread in between.

Linux mmap man page recommends keeping the existing mappings in place to
reserve the place and instead utilize the fact that the next mmap operation
with MAP_FIXED flag passed will implicitly destroy the existing mappings
behind the chosen address. This behavior is guaranteed by POSIX / BSD and
therefore is portable.

Note that it wouldn't make the replacement atomic for parallel accesses to
the replaced region - those might still fail with SIGBUS due to
xenforeignmemory_map not being atomic. So we're still not expecting those.

Tested-by: Anthony PERARD <anthony.perard@citrix.com>
Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Message-Id: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/i386/xen/xen-mapcache.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index 5b120ed44b..e82b7dcdd2 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -171,7 +171,20 @@ static void xen_remap_bucket(MapCacheEntry *entry,
         if (!(entry->flags & XEN_MAPCACHE_ENTRY_DUMMY)) {
             ram_block_notify_remove(entry->vaddr_base, entry->size);
         }
-        if (munmap(entry->vaddr_base, entry->size) != 0) {
+
+        /*
+         * If an entry is being replaced by another mapping and we're using
+         * MAP_FIXED flag for it - there is possibility of a race for vaddr
+         * address with another thread doing an mmap call itself
+         * (see man 2 mmap). To avoid that we skip explicit unmapping here
+         * and allow the kernel to destroy the previous mappings by replacing
+         * them in mmap call later.
+         *
+         * Non-identical replacements are not allowed therefore.
+         */
+        assert(!vaddr || (entry->vaddr_base == vaddr && entry->size == size));
+
+        if (!vaddr && munmap(entry->vaddr_base, entry->size) != 0) {
             perror("unmap fails");
             exit(-1);
         }
-- 
Anthony PERARD


