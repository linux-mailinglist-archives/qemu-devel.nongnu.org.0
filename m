Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F73B7B3D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:28:32 +0200 (CEST)
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyP1j-0006gp-Qh
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOzu-00044S-6n
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:26:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOzq-0004SW-TT
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625016394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5LSU8c3OLKtY67vIj/JEM+PehhQRCpmnLk6zUXYfN4=;
 b=CNf9pkeluZX2bcKi/7Q7GvksFm+iZUg3Xs2pHINIwrSOct6aoshkT6vYTpMPzf/6WEeEQW
 2KXCjOC+wBjCAwye0rbnDj8MJuEjwfTM0yb9yGmCgEY6RCdNdEJrC3+T/x/2hdjFKo3LZr
 0m9oqpvLYzYk61+rJKEKZSEdbLtb4Q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-cKgHrZY1My2flrZ335hu_A-1; Tue, 29 Jun 2021 21:26:32 -0400
X-MC-Unique: cKgHrZY1My2flrZ335hu_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7CDB18414A1;
 Wed, 30 Jun 2021 01:26:31 +0000 (UTC)
Received: from fedora.hsd1.nh.comcast.net (ovpn-114-132.rdu2.redhat.com
 [10.10.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41D0C5C1D1;
 Wed, 30 Jun 2021 01:26:30 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v7 3/4] Jobs based on custom runners: docs and gitlab-runner
 setup playbook
Date: Tue, 29 Jun 2021 21:26:18 -0400
Message-Id: <20210630012619.115262-4-crosa@redhat.com>
In-Reply-To: <20210630012619.115262-1-crosa@redhat.com>
References: <20210630012619.115262-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To have the jobs dispatched to custom runners, gitlab-runner must
be installed, active as a service and properly configured.  The
variables file and playbook introduced here should help with those
steps.

The playbook introduced here covers the Linux distributions and
has been primarily tested on OS/machines that the QEMU project
has available to act as runners, namely:

 * Ubuntu 20.04 on aarch64
 * Ubuntu 18.04 on s390x

But, it should work on all other Linux distributions.  Earlier
versions were tested on FreeBSD too, so chances of success are
high.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>
---
 docs/devel/ci.rst                  | 55 +++++++++++++++++++++++
 scripts/ci/setup/.gitignore        |  2 +-
 scripts/ci/setup/gitlab-runner.yml | 71 ++++++++++++++++++++++++++++++
 scripts/ci/setup/vars.yml.template | 12 +++++
 4 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 scripts/ci/setup/gitlab-runner.yml
 create mode 100644 scripts/ci/setup/vars.yml.template

diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index bfedbb1025..b3bf3ef615 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -70,3 +70,58 @@ privileges, such as those from the ``root`` account or those obtained
 by ``sudo``.  If necessary, please refer to ``ansible-playbook``
 options such as ``--become``, ``--become-method``, ``--become-user``
 and ``--ask-become-pass``.
+
+gitlab-runner setup and registration
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The gitlab-runner agent needs to be installed on each machine that
+will run jobs.  The association between a machine and a GitLab project
+happens with a registration token.  To find the registration token for
+your repository/project, navigate on GitLab's web UI to:
+
+ * Settings (the gears-like icon at the bottom of the left hand side
+   vertical toolbar), then
+ * CI/CD, then
+ * Runners, and click on the "Expand" button, then
+ * Under "Set up a specific Runner manually", look for the value under
+   "And this registration token:"
+
+Copy the ``scripts/ci/setup/vars.yml.template`` file to
+``scripts/ci/setup/vars.yml``.  Then, set the
+``gitlab_runner_registration_token`` variable to the value obtained
+earlier.
+
+To run the playbook, execute::
+
+  cd scripts/ci/setup
+  ansible-playbook -i inventory gitlab-runner.yml
+
+Following the registration, it's necessary to configure the runner tags,
+and optionally other configurations on the GitLab UI.  Navigate to:
+
+ * Settings (the gears like icon), then
+ * CI/CD, then
+ * Runners, and click on the "Expand" button, then
+ * "Runners activated for this project", then
+ * Click on the "Edit" icon (next to the "Lock" Icon)
+
+Tags are very important as they are used to route specific jobs to
+specific types of runners, so it's a good idea to double check that
+the automatically created tags are consistent with the OS and
+architecture.  For instance, an Ubuntu 20.04 aarch64 system should
+have tags set as::
+
+  ubuntu_20.04,aarch64
+
+Because the job definition at ``.gitlab-ci.d/custom-runners.yml``
+would contain::
+
+  ubuntu-20.04-aarch64-all:
+   tags:
+   - ubuntu_20.04
+   - aarch64
+
+It's also recommended to:
+
+ * increase the "Maximum job timeout" to something like ``2h``
+ * give it a better Description
diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
index ee088604d1..f4a6183f1f 100644
--- a/scripts/ci/setup/.gitignore
+++ b/scripts/ci/setup/.gitignore
@@ -1,2 +1,2 @@
 inventory
-
+vars.yml
diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
new file mode 100644
index 0000000000..1127db516f
--- /dev/null
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -0,0 +1,71 @@
+# Copyright (c) 2021 Red Hat, Inc.
+#
+# Author:
+#  Cleber Rosa <crosa@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+#
+# This is an ansible playbook file.  Run it to set up systems with the
+# gitlab-runner agent.
+---
+- name: Installation of gitlab-runner
+  hosts: all
+  vars_files:
+    - vars.yml
+  tasks:
+    - debug:
+        msg: 'Checking for a valid GitLab registration token'
+      failed_when: "gitlab_runner_registration_token == 'PLEASE_PROVIDE_A_VALID_TOKEN'"
+
+    - name: Create a group for the gitlab-runner service
+      group:
+        name: gitlab-runner
+
+    - name: Create a user for the gitlab-runner service
+      user:
+        user: gitlab-runner
+        group: gitlab-runner
+        comment: GitLab Runner
+        home: /home/gitlab-runner
+        shell: /bin/bash
+
+    - name: Remove the .bash_logout file when on Ubuntu systems
+      file:
+        path: /home/gitlab-runner/.bash_logout
+        state: absent
+      when: "ansible_facts['distribution'] == 'Ubuntu'"
+
+    - name: Set the Operating System for gitlab-runner
+      set_fact:
+        gitlab_runner_os: "{{ ansible_facts[\"system\"]|lower }}"
+    - debug:
+        msg: gitlab-runner OS is {{ gitlab_runner_os }}
+
+    - name: Set the architecture for gitlab-runner
+      set_fact:
+        gitlab_runner_arch: "{{ ansible_to_gitlab_arch[ansible_facts[\"architecture\"]] }}"
+    - debug:
+        msg: gitlab-runner arch is {{ gitlab_runner_arch }}
+
+    - name: Download the matching gitlab-runner
+      get_url:
+        dest: /usr/local/bin/gitlab-runner
+        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-{{ gitlab_runner_arch }}"
+        owner: gitlab-runner
+        group: gitlab-runner
+        mode: u=rwx,g=rwx,o=rx
+
+    - name: Register the gitlab-runner
+      command: "/usr/local/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+
+    - name: Install the gitlab-runner service using its own functionality
+      command: /usr/local/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner
+      register: gitlab_runner_install_service_result
+      failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
+
+    - name: Enable the gitlab-runner service
+      service:
+        name: gitlab-runner
+        state: started
+        enabled: yes
diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars.yml.template
new file mode 100644
index 0000000000..e48089761f
--- /dev/null
+++ b/scripts/ci/setup/vars.yml.template
@@ -0,0 +1,12 @@
+# The version of the gitlab-runner to use
+gitlab_runner_version: 13.12.0
+# The URL of the gitlab server to use, usually https://gitlab.com unless you're
+# using a private GitLab instance
+gitlab_runner_server_url: https://gitlab.com
+# A mapping of the ansible to gitlab architecture nomenclature
+ansible_to_gitlab_arch:
+  x86_64: amd64
+  aarch64: arm64
+  s390x: s390x
+# A unique token made available by GitLab to your project for registering runners
+gitlab_runner_registration_token: PLEASE_PROVIDE_A_VALID_TOKEN
-- 
2.31.1


