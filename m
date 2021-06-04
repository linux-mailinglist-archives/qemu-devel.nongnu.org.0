Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527B739BEAD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:27:14 +0200 (CEST)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDbF-0008A1-FE
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCqr-00054S-0z
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCqn-00057C-Lb
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622824752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IAbe0lan2gVtrrq1ba1WBRlYym84KXDlTKoNeNlkMqY=;
 b=ihsiu8uPkVFaVf4R5J8zF7U422EkPPhxwymwmkmOcKZMUJh2VqRSG4OXQSk0z8SGfEpRAK
 5LFsRQcfmc1ikXrr/dgHWBpVYqRgfDOaWMdbyxYt0P69baXBchkERIylTSR4iHUSIrgqNC
 rJQIRkJvsDoqnkF7szAE/d2Rel3O3Sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-8ymAk3ECNwmSaTMKYXfinA-1; Fri, 04 Jun 2021 12:39:10 -0400
X-MC-Unique: 8ymAk3ECNwmSaTMKYXfinA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32A1C800D62;
 Fri,  4 Jun 2021 16:39:09 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD70319D61;
 Fri,  4 Jun 2021 16:39:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/3] python/iotests: Run iotest linters during Python CI
Date: Fri,  4 Jun 2021 12:39:04 -0400
Message-Id: <20210604163907.1511224-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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

Since iotests are such a heavy and prominent user of the Python qemu.qmp=0D
and qemu.machine packages, it would be convenient if the Python linting=0D
suite also checked this client for any possible regressions introduced=0D
by shifting around signatures, types, or interfaces in these packages.=0D
=0D
(Of course, we'd eventually find those problems when iotest 297 ran, but=0D
with increasing distance between Python development and Block=0D
development, the risk of an accidental breakage in this regard=0D
increases. I, personally, know to run iotests (and especially 297) after=0D
changing Python code, but not everyone in the future might.)=0D
=0D
Add the ability for the Python CI to run the iotest linters too, which=0D
means that iotests would be checked against:=0D
=0D
- Python 3.6, using a frozen set of packages using 'pipenv'=0D
- Python 3.6 through Python 3.10 inclusive, using 'tox' and the latest=0D
  versions of mypy/pylint that happen to be installed during test=0D
  time. (This CI test is allowed to fail with a warning, and can serve=0D
  as a bellwether for when new incompatible changes may disrupt the=0D
  linters. Testing against old and new Python interpreters alike can=0D
  help surface incompatibility issues we may need to be aware of.)=0D
=0D
It also means that you can cd to ./python and:=0D
=0D
- "make venv-check", if you have Python 3.6 and pipenv installed. (On=0D
  Fedora: `dnf install python36` or `dnf install python3.6`) This will=0D
  set up a venv with exactly the same versions of all packages and their=0D
  dependencies as the CI test does. After this series, it will run the=0D
  iotest linters, too.=0D
=0D
- "make check-tox", if you have Python 3.6 through Python 3.10=0D
  installed. (On Fedora: `dnf install python3-tox python3.10`) This will=0D
  set up five different venvs, one for each Python version, and run all=0D
  of the Python linters against each. After this series, it will also=0D
  include the iotest linters.=0D
=0D
"John, that's annoying. None of those invocations are free from some=0D
kind of annoying dependency. Not everyone runs Fedora!"=0D
=0D
Yeah, yeah. This series doesn't *remove* iotest 297 either. It continues=0D
to work just fine! There's also a slightly more involved method that=0D
will run on "any version you happen to have", but the setup is more=0D
laborious, and I haven't made a Makefile invocation to canonize it yet:=0D
=0D
> cd /python=0D
> python3 -m venv ~/.cache/qemu-venv/=0D
> source ~/.cache/qemu-venv/bin/activate=0D
> make develop=0D
> make check=0D
> deactivate=0D
=0D
- This uses whatever version of Python you happen to have, and doesn't=0D
  require pipenv or tox.=0D
- It should work on any distro with any python3 >=3D 3.6.0=0D
- use 'activate.[fish|csh] as desired to enter the venv. (I use FiSH!)=0D
- This will run the linters with correct versions against the qemu=0D
  packages installed into this venv.=0D
=0D
Example outputs from the three different local execution methods, in=0D
order as outlined above:=0D
=0D
jsnow@scv ~/s/q/python (python-package-iotest)> make venv-check=0D
make[1]: Entering directory '/home/jsnow/src/qemu/python'=0D
JOB ID     : f5f383275da6b9d5eb5fe717e463f47f18980d07=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.28-f5f3832/j=
ob.log=0D
 (1/5) tests/flake8.sh: PASS (0.43 s)=0D
 (2/5) tests/iotests.sh: PASS (9.93 s)=0D
 (3/5) tests/isort.sh: PASS (0.24 s)=0D
 (4/5) tests/mypy.sh: PASS (0.25 s)=0D
 (5/5) tests/pylint.sh: PASS (3.66 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 14.85 s=0D
make[1]: Leaving directory '/home/jsnow/src/qemu/python'=0D
=0D
jsnow@scv ~/s/q/python (python-package-iotest)> make check-tox=0D
GLOB sdist-make: /home/jsnow/src/qemu/python/setup.py=0D
py36 inst-nodeps: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.=
1.0a1.zip=0D
py36 installed: appdirs=3D=3D1.4.4,astroid=3D=3D2.5.6,avocado-framework=3D=
=3D88.1,distlib=3D=3D0.3.2,filelock=3D=3D3.0.12,flake8=3D=3D3.9.2,fusepy=3D=
=3D3.0.1,importlib-metadata=3D=3D4.5.0,importlib-resources=3D=3D5.1.4,isort=
=3D=3D5.8.0,lazy-object-proxy=3D=3D1.6.0,mccabe=3D=3D0.6.1,mypy=3D=3D0.812,=
mypy-extensions=3D=3D0.4.3,packaging=3D=3D20.9,pluggy=3D=3D0.13.1,py=3D=3D1=
.10.0,pycodestyle=3D=3D2.7.0,pyflakes=3D=3D2.3.1,pylint=3D=3D2.8.3,pyparsin=
g=3D=3D2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/=
qemu-0.6.1.0a1.zip,six=3D=3D1.16.0,toml=3D=3D0.10.2,tox=3D=3D3.23.1,typed-a=
st=3D=3D1.4.3,typing-extensions=3D=3D3.10.0.0,virtualenv=3D=3D20.4.7,wrapt=
=3D=3D1.12.1,zipp=3D=3D3.4.1=0D
py36 run-test-pre: PYTHONHASHSEED=3D'1077404307'=0D
py36 run-test: commands[0] | make check=0D
JOB ID     : 8d6a98b947956794e83943950a66dea2e2ee2f0b=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.29-8d6a98b/j=
ob.log=0D
 (1/5) tests/flake8.sh:  PASS (0.36 s)=0D
 (2/5) tests/iotests.sh:  PASS (9.64 s)=0D
 (3/5) tests/isort.sh:  PASS (0.19 s)=0D
 (4/5) tests/mypy.sh:  PASS (0.24 s)=0D
 (5/5) tests/pylint.sh:  PASS (3.64 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 14.38 s=0D
py37 inst-nodeps: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.=
1.0a1.zip=0D
py37 installed: appdirs=3D=3D1.4.4,astroid=3D=3D2.5.6,avocado-framework=3D=
=3D88.1,distlib=3D=3D0.3.2,filelock=3D=3D3.0.12,flake8=3D=3D3.9.2,fusepy=3D=
=3D3.0.1,importlib-metadata=3D=3D4.5.0,isort=3D=3D5.8.0,lazy-object-proxy=
=3D=3D1.6.0,mccabe=3D=3D0.6.1,mypy=3D=3D0.812,mypy-extensions=3D=3D0.4.3,pa=
ckaging=3D=3D20.9,pluggy=3D=3D0.13.1,py=3D=3D1.10.0,pycodestyle=3D=3D2.7.0,=
pyflakes=3D=3D2.3.1,pylint=3D=3D2.8.3,pyparsing=3D=3D2.4.7,qemu @ file:///h=
ome/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six=3D=3D1=
.16.0,toml=3D=3D0.10.2,tox=3D=3D3.23.1,typed-ast=3D=3D1.4.3,typing-extensio=
ns=3D=3D3.10.0.0,virtualenv=3D=3D20.4.7,wrapt=3D=3D1.12.1,zipp=3D=3D3.4.1=
=0D
py37 run-test-pre: PYTHONHASHSEED=3D'1077404307'=0D
py37 run-test: commands[0] | make check=0D
JOB ID     : 97419c5769a56797e1a9b4d91586d6face9be5a2=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.29-97419c5/j=
ob.log=0D
 (1/5) tests/flake8.sh:  PASS (0.34 s)=0D
 (2/5) tests/iotests.sh:  PASS (10.42 s)=0D
 (3/5) tests/isort.sh:  PASS (0.16 s)=0D
 (4/5) tests/mypy.sh:  PASS (0.20 s)=0D
 (5/5) tests/pylint.sh:  PASS (3.52 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 15.01 s=0D
py38 inst-nodeps: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.=
1.0a1.zip=0D
py38 installed: appdirs=3D=3D1.4.4,astroid=3D=3D2.5.6,avocado-framework=3D=
=3D88.1,distlib=3D=3D0.3.2,filelock=3D=3D3.0.12,flake8=3D=3D3.9.2,fusepy=3D=
=3D3.0.1,isort=3D=3D5.8.0,lazy-object-proxy=3D=3D1.6.0,mccabe=3D=3D0.6.1,my=
py=3D=3D0.812,mypy-extensions=3D=3D0.4.3,packaging=3D=3D20.9,pluggy=3D=3D0.=
13.1,py=3D=3D1.10.0,pycodestyle=3D=3D2.7.0,pyflakes=3D=3D2.3.1,pylint=3D=3D=
2.8.3,pyparsing=3D=3D2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.=
tmp/package/1/qemu-0.6.1.0a1.zip,six=3D=3D1.16.0,toml=3D=3D0.10.2,tox=3D=3D=
3.23.1,typed-ast=3D=3D1.4.3,typing-extensions=3D=3D3.10.0.0,virtualenv=3D=
=3D20.4.7,wrapt=3D=3D1.12.1=0D
py38 run-test-pre: PYTHONHASHSEED=3D'1077404307'=0D
py38 run-test: commands[0] | make check=0D
JOB ID     : 1be3a502bea18cdf537426778719dce1d0c9c3a0=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.30-1be3a50/j=
ob.log=0D
 (1/5) tests/flake8.sh:  PASS (0.29 s)=0D
 (2/5) tests/iotests.sh:  PASS (9.17 s)=0D
 (3/5) tests/isort.sh:  PASS (0.14 s)=0D
 (4/5) tests/mypy.sh:  PASS (0.20 s)=0D
 (5/5) tests/pylint.sh:  PASS (3.21 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 13.32 s=0D
py39 inst-nodeps: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.=
1.0a1.zip=0D
py39 installed: appdirs=3D=3D1.4.4,astroid=3D=3D2.5.6,avocado-framework=3D=
=3D88.1,distlib=3D=3D0.3.2,filelock=3D=3D3.0.12,flake8=3D=3D3.9.2,fusepy=3D=
=3D3.0.1,isort=3D=3D5.8.0,lazy-object-proxy=3D=3D1.6.0,mccabe=3D=3D0.6.1,my=
py=3D=3D0.812,mypy-extensions=3D=3D0.4.3,packaging=3D=3D20.9,pluggy=3D=3D0.=
13.1,py=3D=3D1.10.0,pycodestyle=3D=3D2.7.0,pyflakes=3D=3D2.3.1,pylint=3D=3D=
2.8.3,pyparsing=3D=3D2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.=
tmp/package/1/qemu-0.6.1.0a1.zip,six=3D=3D1.16.0,toml=3D=3D0.10.2,tox=3D=3D=
3.23.1,typed-ast=3D=3D1.4.3,typing-extensions=3D=3D3.10.0.0,virtualenv=3D=
=3D20.4.7,wrapt=3D=3D1.12.1=0D
py39 run-test-pre: PYTHONHASHSEED=3D'1077404307'=0D
py39 run-test: commands[0] | make check=0D
JOB ID     : 0323fcaf5137caab9fbca3e91bc0338ae6cb81dc=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.30-0323fca/j=
ob.log=0D
 (1/5) tests/flake8.sh:  PASS (0.26 s)=0D
 (2/5) tests/iotests.sh:  PASS (10.03 s)=0D
 (3/5) tests/isort.sh:  PASS (0.14 s)=0D
 (4/5) tests/mypy.sh:  PASS (0.19 s)=0D
 (5/5) tests/pylint.sh:  PASS (3.39 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 14.37 s=0D
py310 inst-nodeps: /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6=
.1.0a1.zip=0D
py310 installed: appdirs=3D=3D1.4.4,astroid=3D=3D2.5.6,avocado-framework=3D=
=3D88.1,distlib=3D=3D0.3.2,filelock=3D=3D3.0.12,flake8=3D=3D3.9.2,fusepy=3D=
=3D3.0.1,isort=3D=3D5.8.0,lazy-object-proxy=3D=3D1.6.0,mccabe=3D=3D0.6.1,my=
py=3D=3D0.812,mypy-extensions=3D=3D0.4.3,packaging=3D=3D20.9,pluggy=3D=3D0.=
13.1,py=3D=3D1.10.0,pycodestyle=3D=3D2.7.0,pyflakes=3D=3D2.3.1,pylint=3D=3D=
2.8.3,pyparsing=3D=3D2.4.7,qemu @ file:///home/jsnow/src/qemu/python/.tox/.=
tmp/package/1/qemu-0.6.1.0a1.zip,six=3D=3D1.16.0,toml=3D=3D0.10.2,tox=3D=3D=
3.23.1,typed-ast=3D=3D1.4.3,typing-extensions=3D=3D3.10.0.0,virtualenv=3D=
=3D20.4.7,wrapt=3D=3D1.12.1=0D
py310 run-test-pre: PYTHONHASHSEED=3D'1077404307'=0D
py310 run-test: commands[0] | make check=0D
JOB ID     : 88f99ef4b76af4e48e9b1cd845d276d1c29d32dd=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.30-88f99ef/j=
ob.log=0D
 (1/5) tests/flake8.sh:  PASS (0.26 s)=0D
 (2/5) tests/iotests.sh:  PASS (13.34 s)=0D
 (3/5) tests/isort.sh:  PASS (0.15 s)=0D
 (4/5) tests/mypy.sh:  PASS (0.33 s)=0D
 (5/5) tests/pylint.sh:  PASS (3.40 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 17.76 s=0D
_______________________________________________________________ summary ___=
_____________________________________________________________=0D
  py36: commands succeeded=0D
  py37: commands succeeded=0D
  py38: commands succeeded=0D
  py39: commands succeeded=0D
  py310: commands succeeded=0D
  congratulations :)=0D
=0D
(qemu-venv) jsnow@scv ~/s/q/python (python-package-iotest)> make check=0D
JOB ID     : d4d3abff53bef6f41b5e2d10d889040d3a698208=0D
JOB LOG    : /home/jsnow/avocado/job-results/job-2021-06-04T12.22-d4d3abf/j=
ob.log=0D
 (1/5) tests/flake8.sh: PASS (0.27 s)=0D
 (2/5) tests/iotests.sh: PASS (10.30 s)=0D
 (3/5) tests/isort.sh: PASS (0.15 s)=0D
 (4/5) tests/mypy.sh: PASS (0.19 s)=0D
 (5/5) tests/pylint.sh: PASS (3.40 s)=0D
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0=0D
JOB TIME   : 14.65 s=0D
=0D
John Snow (3):=0D
  python: expose typing information via PEP 561=0D
  iotests: split 'linters.py' off from 297=0D
  python: Add iotest linters to test suite=0D
=0D
 python/qemu/machine/py.typed  |   0=0D
 python/qemu/qmp/py.typed      |   0=0D
 python/qemu/utils/py.typed    |   0=0D
 python/setup.cfg              |   3 +=0D
 python/tests/iotests.sh       |   2 +=0D
 tests/qemu-iotests/297        |  88 ++++-------------------=0D
 tests/qemu-iotests/linters.py | 130 ++++++++++++++++++++++++++++++++++=0D
 7 files changed, 148 insertions(+), 75 deletions(-)=0D
 create mode 100644 python/qemu/machine/py.typed=0D
 create mode 100644 python/qemu/qmp/py.typed=0D
 create mode 100644 python/qemu/utils/py.typed=0D
 create mode 100755 python/tests/iotests.sh=0D
 create mode 100644 tests/qemu-iotests/linters.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


