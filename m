Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F5569725A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 01:01:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS5Dy-0006CT-5b; Tue, 14 Feb 2023 19:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pS5De-0006Bi-8T
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 19:00:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pS5Dc-00076L-C4
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 19:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676419215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m0MkvqmAQZ4tSS8XVmyZJMBnwJUOh9WZzPr58muqnSw=;
 b=Oywka2iTMVgrZeuXHXi8ITt/u9fxjEGfEGf5keLQux4VqRt96JhUtx+7Z+Am5ZvEzTPwRz
 NNS8rcVV++AM5N24sQ+Bs6Jj1ViaYXPRz9fbaGMozYY98XORAtOCX8LYz6CdFu7f6cUEd5
 Hpg/yTvB/cWKl9BBWShdPzTPKVjuxYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-1OTA_OsiM2yG5AVVxRegrw-1; Tue, 14 Feb 2023 19:00:12 -0500
X-MC-Unique: 1OTA_OsiM2yG5AVVxRegrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B204B857A84;
 Wed, 15 Feb 2023 00:00:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82D672166B26;
 Wed, 15 Feb 2023 00:00:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v4 0/6] qapi: static typing conversion, pt5c
Date: Tue, 14 Feb 2023 19:00:05 -0500
Message-Id: <20230215000011.1725012-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is part five (c), and focuses on sharing strict types between=0D
parser.py and expr.py.=0D
=0D
gitlab: https://gitlab.com/jsnow/qemu/-/commits/python-qapi-cleanup-pt5c=0D
=0D
Every commit should pass with:=0D
 - `isort -c qapi/`=0D
 - `flake8 qapi/`=0D
 - `pylint --rcfile=3Dqapi/pylintrc qapi/`=0D
 - `mypy --config-file=3Dqapi/mypy.ini qapi/`=0D
=0D
V4:=0D
 - Dropped the "split check_exprs" patch=0D
 - Based the QAPIExpression class on Dict[str, object] instead=0D
 - Removed the type workaround patch, which is no longer needed.=0D
 - Added a new patch to fix a problem with Python 3.6 and pylint=0D
=0D
V3:=0D
 - Squashed a bunch of patches into the QAPIExpression patch=0D
 - Added a few 'info' locals whenever there were >=3D 3 usages to help=0D
   minimize some churn=0D
 - Removed some type redundancy from docstrings=0D
 - Brought along the two patches from pt0 that I want merged.=0D
 - Removed 'pexpr' entirely, there's no intermediate state where it's=0D
   needed now.=0D
 - Minor style issues.=0D
=0D
John Snow (6):=0D
  qapi: Update flake8 config=0D
  qapi: update pylint configuration=0D
  qapi: Add minor typing workaround for 3.6=0D
  qapi/parser: add QAPIExpression type=0D
  qapi: remove _JSONObject=0D
  qapi: remove JSON value FIXME=0D
=0D
 scripts/qapi/.flake8   |   3 +-=0D
 scripts/qapi/expr.py   | 101 ++++++++++++++++-------------------------=0D
 scripts/qapi/parser.py |  41 +++++++++--------=0D
 scripts/qapi/pylintrc  |   1 +=0D
 scripts/qapi/schema.py |  72 +++++++++++++++--------------=0D
 5 files changed, 104 insertions(+), 114 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D


