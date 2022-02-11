Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE394B29E2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:14:51 +0100 (CET)
Received: from localhost ([::1]:37130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYZO-0005OV-QL
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:14:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOe-0007Rv-MW
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:44 -0500
Received: from [2a00:1450:4864:20::52f] (port=37588
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOY-0005Bc-I0
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:40 -0500
Received: by mail-ed1-x52f.google.com with SMTP id da4so17152465edb.4
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXsis8WuMNaivDbN1qF2633lGkq2Q3P7dp1n5KkzK9E=;
 b=ilN8hcA7C6Dn9hsO6+gYi5aNzONSJEkQyd/B0MMunRlCNhtrJCWKTrj1PWgk9u2K/6
 DUC3TcmqhpI3K9n1873zW873pnahWrmUCPbGmw/tTvzzUFt7fcPIqLqsdbMZxvIPtFBj
 uO9SmDzcw5pJc9OvXjsZoQZi0YnxGeeKan9ls9FNHajbYbW7DT8xW5sfdgn9e4rEnPSW
 HWMRqYKF9/xMLNKeW+sTPg1giK50UvqUd5P9cdFGwfOJhaRbSRLffmWx2lEjvAAfvmis
 0sY+KM4s7KrPcY/5RZm438kv0A+cMg2lHzkDFO35t5oUxO/28WwyrkYoDz3T0K+6YfPv
 w8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YXsis8WuMNaivDbN1qF2633lGkq2Q3P7dp1n5KkzK9E=;
 b=EyUkizL2raV/Uy8KvPTYxahTu8UTkjDv3+IqXpgMEQdiYh2KxpihHrHEyxl5Og3UBp
 XNAlzpoovqsuCFmmdu3N51uPvwFXnQeogMssrnbB7w+QjbaCRxEB/jVz7aB38Lvcy9eB
 yb9nBagsx9RGmGV7TMeEX5YzcfpfW25P1jFlAvgUCGb5groEBJDKq7E6WO59RaiMXa4k
 hMpqK+ggOW9iBYIC13RcCB6bbUSOGtcHlOtOvwa/OJYAFrfzEuRYuivw+AAEPRbpE0fZ
 bB+C77Tq5nnrKHdcQrFF+2hTwbi0r/jY3cx3uDgTdI1NQlrrxhrUlTKnMHqXKb3/Ad0o
 luGA==
X-Gm-Message-State: AOAM530MeVQ+/zjzMknP+wlO84mpzcLLymIFUsftdjSccNTEHKhrzOYD
 3OpUfYkhTT9HbQU75TXlSZOGiQ==
X-Google-Smtp-Source: ABdhPJxnChx+l+XdAJN0yQO0BoANGyANUBeNPpxxKhCjPaAKqk/gKc+glDURUCJt23kCWrug+/qPtg==
X-Received: by 2002:a50:d70e:: with SMTP id t14mr2698223edi.19.1644595399844; 
 Fri, 11 Feb 2022 08:03:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j6sm11090893edl.98.2022.02.11.08.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:03:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4ACC41FFBE;
 Fri, 11 Feb 2022 16:03:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 06/11] scripts/ci: add build env rules for aarch32 on
 aarch64
Date: Fri, 11 Feb 2022 16:03:04 +0000
Message-Id: <20220211160309.335014-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At least the current crop of Aarch64 HW can support running 32 bit EL0
code. Before we can build and test we need a minimal set of packages
installed. We can't use "apt build-dep" because it currently gets
confused trying to keep two sets of build-deps installed at once.
Instead we install a minimal set of libraries that will allow us to
continue.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/build-environment.yml | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 599896cc5b..9182e0c253 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -19,6 +19,13 @@
           - '((ansible_version.major == 2) and (ansible_version.minor >= 8)) or (ansible_version.major >= 3)'
         msg: "Unsuitable ansible version, please use version 2.8.0 or later"
 
+    - name: Add armhf foreign architecture to aarch64 hosts
+      command: dpkg --add-architecture armhf
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
     - name: Update apt cache / upgrade packages via apt
       apt:
         update_cache: yes
@@ -115,6 +122,24 @@
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['distribution_version'] == '20.04'
 
+    - name: Install armhf cross-compile packages to build QEMU on AArch64 Ubuntu 20.04
+      package:
+        name:
+          - binutils-arm-linux-gnueabihf
+          - gcc-arm-linux-gnueabihf
+          - libblkid-dev:armhf
+          - libc6-dev:armhf
+          - libffi-dev:armhf
+          - libglib2.0-dev:armhf
+          - libmount-dev:armhf
+          - libpcre2-dev:armhf
+          - libpixman-1-dev:armhf
+          - zlib1g-dev:armhf
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['architecture'] == 'aarch64'
+
     - name: Install basic packages to build QEMU on EL8
       dnf:
         # This list of packages start with tests/docker/dockerfiles/centos8.docker
-- 
2.30.2


