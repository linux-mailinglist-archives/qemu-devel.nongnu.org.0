Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562D52920F3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 03:54:08 +0200 (CEST)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUKND-0006Fh-DY
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 21:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kUKJf-0001h1-BM
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 21:50:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kUKJZ-0001H8-W2
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 21:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603072221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q09udQSpOqJryDUc6T1JF6tDvIft0oQYAmRB4pZ755M=;
 b=K+6r9tYeOwjje+nT0noYiQbf6E8oJaaUZdp+2udWNXA5nk9gBepxZjG5Mq7J/D/yMop3Ce
 tS6YDlioPpixLKxFqOm5gXVycR817+4EU0D7f3EdfAUMZdSrq2EetJPqmQwQGz7bz+5Qsz
 p+42N7EakU8dAdReC2X8c+4nHYWmeEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-bQoBwzP-NH-QUf8D1TAg7A-1; Sun, 18 Oct 2020 21:50:18 -0400
X-MC-Unique: bQoBwzP-NH-QUf8D1TAg7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27CEF802B69;
 Mon, 19 Oct 2020 01:50:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9FD76EF45;
 Mon, 19 Oct 2020 01:50:15 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 3/4] Jobs based on custom runners: docs and gitlab-runner
 setup playbook
Date: Sun, 18 Oct 2020 21:50:02 -0400
Message-Id: <20201019015003.1527746-4-crosa@redhat.com>
In-Reply-To: <20201019015003.1527746-1-crosa@redhat.com>
References: <20201019015003.1527746-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/18 21:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To have the jobs dispatched to custom runners, gitlab-runner must
be installed, active as a service and properly configured.  The
variables file and playbook introduced here should help with those
steps.

The playbook introduced here covers a number of different Linux
distributions and FreeBSD, and are intended to provide a reproducible
environment.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/ci.rst                  | 63 ++++++++++++++++++++++++++
 scripts/ci/setup/.gitignore        |  1 +
 scripts/ci/setup/gitlab-runner.yml | 72 ++++++++++++++++++++++++++++++
 scripts/ci/setup/vars.yml.template | 13 ++++++
 4 files changed, 149 insertions(+)
 create mode 100644 scripts/ci/setup/.gitignore
 create mode 100644 scripts/ci/setup/gitlab-runner.yml
 create mode 100644 scripts/ci/setup/vars.yml.template

diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index 208b5e399b..a234a5e24c 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -84,3 +84,66 @@ To run the playbook, execute::
 
   cd scripts/ci/setup
   ansible-playbook -i inventory build-environment.yml
+
+gitlab-runner setup and registration
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The gitlab-runner agent needs to be installed on each machine that
+will run jobs.  The association between a machine and a GitLab project
+happens with a registration token.  To find the registration token for
+your repository/project, navigate on GitLab's web UI to:
+
+ * Settings (the gears like icon), then
+ * CI/CD, then
+ * Runners, and click on the "Expand" button, then
+ * Under "Set up a specific Runner manually", look for the value under
+   "Use the following registration token during setup"
+
+Copy the ``scripts/ci/setup/vars.yml.template`` file to
+``scripts/ci/setup/vars.yml``.  Then, set the
+``gitlab_runner_registration_token`` variable to the value obtained
+earlier.
+
+.. note:: gitlab-runner is not available from the standard location
+          for all OS and architectures combinations.  For some systems,
+          a custom build may be necessary.  Some builds are avaiable
+          at https://cleber.fedorapeople.org/gitlab-runner/ and this
+          URI may be used as a value on ``vars.yml``
+
+To run the playbook, execute::
+
+  cd scripts/ci/setup
+  ansible-playbook -i inventory gitlab-runner.yml
+
+.. note:: there are currently limitations to gitlab-runner itself when
+          setting up a service under FreeBSD systems.  You will need to
+          perform steps 4 to 10 manually, as described at
+          https://docs.gitlab.com/runner/install/freebsd.html
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
+Under tags, add values matching the jobs a runner should run.  For a
+FreeBSD 12.1 x86_64 system, the tags should be set as::
+
+  freebsd12.1,x86_64
+
+Because the job definition at ``.gitlab-ci.d/custom-runners.yml``
+would contain::
+
+  freebsd-12.1-x86_64-all:
+   tags:
+   - freebsd_12.1
+   - x86_64
+
+It's also recommended to:
+
+ * increase the "Maximum job timeout" to something like ``2h``
+ * uncheck the "Run untagged jobs" check box
+ * give it a better Description
diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
new file mode 100644
index 0000000000..f112d05dd0
--- /dev/null
+++ b/scripts/ci/setup/.gitignore
@@ -0,0 +1 @@
+vars.yml
\ No newline at end of file
diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
new file mode 100644
index 0000000000..c2f52dad10
--- /dev/null
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -0,0 +1,72 @@
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
+    - name: Checks the availability of official gitlab-runner builds in the archive
+      uri:
+        url: https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-linux-386
+        method: HEAD
+        status_code:
+          - 200
+          - 403
+      register: gitlab_runner_available_archive
+
+    - name: Update base url
+      set_fact:
+        gitlab_runner_base_url: https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-
+      when: gitlab_runner_available_archive.status == 200
+    - debug:
+        msg: Base gitlab-runner url is {{ gitlab_runner_base_url  }}
+
+    - name: Set OS name (FreeBSD)
+      set_fact:
+        gitlab_runner_os: freebsd
+      when: "ansible_facts['system'] == 'FreeBSD'"
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
+    - name: Downloads the matching gitlab-runner
+      get_url:
+        dest: /usr/local/bin/gitlab-runner
+        url: "{{ gitlab_runner_base_url }}{{ gitlab_runner_os }}-{{ gitlab_runner_arch }}"
+        owner: gitlab-runner
+        group: gitlab-runner
+        mode: u=rwx,g=rwx,o=rx
+
+    - name: Register the gitlab-runner
+      command: "/usr/local/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell  --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+
+    - name: Install the gitlab-runner service using its own functionality
+      command: /usr/local/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner
+      register: gitlab_runner_install_service_result
+      failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
+      when: "ansible_facts['os_family'] != 'FreeBSD'"
+
+    - name: Enable the gitlab-runner service
+      service:
+        name: gitlab-runner
+        state: started
+        enabled: yes
+      when: "ansible_facts['os_family'] != 'FreeBSD'"
diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars.yml.template
new file mode 100644
index 0000000000..621435d030
--- /dev/null
+++ b/scripts/ci/setup/vars.yml.template
@@ -0,0 +1,13 @@
+# The version of the gitlab-runner to use
+gitlab_runner_version: 13.1.1
+# The base location of gitlab-runner binaries, this will be suffixed by $OS-$ARCH
+gitlab_runner_base_url: https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-
+# The URL of the gitlab server to use, usually https://gitlab.com unless you're
+# using a private GitLab instance
+gitlab_runner_server_url: https://gitlab.com
+# Defaults to linux, checks can be used to change this
+gitlab_runner_os: linux
+# Defaults to amd64 (x86_64), checks can be used to change this
+gitlab_runner_arch: amd64
+# A unique token made available by GitLab to your project for registering runners
+gitlab_runner_registration_token: PLEASE_PROVIDE_A_VALID_TOKEN
-- 
2.25.4


