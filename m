Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B613383A56
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:47:23 +0200 (CEST)
Received: from localhost ([::1]:33004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligOo-0000fw-5f
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig8y-00055G-La
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig8w-00069H-72
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621269051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z5jT307v8s7ps4VBQmLQ7rnT/GTrOAht2PXREgsRX2o=;
 b=BIf4S1AVHs9E3+cnXNMzI2W/MENqpHQyPaD8h3mbHXEtqYwWhitWClVGFcEIy2lO4JxRE+
 xAI8+n+IdjXAB7HKAIRJzj06SUZ/uevti9gh1GOB0cA8pYIXzseu6jEJbxuDySVLKFzV/8
 8Yhu7jMP8FCfvt3MXDfjqVqkLAkAicg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-cs_JPbmbNia6GxDMwVLZYA-1; Mon, 17 May 2021 12:30:47 -0400
X-MC-Unique: cs_JPbmbNia6GxDMwVLZYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BF258042A8
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 16:30:45 +0000 (UTC)
Received: from localhost (unknown [10.36.110.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E1E55C1D1;
 Mon, 17 May 2021 16:30:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/9] qapi: untie 'if' conditions from C preprocessor
Date: Mon, 17 May 2021 20:30:31 +0400
Message-Id: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com
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
  qapi: replace List[str] by QAPISchemaIfCond=0D
  qapi: make gen_if/gen_endif take a simple string=0D
  qapi: start building an 'if' predicate tree=0D
  qapi: introduce IfPredicateList and IfAny=0D
  qapi: add IfNot=0D
  qapi: normalize 'if' condition to IfPredicate tree=0D
  qapi: convert 'if' C-expressions to the new syntax tree=0D
  qapi: make 'if' condition strings simple identifiers=0D
  docs: update the documentation about schema configuration=0D
=0D
 docs/devel/qapi-code-gen.txt                  |  33 ++---=0D
 docs/sphinx/qapidoc.py                        |   6 +-=0D
 qapi/block-core.json                          |  16 +--=0D
 qapi/block-export.json                        |   6 +-=0D
 qapi/char.json                                |   8 +-=0D
 qapi/machine-target.json                      |  28 +++--=0D
 qapi/migration.json                           |  10 +-=0D
 qapi/misc-target.json                         |  36 ++++--=0D
 qapi/qom.json                                 |  10 +-=0D
 qapi/sockets.json                             |   4 +-=0D
 qapi/ui.json                                  |  48 ++++----=0D
 qga/qapi-schema.json                          |   8 +-=0D
 tests/unit/test-qmp-cmds.c                    |   1 +=0D
 scripts/qapi/commands.py                      |   4 +-=0D
 scripts/qapi/common.py                        | 116 ++++++++++++++++--=0D
 scripts/qapi/events.py                        |   5 +-=0D
 scripts/qapi/expr.py                          |  53 +++++---=0D
 scripts/qapi/gen.py                           |  14 +--=0D
 scripts/qapi/introspect.py                    |  26 ++--=0D
 scripts/qapi/schema.py                        | 112 +++++++++++++----=0D
 scripts/qapi/types.py                         |  33 ++---=0D
 scripts/qapi/visit.py                         |  23 ++--=0D
 .../alternate-branch-if-invalid.err           |   2 +-=0D
 tests/qapi-schema/bad-if-empty.err            |   2 +-=0D
 tests/qapi-schema/bad-if-list.err             |   2 +-=0D
 tests/qapi-schema/bad-if.err                  |   3 +-=0D
 tests/qapi-schema/bad-if.json                 |   2 +-=0D
 tests/qapi-schema/doc-good.json               |   6 +-=0D
 tests/qapi-schema/doc-good.out                |  12 +-=0D
 tests/qapi-schema/doc-good.txt                |   6 +-=0D
 tests/qapi-schema/enum-if-invalid.err         |   3 +-=0D
 tests/qapi-schema/features-if-invalid.err     |   2 +-=0D
 tests/qapi-schema/features-missing-name.json  |   2 +-=0D
 tests/qapi-schema/qapi-schema-test.json       |  58 +++++----=0D
 tests/qapi-schema/qapi-schema-test.out        |  67 +++++-----=0D
 .../qapi-schema/struct-member-if-invalid.err  |   2 +-=0D
 tests/qapi-schema/test-qapi.py                |   2 +-=0D
 tests/qapi-schema/union-branch-if-invalid.err |   2 +-=0D
 38 files changed, 493 insertions(+), 280 deletions(-)=0D
=0D
--=20=0D
2.29.0=0D
=0D


