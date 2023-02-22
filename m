Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1965169F6CD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:41:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqJC-0003jC-Ox; Wed, 22 Feb 2023 09:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqJ9-0003ik-CN
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:41:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqJ6-00024S-E5
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwGmVlbnTJRO4XtFjIsIWEQS/c4kjx3FDHF/wrPTbLI=;
 b=b4wo66Nn0ooZ2B7UeL+JIYj0goM+HF+G1DICGnzLTN49ZLYT/Zwk9Wngqk6/9GJOnhsopn
 4AFmlXz5FC+uQ21cx0hvzpx8ktzfj7IEPDmji2XoPACLK5OziwCO32wsPYg7lAaW7AcGeb
 auk9XPvPr/CSUydmlWseZaV7LlPR7Ns=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-u2WwFl_oP-2EwLS6vIHrJw-1; Wed, 22 Feb 2023 09:41:18 -0500
X-MC-Unique: u2WwFl_oP-2EwLS6vIHrJw-1
Received: by mail-ed1-f69.google.com with SMTP id
 eg35-20020a05640228a300b004ad6e399b73so10190115edb.10
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NwGmVlbnTJRO4XtFjIsIWEQS/c4kjx3FDHF/wrPTbLI=;
 b=8SRG4m+Vlt+vzDbl1wWFgPwf/u92dkJAhdGIQoiJr5Qxj388ripR4hEiHTPYH6fdLj
 bRpZpNtlu9x6JyfxJmf4A+w1YMZaYmExOh1EbcojWgs5ALwY7+KvefKXRsseCvjopUol
 R1wyYqRPEVP9UbN0uHpixrsrvHgQ/rOG7rRvy4HHrX4Yofqn38kcGdeXMPyqVJ6R7uGK
 t+tU38x9mni2jVJop7ZDrXwAA28cRIBbYmwHVr2lbsTt6yEo4C7ZTlnggaT/GiYGeNYZ
 63ft2j391Iy9Q6t/G9K5dbh4F4saszs0domZHkQxfCUIEV87EaZHV1wwCxRIiByU9mv1
 to9A==
X-Gm-Message-State: AO0yUKWU13O19h/bT+7zrP+s3hwV5UdRT0fSLJryHziy13UMv+iANFMe
 q6XZKmcjIYZogz5FHr90w0/6pnu/PZ1CHnKZGySFEGIPUJnPhEpj/iZGiMZt451DPNB96lZUvoR
 LULvZfN3GD0KX6ZDBN5cDZ/9QIa9spoxOj9ZUVd8oM+VJe/x2+4DktGL6xxiyVRA2Av9S6ZBW
X-Received: by 2002:aa7:df96:0:b0:4ad:7203:9b2a with SMTP id
 b22-20020aa7df96000000b004ad72039b2amr9489332edy.19.1677076876246; 
 Wed, 22 Feb 2023 06:41:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/xImzL0z0UZu+DMd36owHMttHKXcIRttal7fo0DDQE1bfw+lJcr1hW8ONoAtw49eeeMMyQFg==
X-Received: by 2002:aa7:df96:0:b0:4ad:7203:9b2a with SMTP id
 b22-20020aa7df96000000b004ad72039b2amr9489312edy.19.1677076875910; 
 Wed, 22 Feb 2023 06:41:15 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a27-20020a509b5b000000b004acc7202074sm3132759edj.16.2023.02.22.06.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:41:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 3/4] docs: build-platforms: refine requirements on Python build
 dependencies
Date: Wed, 22 Feb 2023 15:41:02 +0100
Message-Id: <20230222144103.467002-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222144103.467002-1-pbonzini@redhat.com>
References: <20230222144103.467002-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Historically, the critical dependency for both building and running
QEMU has been the distro packages.  Because QEMU is written in C and C's
package management has been tied to distros (at least if you do not want
to bundle libraries with the binary, otherwise I suppose you could use
something like conda or wrapdb), C dependencies of QEMU would target the
version that is shipped in relatively old but still commonly used distros.

For non-C libraries, however, the situation is different, as these
languages have their own package management tool (cpan, pip, gem, npm,
and so on).  For some of these languages, the amount of dependencies
for even a simple program can easily balloon to the point that many
distros have given up on packaging non-C code.  For this reason, it has
become increasingly normal for developers to download dependencies into
a self-contained local environment, instead of relying on distro packages.

Fortunately, this affects QEMU only at build time, as qemu.git does
not package non-C artifacts such as the qemu.qmp package; but still,
as we make more use of Python, we experience a clash between a support
policy that is written for the C world, and dependencies (both direct
and indirect) that increasingly do not care for the distro versions
and are quick at moving past Python runtime versions that are declared
end-of-life.

For example, Python 3.6 has been EOL'd since December 2021 and Meson 0.62
(released the following March) already dropped support for it.  Yet,
Python 3.6 is the default version of the Python runtime for RHEL/CentOS
8 and SLE 15, respectively the penultimate and the most recent version
of two distros that QEMU would like to support.  (It is also the version
used by Ubuntu 18.04, but QEMU stopped supporting it in April 2022).

There are good reasons to move forward with the deprecation of Python
3.6 in QEMU as well: completing the configure->meson switch (which
requires Meson 0.63), and making the QAPI generator fully typed (which
requires newer versions of not just mypy but also Python, due to PEP563).

Fortunately, these long-term support distros do include newer versions of
the Python runtime.  However, these more recent runtimes only come with
a very small subset of the Python packages that the distro includes.
Because most dependencies are optional tests (avocado, mypy, flake8)
and Meson is bundled with QEMU, the most noticeably missing package is
Sphinx (and the readthedocs theme).  There are four possibilities:

* we change the support policy and stop supporting CentOS 8 and SLE 15;
  not a good idea since CentOS 8 is not an unreasonable distro for us to
  want to continue to support

* we keep supporting Python 3.6 until CentOS 8 and SLE 15 stop being
  supported.  This is a possibility---but we may want to revise the support
  policy anyway because SLE 16 has not even been released, so this would
  mean delaying those desirable reasons for perhaps three years;

* we support Python 3.6 just for building documentation, i.e. we are
  careful not to use Python 3.7+ features in our Sphinx extensions but are
  free to use them elsewhere.  Besides being more complicated to understand
  for developers, this can be quite limiting; parts of the QAPI generator
  run at sphinx-build time, which would exclude one of the areas which
  would benefit from a newer version of the runtime;

* we only support Python 3.7+, which means CentOS 8 CI and users
  have to either install Sphinx from pip or disable documentation.

This proposed update to the support policy chooses the last of these
possibilities.  It does by modifying three aspects of the support
policy:

* it introduces different support periods for *native* vs. *non-native*
  dependencies.  Non-native dependencies are currently Python ones only,
  and for simplicity the policy only mentions Python; however, the concept
  generalizes to other languages with a well-known upstream package
  manager, that users of older distributions can fetch dependencies from;

* it opens up the possibility of taking non-native dependencies from their
  own package index instead of using the version in the distribution.  The
  wording right now is specific to dependencies that are only required at
  build time.  In the future we may have to refine it if, for example, parts
  of QEMU will be written in Rust; in that case, crates would be handled
  in a similar way to submodules and vendored in the release tarballs.

* it mentions specifically that optional build dependencies are excluded
  from the platform policy.  Tools such as mypy don't affect the ability
  to build QEMU and move fast enough that distros cannot standardize on
  a single version of them (for example RHEL9 does not package them at
  all, nor does it run them at rpmbuild time).  In other cases, such as
  cross compilers, we have alternatives.

Right now, non-native dependencies have to be download manually by
running "pip" before "configure".  In the future, it will be desirable
for configure to set up a virtual environment and download them in the
same way that it populates git submodules (but, in this case, without
vendoring them in the release tarballs).

Just like with submodules, this would make things easier for people
that can afford accessing the network in their build environment; the
option to populate the build environment manually would remain for
people whose build machines lack network access.  The change to the
support policy neither requires nor forbids this future change.

[Thanks to Daniel P. Berrangé, Peter Maydell and others for discussions
 that were copied or summarized in the above commit message]

Cc: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/build-platforms.rst | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 1c1e7b9e11c3..20b97c33109d 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -86,6 +86,38 @@ respective ports repository, while NetBSD will use the pkgsrc repository.
 For macOS, `Homebrew`_ will be used, although `MacPorts`_ is expected to carry
 similar versions.
 
+Some build dependencies may follow less conservative rules:
+
+Python runtime
+  Distributions with long-term support often provide multiple versions
+  of the Python runtime.  While QEMU will initially aim to support the
+  distribution's default runtime, it may later increase its minimum version
+  to any newer python that is available as an option from the vendor.
+  In this case, it will be necessary to use the ``--python`` command line
+  option of the ``configure`` script to point QEMU to a supported
+  version of the Python runtime.
+
+  As of QEMU |version|, the minimum supported version of Python is 3.6.
+
+Python build dependencies
+  Some of QEMU's build dependencies are written in Python.  Usually these
+  are only packaged by distributions for the default Python runtime.
+  If QEMU bumps its minimum Python version and a non-default runtime is
+  required, it may be necessary to fetch python modules from the Python
+  Package Index (PyPI) via ``pip``, in order to build QEMU.
+
+Optional build dependencies
+  Build components whose absence does not affect the ability to build
+  QEMU may not be available in distros, or may be too old for QEMU's
+  requirements.  Many of these, such as the Avocado testing framework
+  or various linters, are written in Python and therefore can also
+  be installed using ``pip``.  Cross compilers are another example
+  of optional build-time dependency; in this case it is possible to
+  download them from repositories such as EPEL, to use container-based
+  cross compilation using ``docker`` or ``podman``, or to use pre-built
+  binaries distributed with QEMU.
+
+
 Windows
 -------
 
-- 
2.39.1


