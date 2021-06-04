Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C9439B5C3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 11:19:31 +0200 (CEST)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5zG-0005Bh-EB
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 05:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lp5xX-00028G-A8
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:17:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lp5xR-0002mU-NV
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622798256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g8r1ewJolh36Nz49oHrNQOQonwARphd8jT42d0ZFz1I=;
 b=WVunvLzfOLG/aeOBtXU/zTN8922gqo93mnNN1onxp1F8cem/XIj3HUc8XPKXDzCnQIjH88
 Yq4vhvD1v2YjA7rl8CjdtpvYUECRBlNaMa1s+4gn16nSPMkfNnO6Ebt4GXISlXy62NLVcV
 u4Dcx5/AFubqhAdpe+g+hx+VS7vVhU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-MCiHij8iOOKtrzJKgt9ZzA-1; Fri, 04 Jun 2021 05:17:34 -0400
X-MC-Unique: MCiHij8iOOKtrzJKgt9ZzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 576131854E25;
 Fri,  4 Jun 2021 09:17:33 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-43.ams2.redhat.com
 [10.36.115.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFD0A6A042;
 Fri,  4 Jun 2021 09:17:24 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 00/16] qemu_iotests: improve debugging options
Date: Fri,  4 Jun 2021 11:17:07 +0200
Message-Id: <20210604091723.13419-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

This series is tested on the previous serie
"qemu-iotests: quality of life improvements"
but independent from it, so it can be applied separately.

It is also based on "iotests/check: move general long options to double dash"
by Vladimir Sementsov-Ogievskiy.

Based-on: <20210526181659.365531-1-vsementsov@virtuozzo.com>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v5:
* base this serie on the double dash options, so define --gdb instead of -gdb
* return error if -gdb and -valgrind are used together [Vladimir]
* style changes (do not use subprocess_check_valgrind() but do the operation
  inside the caller) [Vladimir]
* minor fixes in commit messages [Vladimir]
* create a common public function in patch 15 instead of using
  _private fields [Vladimir]
* use @contextmanager in patch 6 to skip gdb timeouts involving the
  Timeout class [Vladimir]
* apply John Snow patch to silence pylint warning in the CI tests

Emanuele Giuseppe Esposito (15):
  python: qemu: add timer parameter for qmp.accept socket
  python: qemu: pass the wrapper field from QEMUQtestmachine to
    QEMUMachine
  docs/devel/testing: add debug section to the QEMU iotests chapter
  qemu-iotests: add option to attach gdbserver
  qemu-iotests: delay QMP socket timers
  qemu_iotests: insert gdbserver command line as wrapper for qemu binary
  qemu-iotests: add gdbserver option to script tests too
  docs/devel/testing: add --gdb option to the debugging section of QEMU
    iotests
  qemu-iotests: extend the check script to prepare supporting valgrind
    for python tests
  qemu-iotests: extend QMP socket timeout when using valgrind
  qemu-iotests: allow valgrind to read/delete the generated log file
  qemu-iotests: insert valgrind command line as wrapper for qemu binary
  docs/devel/testing: add --valgrind option to the debug section of QEMU
    iotests
  qemu-iotests: add option to show qemu binary logs on stdout
  docs/devel/testing: add -p option to the debug section of QEMU iotests

John Snow (1):
  python: Reduce strictness of pylint's duplicate-code check

 docs/devel/testing.rst         | 30 ++++++++++++++++++++
 python/qemu/machine/machine.py | 16 +++++++----
 python/qemu/machine/qtest.py   |  9 ++++--
 python/setup.cfg               |  5 ++++
 tests/qemu-iotests/check       | 15 +++++++---
 tests/qemu-iotests/common.rc   |  8 +++++-
 tests/qemu-iotests/iotests.py  | 52 ++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/testenv.py  | 23 +++++++++++++--
 8 files changed, 141 insertions(+), 17 deletions(-)

-- 
2.30.2


