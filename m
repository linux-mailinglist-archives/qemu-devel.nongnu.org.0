Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D623A69ABB8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 13:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT03u-00062o-Gx; Fri, 17 Feb 2023 07:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pT03s-00062Q-Q8
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 07:42:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pT03o-0001sX-It
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 07:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676637715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mJ8wyJUdF4piWr+xC0xDa1Q0GHL5KCMgD1x489onYFI=;
 b=Mi7mZ+hbcbL3ALrpYCwx9P0FDEUyCTQL4KVL8q42dwTdXXLWHo+iyl1vzfPO9XShxB1xgM
 ZZmxtZTUL4t5Z8qcdof9qXyzmTv3oKgazAViYm8y6ogQ+m1zOu0V7BM3TNz9UXvXBjtGQN
 EYgeceffq1xBF3XYD8wga26YmrlULE8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-5NssOKlMPFyrbxfEV0Q4YQ-1; Fri, 17 Feb 2023 07:41:54 -0500
X-MC-Unique: 5NssOKlMPFyrbxfEV0Q4YQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n21-20020a7bcbd5000000b003e21fa60ec1so1085752wmi.2
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 04:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mJ8wyJUdF4piWr+xC0xDa1Q0GHL5KCMgD1x489onYFI=;
 b=6fQiLDX+XseQkPUJyfT5OfMVwlZcQUUuiTXKNCOfEYlNnCDawoeRxfHFBinaSM+NYY
 Sy/o8DW+MDK3zfz3kbA/IuBki9BnFVEZyCkhXTGw42Nql8gvJOYgoW9mLXhW+q5mV2dF
 3cNdUE6HpACYSSzvoHmVD0/J01NKIUnTnG3PsWvVzDRl0wS7pcplfl6LRen8F3yd6j20
 qyuo+k49gTtTLYWaGmb9jKWPlOU/F/Ve3CjNj5Xw29AWY8X8hDD1ICWMDuxJJqE8T7gp
 w+DSXpWN/P5q3mhWz2djW1+VBKdmtRTZdzOWpCtYeZFUY5q7RhjLoSiy3Bl2PubiGE/L
 Oo1Q==
X-Gm-Message-State: AO0yUKXKiHwnvFBJoz0Ttr3AwE2Z8A3PcgGixpai+f59B17j/NdxwL89
 /3OlP1I4rjnOAPh0uAYfXi9uiTkqy+A5NNoSYKjiMOIJjp/fvCKg4hellLiyS409SuE2fT0UmxH
 Kv8FtyMgk7A4RY29ehu/muSTIKmTlRhx1tPkvWRpS7uoDk2tlH4Ed0/VVOFDXrgi4jRMYRBu+
X-Received: by 2002:a05:600c:1605:b0:3dc:5a9f:1c7a with SMTP id
 m5-20020a05600c160500b003dc5a9f1c7amr242475wmn.30.1676637712023; 
 Fri, 17 Feb 2023 04:41:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9HXTEhuteht7N9ZeRjIRWFqkV2wfVqis5d1IEWjw/7SYLbgdcWzXsPTGqvpaIYVKbA5WhSNA==
X-Received: by 2002:a05:600c:1605:b0:3dc:5a9f:1c7a with SMTP id
 m5-20020a05600c160500b003dc5a9f1c7amr242453wmn.30.1676637711686; 
 Fri, 17 Feb 2023 04:41:51 -0800 (PST)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 bi23-20020a05600c3d9700b003e200d3b2d1sm4959382wmb.38.2023.02.17.04.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 04:41:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [RFC PATCH] docs: build-platforms: refine requirements on Python
 build dependencies
Date: Fri, 17 Feb 2023 13:41:50 +0100
Message-Id: <20230217124150.205012-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
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

Fortunately, these long-term support distros do include newer versions of
the Python runtime.  However, these more recent runtimes only come with
a very small subset of the Python packages that the distro includes.
Because most dependencies are optional tests (avocado, mypy, flake8)
and Meson is bundled with QEMU, the most noticeably missing package is
Sphinx (and the readthedocs theme).

Assuming QEMU would like to move forward with the deprecation of
Python 3.6 (for which there are some good reasons: completing the
configure->meson switch, which requires Meson 0.63, or making qapidoc
fully typed which requires newer versions of mypy and also Python due
to PEP563), there are four possibilities:

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
  for developers, this is difficult to apply because qapidoc runs at
  sphinx-build time, and it is one of the areas which would benefit from
  a newer version of the runtime;

* we only support Python 3.7+, which means CentOS 8 CI and users
  have to either install Sphinx from pip or disable documentation.

This proposed update to the support policy chooses the last of these
possibilities.  It does by modifying two aspects of the support policy:

* it introduces different support periods for *native* vs. *non-native*
  dependencies.  Non-native dependencies are currently Python ones only,
  and for simplicity the policy only mentions Python; however, the concept
  generalizes to other languages with a well-known upstream package
  manager, that users of older distributions can fetch dependencies from;

* it limits the support period for non-native dependencies to a fixed
  amount of 4 years.  This is intended to be close to the Python 5-year
  lifecycle while accounting for the time between a distro's feature freeze
  and the day it's released.  This limit applies to all distro versions,
  not just the previous one, in order to cater for the delay of SLE 16.

The 4 year cutoff in practice means that QEMU will be able to drop Python
3.6 support for QEMU 7.1 (RHEL8 becomes 4 year old next May, while SLE
is already over the threshold).

Note that all "non-native" packages are currently build dependencies.
If in the future some non-native packages became runtime dependencies for
parts of QEMU, it would still be possible to choose any of the first
three possibilities for them.

Another possible future change is to the way that these dependencies
have to be obtained by the person building QEMU.  Right now they have to
run pip before the build; it may be desirable for configure to set up a
virtual environment and download them in the same way that it populates
git submodules.  Just like with submodules, this would make things
easier for people that can afford accessing the network in their build
environment; the option to populate the build environment manually with
pip would remain for people whose build machines lack network access.
The change to the support policy neither requires nor forbids this change.

[Thanks to Daniel P. Berrangé, Peter Maydell and others for discussions
 that were copied or summarized in the above commit message]

Cc: Markus Armbruster <armbru@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/build-platforms.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 1c1e7b9e11c3..e1ea09789107 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -86,6 +86,25 @@ respective ports repository, while NetBSD will use the pkgsrc repository.
 For macOS, `Homebrew`_ will be used, although `MacPorts`_ is expected to carry
 similar versions.
 
+Python build dependencies
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The minimum supported version of Python is currently 3.6.
+
+Distributions with long-term support often provide multiple
+versions of the Python runtime.  QEMU aims to support the default
+Python runtime for 4 years after the initial release of a new version.
+Afterwards, you may have to point QEMU to a newer version of the Python
+runtime using the ``--python`` command line option of the ``configure``
+script.
+
+Some of QEMU's build dependencies are written in Python and available
+through the Python Package Index (PyPI).  QEMU aims to be compatible
+with the versions packaged by common Linux distributions for the first
+4 years after the major release of the distribution.  After 4 years,
+you may have to use ``pip`` to install some of these build dependencies.
+
+
 Windows
 -------
 
-- 
2.39.1


