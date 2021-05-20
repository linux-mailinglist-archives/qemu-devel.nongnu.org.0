Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5770389F2A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 09:55:18 +0200 (CEST)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdWW-00038C-L0
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 03:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljdUD-0002IE-1o
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljdUB-0005ht-BQ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621497168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=405GapVsL7JNLeZeQL64J3dgda4R43mpjsJQ48gR8tk=;
 b=e83EprDEYR0uF+62VIguxBadcB98lnVl9TpiE3cXd7k3qziwveP1+J3QshnuJER3RkNAsu
 TNlpcONCTk7YonEng8vO0jr3El56v7ZjyqvTQOLL53vra7CU06/xNAoI6odqhfIZdORE7Q
 JjH20ngZD/oVf9WLbv1Nq99GmF8GtGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-KnKnSU2dNbmSz9NMO9nglw-1; Thu, 20 May 2021 03:52:45 -0400
X-MC-Unique: KnKnSU2dNbmSz9NMO9nglw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49166800D62;
 Thu, 20 May 2021 07:52:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-52.ams2.redhat.com
 [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D39C690F3;
 Thu, 20 May 2021 07:52:37 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 00/15] qemu_iotests: improve debugging options
Date: Thu, 20 May 2021 09:52:21 +0200
Message-Id: <20210520075236.44723-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds the option to attach gdbserver and valgrind
to the QEMU binary running in qemu_iotests.
It also allows to redirect QEMU binaries output of the python tests
to the stdout, instead of a log file.

Patches 1-6 introduce the -gdb option to both python and bash tests, 
7-10 extend the already existing -valgrind flag to work also on 
python tests, and patch 11 introduces -p to enable logging to stdout.

In particular, patches 1,5,10 focus on extending the QMP socket timers
when using gdb/valgrind, otherwise the python tests will fail due to
delays in the QMP responses.

This series is tested on the previous serie
"qemu-iotests: quality of life improvements"
but independent from it, so it can be applied separately.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v4:
* Rename environment variable from GDB_QEMU to GDB_OPTIONS
* This time test 297 (pylint) passes [Max]
* Refactor the qmp_timer field in machine.py, and add a new 
  parameter in machine.py and subclasses constructor [John]
* Add additional check in patch 4 to cover the case where
  GDB_OPTIONS is empty

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
  qemu-iotests: extend the check script to support valgrind for python
    tests
  qemu-iotests: extent QMP socket timeout when using valgrind
  qemu-iotests: allow valgrind to read/delete the generated log file
  qemu-iotests: insert valgrind command line as wrapper for qemu binary
  docs/devel/testing: add -valgrind option to the debug section of QEMU
    iotests
  qemu-iotests: add option to show qemu binary logs on stdout
  docs/devel/testing: add -p option to the debug section of QEMU iotests

 docs/devel/testing.rst        | 30 +++++++++++++++++++
 python/qemu/machine.py        |  7 +++--
 python/qemu/qtest.py          |  9 ++++--
 tests/qemu-iotests/check      | 15 +++++++---
 tests/qemu-iotests/common.rc  |  8 ++++-
 tests/qemu-iotests/iotests.py | 56 +++++++++++++++++++++++++++++++----
 tests/qemu-iotests/testenv.py | 25 ++++++++++++++--
 7 files changed, 132 insertions(+), 18 deletions(-)

-- 
2.30.2


