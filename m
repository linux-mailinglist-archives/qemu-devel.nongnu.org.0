Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F934CDD64
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:44:05 +0100 (CET)
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDqO-0003g7-JB
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:44:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDj6-0002kE-AI
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:36:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDj4-0004IF-56
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a+KmiA2pOUzyZfw6ENdiLEcrkmaR4qOPLFD+3z+pV0o=;
 b=ORXMAcZBLBjeSdJVOdd+iLxEKjcutn7AFhWqIHFrHcLdwxnH/ALw432d0yJy/FtHKFyGYz
 UH160aPzIeRrprjayCXYb7mA0WGNjGyfqcSXtZpA3mBQpoiQ95E8eA53hk2DZuUzuqvCwW
 dO5w0UJKlFyJH8YKbSeRScRX/lf/qPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-IeiLU-A8OqSi_h0--juQOg-1; Fri, 04 Mar 2022 14:36:25 -0500
X-MC-Unique: IeiLU-A8OqSi_h0--juQOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB5C31006AA6;
 Fri,  4 Mar 2022 19:36:24 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A85525DF21;
 Fri,  4 Mar 2022 19:36:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] nbd: enable use of TLS on non-TCP transports and
 other TLS improvements
Date: Fri,  4 Mar 2022 19:35:58 +0000
Message-Id: <20220304193610.3293146-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
In v2:=0D
=0D
  - Tweak the filter for qemu-nbd export list to expose export name=0D
  - Add "since" tag to QAPI addition=0D
  - Minor docs fixes=0D
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
 docs/tools/qemu-nbd.rst          | 13 +++++=0D
 include/block/nbd.h              |  3 +-=0D
 nbd/client-connection.c          | 12 +++-=0D
 qapi/block-core.json             |  3 +=0D
 qemu-nbd.c                       | 25 ++++++--=0D
 tests/qemu-iotests/233           | 99 +++++++++++++++++++++++++++-----=0D
 tests/qemu-iotests/233.out       | 56 +++++++++++++++---=0D
 tests/qemu-iotests/241           |  6 +-=0D
 tests/qemu-iotests/241.out       |  6 ++=0D
 tests/qemu-iotests/common.filter |  9 +++=0D
 tests/qemu-iotests/common.tls    | 31 +++++++++-=0D
 tests/qemu-iotests/testrunner.py |  6 ++=0D
 15 files changed, 255 insertions(+), 51 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


