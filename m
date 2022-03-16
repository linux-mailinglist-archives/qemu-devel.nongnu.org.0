Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F9D4DA92B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 05:06:30 +0100 (CET)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUKvd-0005Te-7R
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 00:06:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUKu8-0004lK-Ll
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 00:04:58 -0400
Received: from smtp116.iad3a.emailsrvr.com ([173.203.187.116]:47135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUKu6-00077z-Oz
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 00:04:56 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp39.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 4A8DE4325; 
 Wed, 16 Mar 2022 00:04:51 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH] softmmu/physmem: Use qemu_madvise
Date: Tue, 15 Mar 2022 23:04:05 -0500
Message-Id: <20220316040405.4131-1-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
X-Classification-ID: 0d3ca5e0-ac42-4b96-9df2-d16d0103ead4-1-1
Received-SPF: pass client-ip=173.203.187.116;
 envelope-from=adeason@sinenomine.net; helo=smtp116.iad3a.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Deason <adeason@sinenomine.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a thin wrapper around madvise, called qemu_madvise, which
provides consistent behavior for the !CONFIG_MADVISE case, and works
around some platform-specific quirks (some platforms only provide
posix_madvise, and some don't offer all 'advise' types). This specific
caller of madvise has never used it, tracing back to its original
introduction in commit e0b266f01dd2 ("migration_completion: Take
current state").

Call qemu_madvise here, to follow the same logic as all of our other
madvise callers. This slightly changes the behavior for
!CONFIG_MADVISE (EINVAL instead of ENOSYS, and a slightly different
error message), but this is now more consistent with other callers
that use qemu_madvise.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
---
Looking at the history of commits that touch this madvise() call, it
doesn't _look_ like there's any reason to be directly calling madvise vs
qemu_advise (I don't see anything mentioned), but I'm not sure.

 softmmu/physmem.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 43ae70fbe2..900c692b5e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3584,40 +3584,32 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length)
                          rb->idstr, start, length, ret);
             goto err;
 #endif
         }
         if (need_madvise) {
             /* For normal RAM this causes it to be unmapped,
              * for shared memory it causes the local mapping to disappear
              * and to fall back on the file contents (which we just
              * fallocate'd away).
              */
-#if defined(CONFIG_MADVISE)
             if (qemu_ram_is_shared(rb) && rb->fd < 0) {
-                ret = madvise(host_startaddr, length, QEMU_MADV_REMOVE);
+                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_REMOVE);
             } else {
-                ret = madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
+                ret = qemu_madvise(host_startaddr, length, QEMU_MADV_DONTNEED);
             }
             if (ret) {
                 ret = -errno;
                 error_report("ram_block_discard_range: Failed to discard range "
                              "%s:%" PRIx64 " +%zx (%d)",
                              rb->idstr, start, length, ret);
                 goto err;
             }
-#else
-            ret = -ENOSYS;
-            error_report("ram_block_discard_range: MADVISE not available"
-                         "%s:%" PRIx64 " +%zx (%d)",
-                         rb->idstr, start, length, ret);
-            goto err;
-#endif
         }
         trace_ram_block_discard_range(rb->idstr, host_startaddr, length,
                                       need_madvise, need_fallocate, ret);
     } else {
         error_report("ram_block_discard_range: Overrun block '%s' (%" PRIu64
                      "/%zx/" RAM_ADDR_FMT")",
                      rb->idstr, start, length, rb->max_length);
     }
 
 err:
-- 
2.11.0


