Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ED16BF99F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:48:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1R-0004mn-VS; Sat, 18 Mar 2023 07:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1O-0004lU-GU
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1M-0007Cg-4m
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id ay8so4761975wmb.1
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ym/QZjPWNLy4DWZhpWySS6BaNsmS4AnivkHm8ts1J/k=;
 b=RQ+d6JpbfRK0G/EW132ILhDaAThRjnWbOAfFecwA7KuC85Cyw2wBYavmJMI10M+WcL
 SztadXGDCIFbdV1mTLvIezjVywTCFS/cEtF/gC8nA9lpFa1wG0aHdk5Z8elUkO/FeIPD
 9nbTB0G3oTEvBMOgAzglkrsW898t2JzRmaRymEdNfV78taFYo4niObPBvXIhlghVCJoq
 s75YX1c/xnQ+UDwg4UzpyLqPuLggSVkjFmSXr+KUcGRrCCjq8cJGcMiaQWCDa3VdAAKe
 oVuaLsFi3jApYIbnPq4JmYJ0CDhOMpe2IrcrGA3M48WuicMeP3pQnErHhRnbFTlb7bCC
 UqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ym/QZjPWNLy4DWZhpWySS6BaNsmS4AnivkHm8ts1J/k=;
 b=NhNZ6Q11x0XKxyiwa2lnL+U956Uxc+EV6UFSVd2j94gotU9mvhAwUNwQmxMaAUgCU+
 5UijsfQEMOcZilIN+Qg40Di90R/fSZL9Z7GjqN/46q51wkPM3MHuWcReMS9GxEwtYCAm
 teI1ui7sdg7IePp0BOd5Hpp+GVpSYrH1mbSut/4+9BMA+IeKQ75Y5SNG5DScLopSW0H7
 qGZEsMWHyeLQjGAk4Cf483NJxJXZCi7ZB150b63RDC0wcNK14nQkjipsDqb3jb8kInq2
 tGqraTVRdCpgcEJxrc3NRQAgPm3tOaCErX3WoPfo5FThEVohJO+mHJNvKdh+MSPSl/o8
 jSLA==
X-Gm-Message-State: AO0yUKUOUqEfBlBu6MRIH/NmyJtFLOrLASuQlsdbmex/hfnnhhfDZPAN
 7FlTxL6+spLCreO0L1heVMMM7w==
X-Google-Smtp-Source: AK7set/PfynNT2jFp9EyqawtgXx/jDGzitm3/z/XuqoSOE0QDg8Jp/54ifEprQzRXqIlQJdsA1Y8gw==
X-Received: by 2002:a05:600c:4fce:b0:3ed:24f6:1089 with SMTP id
 o14-20020a05600c4fce00b003ed24f61089mr19792280wmq.15.1679140006791; 
 Sat, 18 Mar 2023 04:46:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b003edb59096f2sm1115100wmb.36.2023.03.18.04.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEA041FFBC;
 Sat, 18 Mar 2023 11:46:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 04/31] scripts/ci: update gitlab-runner playbook to handle
 CentOS
Date: Sat, 18 Mar 2023 11:46:17 +0000
Message-Id: <20230318114644.1340899-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Message-Id: <20230315174331.2959-5-alex.bennee@linaro.org>

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


