Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31323433AEA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:42:33 +0200 (CEST)
Received: from localhost ([::1]:35596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrG4-0007NE-6r
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQg-0001NH-Ss
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mcqQe-0007zp-J4
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 10:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634654963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eVSs4VK3z5GL4XSzozgpBnAYo0zvgjt1M1iWtTVkRDE=;
 b=XalyBUoLFi+PBHrYpanUj1w8PAo2tmKOZVI/0UoqRUNVBo8VaMYaR0IOcLPr0Q4Xiju1UU
 5RrnszBSsHfIvjGxmY8geRlGp5v8KcEy+TOyS7Ttxg57OSsB6560OpqZy1QvwHxHP1LiUu
 OwqJNn8G1LnLLYURWqLacJQMfbSluv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-FvCt2R_mPoOTPEK-GYWvVw-1; Tue, 19 Oct 2021 10:49:20 -0400
X-MC-Unique: FvCt2R_mPoOTPEK-GYWvVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2CBF80F040;
 Tue, 19 Oct 2021 14:49:19 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 097485D6D7;
 Tue, 19 Oct 2021 14:49:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] python/iotests: Run iotest linters during Python CI
Date: Tue, 19 Oct 2021 10:49:03 -0400
Message-Id: <20211019144918.3159078-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest-pt2=
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/388626603=0D
=0D
(There's no real rush on my part for this particular series, so review=0D
at-leisure, I'm just getting my edits back out onto the list. The AQMP=0D
series is more important to me in the short-term. I suppose this would=0D
be good to have prior to the RC testing phase, though.)=0D
=0D
Factor out pylint and mypy configuration from iotest 297 so that the=0D
Python test infrastructure in python/ can also run these linters. This=0D
will enable what is essentially iotest #297 to run via GitLab CI, via=0D
the 'check-python-pipenv' and 'check-python-tox' tests with new=0D
'iotests-pylint' and 'iotests-mypy' cases.=0D
=0D
This series generally aims to split "linter configuration" out of code=0D
so that both iotest #297 and the Python test suite can both invoke the=0D
same linters (nearly) identically.=0D
=0D
iotest #297 is left as a valid way to run these tests as a convenience=0D
for block layer developers until I can integrate environment setup and=0D
test execution as a part of 'make check' or similar to serve as a=0D
replacement. This invocation (at present) just trusts you've installed=0D
the right packages into the right places with the right versions, as it=0D
always has. Future patches may begin to build the Python testing=0D
environment as part of 'make check', but there are some details to=0D
hammer out there, first.=0D
=0D
v5:=0D
=0D
Broadly:=0D
=0D
 - Remove int return from linting helpers=0D
 - Tighten tool availability checks=0D
 - Explicitly ensured no regressions on 297 mid-series=0D
=0D
In detail:=0D
=0D
001/15:[----] [--] 'iotests/297: Move pylint config into pylintrc'=0D
002/15:[----] [--] 'iotests/297: Split mypy configuration out into mypy.ini=
'=0D
003/15:[----] [--] 'iotests/297: Add get_files() function'=0D
004/15:[----] [--] 'iotests/297: Create main() function'=0D
005/15:[0002] [FC] 'iotests/297: Don't rely on distro-specific linter binar=
ies'=0D
006/15:[0023] [FC] 'iotests/297: Split run_linters apart into run_pylint an=
d run_mypy'=0D
007/15:[0006] [FC] 'iotests/297: refactor run_[mypy|pylint] as generic exec=
ution shim'=0D
008/15:[down] 'iotests/297: Change run_linter() to raise an exception on fa=
ilure'=0D
009/15:[down] 'iotests/297: update tool availability checks'=0D
010/15:[down] 'iotests/297: split test into sub-cases'=0D
011/15:[0051] [FC] 'iotests: split linters.py out from 297'=0D
012/15:[0021] [FC] 'iotests/linters: Add entry point for linting via Python=
 CI'=0D
013/15:[0004] [FC] 'iotests/linters: Add workaround for mypy bug #9852'=0D
014/15:[----] [--] 'python: Add iotest linters to test suite'=0D
015/15:[0072] [FC] 'iotests: [RFC] drop iotest 297'=0D
=0D
- 005: Fixed extra parenthesis. (Oops.)=0D
- 006: Squashed with intermediate patch from v1.=0D
- 007: Removed 'int' return from run_linter()=0D
- 008-010: New.=0D
- 011: Modified comment, otherwise just rebased.=0D
- 012: Rewrote CLI handling to be more thorough.=0D
- 013: Rebase changes only.=0D
- 015: Rebase changes, not that it matters!=0D
=0D
v4:=0D
=0D
- Some optimizations and touchups were included in 'PATCH v2 0/6]=0D
  iotests: update environment and linting configuration' instead, upon=0D
  which this series is now based.=0D
- Rewrote most patches, being more aggressive about the factoring=0D
  between "iotest" and "linter invocation". The patches are smaller now.=0D
- Almost all configuration is split out into mypy.ini and pylintrc.=0D
- Remove the PWD/CWD juggling that the previous versions added; it's not=0D
  strictly needed for this integration. We can re-add it later if we=0D
  wind up needing it for something.=0D
- mypy and pylintrc tests are split into separate tests. The GitLab CI=0D
  now lists them as two separate test cases, so it's easier to see what=0D
  is failing and why. (And how long those tests take.) It is also now=0D
  therefore possible to ask avocado to run just one or the other.=0D
- mypy bug workaround is only applied strictly in cases where it is=0D
  needed, optimizing speed of iotest 297.=0D
=0D
v3:=0D
 - Added patch 1 which has been submitted separately upstream,=0D
   but was necessary for testing.=0D
 - Rebased on top of hreitz/block, which fixed some linting issues.=0D
 - Added a workaround for a rather nasty mypy bug ... >:(=0D
=0D
v2:=0D
 - Added patches 1-5 which do some more delinting.=0D
 - Added patch 8, which scans subdirs for tests to lint.=0D
 - Added patch 17, which improves the speed of mypy analysis.=0D
 - Patch 14 is different because of the new patch 8.=0D
=0D
John Snow (15):=0D
  iotests/297: Move pylint config into pylintrc=0D
  iotests/297: Split mypy configuration out into mypy.ini=0D
  iotests/297: Add get_files() function=0D
  iotests/297: Create main() function=0D
  iotests/297: Don't rely on distro-specific linter binaries=0D
  iotests/297: Split run_linters apart into run_pylint and run_mypy=0D
  iotests/297: refactor run_[mypy|pylint] as generic execution shim=0D
  iotests/297: Change run_linter() to raise an exception on failure=0D
  iotests/297: update tool availability checks=0D
  iotests/297: split test into sub-cases=0D
  iotests: split linters.py out from 297=0D
  iotests/linters: Add entry point for linting via Python CI=0D
  iotests/linters: Add workaround for mypy bug #9852=0D
  python: Add iotest linters to test suite=0D
  iotests: [RFC] drop iotest 297=0D
=0D
 python/tests/iotests-mypy.sh           |  4 ++=0D
 python/tests/iotests-pylint.sh         |  4 ++=0D
 tests/qemu-iotests/297.out             |  2 -=0D
 tests/qemu-iotests/{297 =3D> linters.py} | 96 ++++++++++++--------------=
=0D
 tests/qemu-iotests/mypy.ini            | 12 ++++=0D
 tests/qemu-iotests/pylintrc            | 16 +++++=0D
 6 files changed, 79 insertions(+), 55 deletions(-)=0D
 create mode 100755 python/tests/iotests-mypy.sh=0D
 create mode 100755 python/tests/iotests-pylint.sh=0D
 delete mode 100644 tests/qemu-iotests/297.out=0D
 rename tests/qemu-iotests/{297 =3D> linters.py} (52%)=0D
 mode change 100755 =3D> 100644=0D
 create mode 100644 tests/qemu-iotests/mypy.ini=0D
=0D
--=20=0D
2.31.1=0D
=0D


