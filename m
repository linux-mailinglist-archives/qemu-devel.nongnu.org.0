Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD06FD27B8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 13:06:49 +0200 (CEST)
Received: from localhost ([::1]:36049 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIWHQ-000648-E0
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 07:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1iIWG9-00057o-QV
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:05:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1iIWG8-0000rw-AM
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:05:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36476)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1iIWG8-0000qN-4u
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 07:05:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 538903086E2F
 for <qemu-devel@nongnu.org>; Thu, 10 Oct 2019 11:05:26 +0000 (UTC)
Received: from angien.brq.redhat.com (unknown [10.43.2.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FABC60BE1;
 Thu, 10 Oct 2019 11:05:25 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] qapi: Add detection for the 'savevm' fix for blockdev
Date: Thu, 10 Oct 2019 13:05:21 +0200
Message-Id: <cover.1570705279.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 10 Oct 2019 11:05:26 +0000 (UTC)
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 'features' field in the schema for commands and add a feature flag
to advertise that the fix for savevm [1] is present.

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03487.html

v3:
 - added tests
 - mentioned commit fixing savevm in the patch adding the new feature
 - mentioned actual problem in the patch adding the new feature
 - rebased on top of the last batch of Markus' cleanups

Peter Krempa (3):
  qapi: Add feature flags to commands in qapi
  tests: qapi: Test 'features' of commands
  qapi: Allow introspecting fix for savevm's cooperation with blockdev

 docs/devel/qapi-code-gen.txt            |  7 +++---
 qapi/introspect.json                    |  6 ++++-
 qapi/misc.json                          |  9 +++++++-
 scripts/qapi/commands.py                |  3 ++-
 scripts/qapi/doc.py                     |  3 ++-
 scripts/qapi/expr.py                    | 17 ++++++++++++++-
 scripts/qapi/introspect.py              |  7 +++++-
 scripts/qapi/schema.py                  | 22 +++++++++++++++----
 tests/qapi-schema/qapi-schema-test.json | 26 ++++++++++++++++++++++
 tests/qapi-schema/qapi-schema-test.out  | 29 +++++++++++++++++++++++++
 tests/qapi-schema/test-qapi.py          |  7 +++++-
 tests/test-qmp-cmds.c                   | 28 ++++++++++++++++++++++++
 12 files changed, 150 insertions(+), 14 deletions(-)

--=20
2.21.0


