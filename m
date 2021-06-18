Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A763AC8CA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:29:07 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBkI-0006kO-Fi
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBgr-0004Op-6J
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:25:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBgl-0008FZ-98
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624011921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Lcama/lDIT2o1NlcnQl85IZuMUFmYmEYnvltWETbl8=;
 b=fNRQj+axqGvuWKeDaWviQqENMe6dO3CXgJj2hoqbIdMwyUjxJ/WK4wPZIiMUK/P/E02tvX
 6rEUkvlo1iMTSTInNbTCym1k/nPsrfDv0GFF+slgMystgcvGniyidAlVliBYymhbWb/tiZ
 krcVYcpqa0b3jvaBUdhzK/oWQnzmgPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-qoDBJNKDPcuLOQDrWsSxiQ-1; Fri, 18 Jun 2021 06:25:19 -0400
X-MC-Unique: qoDBJNKDPcuLOQDrWsSxiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 084E580430B
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:25:19 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53E5960C4A;
 Fri, 18 Jun 2021 10:25:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/11] qapi: untie 'if' conditions from C preprocessor
Date: Fri, 18 Jun 2021 14:24:56 +0400
Message-Id: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
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
v6: after Markus review=0D
 - drop the predicate tree, QAPISchemaIfCond simply holds the original obje=
ct=0D
 - introduce the dict operations ('all', 'any', 'not') in multiple patches=
=0D
 - split QAPISchemaIfCond introduction in multiple patches=0D
 - replace __bool__ usage with is_present()=0D
 - removed __eq__=0D
 - move cgen/docgen implementation to common.py=0D
 - doc & commit message updates=0D
 - rebased=0D
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
Marc-Andr=C3=A9 Lureau (11):=0D
  docs: update the documentation upfront about schema configuration=0D
  qapi: wrap Sequence[str] in an object=0D
  qapi: add QAPISchemaIfCond.is_present()=0D
  qapi: _make_enum_members() to work with pre-built QAPISchemaIfCond=0D
  qapi: introduce QAPISchemaIfCond.cgen()=0D
  qapidoc: introduce QAPISchemaIfCond.docgen()=0D
  qapi: replace if condition list with dict {'all': [...]}=0D
  qapi: add 'any' condition=0D
  qapi: convert 'if' C-expressions to the new syntax tree=0D
  qapi: add 'not' condition operation=0D
  qapi: make 'if' condition strings simple identifiers=0D
=0D
 docs/devel/qapi-code-gen.txt                  | 30 ++++---=0D
 docs/sphinx/qapidoc.py                        | 22 ++---=0D
 qapi/block-core.json                          | 16 ++--=0D
 qapi/block-export.json                        |  6 +-=0D
 qapi/char.json                                | 12 +--=0D
 qapi/machine-target.json                      | 28 ++++--=0D
 qapi/migration.json                           | 10 +--=0D
 qapi/misc-target.json                         | 40 +++++----=0D
 qapi/qom.json                                 | 10 +--=0D
 qapi/sockets.json                             |  6 +-=0D
 qapi/tpm.json                                 | 18 ++--=0D
 qapi/ui.json                                  | 48 +++++------=0D
 qga/qapi-schema.json                          |  8 +-=0D
 tests/unit/test-qmp-cmds.c                    |  1 +=0D
 scripts/qapi/commands.py                      |  4 +-=0D
 scripts/qapi/common.py                        | 58 ++++++++++---=0D
 scripts/qapi/events.py                        |  5 +-=0D
 scripts/qapi/expr.py                          | 55 +++++++-----=0D
 scripts/qapi/gen.py                           | 14 +--=0D
 scripts/qapi/introspect.py                    | 26 +++---=0D
 scripts/qapi/schema.py                        | 85 +++++++++++++------=0D
 scripts/qapi/types.py                         | 33 +++----=0D
 scripts/qapi/visit.py                         | 23 ++---=0D
 .../alternate-branch-if-invalid.err           |  2 +-=0D
 tests/qapi-schema/bad-if-empty-list.json      |  2 +-=0D
 tests/qapi-schema/bad-if-empty.err            |  2 +-=0D
 tests/qapi-schema/bad-if-list.err             |  2 +-=0D
 tests/qapi-schema/bad-if-list.json            |  2 +-=0D
 tests/qapi-schema/bad-if.err                  |  3 +-=0D
 tests/qapi-schema/bad-if.json                 |  2 +-=0D
 tests/qapi-schema/doc-good.json               | 15 ++--=0D
 tests/qapi-schema/doc-good.out                | 14 +--=0D
 tests/qapi-schema/doc-good.txt                | 21 ++++-=0D
 tests/qapi-schema/enum-if-invalid.err         |  3 +-=0D
 tests/qapi-schema/features-if-invalid.err     |  2 +-=0D
 tests/qapi-schema/features-missing-name.json  |  2 +-=0D
 tests/qapi-schema/qapi-schema-test.json       | 60 +++++++------=0D
 tests/qapi-schema/qapi-schema-test.out        | 67 ++++++++-------=0D
 .../qapi-schema/struct-member-if-invalid.err  |  2 +-=0D
 tests/qapi-schema/test-qapi.py                |  4 +-=0D
 tests/qapi-schema/union-branch-if-invalid.err |  2 +-=0D
 .../qapi-schema/union-branch-if-invalid.json  |  2 +-=0D
 42 files changed, 458 insertions(+), 309 deletions(-)=0D
=0D
--=20=0D
2.29.0=0D
=0D


