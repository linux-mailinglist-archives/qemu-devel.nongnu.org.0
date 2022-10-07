Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317545F77ED
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:27:02 +0200 (CEST)
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmRQ-0004Cr-TD
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuT-00065D-Dj
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuR-0003LP-Vg
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nCbxNZFOXn0xQq9rHwPRyECSDQTke15H3NzZPZlYns0=;
 b=SJDMUQOVRyJGNnDlW2SIYJacKykG+SXMlgM9k7IvUadpJvS+RZHQaD65MIhUWO0n8k3nXM
 R501Y8vacFxZHKtdUzH6YRot1jkdd+SI3Hr5n07QPU6ITwnk8byqDkG9J3zL2eaYsUS50d
 Hx50wVO3RIdAEFaa+kqUee7bFQsU+GI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-Uykhbyo3NnK5gpYBKiWnOQ-1; Fri, 07 Oct 2022 06:48:50 -0400
X-MC-Unique: Uykhbyo3NnK5gpYBKiWnOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2335680206D;
 Fri,  7 Oct 2022 10:48:50 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6240E2024CBB;
 Fri,  7 Oct 2022 10:48:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 50/50] file-posix: Remove unused s->discard_zeroes
Date: Fri,  7 Oct 2022 12:47:52 +0200
Message-Id: <20221007104752.141361-51-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

The field is unused (only ever set, but never read) since commit
ac9185603. Additionally, the commit message of commit 34fa110e already
explained earlier why it's unreliable. Remove it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220923142838.91043-1-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index ad3021938b..23acffb9a4 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -154,7 +154,6 @@ typedef struct BDRVRawState {
 
     bool has_discard:1;
     bool has_write_zeroes:1;
-    bool discard_zeroes:1;
     bool use_linux_aio:1;
     bool use_linux_io_uring:1;
     int page_cache_inconsistent; /* errno from fdatasync failure */
@@ -755,7 +754,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
             ret = -EINVAL;
             goto fail;
         } else {
-            s->discard_zeroes = true;
             s->has_fallocate = true;
         }
     } else {
@@ -769,19 +767,12 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
     }
 
     if (S_ISBLK(st.st_mode)) {
-#ifdef BLKDISCARDZEROES
-        unsigned int arg;
-        if (ioctl(s->fd, BLKDISCARDZEROES, &arg) == 0 && arg) {
-            s->discard_zeroes = true;
-        }
-#endif
 #ifdef __linux__
         /* On Linux 3.10, BLKDISCARD leaves stale data in the page cache.  Do
          * not rely on the contents of discarded blocks unless using O_DIRECT.
          * Same for BLKZEROOUT.
          */
         if (!(bs->open_flags & BDRV_O_NOCACHE)) {
-            s->discard_zeroes = false;
             s->has_write_zeroes = false;
         }
 #endif
-- 
2.37.3


