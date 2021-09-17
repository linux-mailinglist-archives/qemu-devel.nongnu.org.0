Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E2F40F1B8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:44:33 +0200 (CEST)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6fn-0007my-U6
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cW-0004px-Lm
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cT-0003GW-MU
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PwRmHKZt7KaXc3PjOa6poVzGcltWXg9N2KQYvkiuoiU=;
 b=FLjDY687fRuyy42fMkm0E9WFCwu9E2m43GLxDr8XO47RXbUJNzjTKRcFS4mlTFhABwH5FI
 L14MsoBhqAaDfjO6/biLZ3AehwxrbZN0TYuS8w4Ob+E8AV7OKg5lMX1+GGbs6g6yT0RWUG
 1Cc91oXo2lHLDecqLAj5V56oT677bBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-eiaq5maQPreoBrvNLAeH1w-1; Fri, 17 Sep 2021 01:41:01 -0400
X-MC-Unique: eiaq5maQPreoBrvNLAeH1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 694741084687;
 Fri, 17 Sep 2021 05:41:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 965B077F3C;
 Fri, 17 Sep 2021 05:40:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/15] Switch iotests to using Async QMP
Date: Fri, 17 Sep 2021 01:40:32 -0400
Message-Id: <20210917054047.2042843-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210916220716.1353698-1-jsnow@redhat.com>=0D
Based-on: <20210915162955.333025-1-jsnow@redhat.com>=0D
          [PULL 0/2] Python patches=0D
          [PATCH v4 00/27] python: introduce Asynchronous QMP package=0D
=0D
Hiya,=0D
=0D
This series continues where the first AQMP series left off and adds a=0D
synchronous 'legacy' wrapper around the new AQMP interface, then drops=0D
it straight into iotests to prove that AQMP is functional and totally=0D
cool and fine.=0D
=0D
In the event that a regression happens and I am not physically proximate=0D
to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variable=0D
to any non-empty string as it pleases you to engage the QMP machinery=0D
you are used to.=0D
=0D
I'd like to try and get this committed early in the 6.2 development=0D
cycle to give ample time to smooth over any possible regressions.=0D
I've tested it locally and via gitlab CI and "worksforme".=0D
=0D
John Snow (15):=0D
  python/aqmp: add greeting property to QMPClient=0D
  python/aqmp: add .empty() method to EventListener=0D
  python/aqmp: Return cleared events from EventListener.clear()=0D
  python/qmp: clear events on get_events() call=0D
  python/qmp: add send_fd_scm directly to QEMUMonitorProtocol=0D
  python, iotests: remove socket_scm_helper=0D
  python/aqmp: add send_fd_scm=0D
  python/aqmp: Create MessageModel and StandaloneModel classes=0D
  python/machine: remove has_quit argument=0D
  python/machine: Add support for AQMP backend=0D
  python/aqmp: Create sync QMP wrapper for iotests=0D
  iotests: Disable AQMP logging under non-debug modes=0D
  iotests: Accommodate async QMP Exception classes=0D
  python/aqmp: Remove scary message=0D
  python, iotests: replace qmp with aqmp=0D
=0D
 tests/qemu-iotests/socket_scm_helper.c    | 136 ---------------------=0D
 python/qemu/aqmp/__init__.py              |  14 ---=0D
 python/qemu/aqmp/events.py                |  15 ++-=0D
 python/qemu/aqmp/legacy.py                | 131 ++++++++++++++++++++=0D
 python/qemu/aqmp/models.py                |  67 ++++++++---=0D
 python/qemu/aqmp/qmp_client.py            |  22 ++++=0D
 python/qemu/machine/machine.py            | 139 +++++++++++++---------=0D
 python/qemu/machine/qtest.py              |   2 -=0D
 python/qemu/qmp/__init__.py               |  25 ++--=0D
 python/qemu/qmp/qmp_shell.py              |   1 -=0D
 scripts/simplebench/bench_block_job.py    |   3 +-=0D
 tests/Makefile.include                    |   1 -=0D
 tests/meson.build                         |   4 -=0D
 tests/qemu-iotests/040                    |   7 +-=0D
 tests/qemu-iotests/218                    |   2 +-=0D
 tests/qemu-iotests/255                    |   2 +-=0D
 tests/qemu-iotests/iotests.py             |   5 +-=0D
 tests/qemu-iotests/meson.build            |   5 -=0D
 tests/qemu-iotests/testenv.py             |   8 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms |   6 +-=0D
 20 files changed, 321 insertions(+), 274 deletions(-)=0D
 delete mode 100644 tests/qemu-iotests/socket_scm_helper.c=0D
 create mode 100644 python/qemu/aqmp/legacy.py=0D
 delete mode 100644 tests/qemu-iotests/meson.build=0D
=0D
--=20=0D
2.31.1=0D
=0D


