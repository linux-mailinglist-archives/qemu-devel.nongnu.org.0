Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F03431C588
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:30:33 +0100 (CET)
Received: from localhost ([::1]:47022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBq8G-0000FX-6V
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:30:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwQ-0001Sd-1r
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpwN-00031J-HB
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613441894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5917PSMz2g65wMtlQWH02CpbndSiFwxp9o3DSEVvCVU=;
 b=DjHmEuVC7XSVuzebO/P9wK8nV85OaYq71Z4eYLvHaG+gOxLEWHZ+Tl3S2eiRBIfu54ldCI
 hpur9acoL6+mdpevVC1/FWJcIYKlo9JRMJQdLOGfRNac2K1fZ9UXkQnBdZ7C3efyIM7eLQ
 3IldBdeXHWGxyMuDBMMjYnvptqivk+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-hWOg9oDpPSOaqYKpDUOuyQ-1; Mon, 15 Feb 2021 21:18:12 -0500
X-MC-Unique: hWOg9oDpPSOaqYKpDUOuyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D62018A08C3;
 Tue, 16 Feb 2021 02:18:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDBAA10023AF;
 Tue, 16 Feb 2021 02:18:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 00/19] qapi: static typing conversion, pt2
Date: Mon, 15 Feb 2021 21:17:50 -0500
Message-Id: <20210216021809.134886-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this series adds static type hints to the QAPI module.=0D
This is part two, and covers introspect.py.=0D
=0D
Part 2: https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt2=0D
Everything: https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt6=0D
=0D
- Requires Python 3.6+=0D
- Requires mypy 0.770 or newer (for type analysis only)=0D
- Requires pylint 2.6.0 or newer (for lint checking only)=0D
=0D
(Note: pylint does not like Python 3.9 very much yet. Known problem.)=0D
=0D
Type hints are added in patches that add *only* type hints and change no=0D
other behavior. Any necessary changes to behavior to accommodate typing=0D
are split out into their own tiny patches.=0D
=0D
Every commit should pass with (from ./scripts):=0D
 - flake8 qapi/=0D
 - pylint --rcfile=3Dqapi/pylintrc qapi/=0D
 - mypy --config-file=3Dqapi/mypy.ini qapi/=0D
 - isort -c qapi/=0D
=0D
V6:=0D
=0D
001/19:[down] 'qapi: Replace List[str] with Sequence[str] for ifcond'=0D
009/19:[0021] [FC] 'qapi/introspect.py: Introduce preliminary tree typing'=
=0D
010/19:[0013] [FC] 'qapi/introspect.py: create a typed 'Annotated' data str=
utcure'=0D
013/19:[down] 'qapi/introspect.py: remove _gen_variants helper'=0D
014/19:[0053] [FC] 'qapi/introspect.py: add type hint annotations'=0D
015/19:[down] 'qapi/introspect.py: Add docstrings to _gen_tree and _tree_to=
_qlit'=0D
017/19:[down] 'qapi/introspect.py: Type _gen_tree variants as Sequence[str]=
'=0D
018/19:[down] 'qapi/introspect.py: set _gen_tree's default ifcond argument =
to ()'=0D
019/19:[down] 'qapi/introspect.py: add SchemaMetaType enum'=0D
=0D
01: New; consistently type ifcond as Seq[str] in already-typed files.=0D
09: Adjust comment concerning _stub to be more clear (?)=0D
    Rename _stub to _Stub, etc.=0D
    TreeValue becomes JSONValue.=0D
10: _NodeT becomes _ValueT to match the _Value name.=0D
    Change visit_alternate_type whitespace around some more.=0D
13: New, pre-requisite for using SchemaInfo aliases.=0D
        (Was not appropriate to go into #14.)=0D
14: Use Sequence[str] instead of List[str] for ifcond=0D
    Use SchemaInfo "dummy types" instead of _DObject=0D
15: Adjust comment to mention dict_value limitation.=0D
    Add docstring for _gen_tree (from former "dummy types" patch).=0D
    Change name of commit to reflect now-multiple docstring additions.=0D
=0D
OPTIONAL PATCHES:=0D
=0D
17: Use Sequence[QAPISchemaFeature] instead of Optional[List[QAPISchemaFeat=
ure]]=0D
18: Set a default argument for ifcond to the empty tuple ().=0D
    Stylistically matches the above patch.=0D
19: Create a SchemaMetaType enum and use it instead of the string type.=0D
    (Contains an optional blurb that can be removed if desired.)=0D
=0D
V5:=0D
=0D
04: Rename 'suppress_first_indent' to 'dict_value'=0D
    (Docstring added in 014.)=0D
06: Avoid changing the output structure of _make_tree=0D
07: Chance the structure of _make_tree 8-)=0D
08: Change commented TreeValue to include a TODO instead.=0D
09: Change NodeT bound to _value instead of TreeValue=0D
    Change "Remove in 3.7" text to include "TODO: "=0D
    Remove forwarding suppress_first_indent/dict_value in recursive cases=
=0D
    Change spacing in visit_alternate_type()=0D
11: Consequence of suppress_first_value/dict_value change=0D
12: Commit message note added=0D
    Changed _DObject comment=0D
13: Commit notes adjusted=0D
    _DObject stuff: Comment near SchemaInfo et al adjusted=0D
14: Changed docstring to reflect dict_value change=0D
15: Updated copyright year for 2021 :~)=0D
=0D
V4:=0D
 - Rebased on "pt1.5" v4=0D
 - signatures updated to use Optional[QAPISourceInfo]=0D
=0D
John Snow (19):=0D
  qapi: Replace List[str] with Sequence[str] for ifcond=0D
  qapi/introspect.py: assert schema is not None=0D
  qapi/introspect.py: use _make_tree for features nodes=0D
  qapi/introspect.py: add _gen_features helper=0D
  qapi/introspect.py: guard against ifcond/comment misuse=0D
  qapi/introspect.py: Unify return type of _make_tree()=0D
  qapi/introspect.py: replace 'extra' dict with 'comment' argument=0D
  qapi/introspect.py: Always define all 'extra' dict keys=0D
  qapi/introspect.py: Introduce preliminary tree typing=0D
  qapi/introspect.py: create a typed 'Annotated' data strutcure=0D
  qapi/introspect.py: improve _tree_to_qlit error message=0D
  qapi/introspect.py: improve readability of _tree_to_qlit=0D
  qapi/introspect.py: remove _gen_variants helper=0D
  qapi/introspect.py: add type hint annotations=0D
  qapi/introspect.py: Add docstrings to _gen_tree and _tree_to_qlit=0D
  qapi/introspect.py: Update copyright and authors list=0D
  qapi/introspect.py: Type _gen_tree variants as Sequence[str]=0D
  qapi/introspect.py: set _gen_tree's default ifcond argument to ()=0D
  qapi/introspect.py: add SchemaMetaType enum=0D
=0D
 scripts/qapi/commands.py   |   3 +-=0D
 scripts/qapi/events.py     |   4 +-=0D
 scripts/qapi/gen.py        |  12 +-=0D
 scripts/qapi/introspect.py | 350 +++++++++++++++++++++++++++----------=0D
 scripts/qapi/mypy.ini      |   5 -=0D
 scripts/qapi/schema.py     |   2 +-=0D
 scripts/qapi/types.py      |  12 +-=0D
 scripts/qapi/visit.py      |  10 +-=0D
 8 files changed, 275 insertions(+), 123 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


