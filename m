Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69813934B0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:22:52 +0200 (CEST)
Received: from localhost ([::1]:53256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmJid-0001Td-W5
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lmJgS-0007Bt-Tt
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:20:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lmJgR-0004qo-5t
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622136034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lXUmlBTMsiiuFXMdYtSCMSStnaQPkRXDY4eEYAzaYfs=;
 b=CYX58U/pO+zlrsy6hL+rK3Q95en+qL8WMp9blP9fO2BGd3P2xK/0Omc6GzYtEEr22gst6P
 XQn0qzn1x8S+9+UKWioefjKmXla7Pbq5KA6A6qGvrjztc9Y/TgfnsBUi8njItMF+VQAc+8
 tr8g0qdZfUvAgekIovFfEup8QfxP78k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-00M04-P0NPCaR0zvSKya4g-1; Thu, 27 May 2021 13:20:31 -0400
X-MC-Unique: 00M04-P0NPCaR0zvSKya4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09B971858ED2;
 Thu, 27 May 2021 17:20:30 +0000 (UTC)
Received: from thuth.com (ovpn-112-76.ams2.redhat.com [10.36.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15D6960864;
 Thu, 27 May 2021 17:20:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Subject: [PATCH 2/2] block/file-posix: Try other fallbacks after invalid
 FALLOC_FL_ZERO_RANGE
Date: Thu, 27 May 2021 19:20:20 +0200
Message-Id: <20210527172020.847617-3-thuth@redhat.com>
In-Reply-To: <20210527172020.847617-1-thuth@redhat.com>
References: <20210527172020.847617-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If fallocate(... FALLOC_FL_ZERO_RANGE ...) returns EINVAL, it's likely
an indication that the file system is buggy and does not implement
unaligned accesses right. We still might be lucky with the other
fallback fallocate() calls later in this function, though, so we should
not return immediately and try the others first.
Since FALLOC_FL_ZERO_RANGE could also return EINVAL if the file descriptor
is not a regular file, we ignore this filesystem bug silently, without
printing an error message for the user.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 block/file-posix.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 134ff01d82..a96b6fa8fb 100644
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
2.27.0


