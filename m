Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4258B69AFED
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:56:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT35j-0005zJ-D0; Fri, 17 Feb 2023 10:56:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pT35h-0005xc-D5
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:56:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pT35e-0007oj-B8
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676649361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eArkmVMdZXZHRRXJ5jzEQZYdROFfj80uUaI7uNepmiE=;
 b=NIOTA/3shC0Ucm1Z8E4SuGeLNz+54zfnuCI/H6Uymgpfud+TD4k9DfhVqU0VzBiOxElo/F
 Odf+LbHDgGosDrtY/IeN+/rMVHNyWrF7IMwawvs07Mk2QNiArVTClfvgD/Xv3UsK+XJwtj
 Zt9BBMiQKLRRpF2+EzxdZwi1bOqjrjE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-b-MgQLS1NjeTeXiPfNX8fA-1; Fri, 17 Feb 2023 10:55:59 -0500
X-MC-Unique: b-MgQLS1NjeTeXiPfNX8fA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5748858F0E;
 Fri, 17 Feb 2023 15:55:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85FF61121315;
 Fri, 17 Feb 2023 15:55:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8114221E6A1F; Fri, 17 Feb 2023 16:55:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,  John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH] docs: build-platforms: refine requirements on
 Python build dependencies
References: <20230217124150.205012-1-pbonzini@redhat.com>
Date: Fri, 17 Feb 2023 16:55:57 +0100
In-Reply-To: <20230217124150.205012-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Fri, 17 Feb 2023 13:41:50 +0100")
Message-ID: <87pma870c2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> Historically, the critical dependency for both building and running
> QEMU has been the distro packages.  Because QEMU is written in C and C's
> package management has been tied to distros (at least if you do not want
> to bundle libraries with the binary, otherwise I suppose you could use
> something like conda or wrapdb), C dependencies of QEMU would target the
> version that is shipped in relatively old but still commonly used distros.
>
> For non-C libraries, however, the situation is different, as these
> languages have their own package management tool (cpan, pip, gem, npm,
> and so on).  For some of these languages, the amount of dependencies
> for even a simple program can easily balloon to the point that many
> distros have given up on packaging non-C code.  For this reason, it has
> become increasingly normal for developers to download dependencies into
> a self-contained local environment, instead of relying on distro packages.
>
> Fortunately, this affects QEMU only at build time, as qemu.git does
> not package non-C artifacts such as the qemu.qmp package; but still,
> as we make more use of Python, we experience a clash between a support
> policy that is written for the C world, and dependencies (both direct
> and indirect) that increasingly do not care for the distro versions
> and are quick at moving past Python runtime versions that are declared
> end-of-life.
>
> For example, Python 3.6 has been EOL'd since December 2021 and Meson 0.62
> (released the following March) already dropped support for it.  Yet,
> Python 3.6 is the default version of the Python runtime for RHEL/CentOS
> 8 and SLE 15, respectively the penultimate and the most recent version
> of two distros that QEMU would like to support.  (It is also the version
> used by Ubuntu 18.04, but QEMU stopped supporting it in April 2022).
>
> Fortunately, these long-term support distros do include newer versions of
> the Python runtime.  However, these more recent runtimes only come with
> a very small subset of the Python packages that the distro includes.
> Because most dependencies are optional tests (avocado, mypy, flake8)
> and Meson is bundled with QEMU, the most noticeably missing package is
> Sphinx (and the readthedocs theme).
>
> Assuming QEMU would like to move forward with the deprecation of
> Python 3.6 (for which there are some good reasons: completing the
> configure->meson switch, which requires Meson 0.63, or making qapidoc

I think you mean "the QAPI generator".

> fully typed which requires newer versions of mypy and also Python due
> to PEP563), there are four possibilities:
>
> * we change the support policy and stop supporting CentOS 8 and SLE 15;
>   not a good idea since CentOS 8 is not an unreasonable distro for us to
>   want to continue to support
>
> * we keep supporting Python 3.6 until CentOS 8 and SLE 15 stop being
>   supported.  This is a possibility---but we may want to revise the suppo=
rt
>   policy anyway because SLE 16 has not even been released, so this would
>   mean delaying those desirable reasons for perhaps three years;
>
> * we support Python 3.6 just for building documentation, i.e. we are
>   careful not to use Python 3.7+ features in our Sphinx extensions but are
>   free to use them elsewhere.  Besides being more complicated to understa=
nd
>   for developers, this is difficult to apply because qapidoc runs at

Suggest "some QAPI generator code runs".

>   sphinx-build time, and it is one of the areas which would benefit from
>   a newer version of the runtime;
>
> * we only support Python 3.7+, which means CentOS 8 CI and users
>   have to either install Sphinx from pip or disable documentation.
>
> This proposed update to the support policy chooses the last of these
> possibilities.  It does by modifying two aspects of the support policy:
>
> * it introduces different support periods for *native* vs. *non-native*
>   dependencies.  Non-native dependencies are currently Python ones only,
>   and for simplicity the policy only mentions Python; however, the concept
>   generalizes to other languages with a well-known upstream package
>   manager, that users of older distributions can fetch dependencies from;
>
> * it limits the support period for non-native dependencies to a fixed
>   amount of 4 years.  This is intended to be close to the Python 5-year
>   lifecycle while accounting for the time between a distro's feature free=
ze
>   and the day it's released.  This limit applies to all distro versions,
>   not just the previous one, in order to cater for the delay of SLE 16.
>
> The 4 year cutoff in practice means that QEMU will be able to drop Python
> 3.6 support for QEMU 7.1 (RHEL8 becomes 4 year old next May, while SLE

We released 7.1 last August, do you mean 8.0 or 8.1?

> is already over the threshold).
>
> Note that all "non-native" packages are currently build dependencies.
> If in the future some non-native packages became runtime dependencies for
> parts of QEMU, it would still be possible to choose any of the first
> three possibilities for them.
>
> Another possible future change is to the way that these dependencies
> have to be obtained by the person building QEMU.  Right now they have to
> run pip before the build; it may be desirable for configure to set up a
> virtual environment and download them in the same way that it populates
> git submodules.  Just like with submodules, this would make things
> easier for people that can afford accessing the network in their build
> environment; the option to populate the build environment manually with
> pip would remain for people whose build machines lack network access.
> The change to the support policy neither requires nor forbids this change.
>
> [Thanks to Daniel P. Berrang=C3=A9, Peter Maydell and others for discussi=
ons
>  that were copied or summarized in the above commit message]
>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/about/build-platforms.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.=
rst
> index 1c1e7b9e11c3..e1ea09789107 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -86,6 +86,25 @@ respective ports repository, while NetBSD will use the=
 pkgsrc repository.
>  For macOS, `Homebrew`_ will be used, although `MacPorts`_ is expected to=
 carry
>  similar versions.
>=20=20
> +Python build dependencies
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The minimum supported version of Python is currently 3.6.
> +
> +Distributions with long-term support often provide multiple
> +versions of the Python runtime.  QEMU aims to support the default
> +Python runtime for 4 years after the initial release of a new version.

Just to be crystal clear: new version of what?

> +Afterwards, you may have to point QEMU to a newer version of the Python
> +runtime using the ``--python`` command line option of the ``configure``
> +script.
> +
> +Some of QEMU's build dependencies are written in Python and available
> +through the Python Package Index (PyPI).  QEMU aims to be compatible
> +with the versions packaged by common Linux distributions for the first
> +4 years after the major release of the distribution.  After 4 years,
> +you may have to use ``pip`` to install some of these build dependencies.
> +
> +
>  Windows
>  -------


