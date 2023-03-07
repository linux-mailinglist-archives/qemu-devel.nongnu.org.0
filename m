Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AF36AE2CE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:39:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYSe-0005My-8b; Tue, 07 Mar 2023 09:38:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSP-0005I4-3I
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:26 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSN-0000b0-4u
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id j3so7919753wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678199901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cCbPXzWfjZFi2jKGovhuePGEghRzJegWJl5AEsiLWo=;
 b=LET7CW6WFv+Idt2XMiFypY91WMZuGAt3LJcub7aJRuzpzMAyuVMPZSIkLCYl+Tghlq
 Dk5beV6yFKjRF++GT/jTNNUdMJeA0GfeGL7zxYbpXUI6QfoZsW/L2iHEpFIfX9YT4ed4
 koyw7TJFIvTb5Utni339PdcJyHwmLUNCrB9GW87MK1jM5ctiFpkAo1qS/lm56iV+LkzU
 o255UiUCHftBy9OnEsGouYxUj7W24PFvCa5BSdn5L7W5053vYEycVozmKwHTpMICS2sF
 LuSTmY9gyl3Z50k9k6rybRCDzLW2fdu+2xD8l/fJmlZbMNjJqi310zgsncaTFohQA0/t
 Vnew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678199901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6cCbPXzWfjZFi2jKGovhuePGEghRzJegWJl5AEsiLWo=;
 b=ehHGiCOgEREiqAVEMT87Hzvv4vEwOPvf88Y7285PzateZ2SA5PHTF8hhV45g3e7Cvr
 OfpxwNTLxXk+N63lTyjVAxfE/Wzqhvnz1XUl5rq2ZsI4lIR9ZhQCRuLNiKWNpWUrxg68
 pIKNqvSPg+Y7+by3DSKXNcVD97RQr7AQ/D/2PWDOYGzvtGEgv1P7Sb+QBKBTtrf9+EGr
 23OGw7CXM8wOw0oLsGJDzPhyBxEkHGgxx+PEqeiEAtnMx1WCjMA5hwU6EIyu1u7VcEut
 kRFiZNQAUrEhvoCxIzSrqobhlfhoDjZs2Ec44LYf0edffV5dnuxpklVcbNDUH6ClyaVp
 xHyA==
X-Gm-Message-State: AO0yUKWMOz7C4QtdJkwp0sqGF8aqj4gRmPL4aLeaB81bhlUJM5cQS2fk
 z21k+xFSpFQURH7do8hDzBcQaw==
X-Google-Smtp-Source: AK7set9nHZNKTZ7Phci1fN4nK4GI2B91X7a5e88Y1FjCXT/xO0EHLHM6+vKU0XNijKHVPbuDh1xeYw==
X-Received: by 2002:a05:600c:4f88:b0:3eb:3908:8541 with SMTP id
 n8-20020a05600c4f8800b003eb39088541mr13241733wmq.2.1678199901459; 
 Tue, 07 Mar 2023 06:38:21 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j17-20020adff011000000b002c5a1bd527dsm12641750wro.96.2023.03.07.06.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 06:38:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C48CA1FFBC;
 Tue,  7 Mar 2023 14:38:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 4/5] scripts/ci: update gitlab-runner playbook to handle CentOS
Date: Tue,  7 Mar 2023 14:38:18 +0000
Message-Id: <20230307143819.510186-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307143819.510186-1-alex.bennee@linaro.org>
References: <20230307143819.510186-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


