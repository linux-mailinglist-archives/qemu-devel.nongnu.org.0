Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0330E8A0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 01:37:57 +0100 (CET)
Received: from localhost ([::1]:45298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Sei-0006md-9I
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 19:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZN-0001DD-ML
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZA-0000aY-Nj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612398731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4pcl/9nOA4QxMU1hf+03WYpFzVm6wyV1ile28k0uLJU=;
 b=NFTl+ROAl2LC2E2XzZVLZQerJjz280IDr3+z1yjCE99deVswkYh7kRIp3CrJciNAfPEAPK
 7//vvybMXlvFWB/vyUe+DvXgimsfpeJD6QgsCXWNmbAC0kYLnf5idDHhQK2r69Et6X+OV9
 K+4veWxgh8DoaEajO3HLeJ+q82UFcGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-Qr9YDJbkOyaF2qqNb6vPmg-1; Wed, 03 Feb 2021 19:32:09 -0500
X-MC-Unique: Qr9YDJbkOyaF2qqNb6vPmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AE0D108C279
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 00:32:08 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8415F101E581;
 Thu,  4 Feb 2021 00:32:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 00/15] qapi: static typing conversion, pt2
Date: Wed,  3 Feb 2021 19:31:52 -0500
Message-Id: <20210204003207.2856909-1-jsnow@redhat.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
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
V5:=0D
=0D
001/15:[----] [--] 'qapi/introspect.py: assert schema is not None'=0D
002/15:[----] [--] 'qapi/introspect.py: use _make_tree for features nodes'=
=0D
003/15:[----] [--] 'qapi/introspect.py: add _gen_features helper'=0D
004/15:[0006] [FC] 'qapi/introspect.py: guard against ifcond/comment misuse=
'=0D
005/15:[----] [-C] 'qapi/introspect.py: Unify return type of _make_tree()'=
=0D
006/15:[0009] [FC] 'qapi/introspect.py: replace 'extra' dict with 'comment'=
 argument'=0D
007/15:[down] 'qapi/introspect.py: Always define all 'extra' dict keys'=0D
008/15:[0002] [FC] 'qapi/introspect.py: Introduce preliminary tree typing'=
=0D
009/15:[0018] [FC] 'qapi/introspect.py: create a typed 'Annotated' data str=
utcure'=0D
010/15:[----] [--] 'qapi/introspect.py: improve _tree_to_qlit error message=
'=0D
011/15:[0002] [FC] 'qapi/introspect.py: improve readability of _tree_to_qli=
t'=0D
012/15:[0008] [FC] 'qapi/introspect.py: add type hint annotations'=0D
013/15:[0006] [FC] 'qapi/introspect.py: add introspect.json dummy types'=0D
014/15:[0003] [FC] 'qapi/introspect.py: Add docstring to _tree_to_qlit'=0D
015/15:[0002] [FC] 'qapi/introspect.py: Update copyright and authors list'=
=0D
=0D
004:=0D
 - Rename 'suppress_first_indent' to 'dict_value'=0D
   (Docstring added in 014.)=0D
006:=0D
 - Avoid changing the output structure of _make_tree=0D
007:=0D
 - Chance the structure of _make_tree 8-)=0D
008:=0D
 - Change commented TreeValue to include a TODO instead.=0D
009:=0D
 - Change NodeT bound to _value instead of TreeValue=0D
 - Change "Remove in 3.7" text to include "TODO: "=0D
 - Remove forwarding suppress_first_indent/dict_value in recursive cases=0D
 - Change spacing in visit_alternate_type()=0D
011:=0D
 - Consequence of suppress_first_value/dict_value change=0D
012:=0D
 - Commit message note added=0D
 - Changed _DObject comment=0D
013:=0D
 - Commit notes adjusted=0D
 - _DObject stuff: Comment near SchemaInfo et al adjusted=0D
014:=0D
 - Changed docstring to reflect dict_value change=0D
015:=0D
 - Updated copyright year for 2021 :~)=0D
=0D
V4:=0D
 - Rebased on "pt1.5" v4=0D
 - signatures updated to use Optional[QAPISourceInfo]=0D
 - Changelog from V3 still relevant (That series went unreviewed.)=0D
=0D
V3:=0D
 - Dropped all the R-Bs again...=0D
 - Re-re-ordered to put type annotations last again.=0D
 - Rebased on top of "pt1.5".=0D
 - Ensured compliance with strict-optional typing.=0D
 - Forgive me if I missed a specific critique;=0D
   I probably just lost it in the shuffle.=0D
=0D
V2:=0D
 - Dropped all R-B from previous series; enough has changed.=0D
 - pt2 is now introspect.py, expr.py is pushed to pt3.=0D
 - Reworked again to have less confusing (?) type names=0D
 - Added an assertion to prevent future accidental breakage=0D
=0D
John Snow (15):=0D
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
  qapi/introspect.py: add type hint annotations=0D
  qapi/introspect.py: add introspect.json dummy types=0D
  qapi/introspect.py: Add docstring to _tree_to_qlit=0D
  qapi/introspect.py: Update copyright and authors list=0D
=0D
 scripts/qapi/introspect.py | 314 ++++++++++++++++++++++++++-----------=0D
 scripts/qapi/mypy.ini      |   5 -=0D
 scripts/qapi/schema.py     |   2 +-=0D
 3 files changed, 223 insertions(+), 98 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


