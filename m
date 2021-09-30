Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCE41E2F8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 23:05:54 +0200 (CEST)
Received: from localhost ([::1]:55586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW3FZ-0006hA-0j
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 17:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37O-0006n9-R3
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37L-0008PG-AT
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633035442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IrqyS5gmBJON95HiJHjwrgRObtfX5Qr6dLMxadKeE6Q=;
 b=is94w60JqclZMpaGaKCcbYZwPNjOjZ0r/Z6/QgOTa+Dtoab6hamF+zu/qo9LMwIqEmujeI
 iwtCQrLwW0JiHrgi4W4kvBSCoKvo0EmI8mj5Uff3MjBO9BYfgXvoQaUNBbkuATk0e9aUUn
 OJDViihGjphNAjVD73FRgj69Ux1COdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-SyzHscD7PL6DQ0Dq1uMDFQ-1; Thu, 30 Sep 2021 16:57:19 -0400
X-MC-Unique: SyzHscD7PL6DQ0Dq1uMDFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21E5C1891E80;
 Thu, 30 Sep 2021 20:57:18 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2096A60936;
 Thu, 30 Sep 2021 20:57:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/13] qapi: static typing conversion, pt5b
Date: Thu, 30 Sep 2021 16:57:03 -0400
Message-Id: <20210930205716.1148693-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello darkness my old friend; This is part five (b), and focuses on=0D
QAPIDoc in parser.py.=0D
=0D
GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5b=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/380464863=0D
    Note: intentional trailing whitespace in a QAPI schema test causes=0D
    a warning on the `check-patch` CI test. Ignore it.=0D
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
V4:=0D
=0D
005/13:[0006] [FC] 'qapi/parser: remove FIXME comment from _append_body_lin=
e'=0D
006/13:[down] 'qapi/parser: clarify _end_section() logic'=0D
007/13:[0004] [FC] 'qapi/parser: Introduce NullSection'=0D
010/13:[down] 'qapi/parser: Add FIXME for consolidating JSON-related types'=
=0D
=0D
- Dropped formerly-patch-05, for now.=0D
- Added a new FIXME comment to keep myself honest for pt5c O:-)=0D
- (05) Adjusted a commend and the parser error message=0D
- (06) Changed commit title for 06 ("simplify" =3D> "clarify")=0D
- (07) Adjust comment.=0D
=0D
John Snow (13):=0D
  qapi/pylintrc: ignore 'consider-using-f-string' warning=0D
  qapi/gen: use dict.items() to iterate over _modules=0D
  qapi/parser: fix unused check_args_section arguments=0D
  qapi: Add spaces after symbol declaration for consistency=0D
  qapi/parser: remove FIXME comment from _append_body_line=0D
  qapi/parser: clarify _end_section() logic=0D
  qapi/parser: Introduce NullSection=0D
  qapi/parser: add import cycle workaround=0D
  qapi/parser: add type hint annotations (QAPIDoc)=0D
  qapi/parser: Add FIXME for consolidating JSON-related types=0D
  qapi/parser: enable mypy checks=0D
  qapi/parser: Silence too-few-public-methods warning=0D
  qapi/parser: enable pylint checks=0D
=0D
 qapi/block-core.json                   |   1 +=0D
 qga/qapi-schema.json                   |   3 +=0D
 scripts/qapi/gen.py                    |   3 +-=0D
 scripts/qapi/mypy.ini                  |   5 -=0D
 scripts/qapi/parser.py                 | 152 ++++++++++++++++---------=0D
 scripts/qapi/pylintrc                  |   4 +-=0D
 tests/qapi-schema/doc-bad-feature.err  |   2 +-=0D
 tests/qapi-schema/doc-empty-symbol.err |   2 +-=0D
 tests/qapi-schema/doc-good.json        |   8 ++=0D
 9 files changed, 114 insertions(+), 66 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


