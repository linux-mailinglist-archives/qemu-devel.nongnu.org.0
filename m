Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC33650EE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 05:36:13 +0200 (CEST)
Received: from localhost ([::1]:35952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYhBL-0007r2-Nn
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 23:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <igor.druzhinin@citrix.com>)
 id 1lYhAY-0007L9-BE
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 23:35:23 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:27431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <igor.druzhinin@citrix.com>)
 id 1lYhAU-0002S9-69
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 23:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1618889717;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4OCw2BlETeIJ5/zMETI/C9VjE7n4iGuT4GJGVZlI2tU=;
 b=CIKjB8dfqI8MS8QT3+IkU5CJaXhEoh2p+WeSrfb+iOkW4E6/PHWEgtEt
 wiDaRqBhqG2jX15+rrPysZJkcfpS/orSeBsvus2DZIhAEdI4kIlFR20xS
 X1kH5DZ4LNi5iHWV014yyvsAaPcWSrgJkrVYYMJ05D8+Z9o67DAsou5bs 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: feFMM1VAyrKGKMq/I/3hGcUuM6DYGTxTonCWKap2CE2QC5mu7bltxyxCPER9cU60UT1pGEmhBU
 mdIeDTseJKrnUTUdtwd7XtwI7x9wjSOm00T5g/VUSIrH6H/su3BK3pcos1ftp/b5RIvKPT00oB
 R3MZ8Up4grBpW39oKUCZdI8nBf3KnOTPhaIGSZprMlXOnEHuoJQnd5POAjVjN+LkxnLaPAQsO/
 SlauEB2IG5V5brf1ghYDp1ivo0XYuQhzyHxB8RVXvtmQlV21POJbwmxSD23t3DCjAoWfHhkGIS
 8jw=
X-SBRS: 5.1
X-MesageID: 42068993
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/M1IuqmuRAaPF6ULGJ/OBpfkkrzpDfPfimdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVyZysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CS6Yl1AthDxbeL0sefnglObMcNL
 6xovVKvCChf3N/VLXdOlAgU/LYr9PG0LLKCCR2ZCIP0wWFgTO25LOSKXHxsis2aD9Bzawv9m
 LIiWXCl8Cemsq21wPG0Cvr54lW8eGL9vJ4GMeOhsIJQw+c7jqAWYIJYdy/lQFwms6DwhIAkN
 7AoxAvVv4DlE/5TyWOjjbGnyXl2DYqwXf+xVGfmmuLm72GeBsKT/BvqKgcXhzF61cxnNwU6t
 M740up86B5IDmFvCPh68PGXxtn/3DE0UYKoKoooFF0Fa49AYUh1LA3zQduP7orWB/e0sQBFt
 JjCcnNjcwmDG+yXjTikUREhOC3Um9bJGb/fmEy/va7/hJxh35Dw04R1KUk7ws93aN4cZVC6u
 jeW54Y741mf4sTZaJ5Mu8LXdG6PGzLWQ7NK2KfOz3cZds6B04=
X-IronPort-AV: E=Sophos;i="5.82,235,1613451600"; d="scan'208";a="42068993"
To: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <anthony.perard@citrix.com>, <paul@xen.org>,
 <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>,
 <richard.henderson@linaro.org>, <ehabkost@redhat.com>, Igor Druzhinin
 <igor.druzhinin@citrix.com>
Subject: [PATCH] xen-mapcache: avoid a race on memory map while using MAP_FIXED
Date: Tue, 20 Apr 2021 04:35:02 +0100
Message-ID: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=igor.druzhinin@citrix.com; helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Igor Druzhinin <igor.druzhinin@citrix.com>
From:  Igor Druzhinin via <qemu-devel@nongnu.org>

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
---
 hw/i386/xen/xen-mapcache.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index 5b120ed..e82b7dc 100644
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
2.7.4


