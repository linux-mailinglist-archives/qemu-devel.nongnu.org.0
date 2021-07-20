Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001393D0052
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:35:12 +0200 (CEST)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5teB-0008CX-FZ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tco-0005QM-EH
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcl-0005VZ-De
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QS2jTZKCQ4Jy8mRVGhg3ikPbas6KWhMwmxhPcBIXXcs=;
 b=J2hzRgPnhhqf0HumUW4hAMGytTc1aMy05WkxAhJa9OhoOAsefh1aiWzcS0XF0SM9JljpPr
 pJHRlt521iF/ucYOUgKAxS7MPVSrFxZYDx7jPpgS3b+qbDwUfT5Bf/2MxALYOJ7ehpuw0B
 Qd4ga6A7yjAv6AYo/sku92WvAV3cg40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-g3TJJ1mxNYef-cXgBuJdOA-1; Tue, 20 Jul 2021 13:33:40 -0400
X-MC-Unique: g3TJJ1mxNYef-cXgBuJdOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5DF78018A7;
 Tue, 20 Jul 2021 17:33:38 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A75A5B826;
 Tue, 20 Jul 2021 17:33:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/17] python/iotests: Run iotest linters during Python CI
Date: Tue, 20 Jul 2021 13:33:19 -0400
Message-Id: <20210720173336.1876937-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/340144191=0D
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
- "make check-tox", if you have Python 3.6 through Python 3.10 installed.=
=0D
=0D
See the old commit message for more sample output, etc.=0D
=0D
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07056.html=0D
=0D
V2:=0D
 - Added patches 1-5 which do some more delinting.=0D
 - Added patch 8, which scans subdirs for tests to lint.=0D
 - Added patch 17, which improves the speed of mypy analysis.=0D
 - Patch 14 is different because of the new patch 8.=0D
=0D
Unreviewed patches:=0D
=0D
[01] iotests-use-with-statement-for # [SOB] JS=0D
[02] iotests-use-subprocess.devnull # [SOB] JS=0D
[03] iotests-mirror-top-perms       # [SOB] JS=0D
[04] iotests-migrate-bitmaps        # [SOB] JS=0D
[05] iotests-migrate-bitmaps-test   # [SOB] JS=0D
[07] iotests-297-add-get_files      # [SOB] JS=0D
[08] wip-make-the-test-finding      # [SOB] JS=0D
[14] iotests-297-split-linters-py   # [SOB] JS=0D
[17] iotests-297-check-mypy-files   # [SOB] JS=0D
=0D
--js=0D
=0D
John Snow (17):=0D
  iotests: use with-statement for open() calls=0D
  iotests: use subprocess.DEVNULL instead of open("/dev/null")=0D
  iotests/mirror-top-perms: Adjust import paths=0D
  iotests/migrate-bitmaps-postcopy-test: declare instance variables=0D
  iotests/migrate-bitmaps-test: delint=0D
  iotests/297: modify is_python_file to work from any CWD=0D
  iotests/297: Add get_files() function=0D
  iotests/297: Include sub-directories when finding tests to lint=0D
  iotests/297: Don't rely on distro-specific linter binaries=0D
  iotests/297: Create main() function=0D
  iotests/297: Separate environment setup from test execution=0D
  iotests/297: Add 'directory' argument to run_linters=0D
  iotests/297: return error code from run_linters()=0D
  iotests/297: split linters.py off from 297=0D
  iotests/linters: Add entry point for Python CI linters=0D
  python: Add iotest linters to test suite=0D
  iotests/linters: check mypy files all at once=0D
=0D
 python/tests/iotests.sh                       |   2 +=0D
 tests/qemu-iotests/297                        |  80 ++---------=0D
 tests/qemu-iotests/iotests.py                 |  21 +--=0D
 tests/qemu-iotests/linters.py                 | 130 ++++++++++++++++++=0D
 .../tests/migrate-bitmaps-postcopy-test       |   3 +=0D
 tests/qemu-iotests/tests/migrate-bitmaps-test |  70 +++++-----=0D
 tests/qemu-iotests/tests/mirror-top-perms     |   7 +-=0D
 7 files changed, 198 insertions(+), 115 deletions(-)=0D
 create mode 100755 python/tests/iotests.sh=0D
 create mode 100755 tests/qemu-iotests/linters.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


