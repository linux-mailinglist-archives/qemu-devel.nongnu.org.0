Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400EE40D23C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:12:57 +0200 (CEST)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQilX-0000el-HX
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQiix-0006hQ-Se
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQiiv-0000Q6-Gv
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Sgxh8FU295Xb0VLzJ3WK0PhPqLJhUiYczgErHAjtY08=;
 b=Bi7dy+iLqEO18oDoRzTt/q/IGgQjsIPLmBPcQmJipYoKjzc2GCSvhX+Hhao/aIOrFzgVgP
 9dmFjyTaUHz4te9j9yyYCxEvy/W+QkjgSwhUoCLNJQ8D0rwZrOazdsTXt9fQCiehVI8e9g
 0lS8S7xX5zreXAKpWJRg6rYpud+2Swk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-e38moqxhOY6Gh4FRsP1UVQ-1; Thu, 16 Sep 2021 00:10:02 -0400
X-MC-Unique: e38moqxhOY6Gh4FRsP1UVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 392AF1808301;
 Thu, 16 Sep 2021 04:10:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10AF819C79;
 Thu, 16 Sep 2021 04:09:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/16] python/iotests: Run iotest linters during Python CI
Date: Thu, 16 Sep 2021 00:09:39 -0400
Message-Id: <20210916040955.628560-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/371611883=0D
Based-On: <20210915175318.853225-1-hreitz@redhat.com>=0D
          "[PULL 00/32] Block patches"=0D
=0D
Since iotests are such a heavy and prominent user of the Python qemu.qmp=0D
and qemu.machine packages, it would be convenient if the Python linting=0D
suite also checked this client for any possible regressions introduced=0D
by shifting around signatures, types, or interfaces in these packages.=0D
=0D
(We'd eventually find those problems when iotest 297 ran, but with=0D
increasing distance between Python development and Block development,=0D
the risk of an accidental breakage in this regard increases. I,=0D
personally, know to run iotests (and especially 297) after changing=0D
Python code, but not everyone in the future might. Plus, I am lazy, and=0D
I like only having to push one button.)=0D
=0D
Add the ability for the Python CI to run the iotest linters too, which=0D
means that the iotest linters would be checked against:=0D
=0D
- Python 3.6, using a frozen set of linting packages at their oldest=0D
  supported versions, using 'pipenv'=0D
- Python 3.6 through Python 3.10 inclusive, using 'tox' and the latest=0D
  versions of mypy/pylint that happen to be installed during test=0D
  time. This CI test is allowed to fail with a warning, and can serve=0D
  as a bellwether for when new incompatible changes may disrupt the=0D
  linters. Testing against old and new Python interpreters alike can=0D
  help surface incompatibility issues we may need to be aware of.)=0D
=0D
Here are example outputs of those CI jobs with this series applied:=0D
 - "check-python-pipenv": https://gitlab.com/jsnow/qemu/-/jobs/1377735087=
=0D
 - "check-python-tox": https://gitlab.com/jsnow/qemu/-/jobs/1377735088=0D
=0D
You can also run these same tests locally from ./python, plus one more:=0D
=0D
- "make check-dev" to test against whatever python you have.=0D
- "make check-pipenv", if you have Python 3.6 and pipenv installed.=0D
- "make check-tox", to test against multiple python versions you have insta=
lled,=0D
                    from 3.6 to 3.10 inclusive. (CI tests against all 5.)=
=0D
=0D
See the old commit message for more sample output, etc.=0D
=0D
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07056.html=0D
=0D
V3:=0D
 - Added patch 1 which has been submitted separately upstream,=0D
   but was necessary for testing.=0D
 - Rebased on top of hreitz/block, which fixed some linting issues.=0D
 - Added a workaround for a rather nasty mypy bug ... >:(=0D
=0D
V2:=0D
 - Added patches 1-5 which do some more delinting.=0D
 - Added patch 8, which scans subdirs for tests to lint.=0D
 - Added patch 17, which improves the speed of mypy analysis.=0D
 - Patch 14 is different because of the new patch 8.=0D
=0D
John Snow (16):=0D
  python: Update for pylint 2.10=0D
  iotests/mirror-top-perms: Adjust imports=0D
  iotests/migrate-bitmaps-postcopy-test: declare instance variables=0D
  iotests/migrate-bitmaps-test: delint=0D
  iotests/297: modify is_python_file to work from any CWD=0D
  iotests/297: Add get_files() function=0D
  iotests/297: Don't rely on distro-specific linter binaries=0D
  iotests/297: Create main() function=0D
  iotests/297: Separate environment setup from test execution=0D
  iotests/297: Add 'directory' argument to run_linters=0D
  iotests/297: return error code from run_linters()=0D
  iotests/297: split linters.py off from 297=0D
  iotests/linters: Add entry point for Python CI linters=0D
  iotests/linters: Add workaround for mypy bug #9852=0D
  python: Add iotest linters to test suite=0D
  iotests/linters: check mypy files all at once=0D
=0D
 python/qemu/machine/machine.py                |   9 +-=0D
 python/setup.cfg                              |   1 +=0D
 python/tests/iotests.sh                       |   4 +=0D
 tests/qemu-iotests/297                        |  81 ++---------=0D
 tests/qemu-iotests/linters.py                 | 129 ++++++++++++++++++=0D
 .../tests/migrate-bitmaps-postcopy-test       |   3 +=0D
 tests/qemu-iotests/tests/migrate-bitmaps-test |  50 ++++---=0D
 tests/qemu-iotests/tests/mirror-top-perms     |   7 +-=0D
 8 files changed, 186 insertions(+), 98 deletions(-)=0D
 create mode 100755 python/tests/iotests.sh=0D
 create mode 100755 tests/qemu-iotests/linters.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


