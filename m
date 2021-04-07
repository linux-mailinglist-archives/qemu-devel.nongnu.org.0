Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46D0356DEF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:55:36 +0200 (CEST)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8ed-0000V0-Ts
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8Zv-0003si-Ub
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:50:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8Zk-0005rC-N3
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zg+KPWlPZ9OCgz0iyUsL3F24QInJ9JYiEdQzSETQwow=;
 b=XrA8QNzexjjX6gwVIWXgA02X3iP3RKe0iCQgULMkbCJd1F2wucfydeT5vZr1xFON4BJ9SJ
 b9tlFeDXQe4P7QeW9nUibDt4eyljZDEspH3hLae2791eEO+XIwNKZ6q0X4bga11+tVdJ9w
 6ahx2D4gze0MfL9k8E8SNU9lN4kGnAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-wT3HHVn1MaS4mbpncmHAXg-1; Wed, 07 Apr 2021 09:50:28 -0400
X-MC-Unique: wT3HHVn1MaS4mbpncmHAXg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FDFE107ACE8;
 Wed,  7 Apr 2021 13:50:27 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-163.ams2.redhat.com
 [10.36.115.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2830710A6;
 Wed,  7 Apr 2021 13:50:24 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 00/11] qemu_iotests: improve debugging options
Date: Wed,  7 Apr 2021 15:50:10 +0200
Message-Id: <20210407135021.48330-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

In particular, patches 1,2,4,8 focus on extending the QMP socket timers
when using gdb/valgrind, otherwise the python tests will fail due to
delays in the QMP responses.

This series is tested on the previous serie
"qemu-iotests: quality of life improvements"
but independent from it, so it can be applied separately.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v2:
- add valgrind and print patches
- better splitup of patches, and clearer commit messages

Emanuele Giuseppe Esposito (11):
  python: qemu: add timer parameter for qmp.accept socket
  python: qemu: pass the wrapper field from QEMUQtestmachine to
    QEMUMachine
  qemu-iotests: add option to attach gdbserver
  qemu-iotests: delay QMP socket timers
  qemu_iotests: insert gdbserver command line as wrapper for qemu binary
  qemu-iotests: add gdbserver option to script tests too
  qemu_iotests: extend the check script to support valgrind for python
    tests
  qemu_iotests: extent QMP socket timeout when using valgrind
  qemu_iotests: allow valgrint to print/delete the generated log file
  qemu_iotests: insert valgrind command line as wrapper for qemu binary
  qemu_iotests: add option to show qemu binary logs on stdout

 python/qemu/machine.py        | 12 ++++--
 python/qemu/qtest.py          |  8 ++--
 tests/qemu-iotests/check      |  7 +++-
 tests/qemu-iotests/common.rc  |  8 +++-
 tests/qemu-iotests/iotests.py | 69 ++++++++++++++++++++++++++++++++---
 tests/qemu-iotests/testenv.py | 24 ++++++++++--
 6 files changed, 111 insertions(+), 17 deletions(-)

-- 
2.30.2


