Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416362F4CF1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:18:14 +0100 (CET)
Received: from localhost ([::1]:59680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgyT-0004UG-9R
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzgnI-0002xJ-S6
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:06:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzgn3-0003Xw-06
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610546782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=46Q08HyWUZ/ZVfJVQZ4DEqdROPwYepYeeZ59SFyUJ08=;
 b=UBnlCTzw9nmQQFNodmL2N9/3rs7aZY4YPo0gv0++2xDWRqe6RJJkVoxdD2ZeYiSkY4x6i2
 YGkF+ApD3TFgH2wuBxQqygoWHClZccJOgPxuVO0xlV0yjJF24Mu3PRti4G60NsES4n3ggT
 heSATGnQUQ+o7UjYe1aGBIcX5f5PnEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-4QuH7xEkPXqvMYbLKRt1zQ-1; Wed, 13 Jan 2021 09:06:19 -0500
X-MC-Unique: 4QuH7xEkPXqvMYbLKRt1zQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F8E580667A;
 Wed, 13 Jan 2021 14:06:18 +0000 (UTC)
Received: from localhost (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B36E36F976;
 Wed, 13 Jan 2021 14:06:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/7] iotests/129: Fix it
Date: Wed, 13 Jan 2021 15:06:09 +0100
Message-Id: <20210113140616.150283-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

There are some problems with iotests 129 (perhaps more than these, but
these are the ones I know of):

1. It checks @busy to see whether a block job is still running; however,
   block jobs tend to unset @busy all the time (when they yield).
   [Fixed by patch 3]

2. It uses blockdev throttling, which quite some time ago has been moved
   to the BB level; since then, such throttling will no longer affect
   block jobs.  We can get throttling to work by using a throttle filter
   node.
   [Fixed by patch 4]

3. The mirror job has a large buffer size by default.  A simple drain
   may lead to it making significant process, which is kind of
   dangerous, because we don’t want the job to complete.
   To get around this, we can simply limit its buffer size.  (And we
   should make the commit job an actual commit job instead of an active
   commit (which is just mirror), because the commit interface does not
   allow setting a buffer size.)
   [Fixed by patches 5 and 6]

This series fixes those things, and now 129 seems to reliably pass for
me.


Apart from the major issues above, there are also minor flaws:

- It doesn’t remove the test images.
  [Fixed by patches 1 and 2]

- pylint and mypy complain.
  (Running mypy with the options given in 297.)
  [Patch 4 removes one pylint complaint; patch 7 the rest.]


Max Reitz (7):
  iotests: Move try_remove to iotests.py
  iotests/129: Remove test images in tearDown()
  iotests/129: Do not check @busy
  iotests/129: Use throttle node
  iotests/129: Actually test a commit job
  iotests/129: Limit mirror job's buffer size
  iotests/129: Clean up pylint and mypy complaints

 tests/qemu-iotests/124        |  8 +---
 tests/qemu-iotests/129        | 76 ++++++++++++++++++++++-------------
 tests/qemu-iotests/iotests.py | 11 +++--
 3 files changed, 55 insertions(+), 40 deletions(-)

-- 
2.29.2


