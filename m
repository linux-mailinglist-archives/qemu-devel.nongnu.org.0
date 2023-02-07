Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4B68D5B3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:39:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMIs-0001wu-RG; Tue, 07 Feb 2023 06:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIr-0001wi-EH
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPMIp-000401-TY
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675769903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFhhhUuHz2OCzXqJ3fmXmgINnkbajtsWVIuzmb1Ze10=;
 b=jRGuztHc5yEngoBRiBwIdJoSlz3mmQfjPt2dkKwM/O6vP0LxAQLcM6PeRDzkjb6laQM5UP
 fIMznPGfHdZCKCZYrDRS5VdOB2boaz4E7SU+rZUGCbuj4RmWvoRHKoDxqxkIKP9qggAyR2
 gNp09tny/4+cnUrPrJQcQWgHLZ0FFFE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-ol1_Ks-TP6e2ZBEfVnp6lA-1; Tue, 07 Feb 2023 06:38:22 -0500
X-MC-Unique: ol1_Ks-TP6e2ZBEfVnp6lA-1
Received: by mail-ej1-f69.google.com with SMTP id
 he34-20020a1709073da200b00887ced84328so10990570ejc.10
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IFhhhUuHz2OCzXqJ3fmXmgINnkbajtsWVIuzmb1Ze10=;
 b=oRpL/yPDO/rgJlUd5rHyOmsDXoSwh5C1rF75r5OOe4F+dkgVe5SKC6373si4QR+z67
 lFBDb6cdHF0fcAtNCGUDVnFD4W9ic1SbPdmOUQZYxOtkXPtXaXqO6mA/7r8Oj1baiopq
 FkyKM2w5YjJlfsC57y+gsoMHtDeKSoC5JxTibsHQLEqqpdq2gWBlSDD150RXtfHy5r/5
 4MgF1KdaK8TzbYPQPcC1m1dFdfEw5kwDHdtJW17Zq0HCuBbhL57T4P+z8YU7HwX+P2sC
 04GAHp2mkDYLewPYi5H4fIfKSqC6EHUsggOepO5oC0ooYJ7VsHgW3p4lQvVbpbq+nesd
 YEhQ==
X-Gm-Message-State: AO0yUKUetf9Qs4CIGz23mtkdEBe/1y7ev3vUJb7heki96AmS01uJu6yP
 WanJfRtKWaI67M6Mlte+r33i+EOu7IBqBQnPx3byPhF8KMIuVAW/QaMc4YcjAWB41HsO8hiNhvH
 vYK7ahtG3CXt7b0RzCYdKnYQtrE5u/JPksBhrqy2l5zZWlXRURsLFGHA6MBoFiM2z07QwhJff
X-Received: by 2002:a17:906:8055:b0:884:d15e:10f8 with SMTP id
 x21-20020a170906805500b00884d15e10f8mr3011726ejw.51.1675769900361; 
 Tue, 07 Feb 2023 03:38:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+ZI/8IgY8AxXCcIeyzX1aLjd0dw80KGB/qSkA4/jUtSK1PBjK+8zcCppjr/NRRocwtS7Qn5A==
X-Received: by 2002:a17:906:8055:b0:884:d15e:10f8 with SMTP id
 x21-20020a170906805500b00884d15e10f8mr3011711ejw.51.1675769900136; 
 Tue, 07 Feb 2023 03:38:20 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a50cd56000000b004aaa8e65d0esm3268039edj.84.2023.02.07.03.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 03:38:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: crosa@redhat.com
Subject: [PULL 4/5] scripts/ci: unify package lists for CentOS in
 build-environment files
Date: Tue,  7 Feb 2023 12:38:06 +0100
Message-Id: <20230207113807.67322-5-pbonzini@redhat.com>
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

scripts/ci/org.centos/stream/8/build-environment.yml has a slightly different
list of packages compared to scripts/ci/setup/build-environment.yaml.  Make
them the same.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .../org.centos/stream/8/build-environment.yml | 25 +++++++++++++++++++
 scripts/ci/setup/build-environment.yml        | 19 ++++++++++++++
 2 files changed, 44 insertions(+)

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
index 8d76404c6cf7..2274f736f7de 100644
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
@@ -167,19 +168,36 @@
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
@@ -193,6 +211,7 @@
         # Spice server not available in ppc64le
         name:
           - spice-server
+          - spice-server-devel
         state: present
       when:
         - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
-- 
2.38.1


