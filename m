Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE25431F0E4
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:20:37 +0100 (CET)
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpmu-0007zP-Sz
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpiA-0005Cf-H3
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:15:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpi2-0000Af-Sb
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613679332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G1n1y3bHTmglUIecszyf9GBz/6JZFmVU6mNf/K87r8s=;
 b=QrgVULynpw5gA/hPEX4CJGMG0aHM7kw1ShFkzU4yw0mN+M6yOjDizoX8XCjuZkDZOTnzVT
 vO3nVqIv71CDp8A4JcqkfxBzy8WHs8I9qzUxhgIgwsmYQ6blMRD6LFzT7yP3ciJ7JxH8oK
 z5RcTuwWh1sLKFj4aPIYijKWz8H+JFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-HjXHpjB6N3-bghZtfOIxQQ-1; Thu, 18 Feb 2021 15:15:30 -0500
X-MC-Unique: HjXHpjB6N3-bghZtfOIxQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37F3081473E;
 Thu, 18 Feb 2021 20:15:29 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-156.phx2.redhat.com [10.3.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEB3250C0E;
 Thu, 18 Feb 2021 20:15:28 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] Obey NBD spec regarding block size bounds on reply
Date: Thu, 18 Feb 2021 14:15:23 -0600
Message-Id: <20210218201528.127099-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've had some known long-standing compliance bugs in our NBD server
not always honoring a minimum block size in its response to client
requests, when dealing with an image with a large block size backed by
another image with a smaller block size (for example, an encrypted
qcow2 image has a minimum block size of 512, backed by a file whose
size is not a multiple of 512).  Fragmenting our reply to NBD_CMD_READ
or NBD_CMD_BLOCK_STATUS to something smaller than our advertised
minimum block size can confuse a client (in fact, qemu 3.2 would
abort() on such messages, although we patched the client to be
tolerant of non-compliant servers for qemu 4.0).  Thankfully, most
day-to-day uses of NBD don't run into these cases.

Back in 2019, I did propose a fix for the server[1], but it was
incomplete at the time because I couldn't write a reliable iotest
(using blkdebug failed, because it was a filter that blocked access to
exposing the dirty bitmap), and the patches were too close to the 4.0
release for a corner case that did not occur frequently in practice,
so it moved to my back burner.  But now that we have fixed the ability
to see through the blkdebug filter, and have in the meantime added the
qemu:allocation-depth context that also suffers from the same problem,
I have finally updated this series to a state that I'm happy with.

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg00589.html

Patch 5 is merely to aid in testing, by disabling the client
workaround that has been present since qemu 4.0 (since the revert is
no longer trivial).

Eric Blake (5):
  iotests: Update 241 to expose backing layer fragmentation
  block: Fix BDRV_BLOCK_RAW status to honor alignment
  nbd/server: Avoid unaligned read/block_status from backing
  nbd/server: Avoid unaligned dirty-bitmap status
  do not apply: Revert "nbd-client: Work around server BLOCK_STATUS
    misalignment at EOF"

 block/coroutines.h         |   2 +
 include/block/block.h      |   2 +
 block/io.c                 | 210 ++++++++++++++++++++++++++++++++++---
 block/nbd.c                |  30 +-----
 block/quorum.c             |   7 +-
 nbd/server.c               |  42 ++++++--
 tests/qemu-iotests/221     |  13 +++
 tests/qemu-iotests/221.out |   9 ++
 tests/qemu-iotests/241     |  58 +++++++++-
 tests/qemu-iotests/241.out |  24 ++++-
 10 files changed, 337 insertions(+), 60 deletions(-)

-- 
2.30.1


