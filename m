Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B9C3E41FA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:03:15 +0200 (CEST)
Received: from localhost ([::1]:49744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1Bi-0004RT-0S
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD19w-000192-Tb
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD19u-0001Oi-Mr
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628499682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6/+Ziw6II64r1Gy/Nnt2rUcwgLDq2v46UXJ2L17Do/M=;
 b=YsFAqJFGJqnJftFwHdU4o02W85GZTx6BQBEcLzcl3G3Mhmu48kyboepqfavQXCyLFm396X
 QxMydE8hMQXCXwFGu1eD0ANaHVLuSfv9b7bXgTA0r9qZqEYY1Ct2PtFzjcgyRoOVCg++u5
 JGb+lUMBDw///YEBmS3C/zn8YvOThEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-qiQIZ9L8O3uncVMsTpUcIg-1; Mon, 09 Aug 2021 05:01:19 -0400
X-MC-Unique: qiQIZ9L8O3uncVMsTpUcIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC3A31853029;
 Mon,  9 Aug 2021 09:01:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 726E277701;
 Mon,  9 Aug 2021 09:01:15 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 00/16] qemu_iotests: improve debugging options
Date: Mon,  9 Aug 2021 11:00:58 +0200
Message-Id: <20210809090114.64834-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
v9:
* Replace `! -z` with `-n` in bash scripts (patch 8), and quote $GDB_OPTIONS in
  the same if condition [Max]
* Add r-b from Max to all patches except 8, remove r-b from Vladimir on patch 8

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


