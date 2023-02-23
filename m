Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99C06A0214
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 05:38:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV3Ll-0001Sg-CR; Wed, 22 Feb 2023 23:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pV3Li-0001Ru-OT
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 23:36:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pV3Lg-000280-Rw
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 23:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677127011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=URKsUHMfFwXM7ZRKMKGRVmHqqbGW4HW7CDfEnf2QHnI=;
 b=FBR6Rnk5j71iCQlRseA5MYLLoCysyXrk3KSW0uXSAgdzutHvSq3R9KLkb5zfetAj7fHJwv
 h1PvelKR4r4U6vr45xO5Jb1pI5A1PFG2HrkxI4a+0N8ac5vs0j9dh3+gFylXOgzDD2GYyP
 5CbWno3T5R/U2rjsP2fL5HF9psG0udQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-Tbj7JLkBOVyR4j3dRA3LeQ-1; Wed, 22 Feb 2023 23:36:48 -0500
X-MC-Unique: Tbj7JLkBOVyR4j3dRA3LeQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 578DF38041C0;
 Thu, 23 Feb 2023 04:36:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91C38492B00;
 Thu, 23 Feb 2023 04:36:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Subject: [PULL 0/2] Python patches
Date: Wed, 22 Feb 2023 23:36:45 -0500
Message-Id: <20230223043647.3161732-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8=
:=0D
=0D
  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into sta=
ging (2023-02-21 11:28:31 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 6832189fd791622c30e7bbe3a12b76be14dc1158:=0D
=0D
  python: drop pipenv (2023-02-22 23:35:03 -0500)=0D
=0D
----------------------------------------------------------------=0D
Python=0D
=0D
Only minor testing updates.=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (2):=0D
  python: support pylint 2.16=0D
  python: drop pipenv=0D
=0D
 python/README.rst                             |   3 -=0D
 .gitlab-ci.d/static_checks.yml                |   4 +-=0D
 python/.gitignore                             |   4 +-=0D
 python/Makefile                               |  53 ++-=0D
 python/Pipfile                                |  13 -=0D
 python/Pipfile.lock                           | 347 ------------------=0D
 python/qemu/qmp/protocol.py                   |   2 +-=0D
 python/qemu/qmp/qmp_client.py                 |   2 +-=0D
 python/qemu/utils/qemu_ga_client.py           |   6 +-=0D
 python/setup.cfg                              |   4 +-=0D
 python/tests/minreqs.txt                      |  45 +++=0D
 tests/docker/dockerfiles/python.docker        |   1 -=0D
 tests/qemu-iotests/iotests.py                 |   4 +-=0D
 .../tests/migrate-bitmaps-postcopy-test       |   2 +-=0D
 14 files changed, 94 insertions(+), 396 deletions(-)=0D
 delete mode 100644 python/Pipfile=0D
 delete mode 100644 python/Pipfile.lock=0D
 create mode 100644 python/tests/minreqs.txt=0D
=0D
-- =0D
2.39.0=0D
=0D


