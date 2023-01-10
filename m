Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE4664C7A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIay-0003Le-Tc; Tue, 10 Jan 2023 12:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIaw-0003KI-EP
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:30 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIau-0001D0-Cy
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so12528731wmb.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkRhIgXl5AItP6ba03zv87lTI4x9mQkrreMEEEjOaX8=;
 b=b65qHxeOTQRmnPnZNHnkijD7BVkvWLLedhS9k2IQf9v+Ct4+frnUPvYpicUSKRFRUl
 UAZdDPxBwfcII5/H2yIt0umM1km+hMSNqmcs/UsKbDdOpfZapj52J2PKXGk/ULeov2i4
 HmtYjqCXG7o5E9u/h49fssbpS23L6cIredoTtEroZunXCDA+OB2Wt8kmqKXTg0caW1ql
 Fltfg5yvyN4c5JzqW4kzCu08NI9CwmbfBc32fU1JIyPTdahjQXPiQkL1nqAPnzqTlKix
 oVNWq65oVI/7R2Pbo8PtGt2IgsyhghSZ1ylC+hJ3NGYiixbVJg73c1mEryEHsUJPgQ02
 B1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkRhIgXl5AItP6ba03zv87lTI4x9mQkrreMEEEjOaX8=;
 b=Ba7lu6R8/nMd97xFj3JsQCwvwMtAPekugmuYvquhvCaFAFIlWBKNp6K25YNUq9hau7
 /PKyH9CoGl6KdU9eMTLiBbqzQzHRXhGoLeXWfQ7AcYPBvq17nXAVhNWNntUdHK9owVcQ
 /XU3wCrnBwsYvkFBzBbinrbeM4erCS0my9PlTYcF5bbE46/3P63M4HA41G+W22U0zKHQ
 hOYq65AzZyu9JmzHs5tSowgWH13T+N8mN6r55opbA2sKJRHLpfi/f8GwmxApBtoX0ZKD
 utdM3vyESMhZUV4xmoKIDwEc+vc6ofhtMO2H5I8+BQIwQKsIwxoOK9qgqANRFy4En9tm
 yZrQ==
X-Gm-Message-State: AFqh2kpoLrzfO1T7Lm+HG5HDlS8r/jCOBFEX5/EEaRVU8U/FMpEWhvcm
 6vBBY28ppxToizCvkrQcFsMPDA==
X-Google-Smtp-Source: AMrXdXup5zIwX98Ucum8C4X5YG/H8KyU54hMza7tLUSeHprQVrjI6aIUgFVoRWd3jXSsfiAmuMn/8g==
X-Received: by 2002:a05:600c:1d8a:b0:3d9:ebab:ccff with SMTP id
 p10-20020a05600c1d8a00b003d9ebabccffmr7904161wms.33.1673372365605; 
 Tue, 10 Jan 2023 09:39:25 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c188700b003c701c12a17sm19162023wmp.12.2023.01.10.09.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D41211FFB8;
 Tue, 10 Jan 2023 17:39:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 01/26] scripts/ci: update gitlab-runner playbook to use latest
 runner
Date: Tue, 10 Jan 2023 17:38:57 +0000
Message-Id: <20230110173922.265055-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
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

Note this script isn't fully idempotent as we end up accumulating
runners especially during testing. However we also want to be able to
run twice with different GitLab keys (e.g. project and personal) so I
think we just have to be mindful of that during testing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - only register aarch32 runner, move service start post both registers
  - tested on s390x
---
 scripts/ci/setup/gitlab-runner.yml | 56 +++++++-----------------------
 scripts/ci/setup/vars.yml.template |  2 --
 2 files changed, 13 insertions(+), 45 deletions(-)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 33128be85d..95d4199c03 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -50,60 +50,30 @@
 
     - name: Download the matching gitlab-runner
       get_url:
-        dest: /usr/local/bin/gitlab-runner
-        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-{{ gitlab_runner_arch }}"
-        owner: gitlab-runner
-        group: gitlab-runner
-        mode: u=rwx,g=rwx,o=rx
-
-    - name: Register the gitlab-runner
-      command: "/usr/local/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
-
-    - name: Install the gitlab-runner service using its own functionality
-      command: /usr/local/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner
-      register: gitlab_runner_install_service_result
-      failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
+        dest: "/root/"
+        url: "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_{{ gitlab_runner_arch }}.deb"
 
-    - name: Enable the gitlab-runner service
-      service:
-        name: gitlab-runner
-        state: started
-        enabled: yes
+    - name: Install gitlab-runner via package manager
+      apt: deb="/root/gitlab-runner_{{ gitlab_runner_arch }}.deb"
 
-    - name: Download secondary gitlab-runner
-      get_url:
-        dest: /usr/local/bin/gitlab-runner-arm
-        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-arm"
-        owner: gitlab-runner
-        group: gitlab-runner
-        mode: u=rwx,g=rwx,o=rx
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
+    - name: Register the gitlab-runner
+      command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
 
+    # The secondary runner will still run under the single gitlab-runner service
     - name: Register secondary gitlab-runner
-      command: "/usr/local/bin/gitlab-runner-arm register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+      command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
 
-    - name: Install the secondary gitlab-runner service using its own functionality
-      command: /usr/local/bin/gitlab-runner-arm install --user gitlab-runner --working-directory /home/gitlab-runner/arm -n gitlab-runner-arm
+    - name: Install the gitlab-runner service using its own functionality
+      command: "/usr/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner"
       register: gitlab_runner_install_service_result
       failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
 
-    - name: Enable the secondary gitlab-runner service
+    - name: Enable the gitlab-runner service
       service:
-        name: gitlab-runner-arm
+        name: gitlab-runner
         state: started
         enabled: yes
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
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


