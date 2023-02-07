Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536F68D5B4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:40:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMIv-0001xO-Vl; Tue, 07 Feb 2023 06:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIt-0001xA-DY
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIr-00041c-Uq
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675769905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=II189Xqfh2KwOI8i867CY98ugqcT+WoinR52GUJAUtE=;
 b=OABzOTqi5qFAfpQMhGEAs7XVfajH+5anXfgK84dhjjvo3+X22dZYk0QiyQOXWI9QKcRm1W
 0/mUAgUMZmto23qZp2/Z9l1Mb+eaOPdDnTbBZQcE7IKUbk/R+lzgwr+lU4IAGBxz5rPemr
 cmhnwPfDI3KEKkVxhfkmShXQQ5JNbTA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-yX77ZZFbMLumZjBozijgyg-1; Tue, 07 Feb 2023 06:38:24 -0500
X-MC-Unique: yX77ZZFbMLumZjBozijgyg-1
Received: by mail-ej1-f69.google.com with SMTP id
 21-20020a170906225500b0088b953a6df6so11034596ejr.20
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=II189Xqfh2KwOI8i867CY98ugqcT+WoinR52GUJAUtE=;
 b=U1MdLSIw4VLj00jbbOJJpMjR+thU9ywyaeg7aM4mDdihh/FRdWOHgX4LbaBGgTr8t/
 J8YwInGvr+yueOk1n4LLcHCZi54KwPfeyNZU+Xf7j5UuW5P1kRC98b96vVJ1Qn2AxYnS
 zN4URc6a+OHKZWVJ4yopokoG7g12DII7tDASfEuQZoFmDon3d1Hfn0taT9agaMYgsCMc
 /vxihtGKAW8enFMIb2Hy2jNAJ9n6l/WLjjgTAsb1Y5MydqWBPcOCXcO6GKaB8BaqRQl7
 IEGN7GL/j7APcDZYh+iVBGGym2i46XJ9ZAEd5WkzssHW7lStwLV6MnimJBC0MEdM0dq+
 4WRw==
X-Gm-Message-State: AO0yUKUBU7tR6wMSVaPyhRD/MQJxse+9VqkFnG0U5ZtTbez47bfDdJzG
 rkdJOwCVVYWlPiT9eBolo+W5nYAWCyTL+dpyIS76GOMtgRhzbJEDNsZ9SZ1NRhoVZPK6Mh7/hK+
 PRm4ZpQx74Ybb5X5yCw5FNUXVGKQSM1q8aIWGpA6+WnMZFl6yeBe0apPsFrk4X8Xkkfno/8I5
X-Received: by 2002:a17:906:9b8b:b0:895:58be:96b with SMTP id
 dd11-20020a1709069b8b00b0089558be096bmr4236480ejc.3.1675769902793; 
 Tue, 07 Feb 2023 03:38:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+gR1RjpXQFvLvL2lTfXdlVEWGmBwS3Wv1/nUwXrRIBazIWaaC3P8XvgehBgBZkFecOBPsoLA==
X-Received: by 2002:a17:906:9b8b:b0:895:58be:96b with SMTP id
 dd11-20020a1709069b8b00b0089558be096bmr4236461ejc.3.1675769902584; 
 Tue, 07 Feb 2023 03:38:22 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 qp22-20020a170907207600b0087862f45a29sm6860299ejb.174.2023.02.07.03.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 03:38:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PULL 5/5] scripts/ci: bump CentOS Python to 3.8
Date: Tue,  7 Feb 2023 12:38:07 +0100
Message-Id: <20230207113807.67322-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230207113807.67322-1-pbonzini@redhat.com>
References: <20230207113807.67322-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


