Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ECF31F90C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:09:48 +0100 (CET)
Received: from localhost ([::1]:36438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4bT-0003S3-1m
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WM-0007HJ-05
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD4WJ-0001yI-VW
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tAaMZkC+X4vHvULg/xlpkM+0NLjJUDKBC3YHFUCIOTM=;
 b=HWK2458nVksK6Fs3gLGl+AEqP+sOabxW8DX5gIDMcRE4rPXWfawmjpcqWz1CaJP4FXolGG
 ZaaDAcdfNUNTwJ30aKIa4tOMhesIC+y45nvie6IcMIZDliwSVymFz4B3l/ikeLbSWDL2X4
 G9IDKg9CqYFDEIVTct7fUiHzzz/My1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-W5JHlYvqMgeIobOt831IAQ-1; Fri, 19 Feb 2021 07:04:25 -0500
X-MC-Unique: W5JHlYvqMgeIobOt831IAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2996107ACE3;
 Fri, 19 Feb 2021 12:04:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 745915D9C2;
 Fri, 19 Feb 2021 12:04:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0404D113860F; Fri, 19 Feb 2021 13:04:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/18] QAPI patches patches for 2021-02-18
Date: Fri, 19 Feb 2021 13:04:04 +0100
Message-Id: <20210219120422.600850-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 91416a4254015e1e3f602f2b241b9ddb7879c10b:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-plugin-updates-180221-1' into staging (2021-02-18 13:27:03 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-02-18

for you to fetch changes up to 9b77d946990e7497469bb98171b90b4f3ab186a9:

  qapi/introspect.py: set _gen_tree's default ifcond argument to () (2021-02-18 19:51:14 +0100)

----------------------------------------------------------------
QAPI patches patches for 2021-02-18

----------------------------------------------------------------
John Snow (18):
      qapi: Replace List[str] with Sequence[str] for ifcond
      qapi/introspect.py: assert schema is not None
      qapi/introspect.py: use _make_tree for features nodes
      qapi/introspect.py: add _gen_features helper
      qapi/introspect.py: guard against ifcond/comment misuse
      qapi/introspect.py: Unify return type of _make_tree()
      qapi/introspect.py: replace 'extra' dict with 'comment' argument
      qapi/introspect.py: Always define all 'extra' dict keys
      qapi/introspect.py: Introduce preliminary tree typing
      qapi/introspect.py: create a typed 'Annotated' data strutcure
      qapi/introspect.py: improve _tree_to_qlit error message
      qapi/introspect.py: improve readability of _tree_to_qlit
      qapi/introspect.py: remove _gen_variants helper
      qapi/introspect.py: add type hint annotations
      qapi/introspect.py: Add docstrings to _gen_tree and _tree_to_qlit
      qapi/introspect.py: Update copyright and authors list
      qapi/introspect.py: Type _gen_tree variants as Sequence[str]
      qapi/introspect.py: set _gen_tree's default ifcond argument to ()

 scripts/qapi/commands.py   |   3 +-
 scripts/qapi/events.py     |   4 +-
 scripts/qapi/gen.py        |  12 +-
 scripts/qapi/introspect.py | 327 ++++++++++++++++++++++++++++++++-------------
 scripts/qapi/mypy.ini      |   5 -
 scripts/qapi/schema.py     |   2 +-
 scripts/qapi/types.py      |  12 +-
 scripts/qapi/visit.py      |  10 +-
 8 files changed, 255 insertions(+), 120 deletions(-)

-- 
2.26.2


