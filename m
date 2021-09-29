Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5622C41CCDD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:48:45 +0200 (CEST)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfZM-000237-1H
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfVy-0007SI-0s
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfVt-00069h-Lg
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gWvg+6wZNKRypMCVUqZ5/YMpW2j/NEMTQn8htC1Wr1o=;
 b=TGntNps6zLxmxXt/XhA2iNC+fWiUtM6zzO3dtiHuFdoJdFN/lfnRaPa86zav21uKYKxh0N
 1nNxXzaYKw2sAzI4ESKxzzHz733ji4B7pUXTyqYKUFJ87RuYxuJOn6MU0JO6z/X3LMtuxL
 i6WN4otQcQGkAKDcQbHXsK2/sbc7baA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460--dZNm99iNrOpodoVbBE7aA-1; Wed, 29 Sep 2021 15:45:06 -0400
X-MC-Unique: -dZNm99iNrOpodoVbBE7aA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D88DA3643B;
 Wed, 29 Sep 2021 19:45:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A0F619739;
 Wed, 29 Sep 2021 19:44:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/13] qapi: static typing conversion, pt5b
Date: Wed, 29 Sep 2021 15:44:15 -0400
Message-Id: <20210929194428.1038496-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
CI: https://gitlab.com/jsnow/qemu/-/pipelines/379678153=0D
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
V3:=0D
=0D
001/13:[down] 'qapi/pylintrc: ignore 'consider-using-f-string' warning'=0D
002/13:[down] 'qapi/gen: use dict.items() to iterate over _modules'=0D
003/13:[----] [--] 'qapi/parser: fix unused check_args_section arguments'=
=0D
004/13:[down] 'qapi: Add spaces after symbol declaration for consistency'=
=0D
005/13:[down] 'qapi/parser: improve detection of '@symbol:' preface'=0D
006/13:[down] 'qapi/parser: remove FIXME comment from _append_body_line'=0D
007/13:[down] 'qapi/parser: Simplify _end_section()'=0D
008/13:[down] 'qapi/parser: Introduce NullSection'=0D
009/13:[down] 'qapi/parser: add import cycle workaround'=0D
010/13:[0028] [FC] 'qapi/parser: add type hint annotations (QAPIDoc)'=0D
011/13:[----] [--] 'qapi/parser: enable mypy checks'=0D
012/13:[0003] [FC] 'qapi/parser: Silence too-few-public-methods warning'=0D
013/13:[----] [--] 'qapi/parser: enable pylint checks'=0D
=0D
- Rebased.=0D
- Add patches 1 & 2 for newer pylint versions=0D
- Add patches 4-6 because I was in the neighborhood=0D
- Patches 7 & 8 rewritten from the corpse of the prior fix/workaround=0D
- Patch 9 split out separately from what is now patch 10=0D
- Update patch 12 to accommodate new 7/8=0D
=0D
Notes:=0D
- Patches 4-6 aren't crucial and can be omitted from staging if it makes=0D
  the difference between a respin or not. I think I will definitely want=0D
  patches 5-6 eventually anyway, though. (Or something to replace 'em.)=0D
- Patch 10 and 11 can be squashed, if desired=0D
=0D
John Snow (13):=0D
  qapi/pylintrc: ignore 'consider-using-f-string' warning=0D
  qapi/gen: use dict.items() to iterate over _modules=0D
  qapi/parser: fix unused check_args_section arguments=0D
  qapi: Add spaces after symbol declaration for consistency=0D
  qapi/parser: improve detection of '@symbol:' preface=0D
  qapi/parser: remove FIXME comment from _append_body_line=0D
  qapi/parser: Simplify _end_section()=0D
  qapi/parser: Introduce NullSection=0D
  qapi/parser: add import cycle workaround=0D
  qapi/parser: add type hint annotations (QAPIDoc)=0D
  qapi/parser: enable mypy checks=0D
  qapi/parser: Silence too-few-public-methods warning=0D
  qapi/parser: enable pylint checks=0D
=0D
 qapi/block-core.json                          |   1 +=0D
 qga/qapi-schema.json                          |   3 +=0D
 scripts/qapi/gen.py                           |   3 +-=0D
 scripts/qapi/mypy.ini                         |   5 -=0D
 scripts/qapi/parser.py                        | 161 +++++++++++-------=0D
 scripts/qapi/pylintrc                         |   4 +-=0D
 tests/qapi-schema/doc-bad-feature.err         |   2 +-=0D
 tests/qapi-schema/doc-empty-symbol.err        |   2 +-=0D
 tests/qapi-schema/doc-good.json               |   8 +=0D
 .../doc-whitespace-leading-symbol.err         |   1 +=0D
 .../doc-whitespace-leading-symbol.json        |   6 +=0D
 .../doc-whitespace-leading-symbol.out         |   0=0D
 .../doc-whitespace-trailing-symbol.err        |   1 +=0D
 .../doc-whitespace-trailing-symbol.json       |   6 +=0D
 .../doc-whitespace-trailing-symbol.out        |   0=0D
 tests/qapi-schema/meson.build                 |   2 +=0D
 16 files changed, 134 insertions(+), 71 deletions(-)=0D
 create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.err=0D
 create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.json=0D
 create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.out=0D
 create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.err=0D
 create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.json=
=0D
 create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.out=0D
=0D
--=20=0D
2.31.1=0D
=0D


