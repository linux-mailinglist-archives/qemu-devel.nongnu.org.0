Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5676B4CC27E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:18:42 +0100 (CET)
Received: from localhost ([::1]:54660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoA5-0006Ur-DC
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:18:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPnw0-00071o-5F
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:04:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPnvv-00075d-I8
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646323442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7GmJvOJYnCFotOewrqCWq/1GEy1MpTDgZLmPLpqoA4k=;
 b=TS4os7vSiFAV9AfuDqS8kqi6EWZsZJhNsnJGB3rHBti144XV+a4PzeHw16e2PFc7gGDpfU
 CzUqmgPzVLm69yMOevOocb1vyS/Yv7RmFhldgdWFHhoByZsj4m8yiym3u37sK4yBHNasWz
 6wSQ5L4oQ6zL/F74J2G6echuf7HUmsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-29jZP-YrOteItiRefEerMw-1; Thu, 03 Mar 2022 11:03:57 -0500
X-MC-Unique: 29jZP-YrOteItiRefEerMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 696DE1854E2D;
 Thu,  3 Mar 2022 16:03:56 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAF641006876;
 Thu,  3 Mar 2022 16:03:32 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/12] nbd: enable use of TLS on non-TCP transports and other
 TLS improvements
Date: Thu,  3 Mar 2022 16:03:18 +0000
Message-Id: <20220303160330.2979753-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series was principally motivated by a desire to enabl use of TLS=0D
on non-TCP transports. For x509 certificates this means we need a way=0D
to set the hostname to use for validation. This also lets us override=0D
the hostname when connecting on a TCP transport that is tunnelled or=0D
port-forwarded. It also unlocks the ability to use PSK (pre-shared=0D
keys) with UNIX sockets which would always have worked, had it not=0D
been blocked by explicit checks in NBD code.=0D
=0D
NB, the first patch in this series is common with my corresponding=0D
migration series for TLS=0D
=0D
  https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg00556.html=0D
=0D
Daniel P. Berrang=C3=A9 (12):=0D
  crypto: mandate a hostname when checking x509 creds on a client=0D
  block: pass desired TLS hostname through from block driver client=0D
  block/nbd: support override of hostname for TLS certificate validation=0D
  qemu-nbd: add --tls-hostname option for TLS certificate validation=0D
  block/nbd: don't restrict TLS usage to IP sockets=0D
  tests/qemu-iotests: add QEMU_IOTESTS_REGEN=3D1 to update reference file=
=0D
  tests/qemu-iotests: expand _filter_nbd rules=0D
  tests/qemu-iotests: introduce filter for qemu-nbd export list=0D
  tests/qemu-iotests: convert NBD TLS test to use standard filters=0D
  tests/qemu-iotests: validate NBD TLS with hostname mismatch=0D
  tests/qemu-iotests: validate NBD TLS with UNIX sockets=0D
  tests/qemu-iotests: validate NBD TLS with UNIX sockets and PSK=0D
=0D
 block/nbd.c                      | 25 +++++---=0D
 blockdev-nbd.c                   |  6 --=0D
 crypto/tlssession.c              |  6 ++=0D
 docs/tools/qemu-nbd.rst          | 14 +++++=0D
 include/block/nbd.h              |  3 +-=0D
 nbd/client-connection.c          | 12 +++-=0D
 qapi/block-core.json             |  3 +=0D
 qemu-nbd.c                       | 25 ++++++--=0D
 tests/qemu-iotests/233           | 99 +++++++++++++++++++++++++++-----=0D
 tests/qemu-iotests/233.out       | 56 +++++++++++++++---=0D
 tests/qemu-iotests/241           |  6 +-=0D
 tests/qemu-iotests/241.out       |  3 +=0D
 tests/qemu-iotests/common.filter |  9 +++=0D
 tests/qemu-iotests/common.tls    | 31 +++++++++-=0D
 tests/qemu-iotests/testrunner.py |  6 ++=0D
 15 files changed, 252 insertions(+), 52 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


