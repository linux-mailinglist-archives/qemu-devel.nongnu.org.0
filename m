Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C348E4A88A2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 17:35:03 +0100 (CET)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFf4Y-00032g-RY
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 11:35:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf0I-0007yb-Kv
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:30:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nFf0D-00006P-Js
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643905831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fpPjDMw+XksBUHc189TjVes1PMs4w6YASyCxAU2i1NM=;
 b=Zf/7UTQlRso5yLaT8v2AaxXQT74b4icPnqPlSB+z7Z7sIGJ8UbHw+U6sTErZwSM0tYlg+G
 LVEjDMHOpuPYpEGHTuvoSW8Nd8iv24cVLZaazwHwqftIOpmgs4luwPxPwtTv6xV+e7l0Kq
 QGRYLgawOyBZCMW+c0LjKniLhUTEgkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-g2yFQifSNZeGLnzInhpnEA-1; Thu, 03 Feb 2022 11:30:28 -0500
X-MC-Unique: g2yFQifSNZeGLnzInhpnEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ED191923E22;
 Thu,  3 Feb 2022 16:30:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F7257E2FC;
 Thu,  3 Feb 2022 16:30:26 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/7] block/nbd: Move s->ioc on AioContext change
Date: Thu,  3 Feb 2022 17:30:17 +0100
Message-Id: <20220203163024.38913-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I’ve sent an RFC for this before, which can be found here:

https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00765.html

...and is basically patch 6 in this series.

That was an RFC for two reasons:
(1) I didn’t know what to do with the two timers that the NBD BDS has
    (the open timer and the reconnect delay timer), and
(2) it didn’t include a regression test.

This v1 addresses (2) in the obvious manner (by adding a test), and (1)
like Vladimir has proposed, namely by asserting there are no timers on
AioContext change, because there shouldn’t by any.

The problem is that that assertion is wrong for both timers.  As far as
I can tell, both of them are created so they will cancel the respective
(re-)connection attempt after a user-configurable interval.  However,
they are not deleted when that attempt succeeds (or otherwise returns
before the interval).  So if the attempt does succeed, both of them will
persist for however long they are configured, and they are are never
disarmed/deleted anywhere, not even when the BDS is freed.

That’s a problem beyond “what do I do with them on AioContext change”,
because it means if you delete the BDS when one of those timers is still
active, the timer will still fire afterwards and access (and
dereference!) freed data.

The solution should be clear, though, because as Vladimir has said, they
simply shouldn’t persist.  So once the respective (re-)connection
attempt returns, this series makes it so they are deleted (patches 1 and
2).

Patch 3 adds an assertion that the timers are gone when the BDS is
closed, so that we definitely won’t run into a situation where they
access freed data.


Hanna Reitz (7):
  block/nbd: Delete reconnect delay timer when done
  block/nbd: Delete open timer when done
  block/nbd: Assert there are no timers when closed
  iotests.py: Add QemuStorageDaemon class
  iotests/281: Test lingering timers
  block/nbd: Move s->ioc on AioContext change
  iotests/281: Let NBD connection yield in iothread

 block/nbd.c                   |  64 +++++++++++++++++++++
 tests/qemu-iotests/281        | 101 +++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/281.out    |   4 +-
 tests/qemu-iotests/iotests.py |  42 ++++++++++++++
 4 files changed, 207 insertions(+), 4 deletions(-)

-- 
2.34.1


