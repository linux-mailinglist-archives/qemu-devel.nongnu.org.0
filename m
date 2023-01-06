Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14556660130
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 14:26:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDmhi-0000ve-Bi; Fri, 06 Jan 2023 08:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDmhh-0000vN-5G
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:24:13 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDmhe-00034b-W7
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:24:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so1049496wms.4
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 05:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GVGOysvy+cLtSMRlcivdWChIrHtYtCtwI3Fj0N3Ojho=;
 b=Rjz8EMYiBsLSMDwi9lCVTOjC6QW76uG6wEdO6Vhl/cKMesXJ0P3J3grTY76YieOeZJ
 Lq7va5OjDUNcf/W3l/3dF0ZWYVxohu+FfWO9tQ1gCMIOn6I0IUtt1FBrT8FTeIAi+a9S
 AbD5dN+ui36gSonaiTyoCQuF+R5R5QO6P53+k90/nI6jWeizpJZb9LsUk5eXCah4Ydmr
 CoO3r9FBad0dwMc7r0Zp9zZd7XuwikpWTABpoJeB1Xm7vIKCRA/+ErC5cZPUz7zlRDrg
 wSM5xkjwvUzTl4deKX08pHE9hOlpj01KWXNcmwpYV/S1+5BtDvKp0iPzGvWGkTOMfQv0
 yaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GVGOysvy+cLtSMRlcivdWChIrHtYtCtwI3Fj0N3Ojho=;
 b=Iikrz6of/wbLCvGBhLEfByXEwAscmKldeJkr80CUYN8AL68ZmMGH4CyEslGUN2ysP2
 N3GvUBwmjgLoqGdcyHkgjj45LhdyK6rDFkY8Mcb/fINRy+XiwCozoebKuWWphudhgxRb
 NZZRhks4Taz6INvQD0zPSvJVL49PATFcfEMBbJ7Y9nDNbm3uPvy0Z6erKdJhrVK2BEf9
 oKz0NXrgsZHDqKeA9dzMus+rkwVPtob7NdQfv7nz/N8jSZZl+4KT+LEpekO6ORBkgJZ6
 0L8ZTezztf24r673obHKtalAOLFyPv/L3VsXo/OsMqwILFBP50BJAapxH8Ysem0rvrFp
 yqVQ==
X-Gm-Message-State: AFqh2kqVd/SlYD8ACHBR3OaxleCspY2Dpef7rjRhKjt9F7m0btE2SKlM
 nZMsngAVntyN7UGfzFStaWFp/g==
X-Google-Smtp-Source: AMrXdXsa2KvtaXFiwc1edGGOYvE3XjOR2X350uTUA6w5JtfFgtvJFcMAqTG01rC2F3053lPKZr77iQ==
X-Received: by 2002:a05:600c:8507:b0:3d9:6c7d:c9ee with SMTP id
 gw7-20020a05600c850700b003d96c7dc9eemr34477830wmb.25.1673011449260; 
 Fri, 06 Jan 2023 05:24:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b003cf5ec79bf9sm1891574wmo.40.2023.01.06.05.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:24:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5EA1E1FFB7;
 Fri,  6 Jan 2023 13:24:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] scripts/ci: update gitlab-runner playbook to use latest
 runner
Date: Fri,  6 Jan 2023 13:24:00 +0000
Message-Id: <20230106132401.2544543-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

We were using quite and old runner on our machines and running into
issues with stalling jobs. Gitlab in the meantime now reliably provide
the latest packaged versions of the runner under a stable URL. This
update:

  - creates a per-arch subdir for builds
  - switches from binary tarballs to deb packages
  - re-uses the same binary for the secondary runner
  - updates distro check for second to 22.04

So far I've tested on aarch64.ci.qemu.org but I shall do s390x next as
its having issues with stale runners as well.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/gitlab-runner.yml | 42 ++++++++++++++++--------------
 scripts/ci/setup/vars.yml.template |  2 --
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 33128be85d..05cdb2ae4b 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -30,6 +30,11 @@
         home: /home/gitlab-runner
         shell: /bin/bash
 
+    - name: Create working directories for build
+      file:
+        path: "/home/gitlab-runner/{{ ansible_facts[\"architecture\"] }}"
+        state: directory
+
     - name: Remove the .bash_logout file when on Ubuntu systems
       file:
         path: /home/gitlab-runner/.bash_logout
@@ -50,17 +55,17 @@
 
     - name: Download the matching gitlab-runner
       get_url:
-        dest: /usr/local/bin/gitlab-runner
-        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-{{ gitlab_runner_arch }}"
-        owner: gitlab-runner
-        group: gitlab-runner
-        mode: u=rwx,g=rwx,o=rx
+        dest: "/root/"
+        url: "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_{{ gitlab_runner_arch }}.deb"
+
+    - name: Install gitlab-runner via package manager
+      apt: deb="/root/gitlab-runner_{{ gitlab_runner_arch }}.deb"
 
     - name: Register the gitlab-runner
-      command: "/usr/local/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+      command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
 
     - name: Install the gitlab-runner service using its own functionality
-      command: /usr/local/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner
+      command: "/usr/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner/{{ ansible_facts[\"architecture\"] }}"
       register: gitlab_runner_install_service_result
       failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
 
@@ -70,33 +75,30 @@
         state: started
         enabled: yes
 
-    - name: Download secondary gitlab-runner
-      get_url:
-        dest: /usr/local/bin/gitlab-runner-arm
-        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-arm"
-        owner: gitlab-runner
-        group: gitlab-runner
-        mode: u=rwx,g=rwx,o=rx
+    - name: Create working directories secondary runner
+      file:
+        path: "/home/gitlab-runner/arm"
+        state: directory
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
 
     - name: Register secondary gitlab-runner
-      command: "/usr/local/bin/gitlab-runner-arm register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+      command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
 
     - name: Install the secondary gitlab-runner service using its own functionality
-      command: /usr/local/bin/gitlab-runner-arm install --user gitlab-runner --working-directory /home/gitlab-runner/arm -n gitlab-runner-arm
+      command: /usr/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner/arm -n gitlab-runner-arm
       register: gitlab_runner_install_service_result
       failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
 
     - name: Enable the secondary gitlab-runner service
       service:
@@ -106,4 +108,4 @@
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars.yml.template
index e48089761f..4b355fb80f 100644
--- a/scripts/ci/setup/vars.yml.template
+++ b/scripts/ci/setup/vars.yml.template
@@ -1,5 +1,3 @@
-# The version of the gitlab-runner to use
-gitlab_runner_version: 13.12.0
 # The URL of the gitlab server to use, usually https://gitlab.com unless you're
 # using a private GitLab instance
 gitlab_runner_server_url: https://gitlab.com
-- 
2.34.1


