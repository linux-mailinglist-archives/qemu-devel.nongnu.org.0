Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AB64C890B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:12:38 +0100 (CET)
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzUj-0002ch-Ak
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:12:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6S-0003Mk-4i
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:32 -0500
Received: from [2a00:1450:4864:20::335] (port=39445
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6Q-00078F-Fj
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:31 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o18-20020a05600c4fd200b003826701f847so312130wmq.4
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U+pwlSv+lJBvgdk+JsvrYqjIIdPS4lqzyuJCqNRB8Uk=;
 b=bCNye4m/b5wOylExBFjli7+5FRVOCgiTIiNFmis1P7jlbd8px4C5GaA3nVefUFcZPl
 9GFCCIy5j2o3T5hbwdrYpM5JqrI7mn+/S90an451LyfRbW0puzdOoa9QIJm4NdA40u9/
 yC4j6SXqdIFHRVumElJO+krCFtpbHu0GUdestDdYLv8R1213HMw+gKTxbHQmvkp4RyvR
 okFBPvUFCZ/IATHYxUkiDE63IszS/hTvpsQyWioFRf8kQtVscfgoiAVqgNrWg2h/VisN
 tRJvT+SqTq6PhTDtrOVQDswZe6+pnIBp3SRAvM1KOO44G95z8+AskYPRr9e222dlHZxF
 C+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U+pwlSv+lJBvgdk+JsvrYqjIIdPS4lqzyuJCqNRB8Uk=;
 b=Flth6yEO7Uhy9GtNtQVDVSaEPyuB2QLyyDmGO4RkeJl1AUa1lUg7NYdjwt3z5n9dre
 +L5htyqWl0yjXw5fyRX8vAqac8RZtBAwcowWMLiwasIzjBrr8Z4J24OmLoSRlabLGYCA
 WouPqMgJMHk2Q/28HZJAMQF17290CuKnuZvLjRx4/0oQGcZXls5Gyr6dYLj4869/U6rL
 alIHbWghUVc9oEMNVKih63xYYLUoEFijqBUFbG8sC9SimAA7DhO2Og9EeSqjMgpHu0Sq
 R+bYJNqGd9fLiXgTVUx4cNIXXxoErQwqA6MsGWpPOx//m6xKHndVq1OmR3MRI9JTIN2W
 D4hg==
X-Gm-Message-State: AOAM531RqFujqcwRrz0cRG3m+qeoyoTW6UP29+WHGc1ctNxbRIeI0CzF
 4k8L0y4ZI43NKEtkojaJ/q0dyw==
X-Google-Smtp-Source: ABdhPJzHNu8AtTyCPq6xhdLlDzRW+c6HjrkXzlOKVMSvRyDZpI1HxF+rraqmpKx+4vNA/6pGvDdKKg==
X-Received: by 2002:a05:600c:47d1:b0:381:1c01:2aa7 with SMTP id
 l17-20020a05600c47d100b003811c012aa7mr16360383wmo.189.1646128047858; 
 Tue, 01 Mar 2022 01:47:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfee46000000b001e4bf01bdfbsm13305807wro.46.2022.03.01.01.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18D251FFC0;
 Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/18] scripts/ci: allow for a secondary runner
Date: Tue,  1 Mar 2022 09:47:05 +0000
Message-Id: <20220301094715.550871-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some HW can run multiple architecture profiles so we can install a
secondary runner to build and run tests for those profiles. This
allows setting up secondary service.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-9-alex.bennee@linaro.org>

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 1127db516f..33128be85d 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -69,3 +69,41 @@
         name: gitlab-runner
         state: started
         enabled: yes
+
+    - name: Download secondary gitlab-runner
+      get_url:
+        dest: /usr/local/bin/gitlab-runner-arm
+        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-arm"
+        owner: gitlab-runner
+        group: gitlab-runner
+        mode: u=rwx,g=rwx,o=rx
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
+    - name: Register secondary gitlab-runner
+      command: "/usr/local/bin/gitlab-runner-arm register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
+    - name: Install the secondary gitlab-runner service using its own functionality
+      command: /usr/local/bin/gitlab-runner-arm install --user gitlab-runner --working-directory /home/gitlab-runner/arm -n gitlab-runner-arm
+      register: gitlab_runner_install_service_result
+      failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
+    - name: Enable the secondary gitlab-runner service
+      service:
+        name: gitlab-runner-arm
+        state: started
+        enabled: yes
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
-- 
2.30.2


