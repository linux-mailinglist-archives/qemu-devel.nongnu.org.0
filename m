Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8766139ECDE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 05:16:11 +0200 (CEST)
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqSDq-0002Yg-IX
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 23:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqSCU-0008GQ-2C
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 23:14:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqSCP-0006Zd-MX
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 23:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623122080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRj46+KF1TNVSmvOhVB7y6Of8++oAROpv0iRRqtp3eQ=;
 b=FihX95bpgZ8gu2lfqbGDab+dB/qxViSVxExMQEXsCQ0FJVAy6eEKB8poWYnQ+IhJb7wxkU
 lzXM+uUS00+5fZnTwCyV+K0dgzxhp88/SnsLo03cM0ATBnXGj38pFTmAnykNJmsYo/KaU7
 hoopQzreP9gk3m6m/6qJb6E/P4usmnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-sCjij_0YN66bdQn8C4Ul7A-1; Mon, 07 Jun 2021 23:14:37 -0400
X-MC-Unique: sCjij_0YN66bdQn8C4Ul7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A96C8188E3C9;
 Tue,  8 Jun 2021 03:14:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-153.phx2.redhat.com
 [10.3.112.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E93D95D6D3;
 Tue,  8 Jun 2021 03:14:34 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v6 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
Date: Mon,  7 Jun 2021 23:14:22 -0400
Message-Id: <20210608031425.833536-2-crosa@redhat.com>
In-Reply-To: <20210608031425.833536-1-crosa@redhat.com>
References: <20210608031425.833536-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As described in the included documentation, the "custom runner" jobs
extend the GitLab CI jobs already in place.  One of their primary
goals of catching and preventing regressions on a wider number of host
systems than the ones provided by GitLab's shared runners.

This sets the stage in which other community members can add their own
machine configuration documentation/scripts, and accompanying job
definitions.  As a general rule, those newly added contributed jobs
should run as "non-gating", until their reliability is verified (AKA
"allow_failure: true").

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 .gitlab-ci.d/custom-runners.yml | 14 ++++++++++++++
 .gitlab-ci.d/qemu-project.yml   |  1 +
 docs/devel/ci.rst               | 28 ++++++++++++++++++++++++++++
 docs/devel/index.rst            |  1 +
 4 files changed, 44 insertions(+)
 create mode 100644 .gitlab-ci.d/custom-runners.yml
 create mode 100644 docs/devel/ci.rst

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
new file mode 100644
index 0000000000..a07b27384c
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -0,0 +1,14 @@
+# The CI jobs defined here require GitLab runners installed and
+# registered on machines that match their operating system names,
+# versions and architectures.  This is in contrast to the other CI
+# jobs that are intended to run on GitLab's "shared" runners.
+
+# Different than the default approach on "shared" runners, based on
+# containers, the custom runners have no such *requirement*, as those
+# jobs should be capable of running on operating systems with no
+# compatible container implementation, or no support from
+# gitlab-runner.  To avoid problems that gitlab-runner can cause while
+# reusing the GIT repository, let's enable the clone strategy, which
+# guarantees a fresh repository on each job run.
+variables:
+  GIT_STRATEGY: clone
diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index 64cb2ba1da..dde8270301 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -9,3 +9,4 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/buildtest.yml'
   - local: '/.gitlab-ci.d/static_checks.yml'
+  - local: '/.gitlab-ci.d/custom-runners.yml'
diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
new file mode 100644
index 0000000000..585b7bf4b8
--- /dev/null
+++ b/docs/devel/ci.rst
@@ -0,0 +1,28 @@
+==
+CI
+==
+
+QEMU has configurations enabled for a number of different CI services.
+The most up to date information about them and their status can be
+found at::
+
+   https://wiki.qemu.org/Testing/CI
+
+Jobs on Custom Runners
+======================
+
+Besides the jobs run under the various CI systems listed before, there
+are a number additional jobs that will run before an actual merge.
+These use the same GitLab CI's service/framework already used for all
+other GitLab based CI jobs, but rely on additional systems, not the
+ones provided by GitLab as "shared runners".
+
+The architecture of GitLab's CI service allows different machines to
+be set up with GitLab's "agent", called gitlab-runner, which will take
+care of running jobs created by events such as a push to a branch.
+Here, the combination of a machine, properly configured with GitLab's
+gitlab-runner, is called a "custom runner".
+
+The GitLab CI jobs definition for the custom runners are located under::
+
+  .gitlab-ci.d/custom-runners.yml
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 791925dcda..c9a02e786e 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -27,6 +27,7 @@ Contents:
    migration
    atomics
    stable-process
+   ci
    qtest
    decodetree
    secure-coding-practices
-- 
2.25.4


