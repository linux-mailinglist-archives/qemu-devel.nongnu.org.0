Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C82360B62
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 16:04:39 +0200 (CEST)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX2bk-0001qh-MX
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 10:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX2Wa-0005Uu-7N
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:59:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX2WX-00026R-KT
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618495152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TFzRBkY+DSgenbNBn3jkrOtWXzY0sNDIyTzKb8fUwiE=;
 b=Kg7ZYmUIOtCYAMxN/0Ks7yhs8edpSXfIlwDbzWXlH8tO193C0W5+fG+5fHmUdg2FL3Sg6e
 ZqUQ5hiRv5IBz0B/JabHPDf7A5Kx7hAY4pA4BWhuG+xBHF8o0AJeFk7qkr5bBop1FBzF4Z
 ZmOwWHoaoLUUKn2qvgpN0afr66Yg81k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-gwk9P3JaNOGJchgLUBlV3w-1; Thu, 15 Apr 2021 09:59:11 -0400
X-MC-Unique: gwk9P3JaNOGJchgLUBlV3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 304AB107ACE4;
 Thu, 15 Apr 2021 13:59:10 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-159.ams2.redhat.com
 [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83DFB6BF6B;
 Thu, 15 Apr 2021 13:59:04 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] block: preserve errno from fdatasync failures
Date: Thu, 15 Apr 2021 14:58:49 +0100
Message-Id: <20210415135851.862406-4-berrange@redhat.com>
In-Reply-To: <20210415135851.862406-1-berrange@redhat.com>
References: <20210415135851.862406-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When fdatasync() fails on a file backend we set a flag that
short-circuits any future attempts to call fdatasync(). The
first failure returns the true errno, but the later short-
circuited calls return a generic EIO. The latter is unhelpful
because fdatasync() can return a variety of errnos, including
EACCESS.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/file-posix.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 20e14f8e96..99cf452f84 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -160,7 +160,7 @@ typedef struct BDRVRawState {
     bool discard_zeroes:1;
     bool use_linux_aio:1;
     bool use_linux_io_uring:1;
-    bool page_cache_inconsistent:1;
+    int page_cache_inconsistent; /* errno from fdatasync failure */
     bool has_fallocate;
     bool needs_alignment;
     bool drop_cache;
@@ -1357,7 +1357,7 @@ static int handle_aiocb_flush(void *opaque)
     int ret;
 
     if (s->page_cache_inconsistent) {
-        return -EIO;
+        return -s->page_cache_inconsistent;
     }
 
     ret = qemu_fdatasync(aiocb->aio_fildes);
@@ -1376,7 +1376,7 @@ static int handle_aiocb_flush(void *opaque)
          * Obviously, this doesn't affect O_DIRECT, which bypasses the page
          * cache. */
         if ((s->open_flags & O_DIRECT) == 0) {
-            s->page_cache_inconsistent = true;
+            s->page_cache_inconsistent = errno;
         }
         return -errno;
     }
-- 
2.30.2


