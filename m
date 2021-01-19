Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74A2FBEF2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:29:19 +0100 (CET)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vkk-0005iB-Od
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLL-0007bC-Gq
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLH-0005Of-PG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cNT5+IdQX1p+5ikNy5F7fiWIc/GheO3C6l+TizmZ0x0=;
 b=GaK3ieH336DAR4hVotNvOrB59mslyGoDvqw34r7Qlp2JjpoIjyOdgkQYyhQ+uOn0aMKZ5g
 0Ypz3V7oMSIo9U9m19T/vIm2CrHIDu54EXU7Xzjao7QvTfPHIEHmMZbrsDWiSBzgKOu5eI
 xEIu8sxU4sCTIKGrlpXz2AP1hck+sX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-wTTmgDznOYK0TAabHybimw-1; Tue, 19 Jan 2021 13:02:53 -0500
X-MC-Unique: wTTmgDznOYK0TAabHybimw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E1DB1054F8A
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:02:46 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B22E5D9DD;
 Tue, 19 Jan 2021 18:02:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/17] qapi: static typing conversion, pt1.5
Date: Tue, 19 Jan 2021 13:02:25 -0500
Message-Id: <20210119180242.1570753-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this patchset enables strict optional checking in mypy for=0D
everything we have typed so far.=0D
=0D
In general, this patchset seeks to clarify Optional[T] vs T and lift the=0D
no-strict-optional restriction in mypy.=0D
=0D
Ironing out these issues allows us to be even stricter with our type=0D
checking, which improves consistency in subclass interface types and=0D
should make review a little nicer.=0D
=0D
This series is based on (but does not require) the 'qapi: sphinx-autodoc=0D
for qapi module' series.=0D
=0D
V3:=0D
=0D
Heavily reshuffled. QAPISourceInfo patches are removed in favor of patch=0D
implications for later series, but none here in this series.=0D
=0D
001/17:[----] [--] 'qapi/commands: assert arg_type is not None'=0D
002/17:[----] [--] 'qapi/events: fix visit_event typing'=0D
003/17:[----] [--] 'qapi/main: handle theoretical None-return from re.match=
()'=0D
004/17:[down] 'qapi/gen: inline _wrap_ifcond into end_if()'=0D
=0D
Module naming patches begin here. Their ordering is a little troubled,=0D
but I've rebased and re-ordered them too many times and I'm spinning my whe=
els.=0D
Suggestions welcome.=0D
=0D
005/17:[down] 'qapi: pass QAPISchemaModule to visit_module instead of str'=
=0D
006/17:[down] 'qapi: centralize is_[user|system|builtin]_module methods'=0D
007/17:[down] 'qapi/gen: Replace ._begin_system_module()'=0D
008/17:[down] 'qapi: use explicitly internal module names'=0D
009/17:[down] 'qapi: use './builtin' as the built-in module name'=0D
010/17:[down] 'qapi/gen: Combine ._add_[user|system]_module'=0D
011/17:[down] 'qapi: centralize the built-in module name definition'=0D
=0D
This segment of patches focuses on tightening the types in gen.py. #15=0D
is the payoff for 13-14 and several patches in the last segment.=0D
=0D
012/17:[----] [-C] 'qapi/gen: write _genc/_genh access shims'=0D
013/17:[down] 'qapi/gen: Support for switching to another module temporaril=
y'=0D
014/17:[down] 'qapi/commands: Simplify command registry generation'=0D
015/17:[down] 'qapi/gen: Drop support for QAPIGen without a file name'=0D
=0D
This segment wraps up removing the last non-strict option in mypy.=0D
=0D
016/17:[down] 'qapi: type 'info' as Optional[QAPISourceInfo]'=0D
017/17:[----] [--] 'qapi: enable strict-optional checks'=0D
=0D
John Snow (12):=0D
  qapi/commands: assert arg_type is not None=0D
  qapi/events: fix visit_event typing=0D
  qapi/main: handle theoretical None-return from re.match()=0D
  qapi/gen: inline _wrap_ifcond into end_if()=0D
  qapi: pass QAPISchemaModule to visit_module instead of str=0D
  qapi: centralize is_[user|system|builtin]_module methods=0D
  qapi: use explicitly internal module names=0D
  qapi: use './builtin' as the built-in module name=0D
  qapi: centralize the built-in module name definition=0D
  qapi/gen: write _genc/_genh access shims=0D
  qapi: type 'info' as Optional[QAPISourceInfo]=0D
  qapi: enable strict-optional checks=0D
=0D
Markus Armbruster (5):=0D
  qapi/gen: Replace ._begin_system_module()=0D
  qapi/gen: Combine ._add_[user|system]_module=0D
  qapi/gen: Support for switching to another module temporarily=0D
  qapi/commands: Simplify command registry generation=0D
  qapi/gen: Drop support for QAPIGen without a file name=0D
=0D
 docs/sphinx/qapidoc.py                   |  8 +-=0D
 scripts/qapi/commands.py                 | 62 ++++++++-------=0D
 scripts/qapi/events.py                   | 16 ++--=0D
 scripts/qapi/gen.py                      | 96 ++++++++++++------------=0D
 scripts/qapi/main.py                     |  2 +=0D
 scripts/qapi/mypy.ini                    |  1 -=0D
 scripts/qapi/schema.py                   | 43 +++++++++--=0D
 scripts/qapi/types.py                    |  4 +-=0D
 scripts/qapi/visit.py                    |  6 +-=0D
 tests/qapi-schema/comments.out           |  2 +-=0D
 tests/qapi-schema/doc-good.out           |  2 +-=0D
 tests/qapi-schema/empty.out              |  2 +-=0D
 tests/qapi-schema/event-case.out         |  2 +-=0D
 tests/qapi-schema/include-repetition.out |  2 +-=0D
 tests/qapi-schema/include-simple.out     |  2 +-=0D
 tests/qapi-schema/indented-expr.out      |  2 +-=0D
 tests/qapi-schema/qapi-schema-test.out   |  2 +-=0D
 tests/qapi-schema/test-qapi.py           |  4 +-=0D
 18 files changed, 145 insertions(+), 113 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


