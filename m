Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B23DFCE8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:32:59 +0200 (CEST)
Received: from localhost ([::1]:51928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBCKg-0004qa-4U
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBCJ5-0003DM-GW
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBCJ3-0001TN-Nu
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628065877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tzY7LCYGoz/C2QWWF87OzpSl2hCfX0fkzWC4qVfcydg=;
 b=LtsjNmU+1FtsTQj1nzFckiDJMyhkzdwvNa8I+o6vtMDP4LlhA2AB7uBtE+ZmWgU9g2tvlo
 lv6PMFJghXL/6KOTTmMzYXs0aEsCgZopNt2a+N9SYNMixwxe3W0cz8+X5rImhCT67Lmq/F
 bZsskeke+gwFrMM5VyiFxBG+O8Bl008=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-EsIwGjpANbSkPz5g-RcIqw-1; Wed, 04 Aug 2021 04:31:15 -0400
X-MC-Unique: EsIwGjpANbSkPz5g-RcIqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0456E1940921
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 08:31:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D44F75D6B1;
 Wed,  4 Aug 2021 08:31:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/10] qapi: untie 'if' conditions from C preprocessor
Date: Wed,  4 Aug 2021 12:30:55 +0400
Message-Id: <20210804083105.97531-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>
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
v7: after Markus review=0D
 - use is_present() in introspect too=0D
 - drop now needless "qapi: _make_enum_members() to work with pre-built QAP=
ISchemaIfCond"=0D
 - add tests to cover more error cases=0D
 - indentation updates=0D
 - commit message updates=0D
 - rebased=0D
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
Marc-Andr=C3=A9 Lureau (10):=0D
  docs: update the documentation upfront about schema configuration=0D
  qapi: wrap Sequence[str] in an object=0D
  qapi: add QAPISchemaIfCond.is_present()=0D
  qapi: introduce QAPISchemaIfCond.cgen()=0D
  qapidoc: introduce QAPISchemaIfCond.docgen()=0D
  qapi: replace if condition list with dict {'all': [...]}=0D
  qapi: add 'any' condition=0D
  qapi: Use 'if': { 'any': ... } where appropriate=0D
  qapi: add 'not' condition operation=0D
  qapi: make 'if' condition strings simple identifiers=0D
=0D
 docs/devel/qapi-code-gen.txt                  | 30 ++++---=0D
 docs/sphinx/qapidoc.py                        | 22 ++---=0D
 qapi/block-core.json                          | 34 ++++----=0D
 qapi/block-export.json                        |  6 +-=0D
 qapi/char.json                                | 12 +--=0D
 qapi/machine-target.json                      | 28 +++++--=0D
 qapi/migration.json                           | 10 +--=0D
 qapi/misc-target.json                         | 40 +++++----=0D
 qapi/qom.json                                 | 10 +--=0D
 qapi/sockets.json                             |  6 +-=0D
 qapi/tpm.json                                 | 18 ++---=0D
 qapi/ui.json                                  | 66 +++++++--------=0D
 qga/qapi-schema.json                          |  8 +-=0D
 tests/unit/test-qmp-cmds.c                    |  1 +=0D
 scripts/qapi/commands.py                      |  4 +-=0D
 scripts/qapi/common.py                        | 58 ++++++++++---=0D
 scripts/qapi/events.py                        |  5 +-=0D
 scripts/qapi/expr.py                          | 55 ++++++++-----=0D
 scripts/qapi/gen.py                           | 14 ++--=0D
 scripts/qapi/introspect.py                    | 30 +++----=0D
 scripts/qapi/schema.py                        | 81 +++++++++++++------=0D
 scripts/qapi/types.py                         | 33 ++++----=0D
 scripts/qapi/visit.py                         | 23 +++---=0D
 .../alternate-branch-if-invalid.err           |  2 +-=0D
 tests/qapi-schema/bad-if-all.err              |  2 +=0D
 tests/qapi-schema/bad-if-all.json             |  3 +=0D
 tests/qapi-schema/bad-if-all.out              |  0=0D
 tests/qapi-schema/bad-if-empty-list.json      |  2 +-=0D
 tests/qapi-schema/bad-if-empty.err            |  2 +-=0D
 tests/qapi-schema/bad-if-key.err              |  3 +=0D
 tests/qapi-schema/bad-if-key.json             |  3 +=0D
 tests/qapi-schema/bad-if-key.out              |  0=0D
 tests/qapi-schema/bad-if-keys.err             |  2 +=0D
 tests/qapi-schema/bad-if-keys.json            |  3 +=0D
 tests/qapi-schema/bad-if-keys.out             |  0=0D
 tests/qapi-schema/bad-if-list.err             |  2 +-=0D
 tests/qapi-schema/bad-if-list.json            |  2 +-=0D
 tests/qapi-schema/bad-if.err                  |  2 +-=0D
 tests/qapi-schema/bad-if.json                 |  2 +-=0D
 tests/qapi-schema/doc-good.json               | 16 ++--=0D
 tests/qapi-schema/doc-good.out                | 14 ++--=0D
 tests/qapi-schema/doc-good.txt                | 21 ++++-=0D
 tests/qapi-schema/enum-if-invalid.err         |  3 +-=0D
 tests/qapi-schema/features-if-invalid.err     |  2 +-=0D
 tests/qapi-schema/features-missing-name.json  |  2 +-=0D
 tests/qapi-schema/meson.build                 |  3 +=0D
 tests/qapi-schema/qapi-schema-test.json       | 61 +++++++-------=0D
 tests/qapi-schema/qapi-schema-test.out        | 67 ++++++++-------=0D
 .../qapi-schema/struct-member-if-invalid.err  |  2 +-=0D
 tests/qapi-schema/test-qapi.py                |  4 +-=0D
 tests/qapi-schema/union-branch-if-invalid.err |  2 +-=0D
 .../qapi-schema/union-branch-if-invalid.json  |  2 +-=0D
 52 files changed, 493 insertions(+), 330 deletions(-)=0D
 create mode 100644 tests/qapi-schema/bad-if-all.err=0D
 create mode 100644 tests/qapi-schema/bad-if-all.json=0D
 create mode 100644 tests/qapi-schema/bad-if-all.out=0D
 create mode 100644 tests/qapi-schema/bad-if-key.err=0D
 create mode 100644 tests/qapi-schema/bad-if-key.json=0D
 create mode 100644 tests/qapi-schema/bad-if-key.out=0D
 create mode 100644 tests/qapi-schema/bad-if-keys.err=0D
 create mode 100644 tests/qapi-schema/bad-if-keys.json=0D
 create mode 100644 tests/qapi-schema/bad-if-keys.out=0D
=0D
--=20=0D
2.32.0.264.g75ae10bc75=0D
=0D


