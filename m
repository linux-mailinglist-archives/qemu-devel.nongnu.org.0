Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4655399712
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:40:54 +0200 (CEST)
Received: from localhost ([::1]:59724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobPp-0003P0-QV
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMW-00047t-3N
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMT-0004Ta-9d
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R2cajwO9RPDNRWkUsnw2Q9OpOcFPUSlrAFDR3A8MyCw=;
 b=Eu8HODn4K9qirn0/a2mKOcVCJYKFNLSxlzQhC/6F4iI1ycOcmJsn6vp31jZDnsFvwCYTq4
 r0ooOU1RR0dWhJpe7qkAj457hxDVgh50MZXdbgMC+JeOtD6ICzyf9tsYaZ/NCkT+CdEWrj
 EcYptfGgpZrx2roJMEPkCM0gzZ67IxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-jE0yWOBlOLeSxWM5se01NA-1; Wed, 02 Jun 2021 20:37:21 -0400
X-MC-Unique: jE0yWOBlOLeSxWM5se01NA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CF1107ACCA;
 Thu,  3 Jun 2021 00:37:20 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDE1210013D6;
 Thu,  3 Jun 2021 00:37:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/19] Python: move /scripts/qmp/qom* to
 /python/qemu/qmp/qom*
Date: Wed,  2 Jun 2021 20:37:00 -0400
Message-Id: <20210603003719.1321369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Closes: https://gitlab.com/qemu-project/qemu/-/issues/202=0D
GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-qom=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/313932818=0D
=0D
Hello!=0D
------=0D
=0D
This series applies the usual linting cleanups to modernize the qom=0D
tools and then integrates them into the python packaging hierarchy.=0D
=0D
This will help prevent further bitrot of these tools.=0D
=0D
I don't expect or need a detailed review of the QOM tools themselves --=0D
these tools are not used during build OR testing, and some are fairly=0D
bitrotted in places.=0D
=0D
However, some details of how the python packaging system is being=0D
utilized here may attract your attention and could be worth a look.=0D
(Patches 5-6 and 16-19 are the interesting ones.)=0D
=0D
Since these scripts aren't critical, I'm OK with sending a fairly hasty=0D
PR to merge these sooner rather than later.=0D
=0D
Overview:=0D
---------=0D
=0D
Patch 1: Update Pipfile.lock (See the commit as for why ...)=0D
=0D
Patches 2-3: Correct some existing typing issues in qemu.qmp=0D
=0D
Patch 4: Combine qom-set, qom-get, (etc) into one, newly written script=0D
that makes all of the command invocations, help text, etc. consistent.=0D
(I ask that review for this patch should be limited to critical=0D
mistakes: I have no interest in developing the QOM tools further.)=0D
=0D
Patches 5-6: Integrate the qom tools into the python package.=0D
=0D
Patches 7-15: Delinting of the qom_fuse script. Similarly, I am not=0D
terribly interested in further improvements here, personally.=0D
=0D
Patches 16-19: Integrating qom-fuse into the Python packaging directory;=0D
additional care is taken to ensure that "optional" dependencies like=0D
fusepy are handled well.=0D
=0D
Changelog=0D
---------=0D
=0D
V3:=0D
- Technically, I sent two versions of this before, a long time ago.=0D
  This has been cleaned up and based on the latest origin/master.=0D
=0D
John Snow (19):=0D
  python/pipenv: Update Pipfile.lock=0D
  python/qmp: Fix type of SocketAddrT=0D
  python/qmp: add parse_address classmethod=0D
  python/qmp: Add qom script rewrites=0D
  python/qmp: add qom script entry points=0D
  scripts/qmp: redirect qom-xxx scripts to python/qemu/qmp/=0D
  scripts/qom-fuse: apply isort rules=0D
  scripts/qom-fuse: apply flake8 rules=0D
  python: Add 'fh' to known-good variable names=0D
  scripts/qom-fuse: Apply pylint rules=0D
  scripts/qom-fuse: Add docstrings=0D
  scripts/qom-fuse: Convert to QOMCommand=0D
  scripts/qom-fuse: use QOMCommand.qom_list()=0D
  scripts/qom-fuse: ensure QOMFuse.read always returns bytes=0D
  scripts/qom-fuse: add static type hints=0D
  python: add optional FUSE dependencies=0D
  scripts/qom-fuse: move to python/qemu/qmp/qom_fuse.py=0D
  scripts/qom-fuse: add redirection shim to python/qemu/qmp/qom-fuse.py=0D
  python/qmp: add fuse command to 'qom' tools=0D
=0D
 python/Pipfile.lock           |  97 +++++++++++-=0D
 python/qemu/qmp/__init__.py   |  28 +++-=0D
 python/qemu/qmp/qom.py        | 272 ++++++++++++++++++++++++++++++++++=0D
 python/qemu/qmp/qom_common.py | 178 ++++++++++++++++++++++=0D
 python/qemu/qmp/qom_fuse.py   | 206 +++++++++++++++++++++++++=0D
 python/setup.cfg              |  33 ++++-=0D
 scripts/qmp/qmp-shell         |  21 +--=0D
 scripts/qmp/qom-fuse          | 144 +-----------------=0D
 scripts/qmp/qom-get           |  66 +--------=0D
 scripts/qmp/qom-list          |  63 +-------=0D
 scripts/qmp/qom-set           |  63 +-------=0D
 scripts/qmp/qom-tree          |  74 +--------=0D
 12 files changed, 828 insertions(+), 417 deletions(-)=0D
 create mode 100644 python/qemu/qmp/qom.py=0D
 create mode 100644 python/qemu/qmp/qom_common.py=0D
 create mode 100644 python/qemu/qmp/qom_fuse.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


