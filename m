Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834FF39F60E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:09:09 +0200 (CEST)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaXc-0007IT-3k
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lqaWB-0005wc-93
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lqaW6-00012p-IZ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/6IAZRSazQA/kxf2lqo1GrVWyJ1X7I0sHdApaNsVN7U=;
 b=Fh+TigGwbOEqJJCnpQ2KNU9Wd+jCNzSKRKbgMAv3vrbmgm26YjZ2PgD/3xA7NQlZPCr6f/
 npaTp567HErBFRWRI9fbB2C4SD16eqezl9pZvZg0tvOD8IP//Jbovhwozwawvb5iUmT2Kr
 TQdDw/1sH9TViHtnx9TvrHtMZjKrR7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-Btl3pm_jP96M8Ejk8LaB9A-1; Tue, 08 Jun 2021 08:07:29 -0400
X-MC-Unique: Btl3pm_jP96M8Ejk8LaB9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61E4E101962F
 for <qemu-devel@nongnu.org>; Tue,  8 Jun 2021 12:07:28 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37F8219C66;
 Tue,  8 Jun 2021 12:07:26 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/9] qapi: untie 'if' conditions from C preprocessor
Date: Tue,  8 Jun 2021 16:07:14 +0400
Message-Id: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Eric Blake <eblake@redhat.com>, jsnow@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
This series makes the 'if' conditions less liberal, by formalizing a simple=
=0D
expression tree based on bare boolean logic of configure option identifiers=
.=0D
=0D
(this allows to express conditions in Rust in my QAPI-Rust PoC series)=0D
=0D
thanks=0D
=0D
v5:=0D
 - drop the [ COND, ... ] sugar form=0D
 - move documentation update as first patch=0D
 - documentation and commit message tweaks=0D
=0D
v4:=0D
 - keep gen_if/gen_endif in common.py, reducing C codegen in schema.py=0D
 - raise NotImplemented instead of False for unhandled __eq__=0D
 - change check_if() to keep the json/raw form, add _make_if() to build a=
=0D
   QAPISchemaIfCond=0D
 - improve __repr__ usage=0D
 - drop ABC usage=0D
 - tweaks here and there=0D
 - add various commit tags=0D
=0D
v3:=0D
 - rebasing on queued pt4 (after waiting for it to land)=0D
 - improve documentation generation, to be more human-friendly=0D
 - drop typing annotations from schema.py (not yet queued)=0D
 - commit message tweaks=0D
=0D
v2:=0D
 - fix the normalization step to handle recursive expr=0D
 - replace IfCond by QAPISchemaIf (JohnS)=0D
 - commit message and documentation tweaks=0D
 - mypy/flake8/isort=0D
=0D
Marc-Andr=C3=A9 Lureau (9):=0D
  docs: update the documentation about schema configuration=0D
  qapi: replace List[str] by QAPISchemaIfCond=0D
  qapi: make gen_if/gen_endif take a simple string=0D
  qapi: start building an 'if' predicate tree=0D
  qapi: introduce IfPredicateList and IfAny=0D
  qapi: add IfNot=0D
  qapi: normalize 'if' condition to IfPredicate tree=0D
  qapi: convert 'if' C-expressions to the new syntax tree=0D
  qapi: make 'if' condition strings simple identifiers=0D
=0D
 docs/devel/qapi-code-gen.txt                  |  30 +++--=0D
 docs/sphinx/qapidoc.py                        |   6 +-=0D
 qapi/block-core.json                          |  16 +--=0D
 qapi/block-export.json                        |   6 +-=0D
 qapi/char.json                                |  12 +-=0D
 qapi/machine-target.json                      |  28 +++--=0D
 qapi/migration.json                           |  10 +-=0D
 qapi/misc-target.json                         |  40 +++---=0D
 qapi/qom.json                                 |  10 +-=0D
 qapi/sockets.json                             |   4 +-=0D
 qapi/ui.json                                  |  48 ++++----=0D
 qga/qapi-schema.json                          |   8 +-=0D
 tests/unit/test-qmp-cmds.c                    |   1 +=0D
 scripts/qapi/commands.py                      |   4 +-=0D
 scripts/qapi/common.py                        | 116 ++++++++++++++++--=0D
 scripts/qapi/events.py                        |   5 +-=0D
 scripts/qapi/expr.py                          |  51 +++++---=0D
 scripts/qapi/gen.py                           |  14 +--=0D
 scripts/qapi/introspect.py                    |  26 ++--=0D
 scripts/qapi/schema.py                        | 112 +++++++++++++----=0D
 scripts/qapi/types.py                         |  33 ++---=0D
 scripts/qapi/visit.py                         |  23 ++--=0D
 .../alternate-branch-if-invalid.err           |   2 +-=0D
 tests/qapi-schema/bad-if-empty-list.json      |   2 +-=0D
 tests/qapi-schema/bad-if-empty.err            |   2 +-=0D
 tests/qapi-schema/bad-if-list.err             |   2 +-=0D
 tests/qapi-schema/bad-if-list.json            |   2 +-=0D
 tests/qapi-schema/bad-if.err                  |   3 +-=0D
 tests/qapi-schema/bad-if.json                 |   2 +-=0D
 tests/qapi-schema/doc-good.json               |   6 +-=0D
 tests/qapi-schema/doc-good.out                |  12 +-=0D
 tests/qapi-schema/doc-good.txt                |   6 +-=0D
 tests/qapi-schema/enum-if-invalid.err         |   3 +-=0D
 tests/qapi-schema/features-if-invalid.err     |   2 +-=0D
 tests/qapi-schema/features-missing-name.json  |   2 +-=0D
 tests/qapi-schema/qapi-schema-test.json       |  60 +++++----=0D
 tests/qapi-schema/qapi-schema-test.out        |  67 +++++-----=0D
 .../qapi-schema/struct-member-if-invalid.err  |   2 +-=0D
 tests/qapi-schema/test-qapi.py                |   2 +-=0D
 tests/qapi-schema/union-branch-if-invalid.err |   2 +-=0D
 .../qapi-schema/union-branch-if-invalid.json  |   2 +-=0D
 41 files changed, 498 insertions(+), 286 deletions(-)=0D
=0D
--=20=0D
2.29.0=0D
=0D


