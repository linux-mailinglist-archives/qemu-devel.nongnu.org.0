Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E063BBB53
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:37:46 +0200 (CEST)
Received: from localhost ([::1]:50712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Lyz-0001y1-Fj
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Lwe-0007gZ-5y
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:35:20 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Lwb-0007tG-Ax
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:35:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so2462338wmq.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 03:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qj7lcV0IXplHiXV9KIuhI0uM/cgpbB4bgK2oCACG5mM=;
 b=M8Z4sL4UZIbgm/VDLi/al7xrLl73cpGWKXbCkg0e71dcYm/snAlo7ibCB206B18MrQ
 5XRrH6j0+zEb/+wjFCs/6apglmAH5F02OsQHGpnlGkPljeIrGncceJf5XAM46NGTbWK0
 Hpov4oICpwbp/XljfmTEIFOHuQ2c3YmpdXlFTaK9q3yE/1lp8mmPRUh3uMSXJ+hs4+oz
 ghn7i4AdRCYfla4ZIrQP0gX+d0Up8MwU7QGRb/IRyRV6dD1NwLqHMId2Z+YjM0V6cuEc
 FvdcYkYgWqFgGeIFzvZ1vJPddqZZuajU0brY01BpUm/ONpYFCXI0di27QWnb3m7aFrl1
 FeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qj7lcV0IXplHiXV9KIuhI0uM/cgpbB4bgK2oCACG5mM=;
 b=TWYOlaSVS5T9UWL23Wo2vN83Dm1D5YACSzeXx1v/dc+/AFBEVAS2TIXBBdi+prmRV4
 N0O5HP2vo0Tkicu7bcrCOVh86wKFFwVwdCLO6PafdtAnesmZgXmpaE52hJeNa2+0Lw5+
 p5Tn9cD06B44/MqVcEyTsLm5opKvRIZgT8heXVhWB0GBPdXvWoI/kNR11DTy22T2kr58
 VZAiBXeEeuJRezT46ej3T34ELgKZ3gU0ryVI9UW9/odizFDxYU5Yj93u5wGJUBiHwr4e
 h8JKZE+npDygh9ugNVLBwPWT1HTzR2848V8kMjzR2X7Uhf4TV+DajfqlwI/q1PTEtU9q
 RM4g==
X-Gm-Message-State: AOAM5316HNbWaQEuhOmFpEYAa4c1z9bKgPUYC9H+sZki4b/pcZZoPedS
 vzqCjZMFFg/F4tV2K1z21ukkKw==
X-Google-Smtp-Source: ABdhPJy2bw5PYmv35fc0AaKQmKY6zsUO7kBJTkiOjuFXfOwURopKVdbfzawkCtwMHcxApsLPtcoWeg==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr13861215wmq.177.1625481315636; 
 Mon, 05 Jul 2021 03:35:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o19sm13700352wmc.12.2021.07.05.03.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 03:35:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 46B941FF7E;
 Mon,  5 Jul 2021 11:35:14 +0100 (BST)
References: <20210625172211.451010-1-berrange@redhat.com>
 <20210625172211.451010-3-berrange@redhat.com>
 <ead03192-5ec8-f53e-34d2-4e3a0275f3a8@redhat.com>
 <YNzViRJ1S4G0U5tG@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/3] gitlab: support for FreeBSD 12, 13 and macOS 11 via
 cirrus-run
Date: Mon, 05 Jul 2021 11:35:02 +0100
In-reply-to: <YNzViRJ1S4G0U5tG@redhat.com>
Message-ID: <87czrx59r1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Jun 30, 2021 at 03:58:57PM -0300, Wainer dos Santos Moschetta wro=
te:
>> Hi,
>>=20
>> On 6/25/21 2:22 PM, Daniel P. Berrang=C3=A9 wrote:
>> > This adds support for running 4 jobs via Cirrus CI runners:
>> >=20
>> >   * FreeBSD 12
>> >   * FreeBSD 13
>> >   * macOS 11 with default XCode
>> >   * macOS 11 with latest XCode
>> >=20
>> > The gitlab job uses a container published by the libvirt-ci
>> > project (https://gitlab.com/libvirt/libvirt-ci) that contains
>> > the 'cirrus-run' command. This accepts a short yaml file that
>> > describes a single Cirrus CI job, runs it using the Cirrus CI
>> > REST API, and reports any output to the console.
>> >=20
>> > In this way Cirrus CI is effectively working as an indirect
>> > custom runner for GitLab CI pipelines. The key benefit is that
>> > Cirrus CI job results affect the GitLab CI pipeline result and
>> > so the user only has look at one CI dashboard.
>> >=20
>> > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > ---
>> >   .gitlab-ci.d/cirrus.yml             | 103 ++++++++++++++++++++++++++=
++
>> >   .gitlab-ci.d/cirrus/README.rst      |  54 +++++++++++++++
>> >   .gitlab-ci.d/cirrus/build.yml       |  35 ++++++++++
>> >   .gitlab-ci.d/cirrus/freebsd-12.vars |  13 ++++
>> >   .gitlab-ci.d/cirrus/freebsd-13.vars |  13 ++++
>> >   .gitlab-ci.d/cirrus/macos-11.vars   |  15 ++++
>> >   .gitlab-ci.d/qemu-project.yml       |   1 +
>> >   7 files changed, 234 insertions(+)
>> >   create mode 100644 .gitlab-ci.d/cirrus.yml
>> >   create mode 100644 .gitlab-ci.d/cirrus/README.rst
>> >   create mode 100644 .gitlab-ci.d/cirrus/build.yml
>> >   create mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars
>> >   create mode 100644 .gitlab-ci.d/cirrus/freebsd-13.vars
>> >   create mode 100644 .gitlab-ci.d/cirrus/macos-11.vars
>> >=20
>> > diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
>> > new file mode 100644
>> > index 0000000000..d7b4cce79b
>> > --- /dev/null
>> > +++ b/.gitlab-ci.d/cirrus.yml
>> > @@ -0,0 +1,103 @@
>> > +# Jobs that we delegate to Cirrus CI because they require an operating
>> > +# system other than Linux. These jobs will only run if the required
>> > +# setup has been performed on the GitLab account.
>> > +#
>> > +# The Cirrus CI configuration is generated by replacing target-specif=
ic
>> > +# variables in a generic template: some of these variables are provid=
ed
>> > +# when the GitLab CI job is defined, others are taken from a shell
>> > +# snippet generated using lcitool.
>> > +#
>> > +# Note that the $PATH environment variable has to be treated with
>> > +# special care, because we can't just override it at the GitLab CI job
>> > +# definition level or we risk breaking it completely.
>> > +.cirrus_build_job:
>> > +  stage: build
>> > +  image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
>> > +  needs: []
>> > +  script:
>> > +    - source .gitlab-ci.d/cirrus/$NAME.vars
>> > +    - sed -e "s|[@]CI_REPOSITORY_URL@|$CI_REPOSITORY_URL|g"
>> > +          -e "s|[@]CI_COMMIT_REF_NAME@|$CI_COMMIT_REF_NAME|g"
>> > +          -e "s|[@]CI_COMMIT_SHA@|$CI_COMMIT_SHA|g"
>> > +          -e "s|[@]CIRRUS_VM_INSTANCE_TYPE@|$CIRRUS_VM_INSTANCE_TYPE|=
g"
>> > +          -e "s|[@]CIRRUS_VM_IMAGE_SELECTOR@|$CIRRUS_VM_IMAGE_SELECTO=
R|g"
>> > +          -e "s|[@]CIRRUS_VM_IMAGE_NAME@|$CIRRUS_VM_IMAGE_NAME|g"
>> > +          -e "s|[@]CIRRUS_VM_CPUS@|$CIRRUS_VM_CPUS|g"
>> > +          -e "s|[@]CIRRUS_VM_RAM@|$CIRRUS_VM_RAM|g"
>> > +          -e "s|[@]UPDATE_COMMAND@|$UPDATE_COMMAND|g"
>> > +          -e "s|[@]INSTALL_COMMAND@|$INSTALL_COMMAND|g"
>> > +          -e "s|[@]PATH@|$PATH_EXTRA${PATH_EXTRA:+:}\$PATH|g"
>> > +          -e "s|[@]PKG_CONFIG_PATH@|$PKG_CONFIG_PATH|g"
>> > +          -e "s|[@]PKGS@|$PKGS|g"
>> > +          -e "s|[@]MAKE@|$MAKE|g"
>> > +          -e "s|[@]PYTHON@|$PYTHON|g"
>> > +          -e "s|[@]PIP3@|$PIP3|g"
>> > +          -e "s|[@]PYPI_PKGS@|$PYPI_PKGS|g"
>> > +          -e "s|[@]CONFIGURE_ARGS@|$CONFIGURE_ARGS|g"
>> > +          -e "s|[@]TEST_TARGETSS@|$TEST_TARGETSS|g"
>> > +      <.gitlab-ci.d/cirrus/build.yml >.gitlab-ci.d/cirrus/$NAME.yml
>> > +    - cat .gitlab-ci.d/cirrus/$NAME.yml
>> > +    - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME=
.yml
>> > +  rules:
>> > +    - if: "$TEMPORARILY_DISABLED"
>>=20
>> Reading 'TEMPORARILY_DISABLED' I immediately think the job is malfunctio=
ning
>> or under maintenance.
>
> Actually this is cruft that I mistakenly copied from libvirt's rules.
>
>> But since the plan is to keep it running as 'non-gate' until it proves
>> reliable, so maybe you could rename the variable to 'NON_GATE' or
>> 'STAGING_JOB' (i.e. some words to better express the intent).
>
> We can just remove the 'if $TEMPORARILY_DISABLED' bit and
> have only the 'allow_failure: true' bit

I've cleaned that up on testing/next



--=20
Alex Benn=C3=A9e

