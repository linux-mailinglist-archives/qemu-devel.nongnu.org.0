Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5C673DCF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:45:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIX6R-000446-GC; Thu, 19 Jan 2023 10:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX6I-00043f-7H
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:45:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX6G-0006L5-KD
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674143111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zX8C+Y8fMCYubHJBZFajhe4JnvHkJyibl8fa75QOFD4=;
 b=LoMudNjk7Jf6xoesWqjLIymyXhO3IR5dg6rW2MYFEoplanAtxEaTVwwrZl0oNz1uSY1t7T
 m5EgblZpePVq7cbMEEDbfonqsgaRgtucLNGDk6MTyG81VdXaGbde9okaBWvo/Ck0av9gFn
 Sz+eP+qy/TZaHdbugMvla7HV7sdkO1A=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16-i3FrQM8dPO6Q3fdA5GvlKQ-1; Thu, 19 Jan 2023 10:42:24 -0500
X-MC-Unique: i3FrQM8dPO6Q3fdA5GvlKQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 hp2-20020a1709073e0200b0084d47e3fe82so1862365ejc.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zX8C+Y8fMCYubHJBZFajhe4JnvHkJyibl8fa75QOFD4=;
 b=hRoyQ2rm/ciEWBOZ2ADhkMQXoZRx5nr+bOqGZdPQVEDwfK/nW83xyCjhb3XA4PcGs2
 zbmNQgnh7r+ekZLK3ZvqQQHlrXpC+FunEjrfn5vmpJky3mYXA3zsgH41Q6qT1E5SW28K
 sQ+gvRnLJBIffbeU6pAGVnWudVwjKPrp2EExP3s6RLjaR+zAnm53iazQhkyh6Il1Qdiu
 3qfbRwpjxBIwwS4A58voNVa7YgDxLFuCEx1KcaDY0o2p3wP899usC+89NK5BEa2UAIY+
 mM/azaZUAgR2BNa1ibfONDtAcu/DC24BlGOPqaU6WOZtX2N32f2qX8npVL+DUDAjcuC8
 OaGA==
X-Gm-Message-State: AFqh2krbUGd8UVCNfb3knTyYWplNP2CT8Xj3DII/ooYpcLKfVY8kWsdx
 jvtVT+O3OZxRa//JQMlxYbmoiuknA7qYk/Z2YJtj5NnJp6Pz2XLDmkDYh2xKD3NodO6VVCaO3Dp
 EhrvaXv1/0ej1FR0AyidDBJvAlQaA7WsTQrooM3x28es36wYmLkxFOPkJLjadRvewMpk=
X-Received: by 2002:a17:907:3a15:b0:819:7d8f:9684 with SMTP id
 fb21-20020a1709073a1500b008197d8f9684mr21400610ejc.72.1674142915958; 
 Thu, 19 Jan 2023 07:41:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsogaggTbWOpuOxDd3opiXvatxTpJJI2tdr1ac6zL9sbJH0qd49uP2SxEYy/mUGdPYjhyvoww==
X-Received: by 2002:a17:907:3a15:b0:819:7d8f:9684 with SMTP id
 fb21-20020a1709073a1500b008197d8f9684mr21400597ejc.72.1674142915689; 
 Thu, 19 Jan 2023 07:41:55 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 sa14-20020a170906edae00b008639ddec882sm10202429ejb.56.2023.01.19.07.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 07:41:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PATCH 3/5] scripts/ci: add capstone development packages
Date: Thu, 19 Jan 2023 16:41:43 +0100
Message-Id: <20230119154145.471156-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119154145.471156-1-pbonzini@redhat.com>
References: <20230119154145.471156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Capstone is not provided anymore by QEMU as a submodule since
commit 83602083b4ad ("capstone: Remove the capstone submodule", 2022-05-18).
For the org.centos/stream/8 playbook to actually provide a usable
build environment, it needs to include the capstone-devel package.

Include it in the "basic" build packages as well so that the resulting
QEMU has full disassembling functionality.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/ci/org.centos/stream/8/build-environment.yml |  9 +++++++++
 scripts/ci/setup/build-environment.yml               | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
index fe8807b7b074..95474ad034dc 100644
--- a/scripts/ci/org.centos/stream/8/build-environment.yml
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -10,6 +10,14 @@
       check_mode: yes
       register: centos_stream_8
 
+    - name: Enable EPEL repo on CentOS Stream 8
+      dnf:
+        name:
+          - epel-release
+        state: present
+      when:
+        - centos_stream_8
+
     - name: Enable PowerTools repo on CentOS Stream 8
       ini_file:
         path: /etc/yum.repos.d/CentOS-Stream-PowerTools.repo
@@ -22,6 +30,7 @@
     - name: Install basic packages to build QEMU on CentOS Stream 8
       dnf:
         name:
+          - capstone-devel
           - device-mapper-multipath-devel
           - glusterfs-api-devel
           - gnutls-devel
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index ad63bbb3ccf7..2e5f3b06028a 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -46,6 +46,7 @@
           - libbrlapi-dev
           - libbz2-dev
           - libcacard-dev
+          - libcapstone-dev
           - libcap-ng-dev
           - libcurl4-gnutls-dev
           - libdrm-dev
@@ -130,6 +131,15 @@
         - ansible_facts['distribution_version'] == '20.04'
         - ansible_facts['architecture'] == 'aarch64'
 
+    - name: Enable EPEL repo on EL8
+      dnf:
+        name:
+          - epel-release
+        state: present
+      when:
+        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
+        - ansible_facts['distribution_major_version'] == '8'
+
     - name: Enable PowerTools repo on CentOS 8
       ini_file:
         path: /etc/yum.repos.d/CentOS-Stream-PowerTools.repo
@@ -148,6 +158,7 @@
         name:
           - bzip2
           - bzip2-devel
+          - capstone-devel
           - dbus-daemon
           - diffutils
           - gcc
-- 
2.38.1


