Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E563B5E18
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:35:11 +0200 (CEST)
Received: from localhost ([::1]:44014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqTm-0001sc-TB
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lxqQp-0006lh-Sl
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lxqQm-00036k-6t
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624883522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V2bXOyM8OVLteTmGowMPJWnmTEerk25OWjhfREIS+DI=;
 b=fdBtu3t6CJlhI/r7wncN2qgu+uJrdnRu5x/g+Nofm0SPV6r4MUjaz8S4ES/lq+mQdO11fy
 UF+kJGtFl4hTYQMarsEqkvw1Bt14yk81kIWE0f/2TFlc7i03K5anVa87BK8WcYY+MXs2QR
 0gTWcXOluvosh6iByelc5ILSsbiWtkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-c346qzalP7Sf8nZ-OBTFlA-1; Mon, 28 Jun 2021 08:32:01 -0400
X-MC-Unique: c346qzalP7Sf8nZ-OBTFlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F4988BAF5C;
 Mon, 28 Jun 2021 12:31:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-69.ams2.redhat.com
 [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34EB319C46;
 Mon, 28 Jun 2021 12:31:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 00/16] qemu_iotests: improve debugging options
Date: Mon, 28 Jun 2021 14:31:34 +0200
Message-Id: <20210628123150.56567-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

In particular, patches 1,6,11 focus on extending the QMP socket timers
when using gdb/valgrind, otherwise the python tests will fail due to
delays in the QMP responses.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v7:
* While using debugging tests with gdb, I found out that there is a
  timer also in bash scripts (common.qemu). Modify patch 8 to remove
  the timer when gdb is used.

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

 docs/devel/testing.rst         | 30 +++++++++++++++++++++
 python/qemu/machine/machine.py | 16 +++++++----
 python/qemu/machine/qtest.py   |  9 ++++---
 python/setup.cfg               |  5 ++++
 tests/qemu-iotests/check       | 15 ++++++++---
 tests/qemu-iotests/common.qemu |  7 ++++-
 tests/qemu-iotests/common.rc   |  8 +++++-
 tests/qemu-iotests/iotests.py  | 49 ++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/testenv.py  | 23 ++++++++++++++--
 9 files changed, 144 insertions(+), 18 deletions(-)

-- 
2.31.1


