Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1447332010F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:00:47 +0100 (CET)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDpO-0002LR-1u
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lDDnh-00015R-V7
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:59:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lDDnX-0004m2-UR
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7oaHANp0svNorVrNpEGNCcyUWOrGQfZAV8MSaKvs3pU=;
 b=b5JWKGYc06g5zNl6Ee8AkAcr2iuFvjyQ9AGteuqvt4hmDnabQxwm2w3hhSltR3eMHQhaOH
 p8ier4H6IIKtX/mVqKhQpGS7dIw18wPeUWUWSqDU+HEE8htFfTLrn0cbc+JVHeFnaZkmRG
 iWAQ5JpvNlcl6US1vKXSbKEtLAZAetw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-SnKYtp2kO1SzUjwPAf5OJg-1; Fri, 19 Feb 2021 16:58:49 -0500
X-MC-Unique: SnKYtp2kO1SzUjwPAf5OJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 532AB1020C22;
 Fri, 19 Feb 2021 21:58:48 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC8BE708E2;
 Fri, 19 Feb 2021 21:58:46 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 2/4] Jobs based on custom runners: build environment docs
 and playbook
Date: Fri, 19 Feb 2021 16:58:36 -0500
Message-Id: <20210219215838.752547-3-crosa@redhat.com>
In-Reply-To: <20210219215838.752547-1-crosa@redhat.com>
References: <20210219215838.752547-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To run basic jobs on custom runners, the environment needs to be
properly set up.  The most common requirement is having the right
packages installed.

The playbook introduced here covers the QEMU's project s390x and
aarch64 machines.  At the time this is being proposed, those machines
have already had this playbook applied to them.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/ci.rst                      | 30 ++++++++++
 scripts/ci/setup/build-environment.yml | 76 ++++++++++++++++++++++++++
 scripts/ci/setup/inventory             |  1 +
 3 files changed, 107 insertions(+)
 create mode 100644 scripts/ci/setup/build-environment.yml
 create mode 100644 scripts/ci/setup/inventory

diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index 585b7bf4b8..a556558435 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
 The GitLab CI jobs definition for the custom runners are located under::
 
   .gitlab-ci.d/custom-runners.yml
+
+Machine Setup Howto
+-------------------
+
+For all Linux based systems, the setup can be mostly automated by the
+execution of two Ansible playbooks.  Start by adding your machines to
+the ``inventory`` file under ``scripts/ci/setup``, such as this::
+
+  fully.qualified.domain
+  other.machine.hostname
+
+You may need to set some variables in the inventory file itself.  One
+very common need is to tell Ansible to use a Python 3 interpreter on
+those hosts.  This would look like::
+
+  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
+  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
+
+Build environment
+~~~~~~~~~~~~~~~~~
+
+The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
+set up machines with the environment needed to perform builds and run
+QEMU tests.  It covers a number of different Linux distributions and
+FreeBSD.
+
+To run the playbook, execute::
+
+  cd scripts/ci/setup
+  ansible-playbook -i inventory build-environment.yml
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
new file mode 100644
index 0000000000..0197e0a48b
--- /dev/null
+++ b/scripts/ci/setup/build-environment.yml
@@ -0,0 +1,76 @@
+---
+- name: Installation of basic packages to build QEMU
+  hosts: all
+  tasks:
+    - name: Update apt cache
+      apt:
+        update_cache: yes
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+
+    - name: Install basic packages to build QEMU on Ubuntu 18.04/20.04
+      package:
+        name:
+        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
+          - ccache
+          - clang
+          - gcc
+          - gettext
+          - git
+          - glusterfs-common
+          - libaio-dev
+          - libattr1-dev
+          - libbrlapi-dev
+          - libbz2-dev
+          - libcacard-dev
+          - libcap-ng-dev
+          - libcurl4-gnutls-dev
+          - libdrm-dev
+          - libepoxy-dev
+          - libfdt-dev
+          - libgbm-dev
+          - libgtk-3-dev
+          - libibverbs-dev
+          - libiscsi-dev
+          - libjemalloc-dev
+          - libjpeg-turbo8-dev
+          - liblzo2-dev
+          - libncurses5-dev
+          - libncursesw5-dev
+          - libnfs-dev
+          - libnss3-dev
+          - libnuma-dev
+          - libpixman-1-dev
+          - librados-dev
+          - librbd-dev
+          - librdmacm-dev
+          - libsasl2-dev
+          - libsdl2-dev
+          - libseccomp-dev
+          - libsnappy-dev
+          - libspice-protocol-dev
+          - libssh-dev
+          - libusb-1.0-0-dev
+          - libusbredirhost-dev
+          - libvdeplug-dev
+          - libvte-2.91-dev
+          - libzstd-dev
+          - make
+          - ninja-build
+          - python3-yaml
+          - python3-sphinx
+          - sparse
+          - xfslibs-dev
+        state: present
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+
+    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on non-s390x
+      package:
+        name:
+          - libspice-server-dev
+          - libxen-dev
+        state: present
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] != 's390x'
diff --git a/scripts/ci/setup/inventory b/scripts/ci/setup/inventory
new file mode 100644
index 0000000000..2fbb50c4a8
--- /dev/null
+++ b/scripts/ci/setup/inventory
@@ -0,0 +1 @@
+localhost
-- 
2.25.4


