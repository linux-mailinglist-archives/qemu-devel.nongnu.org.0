Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F61A2DD45B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:41:35 +0100 (CET)
Received: from localhost ([::1]:40552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvPK-00078Y-EE
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kpvM8-0003Ws-3i
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kpvM5-00077a-3T
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608219489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vrh4rqW1+xPx6+dvAkXevPMXXq9Hczt82niyoGwSL5g=;
 b=TvuhnNDKFrb/yCKTEpTfU9krScwaEW1MaLuUH4v6vHRVSn12i1P0rzeKlhK4vDBoMmzQg3
 j6+y5eJkeSnkPtJR7tqVwcjKcvMZCTkyL8LG829L+qMBVrCgsaMc3mJjxKbo4+YKmyWHfe
 TVhp4YHaqvqPQ/ljJ0BbaYFeY7pimt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-QOHnUYPbOnCXbyEjvJpF4g-1; Thu, 17 Dec 2020 10:38:07 -0500
X-MC-Unique: QOHnUYPbOnCXbyEjvJpF4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66FBB809DD9;
 Thu, 17 Dec 2020 15:38:06 +0000 (UTC)
Received: from localhost (ovpn-112-159.ams2.redhat.com [10.36.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDEBE19C71;
 Thu, 17 Dec 2020 15:38:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] Fix _send_qemu_cmd with bash 5.1
Date: Thu, 17 Dec 2020 16:38:01 +0100
Message-Id: <20201217153803.101231-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

See patch 2 for what’s changed in bash 5.1 that makes this series
necessary, and what we need to do.  (tl;dr: Bash presumably fixed a bug
for array slices, and that now breaks nearly all iotests that use
_send_qemu_cmd – but we don’t even need an array slice there.)

Patch 1 fixes a bug in 102 in how it calls _send_qemu_cmd.  (This
becomes really visible with the change in patch 2.)

Comparing patch 2 to v1 (“iotests: Quote $cmd in _send_qemu_cmd”), the
reference output diffs haven’t changed, only the common.qemu hunk is
different.


Max Reitz (2):
  iotests/102: Pass $QEMU_HANDLE to _send_qemu_cmd
  iotests: Fix _send_qemu_cmd with bash 5.1

 tests/qemu-iotests/085.out     | 167 ++++++++++++++++++++++++++++-----
 tests/qemu-iotests/094.out     |  10 +-
 tests/qemu-iotests/095.out     |   4 +-
 tests/qemu-iotests/102         |   2 +-
 tests/qemu-iotests/102.out     |   2 +-
 tests/qemu-iotests/109.out     |  88 ++++++++++++-----
 tests/qemu-iotests/117.out     |  13 ++-
 tests/qemu-iotests/127.out     |  12 ++-
 tests/qemu-iotests/140.out     |  10 +-
 tests/qemu-iotests/141.out     | 128 +++++++++++++++++++------
 tests/qemu-iotests/143.out     |   4 +-
 tests/qemu-iotests/144.out     |  28 +++++-
 tests/qemu-iotests/153.out     |  18 ++--
 tests/qemu-iotests/156.out     |  39 ++++++--
 tests/qemu-iotests/161.out     |  18 +++-
 tests/qemu-iotests/173.out     |  25 ++++-
 tests/qemu-iotests/182.out     |  42 +++++++--
 tests/qemu-iotests/183.out     |  19 +++-
 tests/qemu-iotests/185.out     |  45 +++++++--
 tests/qemu-iotests/191.out     |  12 ++-
 tests/qemu-iotests/223.out     |  92 ++++++++++++------
 tests/qemu-iotests/229.out     |  13 ++-
 tests/qemu-iotests/249.out     |  16 +++-
 tests/qemu-iotests/308.out     | 103 +++++++++++++++++---
 tests/qemu-iotests/312.out     |  10 +-
 tests/qemu-iotests/common.qemu |  11 +--
 26 files changed, 730 insertions(+), 201 deletions(-)

-- 
2.29.2


