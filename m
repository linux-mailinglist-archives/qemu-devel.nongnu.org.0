Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39265E0485
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 15:06:56 +0200 (CEST)
Received: from localhost ([::1]:55998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMtsE-00050w-OZ
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 09:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iMtkV-0006zF-K6
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:58:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iMtkU-0006Pr-Fd
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 08:58:55 -0400
Received: from relay.sw.ru ([185.231.240.75]:55176)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iMtkM-0006K9-DR; Tue, 22 Oct 2019 08:58:46 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iMtkH-0003xx-QD; Tue, 22 Oct 2019 15:58:41 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 03/10] hbitmap: unpublish hbitmap_iter_skip_words
Date: Tue, 22 Oct 2019 15:58:32 +0300
Message-Id: <20191022125839.12633-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022125839.12633-1-vsementsov@virtuozzo.com>
References: <20191022125839.12633-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Function is internal and even commented as internal. Drop its
definition from .h file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/hbitmap.h | 7 -------
 util/hbitmap.c         | 2 +-
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index ab227b117f..15837a0e2d 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -297,13 +297,6 @@ void hbitmap_free(HBitmap *hb);
  */
 void hbitmap_iter_init(HBitmapIter *hbi, const HBitmap *hb, uint64_t first);
 
-/* hbitmap_iter_skip_words:
- * @hbi: HBitmapIter to operate on.
- *
- * Internal function used by hbitmap_iter_next and hbitmap_iter_next_word.
- */
-unsigned long hbitmap_iter_skip_words(HBitmapIter *hbi);
-
 /* hbitmap_next_zero:
  *
  * Find next not dirty bit within selected range. If not found, return -1.
diff --git a/util/hbitmap.c b/util/hbitmap.c
index dd3ab345d7..4b4a2753f8 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -104,7 +104,7 @@ struct HBitmap {
 /* Advance hbi to the next nonzero word and return it.  hbi->pos
  * is updated.  Returns zero if we reach the end of the bitmap.
  */
-unsigned long hbitmap_iter_skip_words(HBitmapIter *hbi)
+static unsigned long hbitmap_iter_skip_words(HBitmapIter *hbi)
 {
     size_t pos = hbi->pos;
     const HBitmap *hb = hbi->hb;
-- 
2.21.0


