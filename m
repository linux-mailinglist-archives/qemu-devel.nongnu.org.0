Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C5216F34
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 16:47:49 +0200 (CEST)
Received: from localhost ([::1]:51964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsosu-0006Jr-3q
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 10:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jsorv-0005k7-7w
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 10:46:47 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47277
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jsorp-0007hT-7p
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 10:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594133199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8uRqbq9+MGzTzxMr5ja7NLIkCymq/NQVdrEfBxzsaNI=;
 b=W324qQbHVPQrPVPfNx+m5RZl4deiWjCGxHTbZ7ad8qfjE/1zpKFoSRn6QGvRcBDsPEES4f
 3QRV2SdIX1iHpdmXMmcASp2wIAv4O7zn+m0gigKAbndjZMZP0oxwxwBwwB0/9mt2foq5iL
 32RcU8MPaoFp37ZvtnjUl6XKFMw2fD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-hGipqnMGMciNUEmyxoNk1Q-1; Tue, 07 Jul 2020 10:46:38 -0400
X-MC-Unique: hGipqnMGMciNUEmyxoNk1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E69941005510;
 Tue,  7 Jul 2020 14:46:36 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-113.ams2.redhat.com
 [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1D5F5C1B2;
 Tue,  7 Jul 2020 14:46:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] qemu-img map: Don't limit block status request size
Date: Tue,  7 Jul 2020 16:46:29 +0200
Message-Id: <20200707144629.51235-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:20:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Limiting each loop iteration of qemu-img map to 1 GB was arbitrary from
the beginning, though it only cut the maximum in half then because the
interface a signed 32 bit byte count. These days, bdrv_block_status()
supports a 64 bit byte count, so the arbitrary limit is even worse.

On file-posix, bdrv_block_status() eventually maps to SEEK_HOLE and
SEEK_DATA, which don't support a limit, but always do all of the work
necessary to find the start of the next hole/data. Much of this work may
be repeated if we don't use this information fully, but query with an
only slightly larger offset in the next loop iteration. Therefore, if
bdrv_block_status() is called in a loop, it should always pass the
full number of bytes that the whole loop is interested in.

This removes the arbitrary limit and speeds up 'qemu-img map'
significantly on heavily fragmented images.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-img.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index bdb9f6aa46..74946f81ca 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3217,12 +3217,9 @@ static int img_map(int argc, char **argv)
     curr.start = start_offset;
     while (curr.start + curr.length < length) {
         int64_t offset = curr.start + curr.length;
-        int64_t n;
+        int64_t n = length - offset;
 
-        /* Probe up to 1 GiB at a time.  */
-        n = MIN(1 * GiB, length - offset);
         ret = get_block_status(bs, offset, n, &next);
-
         if (ret < 0) {
             error_report("Could not read file metadata: %s", strerror(-ret));
             goto out;
-- 
2.25.4


