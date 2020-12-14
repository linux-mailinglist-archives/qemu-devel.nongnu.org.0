Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528A52DA469
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 00:55:23 +0100 (CET)
Received: from localhost ([::1]:59000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxgY-0004Yr-Aa
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 18:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxev-00032R-Li
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxet-0000so-6u
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607990018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uwCJnsLKmgDKPUu796maeXj00fPaUyZST5WK2kII/hE=;
 b=DLdXaKeceO/DRu5dUsa1K3lmWTtv1Ds89BuRnEjF3lGecf3/5dFUTJEFUiUugb3wuKnrer
 puc9qbwyurg9KvN9GFOg+GrRIKe5PmKxK25qn6SlOsz0ihNpwNduWjKsu9QDinN9GOFM5T
 wAcnYQiNS4ne8A8BBHwAXEokZ93iIzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-p5vBdKiwNiW0_-Guklm9rw-1; Mon, 14 Dec 2020 18:53:36 -0500
X-MC-Unique: p5vBdKiwNiW0_-Guklm9rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B00661922961
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 23:53:35 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EBC670485;
 Mon, 14 Dec 2020 23:53:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/12] qapi: static typing conversion, pt1.5
Date: Mon, 14 Dec 2020 18:53:15 -0500
Message-Id: <20201214235327.1007124-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this patchset enables strict optional checking in mypy for=0D
everything we have typed so far.=0D
=0D
In general, this patchset seeks to eliminate Optional[T] in favor of T=0D
wherever possible. Optional types used for object properties,=0D
function/method parameters and return values where we expect, in most=0D
cases, to be non-None is troublesome as it requires peppering the code=0D
with assertions about state. If and whenever possible, prefer using=0D
non-Optional types.=0D
=0D
Ironing out these issues allows us to be even stricter with our type=0D
checking, which improves consistency in subclass interface types and=0D
should make review a little nicer.=0D
=0D
This series is based on (but does not require) the 'qapi: sphinx-autodoc=0D
for qapi module' series.=0D
=0D
John Snow (12):=0D
  qapi/commands: assert arg_type is not None=0D
  qapi/events: fix visit_event typing=0D
  qapi/main: handle theoretical None-return from re.match()=0D
  qapi/gen: assert that _start_if is not None in _wrap_ifcond=0D
  qapi/gen: use './builtin' for the built-in module name=0D
  qapi/source: Add builtin null-object sentinel=0D
  qapi/gen: write _genc/_genh access shims=0D
  qapi/schema: make QAPISourceInfo mandatory=0D
  qapi/gen: move write method to QAPIGenC, make fname a str=0D
  tests/qapi-schema: Add quotes to module name in test output=0D
  qapi/schema: Name the builtin module "" instead of None=0D
  qapi: enable strict-optional checks=0D
=0D
 scripts/qapi/commands.py                 |  11 ++-=0D
 scripts/qapi/events.py                   |  14 +--=0D
 scripts/qapi/gen.py                      | 107 ++++++++++++-----------=0D
 scripts/qapi/main.py                     |   3 +-=0D
 scripts/qapi/mypy.ini                    |   1 -=0D
 scripts/qapi/schema.py                   |  33 +++----=0D
 scripts/qapi/source.py                   |  20 ++++-=0D
 scripts/qapi/types.py                    |  11 +--=0D
 scripts/qapi/visit.py                    |   8 +-=0D
 tests/qapi-schema/comments.out           |   4 +-=0D
 tests/qapi-schema/doc-good.out           |   4 +-=0D
 tests/qapi-schema/empty.out              |   4 +-=0D
 tests/qapi-schema/event-case.out         |   4 +-=0D
 tests/qapi-schema/include-repetition.out |   8 +-=0D
 tests/qapi-schema/include-simple.out     |   6 +-=0D
 tests/qapi-schema/indented-expr.out      |   4 +-=0D
 tests/qapi-schema/qapi-schema-test.out   |   8 +-=0D
 tests/qapi-schema/test-qapi.py           |   2 +-=0D
 18 files changed, 143 insertions(+), 109 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


