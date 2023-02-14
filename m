Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8214E696D0C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:36:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0A5-0000cw-8J; Tue, 14 Feb 2023 13:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pS09v-0000WJ-O7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:36:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pS09t-0004LK-L2
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676399765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zj//wh1FRMWz4xS1VMoKNURwQE9fwI2VrZc5ZwEDcbM=;
 b=J0Lt4vbqbYgZNpfFPyASnwADLj+2LESkgsQ9K7wIZ1wtl+C5L+G92t4ZZHjrGVpYTyOhrn
 hVa+ILNtzwcButJ1b72q5OX1zjp4nwPHLw00DMwFZCQHkM0XzCSdfTZt1OoxMdpEUX+/Aw
 xgH+mCx42+oms481kJee0+ajTlk1n4U=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-vfI-rVm4O5Se28wUPJWnrQ-1; Tue, 14 Feb 2023 13:36:03 -0500
X-MC-Unique: vfI-rVm4O5Se28wUPJWnrQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 t13-20020a62d14d000000b005a89856900eso4855661pfl.14
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zj//wh1FRMWz4xS1VMoKNURwQE9fwI2VrZc5ZwEDcbM=;
 b=k+Rr1D6DPVmIzlNkF+XcvfuyJchiIX9PwMIRwDkS+4wkt4dbCr6b966RPgV8CthhHA
 tzaf0spHoW6LJ3Rc0D+71qewhyD4qwxoYgqNPJ2hdUWRHVUOVbDS2yk3Ah/0K9otdTXr
 ztW7ZQJuuHmSGpOs23zqSZNzAIgRtDvRtVAUu2T7rvJba18IEZUUVSTQePkOJeXyfHyC
 tbjhd56xo4Hp+V4Wp31zeWYBDeE2jSyzKbNi8G3KQ9ZZQKBQTEys2zmknKWy7/2gwrZZ
 v/cmfAs36D3Lt5TjWI0XHbjrCBt2TnR80gTytw9BOTSf8ziHnIlpFhvpE28TmpjZLa5u
 AqAg==
X-Gm-Message-State: AO0yUKXVPN3qYf5z4Bknw48yY+V4M5H4IzjkzNyMdvpbuvAcnQLlR1Dp
 DBVqH2TnEAE+Xgd7YqH6uL4UowZSOkjq4Pr190zoLPZ+0h7wqm3IEH8QU6aw1YruVXdd3YzOYcF
 OyBQi6q/Cugky4Cr44jcWIBH27GC/dx/BN4xC
X-Received: by 2002:a17:902:9f97:b0:19a:9b8c:279f with SMTP id
 g23-20020a1709029f9700b0019a9b8c279fmr909815plq.26.1676399761665; 
 Tue, 14 Feb 2023 10:36:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8Y8+MY/W0jvWjSF1ysd8Gfm/DObteQ0Ep5QOLumpS/6dce0D37/ijiTon5CG9EBstgKUoS14joCht3opsJeHQ=
X-Received: by 2002:a17:902:9f97:b0:19a:9b8c:279f with SMTP id
 g23-20020a1709029f9700b0019a9b8c279fmr909796plq.26.1676399761330; Tue, 14 Feb
 2023 10:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
In-Reply-To: <20230210003147.1309376-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Feb 2023 13:35:49 -0500
Message-ID: <CAFn=p-YHKm-Cx56bnZxSGuux_r4jELiOtxKgLbfFu+=3mmpDpA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Feb 9, 2023 at 7:31 PM John Snow <jsnow@redhat.com> wrote:
>
> Howdy, this series increases our minimum python version to 3.7.
>
> CI: https://gitlab.com/jsnow/qemu/-/pipelines/771780626
>     (All green!)
> GL: https://gitlab.com/jsnow/qemu/-/commits/python-require-37
>
> Patches 1 and 2 are loose pre-requisites; I'd like to merge them into
> qemu.git within the week whether or not we take this series. I'd
> appreciate an "ACK" on those specifically. They're just riding along
> here because they make this series a bit nicer.
>
> Patches 3-6 are the hard pre-requisites, and 7 does the dirty work.
>
> The motivation for this series is that Python 3.6 was EOL at the end of
> 2021; upstream tools are beginning to drop support for it, including
> setuptools, pylint, mypy, etc. As time goes by, it becomes more
> difficult to support and test against the full range of Python versions
> that QEMU supports. The closer we get to Python 3.12, the harder it will
> be to cover that full spread of versions.
>
> The qemu.qmp library and the avocado testing framework both have
> motivations for dropping 3.6 support, but are committed to not doing so
> until QEMU drops support.
>
> So, I'd like to talk about doing it.
>
> V2:
> - Added R-Bs to patch 1
> - Updated commit message for patch 7 with explicit version info
> - Added DO-NOT-MERGE to patch 5's title
> - Tested tests/vm/freebsd, netbsd, and openbsd in addition to full CI
>
> RFC:
>  - Patch 5 is just a proof-of-concept; we need to update lcitool instead.
>  - Cleber, I need to update your ansible scripts. How do I test them?
>
> Thanks!
> --js
>
> John Snow (7):
>   python: support pylint 2.16
>   python: drop pipenv

Hi, I've staged these first two patches to my Python branch.

(Kevin, Hanna; is that acceptable? I touch some iotests to do some
trivial linting whack-a-mole.)

--js

>   configure: Look for auxiliary Python installations
>   configure: Add nice hint to Python failure message
>   DO-NOT-MERGE: testing: Add Python >= 3.7 to Centos, OpenSuSE
>   CI: Stop building docs on centos8
>   Python: Drop support for Python 3.6
>
>  docs/conf.py                                  |   4 +-
>  python/README.rst                             |   3 -
>  configure                                     |  40 +-
>  .gitlab-ci.d/buildtest.yml                    |   2 +-
>  .gitlab-ci.d/static_checks.yml                |   4 +-
>  python/.gitignore                             |   4 +-
>  python/Makefile                               |  57 ++-
>  python/Pipfile                                |  13 -
>  python/Pipfile.lock                           | 347 ------------------
>  python/qemu/qmp/protocol.py                   |   2 +-
>  python/qemu/qmp/qmp_client.py                 |   2 +-
>  python/qemu/utils/qemu_ga_client.py           |   6 +-
>  python/setup.cfg                              |  11 +-
>  python/tests/minreqs.txt                      |  45 +++
>  scripts/qapi/mypy.ini                         |   2 +-
>  tests/docker/dockerfiles/centos8.docker       |   1 +
>  tests/docker/dockerfiles/opensuse-leap.docker |   1 +
>  tests/docker/dockerfiles/python.docker        |   1 -
>  tests/qemu-iotests/iotests.py                 |   4 +-
>  .../tests/migrate-bitmaps-postcopy-test       |   2 +-
>  20 files changed, 135 insertions(+), 416 deletions(-)
>  delete mode 100644 python/Pipfile
>  delete mode 100644 python/Pipfile.lock
>  create mode 100644 python/tests/minreqs.txt
>
> --
> 2.39.0
>
>


