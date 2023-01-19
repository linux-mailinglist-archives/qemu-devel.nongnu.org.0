Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB8673DC1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIX3H-00008Z-3K; Thu, 19 Jan 2023 10:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX3F-00007t-6e
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:42:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pIX3D-0005sA-JX
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674142922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWLsKl8EL36g2e2+PVv2QmUwvNRnbldG5EGD5LEWexY=;
 b=Nzb+ykJXzdVBFbflbq9PytB234IwtPjvGqs8epcGRHkaYa3sN/0DvoZq6tDqQboXS/Z/3l
 LEw1Bh842XNQRFWhT/dYCloJYRC7z2U+wHbzeS5WR8Ze6IoNtII4ZkwRuKI7RqChX0qStp
 b14PGQTlyD9g0yRi1H3K9mQJ2R76+qU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-wm1mnpYIMzyymFh-jirCWQ-1; Thu, 19 Jan 2023 10:42:00 -0500
X-MC-Unique: wm1mnpYIMzyymFh-jirCWQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 qw29-20020a1709066a1d00b008725a1034caso1882021ejc.22
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWLsKl8EL36g2e2+PVv2QmUwvNRnbldG5EGD5LEWexY=;
 b=555H/Fr/PmOFkxRleB1hf4jHplpENBaq0ej1jktBdF2lKLhhEDnlsM1DF5iqyTZVJJ
 Pt30GDJukG4m2J42NKmtu6hmFZnB40NE4aBSFdRveWF3jaMbJk0c4r67Rka34fH8VnVK
 CZ1C6Y+pbyb/adfIUZKPmZ2+DHT4/uvNTo2MpURaTf+4jwN3E8H+rB6GH3ozfITcb4zy
 c654FBKAdHoqooYReIHoUCK5pbRWUi8OGaWkGOasnhngWOCDTBf0feJeGIjJqKTyqEkx
 p4/do2GVSHUmp4vulWveiVc9W1w/jk+AWEyMOmCQIOg1aekOjZy8ozssOP6JzfGRBTTh
 K73Q==
X-Gm-Message-State: AFqh2krRpjUty7OgI+OmaGiVCP0sZK2HZxPl816oW6dk63V4crBZB5YL
 pEJoz+eGJSaztlK34xFPc/+WHBCxWWnySFLdYD4GnNaiBXrH3kEdI+JZaP4SHk2s30P2nU1R14E
 2sLQFT3XQ9T6fRvmdJmhPx77taQksPUuLehLSVORtvFhinDEFCW8iVlcZVx4et17ACHM=
X-Received: by 2002:a05:6402:380b:b0:499:e665:8683 with SMTP id
 es11-20020a056402380b00b00499e6658683mr13319448edb.2.1674142918751; 
 Thu, 19 Jan 2023 07:41:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXueoK1ApADNa3aSqzYwXQw3OKsLEtEclqzCHqzhsjRmW28gmGTKQJ/VUnJCuHhuOh9on8eLTw==
X-Received: by 2002:a05:6402:380b:b0:499:e665:8683 with SMTP id
 es11-20020a056402380b00b00499e6658683mr13319421edb.2.1674142918367; 
 Thu, 19 Jan 2023 07:41:58 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a170906495100b0086dd8f20a6asm7290227ejt.77.2023.01.19.07.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 07:41:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PATCH 4/5] scripts/ci: unify package lists for CentOS in
 build-environment files
Date: Thu, 19 Jan 2023 16:41:44 +0100
Message-Id: <20230119154145.471156-5-pbonzini@redhat.com>
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

scripts/ci/org.centos/stream/8/build-environment.yml has a slightly different
list of packages compared to scripts/ci/setup/build-environment.yaml.  Make
them the same for simplicity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .../org.centos/stream/8/build-environment.yml | 25 +++++++++++++++++++
 scripts/ci/setup/build-environment.yml        | 20 ++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
index 95474ad034dc..b1768d18afac 100644
--- a/scripts/ci/org.centos/stream/8/build-environment.yml
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -30,13 +30,26 @@
     - name: Install basic packages to build QEMU on CentOS Stream 8
       dnf:
         name:
+          - bzip2
+          - bzip2-devel
           - capstone-devel
+          - dbus-daemon
           - device-mapper-multipath-devel
+          - diffutils
+          - gcc
+          - gcc-c++
+          - genisoimage
+          - gettext
+          - git
+          - glib2-devel
           - glusterfs-api-devel
           - gnutls-devel
+          - libaio-devel
           - libcap-ng-devel
           - libcurl-devel
+          - libepoxy-devel
           - libfdt-devel
+          - libgcrypt-devel
           - libiscsi-devel
           - libpmem-devel
           - librados-devel
@@ -44,13 +57,25 @@
           - libseccomp-devel
           - libssh-devel
           - libxkbcommon-devel
+          - lzo-devel
+          - make
+          - mesa-libEGL-devel
+          - nettle-devel
           - ninja-build
+          - nmap-ncat
           - numactl-devel
+          - pixman-devel
+          - python36
           - python3-sphinx
+          - rdma-core-devel
           - redhat-rpm-config
           - snappy-devel
+          - spice-glib-devel
           - spice-server-devel
           - systemd-devel
+          - systemtap-sdt-devel
+          - tar
+          - zlib-devel
         state: present
       when:
         - centos_stream_8
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 2e5f3b06028a..2274f736f7de 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -160,6 +160,7 @@
           - bzip2-devel
           - capstone-devel
           - dbus-daemon
+          - device-mapper-multipath-devel
           - diffutils
           - gcc
           - gcc-c++
@@ -167,20 +168,36 @@
           - gettext
           - git
           - glib2-devel
+          - glusterfs-api-devel
+          - gnutls-devel
           - libaio-devel
+          - libcap-ng-devel
+          - libcurl-devel
           - libepoxy-devel
+          - libfdt-devel
           - libgcrypt-devel
+          - libiscsi-devel
+          - libpmem-devel
+          - librados-devel
+          - librbd-devel
+          - libseccomp-devel
+          - libssh-devel
+          - libxkbcommon-devel
           - lzo-devel
           - make
           - mesa-libEGL-devel
           - nettle-devel
           - ninja-build
           - nmap-ncat
-          - perl-Test-Harness
+          - numactl-devel
           - pixman-devel
           - python36
+          - python3-sphinx
           - rdma-core-devel
+          - redhat-rpm-config
+          - snappy-devel
           - spice-glib-devel
+          - systemd-devel
           - systemtap-sdt-devel
           - tar
           - zlib-devel
@@ -194,6 +211,7 @@
         # Spice server not available in ppc64le
         name:
           - spice-server
+          - spice-server-devel
         state: present
       when:
         - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
-- 
2.38.1


