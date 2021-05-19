Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A14389631
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:09:06 +0200 (CEST)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRZ3-00064d-4v
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR70-0005xi-UB
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR6v-0001yU-N3
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621449596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iytE/MlQel0mp/XMfjvd2LdYiRbMp+i9XC/oId+AuG0=;
 b=ZYbiKG6DoGenlOq5B7bQWyUbiK4lQPB6P5sw/T9L/EsT/8xxRBWvEfKXP+ihudSXxgTG0L
 ikQRs822FOrfUKZtc2hWjgpRl8ocIfEQNDMVGLo/F87rzfv8l/HUtBUlomRa6/a2hHnHFJ
 Mx+pLykx1GX9mnn2E3gf6Sf1btVErHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-_TGNL7FONLO3TvposawdGA-1; Wed, 19 May 2021 14:39:54 -0400
X-MC-Unique: _TGNL7FONLO3TvposawdGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F011800D55;
 Wed, 19 May 2021 18:39:53 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 771F860BD9;
 Wed, 19 May 2021 18:39:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/15] qapi: static typing conversion, pt5a
Date: Wed, 19 May 2021 14:39:36 -0400
Message-Id: <20210519183951.3946870-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is part five (a), and focuses on QAPISchemaParser in parser.py.=0D
It does not touch QAPIDoc yet, which will be covered next.=0D
=0D
gitlab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5a=0D
=0D
Requirements:=0D
- Python 3.6+=0D
- mypy >=3D 0.770=0D
- pylint >=3D 2.6.0 (2.7.0+ when using Python 3.9+)=0D
=0D
Every commit should pass with:=0D
 - `isort -c qapi/`=0D
 - `flake8 qapi/`=0D
 - `pylint --rcfile=3Dqapi/pylintrc qapi/`=0D
 - `mypy --config-file=3Dqapi/mypy.ini qapi/`=0D
=0D
V3:=0D
=0D
001: Commit message changed=0D
004: Commit message changed=0D
005/15:[0002] [FC] 'qapi/parser: Assert lexer value is a string'=0D
        - Remove comment=0D
015/15:[0019] [FC] 'qapi/parser: add docstrings'=0D
        - Futz with docstrings based on review from armbru=0D
=0D
V2:=0D
=0D
001/21:[0024] [FC] 'qapi/parser: Don't try to handle file errors'=0D
002/21:[down] 'qapi: Add test for nonexistent schema file'=0D
003/21:[0008] [FC] 'qapi/source: Remove line number from QAPISourceInfo ini=
tializer'=0D
004/21:[0003] [FC] 'qapi/parser: factor parsing routine into method'=0D
005/21:[0002] [FC] 'qapi/parser: Assert lexer value is a string'=0D
006/21:[down] 'qapi/parser: enforce all top-level expressions must be dict =
in _parse()'=0D
007/21:[----] [--] 'qapi/parser: assert object keys are strings'=0D
008/21:[----] [--] 'qapi/parser: Use @staticmethod where appropriate'=0D
009/21:[down] 'qapi: add must_match helper'=0D
010/21:[down] 'qapi/parser: Fix token membership tests when token can be No=
ne'=0D
011/21:[0012] [FC] 'qapi/parser: Rework _check_pragma_list_of_str as a Type=
Guard'=0D
012/21:[0019] [FC] 'qapi/parser: add type hint annotations'=0D
013/21:[down] 'qapi/parser: Remove superfluous list comprehension'=0D
014/21:[----] [--] 'qapi/parser: allow 'ch' variable name'=0D
015/21:[0080] [FC] 'qapi/parser: add docstrings'=0D
=0D
01:=0D
  - Futzed with the commit message a lot.=0D
  - Added new try/except to QAPISchema() instead of main().=0D
  - Adjusted "let caller handle this error" comment=0D
  - Adjusted test-qapi not to crash.=0D
02:=0D
  - New, add test for nonexistant root schema file.=0D
03:=0D
  - Commit message changes.=0D
  - Rebase changes, removed _column RFC patch that preceded it.=0D
04:=0D
  - Commit message changes.=0D
  - Minor rebase changes (from changed comment in 01)=0D
05:=0D
  - Remove assert message, replace w/ comment=0D
06:=0D
  - Replaces 'qapi/parser: assert get_expr returns object in outer loop'=0D
09:=0D
  - Renamed match_nofail() to must_match()=0D
10:=0D
  - Use tuple() for token membership tests=0D
  - Add test cases to prevent regressions=0D
11:=0D
  - _check =3D> _check_list_str=0D
  - info.pragma =3D> pragma=0D
12:=0D
  - Remove 'Expression' type entirely for now=0D
  - Highlight self.tok as actively taking None type with Union[str, None]=
=0D
  - Minor rebase confetti.=0D
13:=0D
  - Renamed commit message.=0D
15:=0D
  - Reworked.=0D
  - Note that 'pos' is indeed interface as it is used by the error handlers=
.=0D
=0D
John Snow (15):=0D
  qapi/parser: Don't try to handle file errors=0D
  qapi: Add test for nonexistent schema file=0D
  qapi/source: Remove line number from QAPISourceInfo initializer=0D
  qapi/parser: factor parsing routine into method=0D
  qapi/parser: Assert lexer value is a string=0D
  qapi/parser: enforce all top-level expressions must be dict in=0D
    _parse()=0D
  qapi/parser: assert object keys are strings=0D
  qapi/parser: Use @staticmethod where appropriate=0D
  qapi: add must_match helper=0D
  qapi/parser: Fix token membership tests when token can be None=0D
  qapi/parser: Rework _check_pragma_list_of_str as a TypeGuard=0D
  qapi/parser: add type hint annotations=0D
  qapi/parser: Remove superfluous list comprehension=0D
  qapi/parser: allow 'ch' variable name=0D
  qapi/parser: add docstrings=0D
=0D
 scripts/qapi/common.py                        |   8 +-=0D
 scripts/qapi/main.py                          |   6 +-=0D
 scripts/qapi/parser.py                        | 230 +++++++++++++-----=0D
 scripts/qapi/pylintrc                         |   1 +=0D
 scripts/qapi/schema.py                        |  11 +-=0D
 scripts/qapi/source.py                        |  13 +-=0D
 tests/qapi-schema/meson.build                 |   9 +-=0D
 tests/qapi-schema/missing-array-rsqb.err      |   1 +=0D
 tests/qapi-schema/missing-array-rsqb.json     |   1 +=0D
 tests/qapi-schema/missing-array-rsqb.out      |   0=0D
 .../missing-object-member-element.err         |   1 +=0D
 .../missing-object-member-element.json        |   1 +=0D
 .../missing-object-member-element.out         |   0=0D
 tests/qapi-schema/missing-schema.err          |   1 +=0D
 tests/qapi-schema/missing-schema.out          |   0=0D
 tests/qapi-schema/non-objects.err             |   2 +-=0D
 tests/qapi-schema/quoted-structural-chars.err |   2 +-=0D
 tests/qapi-schema/test-qapi.py                |   3 -=0D
 18 files changed, 209 insertions(+), 81 deletions(-)=0D
 create mode 100644 tests/qapi-schema/missing-array-rsqb.err=0D
 create mode 100644 tests/qapi-schema/missing-array-rsqb.json=0D
 create mode 100644 tests/qapi-schema/missing-array-rsqb.out=0D
 create mode 100644 tests/qapi-schema/missing-object-member-element.err=0D
 create mode 100644 tests/qapi-schema/missing-object-member-element.json=0D
 create mode 100644 tests/qapi-schema/missing-object-member-element.out=0D
 create mode 100644 tests/qapi-schema/missing-schema.err=0D
 create mode 100644 tests/qapi-schema/missing-schema.out=0D
=0D
--=20=0D
2.30.2=0D
=0D


