Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A33C8693
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:03:11 +0200 (CEST)
Received: from localhost ([::1]:48780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gPm-0001ZC-7q
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNW-00076R-Hq
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNT-0007SB-4X
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:50 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r11so3592560wro.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tx0LVkEeNkiisbZ/NNlmcCoTtxFb5VF+oTFhCuDdy2I=;
 b=hVZVZdDzVJiRM+pEOPCHh8Lv5FrkkZlean3l8+4rMrQcNzdVoAHP9pSXKrIpY1URMg
 Jc+HY/t474giwnMRHdChPgdseRq299RBDTkfkI5HqgHToOIo7oJAkq9KYZJtlcQktxO1
 ofhNiD8MTJ1739jngyqyj1D96/aRkTn0eJEbwKHpK8BdBC/fN57MO6Z1yiXE3Lc+j5Be
 GsHnfJeIkHrWz5OM7KHPZXFsMEmoA66+bSj4ovkna5hhzqUSFRDSux/EwDyxGNBLJEVH
 P1C9vcNuTzZjUad50QLnT0sEVBtWDN2wS3kPQyPeEm7Lo5gi+vMTqdhYbxVe/sxARbnd
 FM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tx0LVkEeNkiisbZ/NNlmcCoTtxFb5VF+oTFhCuDdy2I=;
 b=kqU14kQtVYQU8eKzmnFLSuthR7vE3B3bZWDlHWK/VdCD1KtPFmGuCcaeLqk63K5w5h
 u5RCKXKO2ZYxGONHsR/QbbO4ormlKR0tocJuQO0rmtKNJOqpoXF8I+qhQmiU+YYJ6wd9
 djACCPn0Vv1dumDxWssM98qH58TRFI+viuBieuhjN1eMgas4NkNfFxQOFD1hXM5Eb0ca
 HwDx+r0NFb/wU1jwBEQFmTAqkSzg2E0/saTZxGEwrV09bh6nGqPzRTiCW0iOUhr/4QVk
 vX7K4B6mr+dZgC9CiksE7IeoWI5WMvSSsehHrjWTKrJDZaciQ2gp6LcqdrG8utQ7VCZo
 YKaQ==
X-Gm-Message-State: AOAM532UWSOuuZiF/4tBlq28L2XgtAge3utso42M1bmRvLtirlwb98gi
 963QmI215GJS9LNjJctziG/9cQ==
X-Google-Smtp-Source: ABdhPJzgSAXVzkgRnvhZ6S6M2NuUDn6a58zWivP1fJ3fvb/PUJ+aozf7rybc+js0q5zQwOVtD2+N9g==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr14181477wrk.198.1626274845416; 
 Wed, 14 Jul 2021 08:00:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n20sm2348186wmk.12.2021.07.14.08.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 10D361FF8F;
 Wed, 14 Jul 2021 16:00:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 03/44] Jobs based on custom runners: docs and gitlab-runner
 setup playbook
Date: Wed, 14 Jul 2021 15:59:55 +0100
Message-Id: <20210714150036.21060-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210630012619.115262-4-crosa@redhat.com>
Message-Id: <20210709143005.1554-4-alex.bennee@linaro.org>

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
2.20.1


