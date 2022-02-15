Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793084B6E70
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 15:11:40 +0100 (CET)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyYN-0004tk-G3
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 09:11:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nJyKv-0002CR-MV
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:57:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nJyKt-0002LL-Gg
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644933462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0vJaUduL62c1OYe8zy3dfQP7pNPgrIp1nOI9UowtxV8=;
 b=FEVPICzzmb+ySyP6vKkKtx9jZaSFmACGQhq/f/dIigxq4WEAy6k9ieMCYrQZQ1LFtTwOs6
 HZajcm6I1WqU6IbnXhZ7chZfEES2pimeAYCUIJkQwD39K3YeGxwBRE7geK4QrKjHyoD2Gm
 qUCfrsSVW/vnAW4L0RjgCn4OynV6f8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-fJS5POwoN4OKvGGXPbCqdA-1; Tue, 15 Feb 2022 08:57:38 -0500
X-MC-Unique: fJS5POwoN4OKvGGXPbCqdA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADACB1006AD3;
 Tue, 15 Feb 2022 13:57:35 +0000 (UTC)
Received: from localhost (unknown [10.39.195.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ABF47C0F5;
 Tue, 15 Feb 2022 13:57:29 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] block: Make bdrv_refresh_limits() non-recursive
Date: Tue, 15 Feb 2022 14:57:24 +0100
Message-Id: <20220215135727.28521-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Most bdrv_refresh_limits() callers do not drain the subtree of the node
whose limits are refreshed, so concurrent I/O requests to child nodes
can occur (if the node is in an I/O thread).  bdrv_refresh_limits() is
recursive, so such requests can happen to a node whose limits are being
refreshed.

bdrv_refresh_limits() is not atomic, and so the I/O requests can
encounter invalid limits, like a 0 request_alignment.  This will crash
qemu (e.g. because of a division by 0, or a failed assertion).

On inspection, bdrv_refresh_limits() doesn’t look like it really needs
to be recursive.  It just has always been.  Dropping the recursion fixes
those crashes, because all callers of bdrv_refresh_limits() make sure
one way or another that concurrent requests to the node whose limits are
to be refreshed are at leased paused (by draining, and/or by acquiring
the AioContext).

I see two other ways to fix it:
(A) Have all bdrv_refresh_limits() callers drain the entire subtree,
(B) Protect BDS.bl with RCU, which would make concurrent I/O just fine.

(A) is kind of ugly, and after starting down that path two times, both
times I decided I didn’t want to follow through with it.  It was always
an AioContext-juggling mess.  (E.g. bdrv_set_backing_hd() would need to
drain the subtree; but that means having to acquire the `backing_hd`
context, too, because `bs` might be moved into that context, and so when
`backing_hd` is attached to `bs`, `backing_hd` would be drained in the
new context.  But we can’t acquire a context twice, so we can only
acquire `backing_hd`’s context if the caller hasn’t done so already.
But the worst is that we can’t actually acquire that context: If `bs` is
moved into `backing_hd`’s context, then `bdrv_set_aio_context_ignore()`
requires us not to hold that context.  It’s just kind of a mess.)

I tried (B), and it worked, and I liked it very much; but it requires
quite a bit of refactoring (every BDS.bl reader must then use
qatomic_rcu_read() and take the RCU read lock), so it feels really
difficult to justify when the fix this series proposes just removes four
lines of code.


Hanna Reitz (3):
  block: Make bdrv_refresh_limits() non-recursive
  iotests: Allow using QMP with the QSD
  iotests/graph-changes-while-io: New test

 block/io.c                                    |  4 -
 tests/qemu-iotests/iotests.py                 | 29 +++++-
 .../qemu-iotests/tests/graph-changes-while-io | 91 +++++++++++++++++++
 .../tests/graph-changes-while-io.out          |  5 +
 4 files changed, 124 insertions(+), 5 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/graph-changes-while-io
 create mode 100644 tests/qemu-iotests/tests/graph-changes-while-io.out

-- 
2.34.1


