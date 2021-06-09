Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185F43A1A51
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:59:42 +0200 (CEST)
Received: from localhost ([::1]:54804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0cH-0002fL-3w
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lr0XZ-0001mU-ML
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:54:49 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lr0XX-0006EC-7m
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:54:49 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so4140334wmq.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FpyABjMUPgUymLzhj8Q+isCqWmZteXiGIXLFCqsSmO4=;
 b=pdKLid7ssbxMWvdZNGQgWDZUK+VmQ+jEUTFfvPwWRY0vORL4Qwvq5tsOZ1edSHUKiE
 kNuGx/BdyiGzKoVL9Iwi39KEOIFECroiOApGylBWbWltPbqN7T4KxOZePyOR4RwtYHL8
 fK/ah9K/JvqDLoAOBqHM0pZbQzjjt5h7jopafi1Ms7X8JOdiARNsO0ziY6I+WRUZ1vAJ
 z82jbXfcnf1a16RmMJea9q4k55U5QEOo+kFFeMP2NG4okQbjyQWe8S60VvfoYTUp+qV/
 oWdwuX+a5XVdiDKi8bU9gzbci9VT82tQkc+/5qvB68Va5pVl6kJlKNekKSKw9XOcQUpq
 eQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FpyABjMUPgUymLzhj8Q+isCqWmZteXiGIXLFCqsSmO4=;
 b=esPEMHqDGxObDcxHc+EQbUTdYq16OLiXsRN7mCLT0yDWv2EUlJfQVU46Lz6mC+mLYe
 LYkFzakEhC5VYDNwsW8MefQiJNG/vhz1ghKqeiZAS+ulvsk/V5yfuZBOs07ZAUBbjkug
 eKg2E/HL0+C4kNA4QnKMxUZgYSkvNRLXBkYPVjjTgYvYzwKKNokjLIQ5f2ogJvodZMtS
 7hQmccVgLIUIAdOSAbcVibshAnlBJY1VQ1ZfB2vVoHHhxckiVvvySRhh+E5/NxmeXzfy
 5ZBwvLyUuie6//AgOCpOHC1u5zgODpR93FH10DDuzgyj0xRmeAJuIr3g+I/SVgyFLggE
 OkFA==
X-Gm-Message-State: AOAM531290AzlwQTgG4NINX5Ro+zA4J+zM6JM41+8TTAT7NNvgkorThI
 jts0dJVdXymBjSMkkG0H8ngweA==
X-Google-Smtp-Source: ABdhPJwfc28knK2f7uYo1d/wWU4Ey/TlK1V14QFubl9G/9I54FVtgUSzLncID6Gtw5RUoaJqFWorbw==
X-Received: by 2002:a7b:c346:: with SMTP id l6mr474682wmj.109.1623254084978;
 Wed, 09 Jun 2021 08:54:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q3sm326857wrz.71.2021.06.09.08.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 08:54:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 673211FF7E;
 Wed,  9 Jun 2021 16:54:43 +0100 (BST)
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <3444dc10-a1a7-a5ff-71df-c3fab2b0aa7d@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: wainersm@redhat.com
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job
 definitions for QEMU's machines
Date: Wed, 09 Jun 2021 16:53:42 +0100
In-reply-to: <3444dc10-a1a7-a5ff-71df-c3fab2b0aa7d@redhat.com>
Message-ID: <87r1hbhw3g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E?= =?utf-8?Q?_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Wainer dos Santos Moschetta <wainersm@redhat.com> writes:

> Hi,
>
> On 6/8/21 12:14 AM, Cleber Rosa wrote:
>> The QEMU project has two machines (aarch64 and s390x) that can be used
>> for jobs that do build and run tests.  This introduces those jobs,
>> which are a mapping of custom scripts used for the same purpose.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
>>   1 file changed, 208 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runne=
rs.yml
>> index a07b27384c..061d3cdfed 100644
>> --- a/.gitlab-ci.d/custom-runners.yml
>> +++ b/.gitlab-ci.d/custom-runners.yml
>> @@ -12,3 +12,211 @@
>>   # guarantees a fresh repository on each job run.
>>   variables:
>>     GIT_STRATEGY: clone
>> +
>> +# All ubuntu-18.04 jobs should run successfully in an environment
>> +# setup by the scripts/ci/setup/build-environment.yml task
>> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
>> +ubuntu-18.04-s390x-all-linux-static:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_18.04
>> + - s390x
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>
> Should it restrict the job for pushes to qemu-project only? If yes,
> then it probably needs the statement:
>
> '$CI_PROJECT_NAMESPACE =3D=3D "qemu-project" && $CI_COMMIT_BRANCH =3D~ /^=
staging/'
>
> If you change that here, you will end it changing all over the jobs.
> In general, there are many boilerplates in this file. I'm ok to merge
> it as is as long as it is followed by another series to refactor the
> code.
>
>> + script:
>> + # --disable-libssh is needed because of https://bugs.launchpad.net/qem=
u/+bug/1838763
>> + # --disable-glusterfs is needed because there's no static version of t=
hose libs in distro supplied packages
>> + - mkdir build
>> + - cd build
>> + - ../configure --enable-debug --static --disable-system --disable-glus=
terfs --disable-libssh
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=3D1
>> + - make --output-sync -j`nproc` check-tcg V=3D1
>> +
>> +ubuntu-18.04-s390x-all:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_18.04
>> + - s390x
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> + script:
>> + - mkdir build
>> + - cd build
>> + - ../configure --disable-libssh
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=3D1
>> +
>> +ubuntu-18.04-s390x-alldbg:
> Maybe we don't need both ubuntu-18.04-s390x-all and
> ubuntu-18.04-s390x-alldbg jobs.
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_18.04
>> + - s390x
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> + script:
>> + - mkdir build
>> + - cd build
>> + - ../configure --enable-debug --disable-libssh
>> + - make clean
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=3D1
>> +ubuntu-18.04-s390x-clang:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_18.04
>> + - s390x
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> +   when: manual
>> + script:
>> + - mkdir build
>> + - cd build
>> + - ../configure --disable-libssh --cc=3Dclang --cxx=3Dclang++ --enable-=
sanitizers
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=3D1
>> +
>> +ubuntu-18.04-s390x-tci:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_18.04
>> + - s390x
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> + script:
>> + - mkdir build
>> + - cd build
>> + - ../configure --disable-libssh --enable-tcg-interpreter
>> + - make --output-sync -j`nproc`
> I think it needs to `make check-tcg` at least. See "build-tci" in
> `.gitlab-ci.d/buildtest.yml` for other tests being executed on shared
> runners.

To get anything other than the s390x-linux-user tests we will need the
cross compilers installed. Currently we don't really use docker for
anything other than x86_64 hosts (and some aarch64 which I've tested).

>> +
>> +ubuntu-18.04-s390x-notcg:
> The "build-tcg-disabled" in `.gitlab-ci.d/buildtest.yml` could be
> mimic-ed here too.
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_18.04
>> + - s390x
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> +   when: manual
>> + script:
>> + - mkdir build
>> + - cd build
>> + - ../configure --disable-libssh --disable-tcg
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=3D1
>> +
>> +# All ubuntu-20.04 jobs should run successfully in an environment
>> +# setup by the scripts/ci/setup/qemu/build-environment.yml task
>> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
>> +ubuntu-20.04-aarch64-all-linux-static:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_20.04
>> + - aarch64
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> + script:
>> + # --disable-libssh is needed because of https://bugs.launchpad.net/qem=
u/+bug/1838763
>> + # --disable-glusterfs is needed because there's no static version of t=
hose libs in distro supplied packages
>> + - mkdir build
>> + - cd build
>> + - ../configure --enable-debug --static --disable-system --disable-glus=
terfs --disable-libssh
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=3D1
>> + - make --output-sync -j`nproc` check-tcg V=3D1
>> +
>> +ubuntu-20.04-aarch64-all:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_20.04
>> + - aarch64
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> + script:
>> + - mkdir build
>> + - cd build
>> + - ../configure --disable-libssh
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=3D1
>> +
>> +ubuntu-20.04-aarch64-alldbg:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_20.04
>> + - aarch64
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> + script:
>> + - mkdir build
>> + - cd build
>> + - ../configure --enable-debug --disable-libssh
>> + - make clean
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=3D1
>> +
>> +ubuntu-20.04-aarch64-clang:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_20.04
>> + - aarch64
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> +   when: manual
>> + script:
>> + - mkdir build
>> + - cd build
>> + - ../configure --disable-libssh --cc=3Dclang-10 --cxx=3Dclang++-10 --e=
nable-sanitizers
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=3D1
>> +
>> +ubuntu-20.04-aarch64-tci:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_20.04
>> + - aarch64
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> + script:
>> + - mkdir build
>> + - cd build
>> + - ../configure --disable-libssh --enable-tcg-interpreter
>> + - make --output-sync -j`nproc`
>> +
>> +ubuntu-20.04-aarch64-notcg:
>> + allow_failure: true
>> + needs: []
>> + stage: build
>> + tags:
>> + - ubuntu_20.04
>> + - aarch64
>> + rules:
>> + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
>> +   when: manual
>> + script:
>> + - mkdir build
>> + - cd build
>> + - ../configure --disable-libssh --disable-tcg
>> + - make --output-sync -j`nproc`
>> + - make --output-sync -j`nproc` check V=3D1


--=20
Alex Benn=C3=A9e

