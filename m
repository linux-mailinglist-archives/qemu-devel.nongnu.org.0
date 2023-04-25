Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CC46EE680
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:19:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMIi-0008Mv-Qy; Tue, 25 Apr 2023 13:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prMIh-0008Lx-Fk
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prMIe-0000g0-1c
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443074;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1cd2mVQP404DKHqImWmUqLx9nkxhErDvT8q8TEtm9Sg=;
 b=F8vxYCurKt/9cxrZzLQOpRPyjYl4AeFcJ5kXXB2Hb2N5P6cl9hr4VC2c3KlX5u5436jX/5
 Iyjz8hEsFf/gq17j2yIgTdt5j/Y3ixATTupywRlYdf0g7owvX+n2uND8BNjWPx4JE2o6dc
 nNFuCm5Q5pzaj9VsUUUTwFZbv9rPnKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-HbbLKasPMDGyMDu5Kfk-QQ-1; Tue, 25 Apr 2023 13:17:52 -0400
X-MC-Unique: HbbLKasPMDGyMDu5Kfk-QQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33C9485A5B1;
 Tue, 25 Apr 2023 17:17:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0BC81121314;
 Tue, 25 Apr 2023 17:17:48 +0000 (UTC)
Date: Tue, 25 Apr 2023 18:17:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
Message-ID: <ZEgLNJ13fJf5RAI4@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Apr 24, 2023 at 04:02:28PM -0400, John Snow wrote:
> GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/846869409
>            (All green, except Python self-tests, see below)
> 
> This patch series creates a mandatory python virtual environment
> ("venv") during configure time and uses it to ensure the availability of
> meson and sphinx.
> 
> See https://www.qemu.org/2023/03/24/python/ for details. The summary is
> that the goal of this series is to ensure that the `python` used to run
> meson is the same `python` used to run Sphinx, tests, and any build-time
> python scripting we have. As it stands, meson and sphinx (and their
> extensions) *may* run in a different python environment than the one
> configured and chosen by the user at configure/build time.
> 
> The effective change of this series is that QEMU will now
> unconditionally create a venv at configure-time and will ensure that
> meson (and sphinx, if docs are enabled) are available through that venv.
> 
> Some important points as a pre-emptive "FAQ":
> 
> - This venv is unconditionally created and lives at {build_dir}/pyvenv.
> 
> - The python interpreter used by this venv is always the one identified
>   by configure. (Which in turn is always the one specified by --python
>   or $PYTHON)
> 
> - *almost* all python scripts in qemu.git executed as part of the build
>   system, meson, sphinx, avocado tests, vm tests or CI are always
>   executed within this venv.
> 
>   (iotests are not yet integrated; I plan to tackle this separately as a
>   follow-up in order to have a more tightly focused scope on that
>   series.)
> 
> - It remains possible to build and test fully offline.
>   (In most cases, you just need meson and sphinx from your distro's repo.)
> 
> - Distribution packaged 'meson' and 'sphinx' are still utilized whenever
>   possible as the highest preference.
> 
> - Vendored versions of e.g. 'meson' are always preferred to PyPI
>   versions for speed, repeatability and ensuring tarball builds work
>   as-is offline.
> 
>   (Sphinx will not be vendored, just like it already isn't.)
> 
> - Missing dependencies, when possible, are fetched and installed
>   on-demand automatically to make developer environments "just work".
> 
> - Works for Python 3.7 and up, on Fedora, OpenSuSE, Red Hat, CentOS,
>   Alpine, Debian, Ubuntu, NetBSD, OpenBSD, and hopefully everywhere
> 
> - No new dependencies (...for most platforms. Debian and NetBSD get an
>   asterisk.)
> 
> - The meson git submodule is unused after this series and can be removed.
> 
> For reviewers, here's how the series is broken up:
> 
> Patch 1 is a testing pre-req. Note that even with this patch,
> 'check-python-minreqs' and 'check-python-tox' CI jobs will both still
> fail on origin/master because this series requires 3.7+, but
> origin/master is currently still 3.6+.
> 
> - python: update pylint configuration
> 
> Patches 2-8 add the mkvenv script. The first patch checks in the barest
> essentials, and each subsequent patch adds a workaround or feature one
> at a time.
> 
> - python: add mkvenv.py
> - mkvenv: add console script entry point generation
> - mkvenv: Add better error message for missing pyexapt module
> - mkvenv: generate console entry shims from inside the venv
> - mkvenv: work around broken pip installations on Debian 10
> - mkvenv: add nested venv workaround
> - mkvenv: add ensure subcommand
> 
> Patches 9-11 modify our testing configuration to add new dependencies as
> needed.
> 
> - tests/docker: add python3-venv dependency
> - tests/vm: Configure netbsd to use Python 3.10
> - tests/vm: add py310-expat to NetBSD
> 
> Patch 12 changes how we package release tarballs.
> 
> - scripts/make-release: download meson==0.61.5 .whl
> 
> Patches 13-16 wire mkvenv into configure and tests.
> 
> - configure: create a python venv unconditionally
> - configure: use 'mkvenv ensure meson' to bootstrap meson
> - configure: add --enable-pypi and --disable-pypi
> - tests: Use configure-provided pyvenv for tests
> 
> Patches 17-20 delegate Sphinx bootstrapping to mkvenv. Some of these
> changes could be folded earlier in the series (like the diagnose()
> patch), but I'm keeping it separate for review for now.
> 
> - configure: move --enable-docs and --disable-docs back to configure
> - mkvenv: add diagnose() method for ensure() failures
> - configure: use --diagnose option with meson ensure
> - configure: bootstrap sphinx with mkvenv

I'm not sure this last bit is working.

I uninstalled meson and python3-sphinx from my F38 host and ran
configure --target-list=x86_64-softmmu and got this:

$ ./configure --target-list=x86_64-softmmu
Using './build' as the directory for build output
python determined to be '/usr/bin/python3'
python version: Python 3.11.3
MKVENV pyvenv
Configured python as '/home/berrange/src/virt/qemu/build/pyvenv/bin/python3 -B'
MKVENV ensure meson>=0.61.5
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due to invalid metadata entry 'name'
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due to invalid metadata entry 'name'
WARNING: Location 'file:///home/berrange/src/virt/qemu/python/wheels' is ignored: it is neither a file nor a directory.
ERROR: Could not find a version that satisfies the requirement meson>=0.61.5 (from versions: none)
ERROR: No matching distribution found for meson>=0.61.5
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due to invalid metadata entry 'name'
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due to invalid metadata entry 'name'
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due to invalid metadata entry 'name'
MKVENV ensure sphinx>=1.6.0
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due to invalid metadata entry 'name'
WARNING: Skipping /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info due to invalid metadata entry 'name'
ERROR: Could not find a version that satisfies the requirement sphinx>=1.6.0 (from versions: none)
ERROR: No matching distribution found for sphinx>=1.6.0

*** Ouch! ***

Could not ensure availability of 'sphinx>=1.6.0':
 • Python package 'sphinx' was not found nor installed.
 • No local package directory was searched.
 • mkvenv was configured to operate offline and did not check PyPI. 


Sphinx not found/usable, disabling docs.
MKVENV ok!



It says mkvenv was configured to run offline, but I didn't do
anything. I thought the intention was for developers it would
live download from PyPI ?


On a system where i already have meson/sphinx installed, it
all just worked fine AFAICT.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


