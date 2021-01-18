Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465C2F9D67
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:02:07 +0100 (CET)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1SIQ-0004nY-43
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1SE8-000838-Ec
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:57:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1SE5-00015f-Sd
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610967457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K0ttacKL5hf6CY2S9p2MzwHSL0uguN3mncHT6JxCqyw=;
 b=eT2j5xgI0uXb9RiBlBQw5lrjsJUTRefcTXwGQ5YqTNou5yfOez1jE5HCtVxKMLOcDSLah2
 7Fot9K9iMIv36WgRLZAYHSAbiMaQydSp3q5lFkKrLz7gL4TkmYtpqeaDIgOq2TWVmv/w/k
 0yMxFmWCmsDoahL9GWG9WoXwugZ2pTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-59_fABOhOguQ3H6Br8_teg-1; Mon, 18 Jan 2021 05:57:23 -0500
X-MC-Unique: 59_fABOhOguQ3H6Br8_teg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D34E806664;
 Mon, 18 Jan 2021 10:57:22 +0000 (UTC)
Received: from localhost (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D6836F7E7;
 Mon, 18 Jan 2021 10:57:21 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: =?UTF-8?q?=5BPATCH=20v5=2000/10=5D=20iotests=3A=20Fix=20129=20and=20expand=20297=E2=80=99s=20reach?=
Date: Mon, 18 Jan 2021 11:57:10 +0100
Message-Id: <20210118105720.14824-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cover letters:
v1: https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00254.html
v2: https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00296.html
v3: https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00371.html
v4: https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00371.html

git:
https://github.com/XanClic/qemu.git fix-129-2-v5
https://git.xanclic.moe/XanClic/qemu.git fix-129-2-v5


Change in v5 (from v4):
- Patch 2:
  - Construct PYTHONPATH/MYPYPATH platform-independently
    - Use os.pathsep instead of hard-coding ':'
    - Use os.path.dirname(__file__) as the basis for '../../python'
      instead of adding a relative path to PYTHONPATH
    - Use os.path.join() instead of joining with '/'


git-backport-diff of v4 <-> v5:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/10:[----] [--] 'iotests.py: Assume a couple of variables as given'
002/10:[0006] [FC] 'iotests/297: Rewrite in Python and extend reach'
003/10:[----] [--] 'iotests: Move try_remove to iotests.py'
004/10:[----] [--] 'iotests/129: Remove test images in tearDown()'
005/10:[----] [--] 'iotests/129: Do not check @busy'
006/10:[----] [--] 'iotests/129: Use throttle node'
007/10:[----] [--] 'iotests/129: Actually test a commit job'
008/10:[----] [--] 'iotests/129: Limit mirror job's buffer size'
009/10:[----] [--] 'iotests/129: Clean up pylint and mypy complaints'
010/10:[----] [--] 'iotests/300: Clean up pylint and mypy complaints'


Max Reitz (10):
  iotests.py: Assume a couple of variables as given
  iotests/297: Rewrite in Python and extend reach
  iotests: Move try_remove to iotests.py
  iotests/129: Remove test images in tearDown()
  iotests/129: Do not check @busy
  iotests/129: Use throttle node
  iotests/129: Actually test a commit job
  iotests/129: Limit mirror job's buffer size
  iotests/129: Clean up pylint and mypy complaints
  iotests/300: Clean up pylint and mypy complaints

 tests/qemu-iotests/124        |   8 +--
 tests/qemu-iotests/129        |  72 +++++++++++++---------
 tests/qemu-iotests/297        | 112 +++++++++++++++++++++++++++-------
 tests/qemu-iotests/297.out    |   5 +-
 tests/qemu-iotests/300        |  19 ++++--
 tests/qemu-iotests/iotests.py |  37 +++++------
 6 files changed, 171 insertions(+), 82 deletions(-)

-- 
2.29.2


