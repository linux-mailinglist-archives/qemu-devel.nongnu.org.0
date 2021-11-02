Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E87443270
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:13:31 +0100 (CET)
Received: from localhost ([::1]:42786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwPi-0002gM-Lh
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIQ-0007Jo-8e
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIK-0004FY-5H
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lb1DtjlN9Wg1pUsbYe2PQMDoMso7alWUBwWJgX+/DTk=;
 b=aJCPgVOjuVfYlcgm/blIp0vNkWoriFxpUhKDWhasj58WaTJN7d/5fs0zIg6j345N8LRqnh
 /cj4qMfzQH7Vc6vEqPJVuGU6obgiqEG2Z8WmqvREEP+4q2R1pb87NaqzNoc4P4WYPdXUAw
 013+a1g6va2dUCdM5qirjMPY1hhAuq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-mYy-_HNdNhWE-bUsxnpnVQ-1; Tue, 02 Nov 2021 12:05:47 -0400
X-MC-Unique: mYy-_HNdNhWE-bUsxnpnVQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C1371006AA2;
 Tue,  2 Nov 2021 16:05:46 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2A25D9D3;
 Tue,  2 Nov 2021 16:05:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/12] block/file-posix: Fix return value translation for AIO
 discards
Date: Tue,  2 Nov 2021 17:05:17 +0100
Message-Id: <20211102160528.206766-2-kwolf@redhat.com>
In-Reply-To: <20211102160528.206766-1-kwolf@redhat.com>
References: <20211102160528.206766-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ari Sundholm <ari@tuxera.com>

AIO discards regressed as a result of the following commit:
	0dfc7af2 block/file-posix: Optimize for macOS

When trying to run blkdiscard within a Linux guest, the request would
fail, with some errors in dmesg:

---- [ snip ] ----
[    4.010070] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE
[    4.011061] sd 2:0:0:0: [sda] tag#0 Sense Key : Aborted Command
[current]
[    4.011061] sd 2:0:0:0: [sda] tag#0 Add. Sense: I/O process
terminated
[    4.011061] sd 2:0:0:0: [sda] tag#0 CDB: Unmap/Read sub-channel 42
00 00 00 00 00 00 00 18 00
[    4.011061] blk_update_request: I/O error, dev sda, sector 0
---- [ snip ] ----

This turns out to be a result of a flaw in changes to the error value
translation logic in handle_aiocb_discard(). The default return value
may be left untranslated in some configurations, and the wrong variable
is used in one translation.

Fix both issues.

Fixes: 0dfc7af2b28 ("block/file-posix: Optimize for macOS")
Cc: qemu-stable@nongnu.org
Signed-off-by: Ari Sundholm <ari@tuxera.com>
Signed-off-by: Emil Karlson <jkarlson@tuxera.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211019110954.4170931-1-ari@tuxera.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 53be0bdc1b..6def2a4cba 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1807,7 +1807,7 @@ static int handle_aiocb_copy_range(void *opaque)
 static int handle_aiocb_discard(void *opaque)
 {
     RawPosixAIOData *aiocb = opaque;
-    int ret = -EOPNOTSUPP;
+    int ret = -ENOTSUP;
     BDRVRawState *s = aiocb->bs->opaque;
 
     if (!s->has_discard) {
@@ -1829,7 +1829,7 @@ static int handle_aiocb_discard(void *opaque)
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
         ret = do_fallocate(s->fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
                            aiocb->aio_offset, aiocb->aio_nbytes);
-        ret = translate_err(-errno);
+        ret = translate_err(ret);
 #elif defined(__APPLE__) && (__MACH__)
         fpunchhole_t fpunchhole;
         fpunchhole.fp_flags = 0;
-- 
2.31.1


