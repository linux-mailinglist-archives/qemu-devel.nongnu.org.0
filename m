Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D37DBFAA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 10:17:36 +0200 (CEST)
Received: from localhost ([::1]:36354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLNS3-0007Da-88
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 04:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iLNPX-0005N4-TT
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 04:15:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iLNPV-0007Mf-KG
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 04:14:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46332)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iLNPV-0007Lm-E4
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 04:14:57 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 20DC3757C8;
 Fri, 18 Oct 2019 08:14:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C24A419C77;
 Fri, 18 Oct 2019 08:14:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 39CA51138619; Fri, 18 Oct 2019 10:14:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/5] qapi: Add detection for the 'savevm' fix for blockdev
Date: Fri, 18 Oct 2019 10:14:49 +0200
Message-Id: <20191018081454.21369-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 18 Oct 2019 08:14:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: kwolf@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Add 'features' field in the schema for commands and add a feature flag
to advertise that the fix for savevm [1] is present.

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03487.html

Based-on: <20191018074345.24034-1-armbru@redhat.com>

v5:
* PATCH 2:
  - qapi-code-gen.txt grammar updated
  - Doc generation for boxed commands fixed
  - Commit message tweaked
* PATCH 3:
  - Command names in qapi-schema-test.json tweaked
  - Trivial pycodestyle-3 fix
* PATCH 4: New
* PATCH 5: Whitespace tweaked

v4:
* PATCH 1: New
* PATCH 2: Factor out check_features()
* PATCH 3: Factor out _print_features(), drop duplicated test
* PATCH 4
  - Shorten savevm-blockdev-monitor-nodes to just savevm-monitor-nodes
  - Tweak commit message and documentation

Markus Armbruster (2):
  tests/qapi-schema: Tidy up test output indentation
  tests/qapi-schema: Cover feature documentation comments

Peter Krempa (3):
  qapi: Add feature flags to commands
  tests: qapi: Test 'features' of commands
  qapi: Allow introspecting fix for savevm's cooperation with blockdev

 docs/devel/qapi-code-gen.txt            | 10 ++--
 tests/qapi-schema/doc-good.texi         | 22 ++++++++
 qapi/introspect.json                    |  6 +-
 qapi/misc.json                          |  9 ++-
 tests/test-qmp-cmds.c                   | 24 ++++++++
 scripts/qapi/commands.py                |  3 +-
 scripts/qapi/doc.py                     |  4 +-
 scripts/qapi/expr.py                    | 35 +++++++-----
 scripts/qapi/introspect.py              |  7 ++-
 scripts/qapi/schema.py                  | 22 ++++++--
 tests/qapi-schema/doc-good.json         | 17 +++++-
 tests/qapi-schema/doc-good.out          |  9 ++-
 tests/qapi-schema/event-case.out        |  2 +-
 tests/qapi-schema/indented-expr.out     |  4 +-
 tests/qapi-schema/qapi-schema-test.json | 18 ++++++
 tests/qapi-schema/qapi-schema-test.out  | 75 ++++++++++++++++---------
 tests/qapi-schema/test-qapi.py          | 20 ++++---
 17 files changed, 219 insertions(+), 68 deletions(-)

--=20
2.21.0


