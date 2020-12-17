Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389722DCAB4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 02:56:31 +0100 (CET)
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpiWs-0005Yc-99
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 20:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUK-0003rd-UG
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:53:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUI-0006I7-Bd
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xj3AF8e1LVZvyc+JVD+u2tSG/0PnpZdfIP6MUpq4rDA=;
 b=WOqxV36z6BgRVDHIOemb/bDCqiQco3HnHz2inT67K2bLAFPV0sHDgn/R2Eb8egsKm8+caq
 E3Z/X1yTyH7cb4L3X+Ssensq4+kIb1yLECU0e9Zlzddxwu+7se4kmuCdp3g0C7JO2u22Py
 Rwn8EQvorJ48MoWRsAMqooY++bsynkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-0FR_DyIFMhSKU1MMsF5CHQ-1; Wed, 16 Dec 2020 20:53:45 -0500
X-MC-Unique: 0FR_DyIFMhSKU1MMsF5CHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5AC5801A9E
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:53:44 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4262060CC4;
 Thu, 17 Dec 2020 01:53:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 00/13] qapi: static typing conversion, pt2
Date: Wed, 16 Dec 2020 20:53:30 -0500
Message-Id: <20201217015343.196279-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Every commit should pass with:=0D
 - flake8 qapi/=0D
 - pylint --rcfile=3Dqapi/pylintrc qapi/=0D
 - mypy --config-file=3Dqapi/mypy.ini qapi/=0D
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
John Snow (13):=0D
  qapi/introspect.py: assert schema is not None=0D
  qapi/introspect.py: use _make_tree for features nodes=0D
  qapi/introspect.py: add _gen_features helper=0D
  qapi/introspect.py: guard against ifcond/comment misuse=0D
  qapi/introspect.py: Unify return type of _make_tree()=0D
  qapi/introspect.py: replace 'extra' dict with 'comment' argument=0D
  qapi/introspect.py: Introduce preliminary tree typing=0D
  qapi/introspect.py: create a typed 'Annotated' data strutcure=0D
  qapi/introspect.py: improve _tree_to_qlit error message=0D
  qapi/introspect.py: improve readability of _tree_to_qlit=0D
  qapi/introspect.py: add type hint annotations=0D
  qapi/instrospect.py: add introspect.json dummy types=0D
  qapi/introspect.py: Add docstring to _tree_to_qlit=0D
=0D
 scripts/qapi/introspect.py | 309 ++++++++++++++++++++++++++-----------=0D
 scripts/qapi/mypy.ini      |   5 -=0D
 scripts/qapi/schema.py     |   2 +-=0D
 3 files changed, 219 insertions(+), 97 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


