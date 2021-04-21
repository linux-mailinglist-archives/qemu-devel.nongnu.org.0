Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6E6367274
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:23:52 +0200 (CEST)
Received: from localhost ([::1]:46766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHVv-0004IF-Jr
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHSr-0002bT-1C
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHSo-0003d1-AM
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vAYz37xoR+rwXZJi0SA65+plXMrULnCJM+cuX9t/8ZM=;
 b=KYdUJo6TRLiJroaQ2Wkp10ISYpe4YSXXTV+3Jp1xhLT6y+0o6bxqnjWO7cCiGIde9pPw31
 1uX1iOviQkgY1AxU7LL6WY2bUxqVhhuS1nVZw1I1R9qR3Xi0vKAbdp+tmEZomb7g7IX6PS
 7EIo+O1Ixhh30M+1UkkDaJH47FCW6VQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-NiVlqq5GMl2gSWcZPe8xRg-1; Wed, 21 Apr 2021 14:20:34 -0400
X-MC-Unique: NiVlqq5GMl2gSWcZPe8xRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C8FE84B9A1;
 Wed, 21 Apr 2021 18:20:33 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 842B919D9B;
 Wed, 21 Apr 2021 18:20:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 00/17] qapi: static typing conversion, pt3
Date: Wed, 21 Apr 2021 14:20:15 -0400
Message-Id: <20210421182032.3521476-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
V5:=0D
=0D
001/17:[----] [--] 'qapi/expr: Comment cleanup'=0D
002/19: -DROPPED-  'flake8: Enforce shorter line length for comments and do=
cstrings'=0D
002/17:[----] [--] 'qapi/expr.py: Remove 'info' argument from nested check_=
if_str'=0D
003/17:[----] [--] 'qapi/expr.py: Check for dict instead of OrderedDict'=0D
004/17:[0006] [FC] 'qapi/expr.py: constrain incoming expression types'=0D
005/17:[----] [--] 'qapi/expr.py: Add assertion for union type 'check_dict'=
'=0D
006/17:[----] [--] 'qapi/expr.py: move string check upwards in check_type'=
=0D
007/17:[down]      'qapi/expr.py: Check type of union and alternate 'data' =
member'=0D
008/19: -MERGED- ^ 'qapi: add tests for invalid 'data' field type'=0D
009/19: -MERGED- ^ 'qapi/expr.py: Check type of 'data' member'=0D
008/17:[0004] [FC] 'qapi/expr.py: Add casts in a few select cases'=0D
009/17:[----] [--] 'qapi/expr.py: Modify check_keys to accept any Collectio=
n'=0D
010/17:[----] [-C] 'qapi/expr.py: add type hint annotations'=0D
011/17:[0013] [FC] 'qapi/expr.py: Consolidate check_if_str calls in check_i=
f'=0D
012/17:[----] [--] 'qapi/expr.py: Remove single-letter variable'=0D
013/17:[----] [--] 'qapi/expr.py: enable pylint checks'=0D
014/17:[down]      'qapi/expr: Only explicitly prohibit 'Kind' nor 'List' f=
or type names'=0D
015/17:[0227] [FC] 'qapi/expr.py: Add docstrings'=0D
016/17:[----] [-C] 'qapi/expr.py: Use tuples instead of lists for static da=
ta'=0D
017/17:[down]      'qapi/expr: Update authorship and copyright information'=
=0D
018/19: -DROPPED-  'qapi/expr.py: move related checks inside check_xxx func=
tions'=0D
019/19: -DROPPED-  'qapi/expr.py: Use an expression checker dispatch table'=
=0D
=0D
- Dropped what was 02, 18, 19.=0D
- Merged what was 08, 09 into what is now 07.=0D
- 04: Expanded comment for _JSONObject type alias.=0D
- 07: "New", combines the fix and the test patches from the previous series=
 into=0D
      one patch.=0D
- 08: Fixed spelling of "Checked" from "Asserted"=0D
- 11: Reverted back to Python2 style string interpolation=0D
- 14: New, fix the code to reflect the docs for Kind/List reservations.=0D
- 15: Many, many docstring changes. (Too many to list!)=0D
- 17: New, update copyright/authorship. (Could be folded into 15 if desired=
,=0D
      as that's what I'm claiming credit for.)=0D
=0D
John Snow (17):=0D
  qapi/expr: Comment cleanup=0D
  qapi/expr.py: Remove 'info' argument from nested check_if_str=0D
  qapi/expr.py: Check for dict instead of OrderedDict=0D
  qapi/expr.py: constrain incoming expression types=0D
  qapi/expr.py: Add assertion for union type 'check_dict'=0D
  qapi/expr.py: move string check upwards in check_type=0D
  qapi/expr.py: Check type of union and alternate 'data' member=0D
  qapi/expr.py: Add casts in a few select cases=0D
  qapi/expr.py: Modify check_keys to accept any Collection=0D
  qapi/expr.py: add type hint annotations=0D
  qapi/expr.py: Consolidate check_if_str calls in check_if=0D
  qapi/expr.py: Remove single-letter variable=0D
  qapi/expr.py: enable pylint checks=0D
  qapi/expr: Only explicitly prohibit 'Kind' nor 'List' for type names=0D
  qapi/expr.py: Add docstrings=0D
  qapi/expr.py: Use tuples instead of lists for static data=0D
  qapi/expr: Update authorship and copyright information=0D
=0D
 scripts/qapi/expr.py                          | 444 +++++++++++++++---=0D
 scripts/qapi/mypy.ini                         |   5 -=0D
 scripts/qapi/pylintrc                         |   1 -=0D
 tests/qapi-schema/alternate-data-invalid.err  |   2 +=0D
 tests/qapi-schema/alternate-data-invalid.json |   4 +=0D
 tests/qapi-schema/alternate-data-invalid.out  |   0=0D
 tests/qapi-schema/meson.build                 |   2 +=0D
 tests/qapi-schema/union-invalid-data.err      |   2 +=0D
 tests/qapi-schema/union-invalid-data.json     |   6 +=0D
 tests/qapi-schema/union-invalid-data.out      |   0=0D
 10 files changed, 385 insertions(+), 81 deletions(-)=0D
 create mode 100644 tests/qapi-schema/alternate-data-invalid.err=0D
 create mode 100644 tests/qapi-schema/alternate-data-invalid.json=0D
 create mode 100644 tests/qapi-schema/alternate-data-invalid.out=0D
 create mode 100644 tests/qapi-schema/union-invalid-data.err=0D
 create mode 100644 tests/qapi-schema/union-invalid-data.json=0D
 create mode 100644 tests/qapi-schema/union-invalid-data.out=0D
=0D
--=20=0D
2.30.2=0D
=0D


