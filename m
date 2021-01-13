Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1082F5190
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 19:00:18 +0100 (CET)
Received: from localhost ([::1]:50544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzkRN-0003Sr-BE
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 13:00:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzkPF-0001dV-Ei
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:58:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzkPC-0000tB-Ku
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610560678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NL582VnSIbEFYw9y7D7Uui/9R9pwmRjxUYUmIF0ARt8=;
 b=anfNVz4ur+CXalYuBlsNam+yVrhkuplOizFJ481VYXg2k9UDDR3wtYd6rcYMmnSc89/4o8
 w77uZguI0cxu8QG0Ms6Ps5cC4WOxd6hvU6qqG/OMrWNCUBDpF6azckFjzYL6TXJ6d0Bq5X
 PCXF+kuzFA3lqPrzyMPyXCLmkfyo7s0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-63kuXx06MQOVOUWuYfqcBg-1; Wed, 13 Jan 2021 12:57:55 -0500
X-MC-Unique: 63kuXx06MQOVOUWuYfqcBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D688066E0;
 Wed, 13 Jan 2021 17:57:54 +0000 (UTC)
Received: from localhost (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2310910016F7;
 Wed, 13 Jan 2021 17:57:53 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: =?UTF-8?q?=5BPATCH=20v2=200/8=5D=20iotests=3A=20Fix=20129=20and=20expand=20297=E2=80=99s=20reach?=
Date: Wed, 13 Jan 2021 18:57:44 +0100
Message-Id: <20210113175752.403022-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

v1 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00254.html

Hi,

See the cover letter above for the main point of this series (it’s just
that all patch indices are shifted up by one in v2).

In addition to that, I’ve added patch 1 that makes some changes to 297
so it checks all Python files in qemu-iotests/ by default (with an
extensive skip list for now).  With Vladimir’s changes to test naming,
we’ll need to extend this to include files under qemu-iotests/tests/,
but that shouldn’t be a problem.

v2:
- Added patch 1 so 297 checks all Python files in qemu-iotests/ by
  default, skipping “only” files given in an explicit list.  This list
  is extremely long right now, but at least patch 8 makes it one entry
  shorter.

- Patch 5:
  - Use multi-line string concatenation without +
  - Drop block-job-cancel

- Patch 6:
  - Use multi-line string concatenation without +

- Patch 7:
  - Changed the commit message from implying that 'stop' shouldn’t drain
    the block job (it does and it should) to stating that 'stop'
    shouldn’t make the block job try to complete

- Patch 8:
  - Remove 129 from 297’s new skip list


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/8:[down] 'iotests/297: Allow checking all Python test files'
002/8:[----] [--] 'iotests: Move try_remove to iotests.py'
003/8:[----] [--] 'iotests/129: Remove test images in tearDown()'
004/8:[----] [--] 'iotests/129: Do not check @busy'
005/8:[0008] [FC] 'iotests/129: Use throttle node'
006/8:[0002] [FC] 'iotests/129: Actually test a commit job'
007/8:[----] [--] 'iotests/129: Limit mirror job's buffer size'
008/8:[0003] [FC] 'iotests/129: Clean up pylint and mypy complaints'


Max Reitz (8):
  iotests/297: Allow checking all Python test files
  iotests: Move try_remove to iotests.py
  iotests/129: Remove test images in tearDown()
  iotests/129: Do not check @busy
  iotests/129: Use throttle node
  iotests/129: Actually test a commit job
  iotests/129: Limit mirror job's buffer size
  iotests/129: Clean up pylint and mypy complaints

 tests/qemu-iotests/124        |  8 +---
 tests/qemu-iotests/129        | 74 +++++++++++++++++++++--------------
 tests/qemu-iotests/297        | 66 ++++++++++++++++++++++++++++---
 tests/qemu-iotests/297.out    |  7 +++-
 tests/qemu-iotests/iotests.py | 11 ++++--
 5 files changed, 119 insertions(+), 47 deletions(-)

-- 
2.29.2


