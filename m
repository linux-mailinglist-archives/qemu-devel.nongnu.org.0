Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73053488BC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:07:54 +0100 (CET)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJ9t-0003bY-E9
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6E-00022c-Ji
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6B-0008Ir-Q9
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vkd3lbJyJdV4cUWdRqdCfjx3ZK1SkT26aBHC26WmGV8=;
 b=Yx1T9NA7zVmf3bbv57Om6rUCzKOR6b7A3iv3ALDDKcVRXpFagL0GtV3L6MQP2KjwvD9FLW
 QrproSmE3rMXgZs//71iA+71WQgpo8aly3LyQws+6WZ5EhfXvJOs7uLn+HaYffNuIDJUYo
 oLWCwdT7tOboib7pgT/NpOWeEVyolOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-0sHmnJBhNaSW6xab1x2Vrw-1; Thu, 25 Mar 2021 02:03:59 -0400
X-MC-Unique: 0sHmnJBhNaSW6xab1x2Vrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13F34190B2A3;
 Thu, 25 Mar 2021 06:03:58 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CD9A88EE3;
 Thu, 25 Mar 2021 06:03:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 00/19] qapi: static typing conversion, pt3
Date: Thu, 25 Mar 2021 02:03:37 -0400
Message-Id: <20210325060356.4040114-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this series adds static types to the QAPI module.=0D
This is part three, and it focuses on expr.py.=0D
=0D
Environment:=0D
- Python >=3D 3.6, <=3D 3.8 *=0D
- mypy >=3D 0.770=0D
- pylint >=3D 2.6.0=0D
- flake8=0D
- isort=0D
=0D
Every commit should pass with (from ./scripts/):=0D
 - flake8 qapi/=0D
 - pylint --rcfile=3Dqapi/pylintrc qapi/=0D
 - mypy --config-file=3Dqapi/mypy.ini qapi/=0D
 - pushd qapi && isort -c . && popd=0D
=0D
V4:=0D
=0D
Patch 2 is exploratory.=0D
Patch 8 is broken and should be merged into Patch 9.=0D
Patches 17-19 are optional and I'd sooner you drop them than have to respin=
.=0D
=0D
001/19:[down] 'qapi/expr: Comment cleanup'=0D
002/19:[down] 'flake8: Enforce shorter line length for comments and docstri=
ngs'=0D
003/19:[----] [--] 'qapi/expr.py: Remove 'info' argument from nested check_=
if_str'=0D
004/19:[----] [--] 'qapi/expr.py: Check for dict instead of OrderedDict'=0D
005/19:[0011] [FC] 'qapi/expr.py: constrain incoming expression types'=0D
006/19:[0006] [FC] 'qapi/expr.py: Add assertion for union type 'check_dict'=
'=0D
007/19:[----] [--] 'qapi/expr.py: move string check upwards in check_type'=
=0D
008/19:[down] 'qapi: add tests for invalid 'data' field type'=0D
009/19:[0004] [FC] 'qapi/expr.py: Check type of 'data' member'=0D
010/19:[0008] [FC] 'qapi/expr.py: Add casts in a few select cases'=0D
011/19:[0005] [FC] 'qapi/expr.py: Modify check_keys to accept any Collectio=
n'=0D
012/19:[0057] [FC] 'qapi/expr.py: add type hint annotations'=0D
013/19:[0032] [FC] 'qapi/expr.py: Consolidate check_if_str calls in check_i=
f'=0D
014/19:[0016] [FC] 'qapi/expr.py: Remove single-letter variable'=0D
015/19:[----] [--] 'qapi/expr.py: enable pylint checks'=0D
016/19:[0168] [FC] 'qapi/expr.py: Add docstrings'=0D
017/19:[----] [-C] 'qapi/expr.py: Use tuples instead of lists for static da=
ta'=0D
018/19:[----] [-C] 'qapi/expr.py: move related checks inside check_xxx func=
tions'=0D
019/19:[0003] [FC] 'qapi/expr.py: Use an expression checker dispatch table'=
=0D
=0D
- Add test patch to demonstrate 72col docstring enforcement. (Not a fan.)=
=0D
- Changed MutableMapping type to regular ol' dict.=0D
- Added tests for alternate and union to see what happens when we pass a li=
st=0D
  for 'data' instead. (It crashes.)=0D
- Rewrote a bunch of the docstrings.=0D
- Updated type hints for rc0=0D
- Rebased on latest master, incorporating latest qapi changes.=0D
- Addressed most feedback, some exceptions;=0D
  - Kept isinstance check for dict; it is strictly more convenient to me an=
d it=0D
    does not cause breakages. It won't cause breakages.=0D
=0D
RFCs/notes:=0D
=0D
- I'd be flabbergasted if anyone reads these.=0D
=0D
John Snow (19):=0D
  qapi/expr: Comment cleanup=0D
  flake8: Enforce shorter line length for comments and docstrings=0D
  qapi/expr.py: Remove 'info' argument from nested check_if_str=0D
  qapi/expr.py: Check for dict instead of OrderedDict=0D
  qapi/expr.py: constrain incoming expression types=0D
  qapi/expr.py: Add assertion for union type 'check_dict'=0D
  qapi/expr.py: move string check upwards in check_type=0D
  qapi: add tests for invalid 'data' field type=0D
  qapi/expr.py: Check type of 'data' member=0D
  qapi/expr.py: Add casts in a few select cases=0D
  qapi/expr.py: Modify check_keys to accept any Collection=0D
  qapi/expr.py: add type hint annotations=0D
  qapi/expr.py: Consolidate check_if_str calls in check_if=0D
  qapi/expr.py: Remove single-letter variable=0D
  qapi/expr.py: enable pylint checks=0D
  qapi/expr.py: Add docstrings=0D
  qapi/expr.py: Use tuples instead of lists for static data=0D
  qapi/expr.py: move related checks inside check_xxx functions=0D
  qapi/expr.py: Use an expression checker dispatch table=0D
=0D
 scripts/qapi/.flake8                          |   1 +=0D
 scripts/qapi/common.py                        |   8 +-=0D
 scripts/qapi/events.py                        |   9 +-=0D
 scripts/qapi/expr.py                          | 499 +++++++++++++-----=0D
 scripts/qapi/gen.py                           |   8 +-=0D
 scripts/qapi/introspect.py                    |   8 +-=0D
 scripts/qapi/main.py                          |   4 +-=0D
 scripts/qapi/mypy.ini                         |   5 -=0D
 scripts/qapi/parser.py                        |  15 +-=0D
 scripts/qapi/pylintrc                         |   1 -=0D
 scripts/qapi/schema.py                        |  23 +-=0D
 scripts/qapi/types.py                         |   7 +-=0D
 .../alternate-invalid-data-type.err           |   2 +=0D
 .../alternate-invalid-data-type.json          |   4 +=0D
 .../alternate-invalid-data-type.out           |   0=0D
 tests/qapi-schema/meson.build                 |   2 +=0D
 tests/qapi-schema/union-invalid-data-type.err |   2 +=0D
 .../qapi-schema/union-invalid-data-type.json  |  13 +=0D
 tests/qapi-schema/union-invalid-data-type.out |   0=0D
 19 files changed, 449 insertions(+), 162 deletions(-)=0D
 create mode 100644 tests/qapi-schema/alternate-invalid-data-type.err=0D
 create mode 100644 tests/qapi-schema/alternate-invalid-data-type.json=0D
 create mode 100644 tests/qapi-schema/alternate-invalid-data-type.out=0D
 create mode 100644 tests/qapi-schema/union-invalid-data-type.err=0D
 create mode 100644 tests/qapi-schema/union-invalid-data-type.json=0D
 create mode 100644 tests/qapi-schema/union-invalid-data-type.out=0D
=0D
--=20=0D
2.30.2=0D
=0D


