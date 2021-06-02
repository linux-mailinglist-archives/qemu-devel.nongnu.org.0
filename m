Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D28398B2E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:57:09 +0200 (CEST)
Received: from localhost ([::1]:49558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRMq-00012n-Vd
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCQ-0001YF-4c
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCN-0007Jo-Gk
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CBaDUKnvJIg91/Bx09z1bIJ+o8IZg/K0bT1Oewi4xNs=;
 b=P/Z/l7s/hbZ2YlBOZhARGgwTd4zYlqeCvbBUVAvJ9yocnBR11hx4BBeqsOXCgJUB3uHDKB
 RxPDWv8+PpOOSL5SZif7MO2rS5qlWD7ubFERHbzTY9IFvQzQ/N16D8/5rBp0KUmLrGpL6N
 uDZgRby57WmwBd3Ijr1nnzO2sXdZ9i0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-zhEb_yy0MbWh4qiV6aZ7IQ-1; Wed, 02 Jun 2021 09:46:08 -0400
X-MC-Unique: zhEb_yy0MbWh4qiV6aZ7IQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ED9A1075FEB;
 Wed,  2 Jun 2021 13:45:46 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F2A319814;
 Wed,  2 Jun 2021 13:45:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/20] block/file-posix: Try other fallbacks after invalid
 FALLOC_FL_ZERO_RANGE
Date: Wed,  2 Jun 2021 15:45:18 +0200
Message-Id: <20210602134529.231756-10-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

If fallocate(... FALLOC_FL_ZERO_RANGE ...) returns EINVAL, it's likely
an indication that the file system is buggy and does not implement
unaligned accesses right. We still might be lucky with the other
fallback fallocate() calls later in this function, though, so we should
not return immediately and try the others first.
Since FALLOC_FL_ZERO_RANGE could also return EINVAL if the file descriptor
is not a regular file, we ignore this filesystem bug silently, without
printing an error message for the user.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210527172020.847617-3-thuth@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 6e24083f3f..f37dfc10b3 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1625,17 +1625,17 @@ static int handle_aiocb_write_zeroes(void *opaque)
     if (s->has_write_zeroes) {
         int ret = do_fallocate(s->fd, FALLOC_FL_ZERO_RANGE,
                                aiocb->aio_offset, aiocb->aio_nbytes);
-        if (ret == -EINVAL) {
-            /*
-             * Allow falling back to pwrite for file systems that
-             * do not support fallocate() for an unaligned byte range.
-             */
-            return -ENOTSUP;
-        }
-        if (ret == 0 || ret != -ENOTSUP) {
+        if (ret == -ENOTSUP) {
+            s->has_write_zeroes = false;
+        } else if (ret == 0 || ret != -EINVAL) {
             return ret;
         }
-        s->has_write_zeroes = false;
+        /*
+         * Note: Some file systems do not like unaligned byte ranges, and
+         * return EINVAL in such a case, though they should not do it according
+         * to the man-page of fallocate(). Thus we simply ignore this return
+         * value and try the other fallbacks instead.
+         */
     }
 #endif
 
-- 
2.30.2


