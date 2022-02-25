Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D73B4C4CF9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:54:19 +0100 (CET)
Received: from localhost ([::1]:41958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNenK-0000q6-Fg
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeH0-00046p-IU
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:54 -0500
Received: from [2a00:1450:4864:20::62c] (port=44770
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGj-0002MF-9i
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:47 -0500
Received: by mail-ej1-x62c.google.com with SMTP id p14so12122149ejf.11
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bovqz69HZL8x82kdasie6FxG/SZJtaBt+I+NMEJJYbg=;
 b=vZn3y/nfIpArkRlP1Ne9nD2mwj2rR+w2V+psBUBqS6izex5Qgms3sRLboGAY9FNk6T
 +w7ggtF7IkJMtPg5qJ1fvif4P2YSIRK5Wx4GhQp+7s70z7QiJOJVoRnLxTskeRX/Cfu7
 kHLy9JGXVSiibP4S4xOr3eGlm69SdYNpUkjc7njZIyuMYa+8blwkO1qio3dw42u/9xde
 NTaoAdOjo4EO4gAQohzPuJRnsLdxZpQw/CPDqGHegqL36gqU3kzt+/+odaSHoVYzsx7h
 O6GicMTy7Rc8HtgWxpZ3dTY8mbzyDOj8JWpDmqDYPZAfVKYjupUya4SJJRe5qUwTgt/f
 qEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bovqz69HZL8x82kdasie6FxG/SZJtaBt+I+NMEJJYbg=;
 b=zr3b/J7a2cfokHMkG44fX9vpj0VsF95rULHOqTWkSESAcdfwNdYDKcGou+xMzCp4Zm
 XPBJciq11Fo7yuxkb7ho+COgtopZdYA1sGAdeQqjfpjccNAix5yp18LugnI7vuPz80Iu
 osjFoYFSz0L2pyg/kaDFiFtIqOqo4/aVUfFBtypp1H5C8vh2XFTQUWJqPWtKz6DPW2PL
 8CIfA+PZJI9R/U+XXM18AURkML3Cmk29K/dC8Lr1PUs3+s8I6IePw0JUOIbBLbhN68Ox
 jnHDkeOWTlGJSedz2cwIwWArzjqqVYu7FEz6xxpjoGLUBtvnk6OCao338S41lYB1U/lv
 AFyA==
X-Gm-Message-State: AOAM532nPEIUr9ixPKQ57VMfl3wY28vvKJRUuUmJ/BxxJ+KvVVOb/sDT
 RKgmEeY+rslc+B44E8wcST+bXw==
X-Google-Smtp-Source: ABdhPJyaOAR9bLneTcMkr6shORIM1sEIBNHokvhmZp5o04fuqJa1mPDaKa5dB50FlgwNFRd3YDjmfw==
X-Received: by 2002:a17:906:8505:b0:6cf:2767:f447 with SMTP id
 i5-20020a170906850500b006cf2767f447mr6811169ejx.321.1645809634343; 
 Fri, 25 Feb 2022 09:20:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a50a418000000b00412b67facd1sm1566599edb.91.2022.02.25.09.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C529C1FFC0;
 Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 08/18] scripts/ci: allow for a secondary runner
Date: Fri, 25 Feb 2022 17:20:11 +0000
Message-Id: <20220225172021.3493923-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some HW can run multiple architecture profiles so we can install a
secondary runner to build and run tests for those profiles. This
allows setting up secondary service.

[AJB: this is a fairly ugly hack, I'm sure this could be expressed in
a neater way]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220211160309.335014-8-alex.bennee@linaro.org>
---
 scripts/ci/setup/gitlab-runner.yml | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 1127db516f..19bfd68f7e 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -69,3 +69,37 @@
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


