Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D86B3C53
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:33:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa2C-0007dz-5R; Fri, 10 Mar 2023 05:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa25-0007UL-K1
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:29 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa22-0004Fo-Sj
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id f11so4565134wrv.8
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cCbPXzWfjZFi2jKGovhuePGEghRzJegWJl5AEsiLWo=;
 b=FE/crdNH/S0XkLgeFBbHk628l7rnVEcYaKcHhMWXhWGt9MB+nqBHrxZtXE5ftv91pb
 TussFRCZbF8KuOoAzGxx5Mk9j18j9l2IjjuI8S+DgxvYlRnK7eU7zft1M3AnR08ncheO
 p7DEEwKohW2gGOROT79x6DaTV6jVNMki4RuBA25PSr/mOzHXoa4YBU48idMWNBKeRFsa
 fnz0CUzyRqPnX3XtZ7Dzgl2L/cdl4gXCi6nN+xReykbIr4c+n/dZCyeXqEOA+4W8rAGv
 EAE6X6bE0xK5OPJ+88vKEQujN01EMsdVH24NSKpx8afdi65bqOnUHTDp4pKwNijrK8Ea
 HUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6cCbPXzWfjZFi2jKGovhuePGEghRzJegWJl5AEsiLWo=;
 b=buON81KcpNf0t8F22IuxGj1je+jWmAVDUJUFodpOlpVTH8ftjAUenigSp8s53KFNo2
 GRwYd5ekbO73yHBZXIaFiHNe7npUm/XUvIy+1SWDvmj7/V7Z+mJn1iQ5UZ9ms7j3WdHB
 3/yn5khYkDyKyn0g7roysOp5BCQa9JtUkigYXtWOglq6ZKPyJsDr0wWLF3PutKnGNInK
 Dt+Nn9C8WR7Uok2emJ0nF8IXz+0gDVofRlfZgXGJKEn24uPK0ezU3CCeuOtpr95J1OKC
 CsB2MQ1qiMonx7bJIsqMiMMPHIh2A7hIbGItRxUz6c+/P4ybrh6QIBCe8R9M6VcqR7UE
 rn0w==
X-Gm-Message-State: AO0yUKUSFc058xVgirQlBrcoLlKy2eZE7ddOUy5GJX5eNaT5ACyp8db0
 eL1XMNZKLq1UjPXzWIpgWuBRtw==
X-Google-Smtp-Source: AK7set8XLtmMul9M/M9wM1U7CxBTSjhA6yLYulIep3SphrxNDHfLfMSkL3MrYPcayq+T/LNVS1Y3XQ==
X-Received: by 2002:a5d:526a:0:b0:2c7:1210:fe5b with SMTP id
 l10-20020a5d526a000000b002c71210fe5bmr17110053wrc.49.1678444285572; 
 Fri, 10 Mar 2023 02:31:25 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d7-20020adffd87000000b002c59e001631sm1845103wrr.77.2023.03.10.02.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E448E1FFBC;
 Fri, 10 Mar 2023 10:31:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 04/11] scripts/ci: update gitlab-runner playbook to handle
 CentOS
Date: Fri, 10 Mar 2023 10:31:16 +0000
Message-Id: <20230310103123.2118519-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

This was broken when we moved to using the pre-built packages as we
didn't take care to ensure we used RPMs where required.

NB: I could never get this to complete on my test setup but I suspect
this was down to network connectivity and timeouts while downloading.

Fixes: 69c4befba1 (scripts/ci: update gitlab-runner playbook to use latest runner)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/gitlab-runner.yml | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 95d4199c03..1a1b270ff2 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -48,13 +48,29 @@
     - debug:
         msg: gitlab-runner arch is {{ gitlab_runner_arch }}
 
-    - name: Download the matching gitlab-runner
+    - name: Download the matching gitlab-runner (DEB)
       get_url:
         dest: "/root/"
         url: "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_{{ gitlab_runner_arch }}.deb"
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+
+    - name: Download the matching gitlab-runner (RPM)
+      get_url:
+        dest: "/root/"
+        url: "https://gitlab-runner-downloads.s3.amazonaws.com/latest/rpm/gitlab-runner_{{ gitlab_runner_arch }}.rpm"
+      when:
+        - ansible_facts['distribution'] == 'CentOS'
 
-    - name: Install gitlab-runner via package manager
+    - name: Install gitlab-runner via package manager (DEB)
       apt: deb="/root/gitlab-runner_{{ gitlab_runner_arch }}.deb"
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+
+    - name: Install gitlab-runner via package manager (RPM)
+      yum: name="/root/gitlab-runner_{{ gitlab_runner_arch }}.rpm"
+      when:
+        - ansible_facts['distribution'] == 'CentOS'
 
     - name: Register the gitlab-runner
       command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
-- 
2.39.2


