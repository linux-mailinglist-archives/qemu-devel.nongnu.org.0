Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D331431F0F7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:28:38 +0100 (CET)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpuf-00085G-Qt
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpiX-0005PR-2I
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpiP-0000L4-3i
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613679348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lb+A7NjLOTHq64qqLSA9PvyrBUIxt4UfWXkvuo5Y8iE=;
 b=P3x4NQk7KTssNNnihMlVLywV53/AtUSrEfEFvJKroDLCgg3UTaj8Lr3jl1moMR7FuA9dS8
 kd4xnCzdxme4tCJgNcfEOjCdpzuayXB+LowHIFbmQNztx67YPbXJ1m47cNk4WDkS0LSVxO
 9pWRg6L9hE0H1bTlSR0z9KV4zHE6QiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-Hbos65TtNxm9zZdJU2_PAw-1; Thu, 18 Feb 2021 15:15:43 -0500
X-MC-Unique: Hbos65TtNxm9zZdJU2_PAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB93F107ACF9;
 Thu, 18 Feb 2021 20:15:42 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-156.phx2.redhat.com [10.3.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BCFF50C0E;
 Thu, 18 Feb 2021 20:15:42 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] do not apply: Revert "nbd-client: Work around server
 BLOCK_STATUS misalignment at EOF"
Date: Thu, 18 Feb 2021 14:15:28 -0600
Message-Id: <20210218201528.127099-6-eblake@redhat.com>
In-Reply-To: <20210218201528.127099-1-eblake@redhat.com>
References: <20210218201528.127099-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 737d3f524481bb2ef68d3eba1caa636ff143e16a.

This is intended only for testing purposes: if you apply this without
the rest of the series, iotest 241 no longer benefits from the client
side working around server non-compliance.

---
 block/nbd.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index c26dc5a54f52..34c91f68e150 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -937,36 +937,14 @@ static int nbd_parse_blockstatus_payload(BDRVNBDState *s,
     extent->length = payload_advance32(&payload);
     extent->flags = payload_advance32(&payload);

-    if (extent->length == 0) {
+    if (extent->length == 0 ||
+        (s->info.min_block && !QEMU_IS_ALIGNED(extent->length,
+                                               s->info.min_block))) {
         error_setg(errp, "Protocol error: server sent status chunk with "
-                   "zero length");
+                   "invalid length");
         return -EINVAL;
     }

-    /*
-     * A server sending unaligned block status is in violation of the
-     * protocol, but as qemu-nbd 3.1 is such a server (at least for
-     * POSIX files that are not a multiple of 512 bytes, since qemu
-     * rounds files up to 512-byte multiples but lseek(SEEK_HOLE)
-     * still sees an implicit hole beyond the real EOF), it's nicer to
-     * work around the misbehaving server. If the request included
-     * more than the final unaligned block, truncate it back to an
-     * aligned result; if the request was only the final block, round
-     * up to the full block and change the status to fully-allocated
-     * (always a safe status, even if it loses information).
-     */
-    if (s->info.min_block && !QEMU_IS_ALIGNED(extent->length,
-                                                   s->info.min_block)) {
-        trace_nbd_parse_blockstatus_compliance("extent length is unaligned");
-        if (extent->length > s->info.min_block) {
-            extent->length = QEMU_ALIGN_DOWN(extent->length,
-                                             s->info.min_block);
-        } else {
-            extent->length = s->info.min_block;
-            extent->flags = 0;
-        }
-    }
-
     /*
      * We used NBD_CMD_FLAG_REQ_ONE, so the server should not have
      * sent us any more than one extent, nor should it have included
-- 
2.30.1


