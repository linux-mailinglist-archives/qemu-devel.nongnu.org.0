Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408EA67A0CF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:03:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNcC-0001VF-4S; Tue, 24 Jan 2023 13:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNc4-0001U2-DA
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:40 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNby-00064o-D0
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:01:40 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so13431241wmb.2
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkRhIgXl5AItP6ba03zv87lTI4x9mQkrreMEEEjOaX8=;
 b=pGxlS381LIW4od2+muGYRN7/MdAI1ojgj4bxko/5xhGdqiUvKwS3Z1LQtP5SZDz7XB
 3maheuKji+UICyh9hM+U1wcvMWmDZNDUFlxwgFXVBNe/MabE1AlhlMO+JbCk2V8S9PS1
 A+NciDWWG32craugnFMlssyV15gAGQI3+FWs66FU7V6MaLPOWzv5EyAaRas/+yoe0SCX
 a0oh3A+UBbQO8W7R2UJ8StYtYJlg864ZaMv0uY5a1A2B0laEtH6rHdyLsoRmMVScIzx0
 DhGZx8ci10UiBFSYS+OWWgzITANjs9rUOuZ7yGBHm9lF5O+Z0+WxMcC+WXJyhJ3mwaCN
 jB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkRhIgXl5AItP6ba03zv87lTI4x9mQkrreMEEEjOaX8=;
 b=HnJkrzZuXxtfe+UwlP1G1MU4AX3qNp7PzLLzHLKjWADwbZLo/g7PLsdc43URdeYV8R
 i+3skq+qeyqn3T27xrNLu9W+cO7aHqlC63WK0dtxIHjHvTxzu70TUY5e6IfXtyhW0u1r
 Lct1N8nA3USmPpNVFtHOwjCZIxcUQMT24smbFqTNJD2/OgDoferIO867ceMD2haNUK4n
 fRYd69FBJA8cVc9q5Y+7S8QhT5OzrnF30ZEAJ1UAY0IvUoohq5MSlExZIOI/llNsqLz8
 lyYr/4oCdlKBfr8pCSFlO4DPwloEH2p3hT+zZ4penl1Hy4XMPuxxrsL9B47nF8wdIO8r
 aowA==
X-Gm-Message-State: AFqh2krgIcNqZbP6S80QMYBwIU/pgyOUUVjx1a9hoMBoZK0ASW/hSTMA
 Oivc/lx5OHINvutNwhi9gHo7pw==
X-Google-Smtp-Source: AMrXdXssSTxsNgjLG+XE61kWKaMedNgJPqUGbrkg3Cz6KE24/BAQWd1Kc+e2EmzDO+kLK526gsea0g==
X-Received: by 2002:a05:600c:3d96:b0:3db:26b7:2fc8 with SMTP id
 bi22-20020a05600c3d9600b003db26b72fc8mr19963604wmb.39.1674583291203; 
 Tue, 24 Jan 2023 10:01:31 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a05600c309600b003c6b70a4d69sm2498872wmn.42.2023.01.24.10.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:01:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B08311FFB8;
 Tue, 24 Jan 2023 18:01:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 01/35] scripts/ci: update gitlab-runner playbook to use
 latest runner
Date: Tue, 24 Jan 2023 18:00:53 +0000
Message-Id: <20230124180127.1881110-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


