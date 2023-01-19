Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DC3673DC4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:43:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIX3L-0000FH-3g; Thu, 19 Jan 2023 10:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX3H-00009z-41
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:42:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX3F-0005sP-8s
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674142924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OHSPbNDKKqNQj00N/SjZQnEElBysXJJyDLBL1yBpViw=;
 b=XCmcV3wdAeo+lsNGW2RKP2Kpfgtm5jiQoPaVu2Dkt4hrHKtS468KjuN9y+QRSTky29ebrz
 /lLtwXKvjd34zdDzn5AdrFQ7dQQhQcdmR96rOvgN4L0m2w435IvivXnR9fufDcovd5dF0R
 /X4zQXfHXbwh8tE8q7RQr5dKJzc+J9g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-yIHEiz-yNoSwnM7DgQcxrw-1; Thu, 19 Jan 2023 10:42:03 -0500
X-MC-Unique: yIHEiz-yNoSwnM7DgQcxrw-1
Received: by mail-ej1-f71.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso1884838ejb.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OHSPbNDKKqNQj00N/SjZQnEElBysXJJyDLBL1yBpViw=;
 b=ELP8KRSzxoTSUltpeM9QOm1T6S/J899Hubneg5JQHYG7SATVqEap7i876rnKq6akiP
 6i6bQm7ncXHM+EB1QuClKzwDqEwUT1M+/DOsyn1USmGlYtQrZofJQwZz91kUiTLd5wyg
 PYeThI5ezr44EnvSop/iSG5N8+xZDuD7gJ9m9GR9i1OslIWixBf9qrN9gW7yPR2UR2+T
 C3llNLHeiKNdElBYTp0FnSXUpiWd5tGxGV6e5lyv1cJE9nKT3iuv+Np6Z12BbzjHSxUv
 UUmrRSSh0Jm1Mraa8AAmLukxQ++QCtOI/Uz+x16AVXMEk0t5FYSBx0U1Rz5bcpTJrN36
 BGUw==
X-Gm-Message-State: AFqh2kp4JNIlxCpgETGIg2HdBGoEuvWVRyWab78oj0lyLoNBoiX1r2M9
 rZtjJAd78ZDs3zs4I2vBxuK4kzOiY1ORG2WOt0jSv+v7dt91anvWiGcOFqupkAf5+COrhzPshnr
 jt6iOxpYXz6tVvQ9K1XoW32kjIDwL1xb6sdhMPBv7rnGb0vYiaeb7LQUA2IzCVhnepHA=
X-Received: by 2002:a17:906:9506:b0:86b:1ccc:d434 with SMTP id
 u6-20020a170906950600b0086b1cccd434mr10982054ejx.67.1674142921426; 
 Thu, 19 Jan 2023 07:42:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuts8y2/XRkGyuzhkq/Ru9r8afHnGtTRHcS5yC7UcXJ5+Awcjf3/ieEsI4nqTar/p94rBnMHw==
X-Received: by 2002:a17:906:9506:b0:86b:1ccc:d434 with SMTP id
 u6-20020a170906950600b0086b1cccd434mr10982032ejx.67.1674142921086; 
 Thu, 19 Jan 2023 07:42:01 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ec49-20020a0564020d7100b0049e249c0e56sm4953332edb.56.2023.01.19.07.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 07:42:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PATCH 5/5] scripts/ci: bump CentOS Python to 3.8
Date: Thu, 19 Jan 2023 16:41:45 +0100
Message-Id: <20230119154145.471156-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119154145.471156-1-pbonzini@redhat.com>
References: <20230119154145.471156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

In preparation for bumping the minimum requirement for the Python
runtime in QEMU 8.0, use the Python 3.8 package in the CentOS Stream 8
build environments.  To cover all bases, the "generic" playbook sets up
alternatives so that /usr/bin/python3 points to Python 3.8, while the
custom runner uses the --python option to configure.  The latter is
probably more suitable for the task of building an RPM file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .../ci/org.centos/stream/8/build-environment.yml   |  2 +-
 scripts/ci/org.centos/stream/8/x86_64/configure    |  1 +
 scripts/ci/setup/build-environment.yml             | 14 +++++++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
index b1768d18afac..0d094d70c3b3 100644
--- a/scripts/ci/org.centos/stream/8/build-environment.yml
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -65,7 +65,7 @@
           - nmap-ncat
           - numactl-devel
           - pixman-devel
-          - python36
+          - python38
           - python3-sphinx
           - rdma-core-devel
           - redhat-rpm-config
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index 75882faa9ca5..65eacf3c56bb 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/configure
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -16,6 +16,7 @@
 # that patches adding downstream specific devices are not available.
 #
 ../configure \
+--python=/usr/bin/python3.8 \
 --prefix="/usr" \
 --libdir="/usr/lib64" \
 --datadir="/usr/share" \
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 2274f736f7de..78b1021cd420 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -191,7 +191,7 @@
           - nmap-ncat
           - numactl-devel
           - pixman-devel
-          - python36
+          - python38
           - python3-sphinx
           - rdma-core-devel
           - redhat-rpm-config
@@ -217,3 +217,15 @@
         - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
         - ansible_facts['distribution_version'] == '8'
         - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
+
+    - name: Check whether the Python runtime version is managed by alternatives
+      stat:
+        path: /etc/alternatives/python3
+      register: python3
+
+    - name: Set default Python runtime to 3.8 on EL8
+      command: alternatives --set python3 /usr/bin/python3.8
+      when:
+        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
+        - ansible_facts['distribution_version'] == '8'
+        - python3.stat.islnk and python3.stat.lnk_target != '/usr/bin/python3.8'
-- 
2.38.1


