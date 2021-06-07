Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4FD39E142
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:53:14 +0200 (CEST)
Received: from localhost ([::1]:51116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHYt-0005Lp-J9
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqHXQ-0004Xi-KW
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqHXO-0003ij-5n
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623081097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUako7KtUiscw5Y0wFbP1AtybbsTef8TAVRbkfkPw/8=;
 b=Dc8X+huZmFQi/WI1XMLtzt1MPGL5vQpAgPkRiveg7by/iTURdLzbBg6o8HqKvNMqZpcd9Y
 Rw702av6db1xPuKcSHzT3JNEO51HdJTxSVU7t/IPYpiliUilud1e4g1jQ7NnD874mtZiDl
 /h18I2l77Lalq7FBO5wA2nz45Abda+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-4hqdCgNMOM6u20Gmeac7Cg-1; Mon, 07 Jun 2021 11:51:36 -0400
X-MC-Unique: 4hqdCgNMOM6u20Gmeac7Cg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52F3E800D62;
 Mon,  7 Jun 2021 15:51:34 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1F995D9E3;
 Mon,  7 Jun 2021 15:51:32 +0000 (UTC)
Subject: Re: [PATCH RFC 0/3] python/iotests: Run iotest linters during Python
 CI
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210604163907.1511224-1-jsnow@redhat.com>
 <5a67879f-bcfa-5805-48f2-ce38bf8c3a03@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <388ba3e4-8a09-2ce3-de2f-aa79d0f95b24@redhat.com>
Date: Mon, 7 Jun 2021 11:51:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5a67879f-bcfa-5805-48f2-ce38bf8c3a03@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/5/21 10:08 AM, Vladimir Sementsov-Ogievskiy wrote:
> 04.06.2021 19:39, John Snow wrote:
>> Since iotests are such a heavy and prominent user of the Python qemu.qmp
>> and qemu.machine packages, it would be convenient if the Python linting
>> suite also checked this client for any possible regressions introduced
>> by shifting around signatures, types, or interfaces in these packages.
> 
> I think that's a right idea.
> 

Yep. It will help me to stabilize the qemu.qmp interface and make sure 
there are no breakages.

>>
>> (Of course, we'd eventually find those problems when iotest 297 ran, but
>> with increasing distance between Python development and Block
>> development, the risk of an accidental breakage in this regard
>> increases. I, personally, know to run iotests (and especially 297) after
>> changing Python code, but not everyone in the future might.)
>>
>> Add the ability for the Python CI to run the iotest linters too, which
>> means that iotests would be checked against:
>>
>> - Python 3.6, using a frozen set of packages using 'pipenv'
>> - Python 3.6 through Python 3.10 inclusive, using 'tox' and the latest
>>    versions of mypy/pylint that happen to be installed during test
>>    time. (This CI test is allowed to fail with a warning, and can serve
>>    as a bellwether for when new incompatible changes may disrupt the
>>    linters. Testing against old and new Python interpreters alike can
>>    help surface incompatibility issues we may need to be aware of.)
>>
>> It also means that you can cd to ./python and:
>>
>> - "make venv-check", if you have Python 3.6 and pipenv installed. (On
>>    Fedora: `dnf install python36` or `dnf install python3.6`) This will
>>    set up a venv with exactly the same versions of all packages and their
>>    dependencies as the CI test does. After this series, it will run the
>>    iotest linters, too.
>>
>> - "make check-tox", if you have Python 3.6 through Python 3.10
>>    installed. (On Fedora: `dnf install python3-tox python3.10`) This will
>>    set up five different venvs, one for each Python version, and run all
>>    of the Python linters against each. After this series, it will also
>>    include the iotest linters.
> 
> So, it doesn't run from "make check"?
> 

Well.. it would, but it wouldn't necessarily succeed. It depends on the 
environment in which you run it.

"make venv-check" and "make check-tox" both set up their own VENV for 
running the linters, handling dependencies for you. "make check" does 
not. Both venv-check and check-tox simply run "make check" as their only 
command after they set up their venv(s).

It requires some kind of setup. I avoided suggesting it in this cover 
letter for that reason.

Cleber said during review that maybe the fact that "make check" isn't a 
"handle things for you" command is confusing, and with this review 
comment from you, I am starting to agree.


Maybe we want this instead:

make venv-check
	[pipenv] make raw-check
make check-tox
	[tox] make raw-check
make check
	[venv] make raw-check


with "make raw-check" being the setup-less check step that everything 
else uses, and "make check" representing the third type of test I 
outlined below in this cover letter.

>>
>> "John, that's annoying. None of those invocations are free from some
>> kind of annoying dependency. Not everyone runs Fedora!"
>>
>> Yeah, yeah. This series doesn't *remove* iotest 297 either. It continues
>> to work just fine! There's also a slightly more involved method that
>> will run on "any version you happen to have", but the setup is more
>> laborious, and I haven't made a Makefile invocation to canonize it yet:
>>
>>> cd /python
>>> python3 -m venv ~/.cache/qemu-venv/
>>> source ~/.cache/qemu-venv/bin/activate
>>> make develop
>>> make check
>>> deactivate
>>
>> - This uses whatever version of Python you happen to have, and doesn't
>>    require pipenv or tox.
>> - It should work on any distro with any python3 >= 3.6.0
>> - use 'activate.[fish|csh] as desired to enter the venv. (I use FiSH!)
>> - This will run the linters with correct versions against the qemu
>>    packages installed into this venv.
>>
>> Example outputs from the three different local execution methods, in
>> order as outlined above:
>>
>> jsnow@scv ~/s/q/python (python-package-iotest)> make venv-check
>> make[1]: Entering directory '/home/jsnow/src/qemu/python'
>> JOB ID     : f5f383275da6b9d5eb5fe717e463f47f18980d07
>> JOB LOG    : 
>> /home/jsnow/avocado/job-results/job-2021-06-04T12.28-f5f3832/job.log
>>   (1/5) tests/flake8.sh: PASS (0.43 s)
>>   (2/5) tests/iotests.sh: PASS (9.93 s)
>>   (3/5) tests/isort.sh: PASS (0.24 s)
>>   (4/5) tests/mypy.sh: PASS (0.25 s)
>>   (5/5) tests/pylint.sh: PASS (3.66 s)
>> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 
>> | CANCEL 0
>> JOB TIME   : 14.85 s
>> make[1]: Leaving directory '/home/jsnow/src/qemu/python'
>>
>> jsnow@scv ~/s/q/python (python-package-iotest)> make check-tox
>> GLOB sdist-make: /home/jsnow/src/qemu/python/setup.py
>> py36 inst-nodeps: 
>> /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip
>> py36 installed: 
>> appdirs==1.4.4,astroid==2.5.6,avocado-framework==88.1,distlib==0.3.2,filelock==3.0.12,flake8==3.9.2,fusepy==3.0.1,importlib-metadata==4.5.0,importlib-resources==5.1.4,isort==5.8.0,lazy-object-proxy==1.6.0,mccabe==0.6.1,mypy==0.812,mypy-extensions==0.4.3,packaging==20.9,pluggy==0.13.1,py==1.10.0,pycodestyle==2.7.0,pyflakes==2.3.1,pylint==2.8.3,pyparsing==2.4.7,qemu 
>> @ 
>> file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six==1.16.0,toml==0.10.2,tox==3.23.1,typed-ast==1.4.3,typing-extensions==3.10.0.0,virtualenv==20.4.7,wrapt==1.12.1,zipp==3.4.1 
>>
>> py36 run-test-pre: PYTHONHASHSEED='1077404307'
>> py36 run-test: commands[0] | make check
>> JOB ID     : 8d6a98b947956794e83943950a66dea2e2ee2f0b
>> JOB LOG    : 
>> /home/jsnow/avocado/job-results/job-2021-06-04T12.29-8d6a98b/job.log
>>   (1/5) tests/flake8.sh:  PASS (0.36 s)
>>   (2/5) tests/iotests.sh:  PASS (9.64 s)
>>   (3/5) tests/isort.sh:  PASS (0.19 s)
>>   (4/5) tests/mypy.sh:  PASS (0.24 s)
>>   (5/5) tests/pylint.sh:  PASS (3.64 s)
>> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 
>> | CANCEL 0
>> JOB TIME   : 14.38 s
>> py37 inst-nodeps: 
>> /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip
>> py37 installed: 
>> appdirs==1.4.4,astroid==2.5.6,avocado-framework==88.1,distlib==0.3.2,filelock==3.0.12,flake8==3.9.2,fusepy==3.0.1,importlib-metadata==4.5.0,isort==5.8.0,lazy-object-proxy==1.6.0,mccabe==0.6.1,mypy==0.812,mypy-extensions==0.4.3,packaging==20.9,pluggy==0.13.1,py==1.10.0,pycodestyle==2.7.0,pyflakes==2.3.1,pylint==2.8.3,pyparsing==2.4.7,qemu 
>> @ 
>> file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six==1.16.0,toml==0.10.2,tox==3.23.1,typed-ast==1.4.3,typing-extensions==3.10.0.0,virtualenv==20.4.7,wrapt==1.12.1,zipp==3.4.1 
>>
>> py37 run-test-pre: PYTHONHASHSEED='1077404307'
>> py37 run-test: commands[0] | make check
>> JOB ID     : 97419c5769a56797e1a9b4d91586d6face9be5a2
>> JOB LOG    : 
>> /home/jsnow/avocado/job-results/job-2021-06-04T12.29-97419c5/job.log
>>   (1/5) tests/flake8.sh:  PASS (0.34 s)
>>   (2/5) tests/iotests.sh:  PASS (10.42 s)
>>   (3/5) tests/isort.sh:  PASS (0.16 s)
>>   (4/5) tests/mypy.sh:  PASS (0.20 s)
>>   (5/5) tests/pylint.sh:  PASS (3.52 s)
>> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 
>> | CANCEL 0
>> JOB TIME   : 15.01 s
>> py38 inst-nodeps: 
>> /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip
>> py38 installed: 
>> appdirs==1.4.4,astroid==2.5.6,avocado-framework==88.1,distlib==0.3.2,filelock==3.0.12,flake8==3.9.2,fusepy==3.0.1,isort==5.8.0,lazy-object-proxy==1.6.0,mccabe==0.6.1,mypy==0.812,mypy-extensions==0.4.3,packaging==20.9,pluggy==0.13.1,py==1.10.0,pycodestyle==2.7.0,pyflakes==2.3.1,pylint==2.8.3,pyparsing==2.4.7,qemu 
>> @ 
>> file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six==1.16.0,toml==0.10.2,tox==3.23.1,typed-ast==1.4.3,typing-extensions==3.10.0.0,virtualenv==20.4.7,wrapt==1.12.1 
>>
>> py38 run-test-pre: PYTHONHASHSEED='1077404307'
>> py38 run-test: commands[0] | make check
>> JOB ID     : 1be3a502bea18cdf537426778719dce1d0c9c3a0
>> JOB LOG    : 
>> /home/jsnow/avocado/job-results/job-2021-06-04T12.30-1be3a50/job.log
>>   (1/5) tests/flake8.sh:  PASS (0.29 s)
>>   (2/5) tests/iotests.sh:  PASS (9.17 s)
>>   (3/5) tests/isort.sh:  PASS (0.14 s)
>>   (4/5) tests/mypy.sh:  PASS (0.20 s)
>>   (5/5) tests/pylint.sh:  PASS (3.21 s)
>> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 
>> | CANCEL 0
>> JOB TIME   : 13.32 s
>> py39 inst-nodeps: 
>> /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip
>> py39 installed: 
>> appdirs==1.4.4,astroid==2.5.6,avocado-framework==88.1,distlib==0.3.2,filelock==3.0.12,flake8==3.9.2,fusepy==3.0.1,isort==5.8.0,lazy-object-proxy==1.6.0,mccabe==0.6.1,mypy==0.812,mypy-extensions==0.4.3,packaging==20.9,pluggy==0.13.1,py==1.10.0,pycodestyle==2.7.0,pyflakes==2.3.1,pylint==2.8.3,pyparsing==2.4.7,qemu 
>> @ 
>> file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six==1.16.0,toml==0.10.2,tox==3.23.1,typed-ast==1.4.3,typing-extensions==3.10.0.0,virtualenv==20.4.7,wrapt==1.12.1 
>>
>> py39 run-test-pre: PYTHONHASHSEED='1077404307'
>> py39 run-test: commands[0] | make check
>> JOB ID     : 0323fcaf5137caab9fbca3e91bc0338ae6cb81dc
>> JOB LOG    : 
>> /home/jsnow/avocado/job-results/job-2021-06-04T12.30-0323fca/job.log
>>   (1/5) tests/flake8.sh:  PASS (0.26 s)
>>   (2/5) tests/iotests.sh:  PASS (10.03 s)
>>   (3/5) tests/isort.sh:  PASS (0.14 s)
>>   (4/5) tests/mypy.sh:  PASS (0.19 s)
>>   (5/5) tests/pylint.sh:  PASS (3.39 s)
>> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 
>> | CANCEL 0
>> JOB TIME   : 14.37 s
>> py310 inst-nodeps: 
>> /home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip
>> py310 installed: 
>> appdirs==1.4.4,astroid==2.5.6,avocado-framework==88.1,distlib==0.3.2,filelock==3.0.12,flake8==3.9.2,fusepy==3.0.1,isort==5.8.0,lazy-object-proxy==1.6.0,mccabe==0.6.1,mypy==0.812,mypy-extensions==0.4.3,packaging==20.9,pluggy==0.13.1,py==1.10.0,pycodestyle==2.7.0,pyflakes==2.3.1,pylint==2.8.3,pyparsing==2.4.7,qemu 
>> @ 
>> file:///home/jsnow/src/qemu/python/.tox/.tmp/package/1/qemu-0.6.1.0a1.zip,six==1.16.0,toml==0.10.2,tox==3.23.1,typed-ast==1.4.3,typing-extensions==3.10.0.0,virtualenv==20.4.7,wrapt==1.12.1 
>>
>> py310 run-test-pre: PYTHONHASHSEED='1077404307'
>> py310 run-test: commands[0] | make check
>> JOB ID     : 88f99ef4b76af4e48e9b1cd845d276d1c29d32dd
>> JOB LOG    : 
>> /home/jsnow/avocado/job-results/job-2021-06-04T12.30-88f99ef/job.log
>>   (1/5) tests/flake8.sh:  PASS (0.26 s)
>>   (2/5) tests/iotests.sh:  PASS (13.34 s)
>>   (3/5) tests/isort.sh:  PASS (0.15 s)
>>   (4/5) tests/mypy.sh:  PASS (0.33 s)
>>   (5/5) tests/pylint.sh:  PASS (3.40 s)
>> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 
>> | CANCEL 0
>> JOB TIME   : 17.76 s
>> _______________________________________________________________ 
>> summary ________________________________________________________________
>>    py36: commands succeeded
>>    py37: commands succeeded
>>    py38: commands succeeded
>>    py39: commands succeeded
>>    py310: commands succeeded
>>    congratulations :)
>>
>> (qemu-venv) jsnow@scv ~/s/q/python (python-package-iotest)> make check
>> JOB ID     : d4d3abff53bef6f41b5e2d10d889040d3a698208
>> JOB LOG    : 
>> /home/jsnow/avocado/job-results/job-2021-06-04T12.22-d4d3abf/job.log
>>   (1/5) tests/flake8.sh: PASS (0.27 s)
>>   (2/5) tests/iotests.sh: PASS (10.30 s)
>>   (3/5) tests/isort.sh: PASS (0.15 s)
>>   (4/5) tests/mypy.sh: PASS (0.19 s)
>>   (5/5) tests/pylint.sh: PASS (3.40 s)
>> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 
>> | CANCEL 0
>> JOB TIME   : 14.65 s
>>
>> John Snow (3):
>>    python: expose typing information via PEP 561
>>    iotests: split 'linters.py' off from 297
>>    python: Add iotest linters to test suite
>>
>>   python/qemu/machine/py.typed  |   0
>>   python/qemu/qmp/py.typed      |   0
>>   python/qemu/utils/py.typed    |   0
>>   python/setup.cfg              |   3 +
>>   python/tests/iotests.sh       |   2 +
>>   tests/qemu-iotests/297        |  88 ++++-------------------
>>   tests/qemu-iotests/linters.py | 130 ++++++++++++++++++++++++++++++++++
>>   7 files changed, 148 insertions(+), 75 deletions(-)
>>   create mode 100644 python/qemu/machine/py.typed
>>   create mode 100644 python/qemu/qmp/py.typed
>>   create mode 100644 python/qemu/utils/py.typed
>>   create mode 100755 python/tests/iotests.sh
>>   create mode 100644 tests/qemu-iotests/linters.py
>>
> 
> 


