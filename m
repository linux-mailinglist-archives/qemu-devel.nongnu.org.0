Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FE67C9F2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LP-0002Lm-Ij; Thu, 26 Jan 2023 06:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LJ-0001hb-Vx
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:58 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LG-0003ce-WD
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:22:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n7so1425269wrx.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0NjCeAYrzK7A1a1AbZZ8FkVkM9fRhe+XUXKLNI0vuk=;
 b=Dm6ncvDz+5yxpteh8aQAJ+UfcavSmBKZS6rP9Aerzh+EHMjvfdGNl8B+cP/TfULiCa
 zKoCsNTb5RRGESbqmE2MusD3r4z/rREcRZ/LMwZnaSXbiYnu7UsYIy759KSD8VoKM+0A
 V7ysjPL8Lrg/cZ2snzOEBZ997UIZ+Yp3hpqT0VUG8QSsoVNmwkXWGnzjajlCu6LGrCoc
 U2hsfS/SvOL4fNdYc/YExv4himnDFm/TX+byul+ui6o5Mpqzc8h58/S3IYy2Lwr4WrxD
 K+nAfP8e9tua1KXiPRUtm+VfyfJclHy6LLUQ0N2llxVC99MtiuRmp9s0oHmbVd+We1xH
 6oCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0NjCeAYrzK7A1a1AbZZ8FkVkM9fRhe+XUXKLNI0vuk=;
 b=qJkvKAzw7m9u/sKLbE8wBCI0hyBBoDuaQO68ESskocEgwzhHawa0dr+RBGIE6VVem8
 U5aXlRjmPhYKw6b0in0gAgGVg/8Fw9pdeQeWElVqWjSzfY6siy2qBSb+FsunUh9+R8Lk
 n8GwFmgNXIG9C03BH5WjynzOT8jS2V0WrICMwkTX2xJUpKAyitPhA+pCMdMgUql39XpL
 bOud4iGVjdosJnw58XurUd3nfasMCV728S6Ox+UYUFonG0f4dEodeW9BvopRILfxeN4+
 8UtxazdhhhRWgFSq3Z5CovdLnm7o2V9mAKdqcW8a6uzI5A/pzBYB/nm2dq+OieMAFdeu
 XZ4w==
X-Gm-Message-State: AFqh2kqdRFfCpEeawXs3PuwLxt1U00T9IPR9dkgsQAjoFE1or/9SzGrE
 AMxH+NVya5Z5iTNDuUfV9b8Tmw==
X-Google-Smtp-Source: AMrXdXtRS/sdVB+Thx+pd9vD/0oe2oKkUfQiWkj+s0/YWdcbPNyIk3ZfzZ5Ac6cm5wbAv8/D5RgcSw==
X-Received: by 2002:a05:6000:1708:b0:2bd:db1c:8dfe with SMTP id
 n8-20020a056000170800b002bddb1c8dfemr35569106wrc.48.1674732173020; 
 Thu, 26 Jan 2023 03:22:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adfdb4c000000b002bfb1de74absm1087164wrj.114.2023.01.26.03.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 285241FFB8;
 Thu, 26 Jan 2023 11:22:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 01/35] scripts/ci: update gitlab-runner playbook to use latest
 runner
Date: Thu, 26 Jan 2023 11:22:16 +0000
Message-Id: <20230126112250.2584701-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230124180127.1881110-2-alex.bennee@linaro.org>

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


