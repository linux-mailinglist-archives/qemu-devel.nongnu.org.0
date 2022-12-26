Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A6265653D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 23:05:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9va5-0005zO-9R; Mon, 26 Dec 2022 17:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p9va2-0005vj-To
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 17:04:23 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p9vZz-0003wG-QU
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 17:04:22 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id CB8045FCA7;
 Tue, 27 Dec 2022 01:04:05 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:7302::1:b])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 r3XNq20UleA1-kkdUHaH9; Tue, 27 Dec 2022 01:04:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1672092245; bh=GxS5oBGg62pjt9WymOQQdsKcKh0xpXTjhuke7xLRyAc=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=W6lhWx2oGCUIV/fq7RuQAbqxbS17hnoqoCq9iT4LokR37pAxWE+u1GrR6JmHJ0kXF
 3JBNVXptiDai0YzkcczACUSpO0rISNsjiqpWEQXai8rW2iNhHFfpAHUQYwVJhHl5gh
 FLXOsvOgO24TtFxWiLhyK1uU+WvdivcV9lYyc1rQ=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, david@redhat.com, peterx@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH] coverity: physmem: use simple assertions instead of modelling
Date: Tue, 27 Dec 2022 01:03:51 +0300
Message-Id: <20221226220351.754204-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Unfortunately Coverity doesn't follow the logic aroung "len" and "l"
variables in stacks finishing with flatview_{read,write}_continue() and
generate a lot of OVERRUN false-positives. When small buffer (2 or 4
bytes) is passed to mem read/write path, Coverity assumes the worst
case of sz=8 in stn_he_p()/ldn_he_p() (defined in
include/qemu/bswap.h), and reports buffer overrun.

To silence these false-positives we have model functions, which hide
real logic from Coverity.

However, it turned out that these new two assertions are enough to
quiet Coverity.

Assertions are better than hiding the logic, so let's drop the
modelling and move to assertions for memory r/w call stacks.

After patch, the sequence

 cov-make-library --output-file /tmp/master.xmldb \
    scripts/coverity-scan/model.c
 cov-build --dir ~/covtmp/master make -j9
 cov-analyze --user-model-file /tmp/master.xmldb \
    --dir ~/covtmp/master --all --strip-path "$(pwd)
 cov-format-errors --dir ~/covtmp/master \
    --html-output ~/covtmp/master_html_report

Generate for me the same big set of CIDs excepept for 6 disappeared (so
it becomes even better).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 scripts/coverity-scan/model.c | 88 -----------------------------------
 softmmu/physmem.c             | 18 +++++++
 2 files changed, 18 insertions(+), 88 deletions(-)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 686d1a3008..a064d84084 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -42,94 +42,6 @@ typedef _Bool bool;
 
 typedef struct va_list_str *va_list;
 
-/* exec.c */
-
-typedef struct AddressSpace AddressSpace;
-typedef struct MemoryRegionCache MemoryRegionCache;
-typedef uint64_t hwaddr;
-typedef uint32_t MemTxResult;
-typedef struct MemTxAttrs {} MemTxAttrs;
-
-static void __bufwrite(uint8_t *buf, ssize_t len)
-{
-    int first, last;
-    __coverity_negative_sink__(len);
-    if (len == 0) return;
-    buf[0] = first;
-    buf[len-1] = last;
-    __coverity_writeall__(buf);
-}
-
-static void __bufread(uint8_t *buf, ssize_t len)
-{
-    __coverity_negative_sink__(len);
-    if (len == 0) return;
-    int first = buf[0];
-    int last = buf[len-1];
-}
-
-MemTxResult address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
-                                      MemTxAttrs attrs,
-                                      void *buf, int len)
-{
-    MemTxResult result;
-    // TODO: investigate impact of treating reads as producing
-    // tainted data, with __coverity_tainted_data_argument__(buf).
-    __bufwrite(buf, len);
-    return result;
-}
-
-MemTxResult address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
-                                MemTxAttrs attrs,
-                                const void *buf, int len)
-{
-    MemTxResult result;
-    __bufread(buf, len);
-    return result;
-}
-
-MemTxResult address_space_rw_cached(MemoryRegionCache *cache, hwaddr addr,
-                                    MemTxAttrs attrs,
-                                    void *buf, int len, bool is_write)
-{
-    if (is_write) {
-        return address_space_write_cached(cache, addr, attrs, buf, len);
-    } else {
-        return address_space_read_cached(cache, addr, attrs, buf, len);
-    }
-}
-
-MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
-                               MemTxAttrs attrs,
-                               void *buf, int len)
-{
-    MemTxResult result;
-    // TODO: investigate impact of treating reads as producing
-    // tainted data, with __coverity_tainted_data_argument__(buf).
-    __bufwrite(buf, len);
-    return result;
-}
-
-MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
-                                MemTxAttrs attrs,
-                                const void *buf, int len)
-{
-    MemTxResult result;
-    __bufread(buf, len);
-    return result;
-}
-
-MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
-                             MemTxAttrs attrs,
-                             void *buf, int len, bool is_write)
-{
-    if (is_write) {
-        return address_space_write(as, addr, attrs, buf, len);
-    } else {
-        return address_space_read(as, addr, attrs, buf, len);
-    }
-}
-
 /* Tainting */
 
 typedef struct {} name2keysym_t;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index edec095c7a..24571002b3 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2821,6 +2821,15 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
             l = memory_access_size(mr, l, addr1);
             /* XXX: could force current_cpu to NULL to avoid
                potential bugs */
+
+            /*
+             * Assure Coverity (and ourselves) that we are not going to OVERRUN
+             * the buffer by following ldn_he_p().
+             */
+            assert((l == 1 && len >= 1) ||
+                   (l == 2 && len >= 2) ||
+                   (l == 4 && len >= 4) ||
+                   (l == 8 && len >= 8));
             val = ldn_he_p(buf, l);
             result |= memory_region_dispatch_write(mr, addr1, val,
                                                    size_memop(l), attrs);
@@ -2891,6 +2900,15 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
             l = memory_access_size(mr, l, addr1);
             result |= memory_region_dispatch_read(mr, addr1, &val,
                                                   size_memop(l), attrs);
+
+            /*
+             * Assure Coverity (and ourselves) that we are not going to OVERRUN
+             * the buffer by following stn_he_p().
+             */
+            assert((l == 1 && len >= 1) ||
+                   (l == 2 && len >= 2) ||
+                   (l == 4 && len >= 4) ||
+                   (l == 8 && len >= 8));
             stn_he_p(buf, l, val);
         } else {
             /* RAM case */
-- 
2.34.1


