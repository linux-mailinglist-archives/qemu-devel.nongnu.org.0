Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD6C3BB762
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 08:59:30 +0200 (CEST)
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0IZl-0004n8-1g
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 02:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m0IXp-0002Av-D2
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m0IXl-00045d-T3
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625468243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qHlw+ZZJu8m8m8HZCkjuds7wyNBCzEX57uD8t7k3OTo=;
 b=gj0kYat9BD/GSFwrYI9qjIXJYJTrerBTaPF9WY+2SL0l+ubuHEMq3cdeqsPdKYHbCvB1ob
 OxhYFxJdstFNID//O02OcNfQTkUwu178Odl0O+bZZMrfBolZQbfiw9iy3wWy0juCgYRCDU
 kTVH/9hNC/kIxtLiMIdWHJ3ooOJTQdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-ytsqnRAaMWWZpnaoxk56DQ-1; Mon, 05 Jul 2021 02:57:22 -0400
X-MC-Unique: ytsqnRAaMWWZpnaoxk56DQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A00301084F4C;
 Mon,  5 Jul 2021 06:57:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-244.ams2.redhat.com
 [10.36.112.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DE841002D71;
 Mon,  5 Jul 2021 06:57:13 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 00/16] qemu_iotests: improve debugging options
Date: Mon,  5 Jul 2021 08:56:55 +0200
Message-Id: <20210705065711.127119-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds the option to attach gdbserver and valgrind
to the QEMU binary running in qemu_iotests.
It also allows to redirect QEMU binaries output of the python tests
to the stdout, instead of a log file.

Patches 1-9 introduce the -gdb option to both python and bash tests, 
10-14 extend the already existing -valgrind flag to work also on 
python tests, and patch 15-16 introduces -p to enable logging to stdout.

In particular, patches 1,6,8,11 focus on extending the QMP socket timers
when using gdb/valgrind, otherwise the python tests will fail due to
delays in the QMP responses.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v7:
* Adjust documentation and error message when -gdb and -valgrind are set
  at the same time [Eric]
* Add missing Acked-by [John]

Emanuele Giuseppe Esposito (15):
  python: qemu: add timer parameter for qmp.accept socket
  python: qemu: pass the wrapper field from QEMUQtestmachine to
    QEMUMachine
  docs/devel/testing: add debug section to the QEMU iotests chapter
  qemu-iotests: add option to attach gdbserver
  qemu-iotests: delay QMP socket timers
  qemu_iotests: insert gdbserver command line as wrapper for qemu binary
  qemu-iotests: add gdbserver option to script tests too
  docs/devel/testing: add -gdb option to the debugging section of QEMU
    iotests
  qemu-iotests: extend the check script to prepare supporting valgrind
    for python tests
  qemu-iotests: extend QMP socket timeout when using valgrind
  qemu-iotests: allow valgrind to read/delete the generated log file
  qemu-iotests: insert valgrind command line as wrapper for qemu binary
  docs/devel/testing: add -valgrind option to the debug section of QEMU
    iotests
  qemu-iotests: add option to show qemu binary logs on stdout
  docs/devel/testing: add -p option to the debug section of QEMU iotests

John Snow (1):
  python: Reduce strictness of pylint's duplicate-code check

 docs/devel/testing.rst         | 29 ++++++++++++++++++++
 python/qemu/machine/machine.py | 16 +++++++----
 python/qemu/machine/qtest.py   |  9 ++++---
 python/setup.cfg               |  5 ++++
 tests/qemu-iotests/check       | 15 ++++++++---
 tests/qemu-iotests/common.qemu |  7 ++++-
 tests/qemu-iotests/common.rc   |  8 +++++-
 tests/qemu-iotests/iotests.py  | 49 ++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/testenv.py  | 23 ++++++++++++++--
 9 files changed, 143 insertions(+), 18 deletions(-)

-- 
2.31.1


