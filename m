Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1F32232E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 01:40:24 +0100 (CET)
Received: from localhost ([::1]:38768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lELkL-0005rs-SU
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 19:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELfo-0000oc-MZ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:35:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELec-0005M0-I0
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614040453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1bzOLbmwlvVAMcfzUsKobi+Jko+XsKC74KGeNHr+QyI=;
 b=DlXe8+pvjxxN0OQlM8/kD71H5khVSPN9GUg0Zikll9wPGPm39OQc1fGW+OiowrOwGuqRvJ
 0dZhoVFN8ZOLDLCR7zT0ba6YaTr8eDqng5SxKDf3EA/crn4Pj7oC/GuhfD397FSXcHiwwW
 BiMNHbOoOXTdBzBSv3wjNCTeeKSJOZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-OINIulvfPDSuTnR9sBqQoA-1; Mon, 22 Feb 2021 19:34:10 -0500
X-MC-Unique: OINIulvfPDSuTnR9sBqQoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E38A1005501;
 Tue, 23 Feb 2021 00:34:09 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE81E5D6D5;
 Tue, 23 Feb 2021 00:34:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 00/16] qapi: static typing conversion, pt3
Date: Mon, 22 Feb 2021 19:33:52 -0500
Message-Id: <20210223003408.964543-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
This series is applied and hosted here:=0D
https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt3=0D
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
Please read the changelog below for some review notes that may be of intere=
st.=0D
=0D
V3:=0D
=0D
001/16:[----] [--] 'qapi/expr.py: Remove 'info' argument from nested check_=
if_str'=0D
002/16:[----] [--] 'qapi/expr.py: Check for dict instead of OrderedDict'=0D
003/16:[0004] [FC] 'qapi/expr.py: constrain incoming expression types'=0D
004/16:[----] [--] 'qapi/expr.py: Add assertion for union type 'check_dict'=
'=0D
005/16:[----] [--] 'qapi/expr.py: move string check upwards in check_type'=
=0D
006/16:[----] [--] 'qapi/expr.py: Check type of 'data' member'=0D
007/16:[0002] [FC] 'qapi/expr.py: Add casts in a few select cases'=0D
008/16:[----] [--] 'qapi/expr.py: add type hint annotations'=0D
009/16:[down] 'qapi/expr.py: Consolidate check_if_str calls in check_if'=0D
010/16:[----] [--] 'qapi/expr.py: Remove single-letter variable'=0D
011/16:[----] [--] 'qapi/expr.py: enable pylint checks'=0D
012/16:[----] [-C] 'qapi/expr.py: Add docstrings'=0D
013/16:[down] 'qapi/expr.py: Modify check_keys to accept any Collection'=0D
014/16:[----] [--] 'qapi/expr.py: Use tuples instead of lists for static da=
ta'=0D
015/16:[0004] [FC] 'qapi/expr.py: move related checks inside check_xxx func=
tions'=0D
016/16:[0011] [FC] 'qapi/expr.py: Use an expression checker dispatch table'=
=0D
=0D
 - Some RB-s added, some dropped; see "Review Status" section below.=0D
 - ("pt0" series rebased on latest origin/master.)=0D
 - Rebased on origin/master.=0D
 - 03: Re-ordered the Expression unpacking slightly to match the other stan=
zas.=0D
       (R-Bs kept.)=0D
 - 07: Changed capitalization of a comment. (R-Bs kept.)=0D
 - 09: Rewritten more aggressively. (R-Bs dropped.)=0D
 - 13: Use "Collection" instead of "Iterable" because of concerns with the=
=0D
       possibly consumptive nature of Iterable; change commit name & messag=
e.=0D
       (R-Bs dropped.)=0D
 - 15: Use tuples everywhere, even for single items. (R-Bs kept.)=0D
 - 16: Update ExpressionType to define a __str__ method, which allows=0D
       the meta variable to be passed and used directly as a string.=0D
       (R-Bs dropped.)=0D
=0D
RFCs/notes:=0D
=0D
- This series was written long before pt1.5 and pt2. Keep that in mind! (So=
rry.)=0D
=0D
- I used MutableMapping instead of Dict in patch 8. There's no real=0D
  reason I couldn't have used Dict, both work - this one is more=0D
  abstract.  Both would work for dict/OrderedDict perfectly well.=0D
=0D
  (I think I had some reason at one point or another, but I can no=0D
  longer remember what it is, if I am being honest. It might have to do=0D
  with Dict being invariant, but MutableMapping being covariant, which=0D
  might come into play much later in the six-part series. I really=0D
  forget.)=0D
=0D
- The dreaded _DObject comes back, this time named _JSObject. It's a bad na=
me.=0D
  It means "Any JSON object deserialized as a Python dict". I didn't rename=
 it=0D
  because I didn't want to shed the R-Bs yet. Please suggest a name.=0D
  (Or a way to avoid needing it at all.)=0D
=0D
  You'll probably notice that I keep futzing with the documentation near=0D
  this definition. I opted not to fix it to avoid touching patches that=0D
  were (so far) fully reviewed.=0D
=0D
- Patch 12 (the docstring patch) needs to be heavily copy-edited. I=0D
  figured I would simply address it all at once after review from=0D
  Markus. I ask that a review of this patch be exhaustive if at all=0D
  possible.=0D
=0D
  I start using [Const] and [RW] markers in the summary string; I think=0D
  I will actually remove these as they are not real markup, but I'd like=0D
  to solicit suggestions on how to differentiate functions that modify=0D
  expr from ones that do not.=0D
=0D
  I also start using some fairly arbitrary syntax to try and document=0D
  the syntactic forms being checked and normalized here, but they are=0D
  not very consistent. Suggestions welcome.=0D
=0D
- Patch 16 is something I am not sure I really like anymore, it has some=0D
  mild benefit but I don't like how I repeat the expression types twice=0D
  in one file. I consider this patch optional for now. I suspect there's=0D
  a neater way to write it that gives us the same benefit but looks less=0D
  ugly.=0D
=0D
Review Status:=0D
=0D
[01] qapi-expr-py-remove-info       # [RB] CR,EH [SOB] JS=0D
[02] qapi-expr-py-check-for-dict    # [RB] CR,EH [SOB] JS=0D
[03] qapi-expr-py-constrain         # [RB] CR,EH [SOB] JS=0D
[04] qapi-expr-py-add-assertion-for # [RB] CR,EH [SOB] JS=0D
[05] qapi-expr-py-move-string-check # [RB] CR,EH [SOB] JS=0D
[06] qapi-expr-py-check-type-of     # [RB]    EH [SOB] JS=0D
[07] qapi-expr-py-add-casts-in-a    # [RB] CR,EH [SOB] JS=0D
[08] qapi-expr-py-add-type-hint     # [RB] CR,EH [SOB] JS=0D
[09] qapi-expr-py-consolidate       #            [SOB] JS=0D
[10] qapi-expr-py-remove-single     # [RB] CR,EH [SOB] JS=0D
[11] qapi-expr-py-enable-pylint     # [RB] CR,EH [SOB] JS=0D
[12] qapi-expr-py-add-docstrings    # [RB] CR    [SOB] JS=0D
[13] qapi-expr-py-modify-check_keys #            [SOB] JS=0D
[14] qapi-expr-py-use-tuples        # [RB] CR,EH [SOB] JS=0D
[15] qapi-expr-py-move-related      # [RB] CR    [SOB] JS=0D
[16] qapi-expr-py-use-an-expression #            [SOB] JS=0D
=0D
John Snow (16):=0D
  qapi/expr.py: Remove 'info' argument from nested check_if_str=0D
  qapi/expr.py: Check for dict instead of OrderedDict=0D
  qapi/expr.py: constrain incoming expression types=0D
  qapi/expr.py: Add assertion for union type 'check_dict'=0D
  qapi/expr.py: move string check upwards in check_type=0D
  qapi/expr.py: Check type of 'data' member=0D
  qapi/expr.py: Add casts in a few select cases=0D
  qapi/expr.py: add type hint annotations=0D
  qapi/expr.py: Consolidate check_if_str calls in check_if=0D
  qapi/expr.py: Remove single-letter variable=0D
  qapi/expr.py: enable pylint checks=0D
  qapi/expr.py: Add docstrings=0D
  qapi/expr.py: Modify check_keys to accept any Collection=0D
  qapi/expr.py: Use tuples instead of lists for static data=0D
  qapi/expr.py: move related checks inside check_xxx functions=0D
  qapi/expr.py: Use an expression checker dispatch table=0D
=0D
 scripts/qapi/expr.py  | 453 +++++++++++++++++++++++++++++++-----------=0D
 scripts/qapi/mypy.ini |   5 -=0D
 scripts/qapi/pylintrc |   1 -=0D
 3 files changed, 337 insertions(+), 122 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


