Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C13930B077
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:41:07 +0100 (CET)
Received: from localhost ([::1]:60340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6f4M-00067g-El
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1V-00036B-5c
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1M-0005Yr-K2
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612208276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LPDbVNv6C8auTKYepatJ086kcXlzvP70R1hmDRlOYC4=;
 b=aJt9IvpZeiMi5L4h7NN9k3ziRoBe4mukph0gb57nlnValciTPlgAsqGos+laXT1cWUPyfQ
 fMtc9IZgQ5X3CQBzN0PEyBbdkeRxAJ6kXIiviGLBR4UPLIpIEcSBykfhHQeZ7lwHC/WXOG
 Vuvhf01cf1FRUs6XLyTLvt30oPyD5dU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-I4SEc4imPECi78TetAbcRw-1; Mon, 01 Feb 2021 14:37:53 -0500
X-MC-Unique: I4SEc4imPECi78TetAbcRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D735800400;
 Mon,  1 Feb 2021 19:37:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9984F60C05;
 Mon,  1 Feb 2021 19:37:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/16] qapi: static typing conversion, pt1.5
Date: Mon,  1 Feb 2021 14:37:31 -0500
Message-Id: <20210201193747.2169670-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
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
V4:=0D
=0D
001/16:[----] [--] 'qapi/commands: assert arg_type is not None'=0D
002/16:[----] [--] 'qapi/events: fix visit_event typing'=0D
003/16:[----] [--] 'qapi/main: handle theoretical None-return from re.match=
()'=0D
004/16:[----] [--] 'qapi/gen: inline _wrap_ifcond into end_if()'=0D
005/16:[0047] [FC] 'qapi: centralize is_[user|system|builtin]_module method=
s'=0D
006/16:[0007] [FC] 'qapi/gen: Replace ._begin_system_module()'=0D
007/16:[----] [--] 'qapi: use explicitly internal module names'=0D
008/16:[0016] [FC] 'qapi: use './builtin' as the built-in module name'=0D
009/16:[0011] [FC] 'qapi/gen: Combine ._add_[user|system]_module'=0D
010/16:[0008] [FC] 'qapi: centralize the built-in module name definition'=
=0D
011/16:[----] [-C] 'qapi/gen: write _genc/_genh access shims'=0D
012/16:[----] [--] 'qapi/gen: Support for switching to another module tempo=
rarily'=0D
013/16:[----] [--] 'qapi/commands: Simplify command registry generation'=0D
014/16:[----] [--] 'qapi/gen: Drop support for QAPIGen without a file name'=
=0D
015/16:[----] [-C] 'qapi: type 'info' as Optional[QAPISourceInfo]'=0D
016/16:[----] [--] 'qapi: enable strict-optional checks'=0D
=0D
Removed the patch that made visit_module work in terms of QAPISchemaModule=
=0D
instead of the module name.=0D
=0D
05: Remove the properties, keep just the static/classmethods.=0D
    Convert classmethod to staticmethod where possible.=0D
    Add docstrings to alleviate confusion about what these methods do.=0D
    Leave qapidoc generator alone for now.=0D
    Remove future-bleed from is_system_module (check for None, not "./built=
in")=0D
=0D
06: Change the conditionals in gen.py visit_module to use is_builtin_module=
.=0D
=0D
08: Some contextual difference now that modules are no longer being passed=
=0D
    via visit_module.=0D
    Code added by patch 05 is now amended here to make it consistent in his=
tory.=0D
=0D
09: Removed assertion. Changed commit message.=0D
=0D
10: Contextual fallout; removed end-of-line comment that was unneeded.=0D
=0D
Notes:=0D
=0D
Admittedly, at this point it feels like style and taste. I played with=0D
several other alternatives, but felt I wasn't making good progress in=0D
any direction that was more defensible than what I have here.=0D
=0D
If there are nits at this point, I think they generally require more=0D
engineering than what is present here to resolve them satisfactorily; to=0D
that end I feel like this is close to the fewest SLOC changes that felt=0D
defensible. Concrete counter-proposals would be preferred to minimize=0D
guess-work when it comes to matters of style.=0D
=0D
Namely, I would vastly prefer "module.system_module" as a property of=0D
the module object and to pass those to visitors, but the work involved=0D
in doing this is not trivial, because the generators that "add a system=0D
module" generally only add a system module *name* to the generator, as=0D
if it was visited -- but this is an emulated behavior as a=0D
code-generation technique, the module does not exist. Changing the=0D
gen.py functions to *actually* create a module is more hassle than it is=0D
worth at present, so that python module ought to remain working in terms=0D
of module *names*. Renaming the functions to reflect that made them a=0D
little too cumbersome/long for my tastes, so I left them alone.=0D
=0D
However, I still felt it important to begin making the claim that module=0D
namespaces are global and shared between the generator and the schema;=0D
so I still opted to use QAPISchemaModule methods to formalize the module=0D
type definitions, even if we aren't using them in a classy way (yet).=0D
=0D
You may argue that these can be functions instead, and they can; but it=0D
is just an organizational preference that they live within the=0D
QAPISchemaModule namespace because (to me) this solidifies the idea that=0D
schema.py and QAPISchemaModule themselves are the solely responsible=0D
entities for these definitions. (i.e., it makes it clear to me that=0D
these namespaces aren't purely an invention of gen.py -- which they can=0D
no longer be, as we are declaring and naming "./builtin", the built-in=0D
schema module that contains our predefined types in schema.py.)=0D
=0D
I didn't think it was worth making a class for the names alone and going=0D
that route; that felt like more work than was warranted, too. So this=0D
represents roughly the bottom floor of what seemed subjectively=0D
sensible.=0D
=0D
--js=0D
=0D
John Snow (11):=0D
  qapi/commands: assert arg_type is not None=0D
  qapi/events: fix visit_event typing=0D
  qapi/main: handle theoretical None-return from re.match()=0D
  qapi/gen: inline _wrap_ifcond into end_if()=0D
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
 scripts/qapi/commands.py                 | 62 ++++++++--------=0D
 scripts/qapi/events.py                   | 16 ++--=0D
 scripts/qapi/gen.py                      | 94 ++++++++++++------------=0D
 scripts/qapi/main.py                     |  2 +=0D
 scripts/qapi/mypy.ini                    |  1 -=0D
 scripts/qapi/schema.py                   | 42 +++++++++--=0D
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
 16 files changed, 139 insertions(+), 104 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


