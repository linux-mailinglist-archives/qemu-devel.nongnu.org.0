Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012F2D06D6
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 20:11:56 +0100 (CET)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klzRr-00074D-3o
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 14:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzCY-00056S-Kb
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:56:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzCU-00024K-Bf
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607280960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJv54j6i8iOuNb5cgwW4vcH7LWLUemKzrpTz+i6TyMo=;
 b=E0wDumpJpYwRYrAFMVG+aZdyRm+REZXv9B20r+UfR/2RpfxwHd8J7hJI23d87ydV6X26//
 Orqcz0v2TAvdEAziRbq7t0lgZXU9wDayWOqCJVklVz2bGtFfg2b78Hqvp7ZiciUjgAjsrq
 J2X06dhP3a64hdhIquou5u8vmSoJwK4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-FsVqYXnYNPGLI_sAjt_yXQ-1; Sun, 06 Dec 2020 13:55:58 -0500
X-MC-Unique: FsVqYXnYNPGLI_sAjt_yXQ-1
Received: by mail-wm1-f71.google.com with SMTP id z12so4305645wmf.9
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 10:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJv54j6i8iOuNb5cgwW4vcH7LWLUemKzrpTz+i6TyMo=;
 b=BCSKR2Tp5yE0qRR0fQr12dORg/fEvSM5Ci3DJCaAkj279ECqF8cfn8S7CJ3jelvtNC
 sNSCBp+Maep7146wHaS49O20vSDF8DtjJ8nkNPqGhsJsnYHViMDP8CyFy1wo/OLH4J9B
 A6ePuOHoQBwG96NecjI9k9SS6id2uSqpHVJ8PgRw4RUJqfP5MY7HBYkocBrv7SthiVnx
 5mtTwGqceKl6H8A2UxVSFYwd46ODNUDNbQM1PDJoYPwkp5gfBT+t2nz4aqiOT+VdDWoA
 UV1aX8eubFcp0JqeMhityZ8r+xwSN2uvMvO+GxRdU+k2zPZ2sXmNflJZFkJDxNwgvYuu
 BiAg==
X-Gm-Message-State: AOAM5335bN5qj66UkxPuNb3D9W2Wx5G5Jo4it4WQQWuPYsBEyVLXgg5b
 tp0e2A8sVE3HEeEcF7GfFwjC5YZK1anO1jBTMZOzlHNj/NcYB7LL6MJzuXoH6NhUbcmYv7WEb+0
 bJmQ/7JhJGNdsmJ0TRkHdXcmZMlNOiovwv26ZolTbsUgsDqBZuHEDW1HO93zlcma9
X-Received: by 2002:a5d:540f:: with SMTP id g15mr7837234wrv.397.1607280957390; 
 Sun, 06 Dec 2020 10:55:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaQWa5KUxTpGy2U2kfc8S05U9x2ntHy5AYmvHAQPO8HICDiiXk9/Erff4S29pCdX8ZlczzjA==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr7837200wrv.397.1607280957219; 
 Sun, 06 Dec 2020 10:55:57 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f199sm10894749wme.15.2020.12.06.10.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] gitlab-ci: Add Xen cross-build jobs
Date: Sun,  6 Dec 2020 19:55:08 +0100
Message-Id: <20201206185508.3545711-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206185508.3545711-1-philmd@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Thomas Huth <thuth@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cross-build ARM and X86 targets with only Xen accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds-xen.yml | 14 ++++++++++++++
 .gitlab-ci.yml                   |  1 +
 MAINTAINERS                      |  1 +
 3 files changed, 16 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-xen.yml

diff --git a/.gitlab-ci.d/crossbuilds-xen.yml b/.gitlab-ci.d/crossbuilds-xen.yml
new file mode 100644
index 00000000000..9c4def4feeb
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-xen.yml
@@ -0,0 +1,14 @@
+cross-amd64-xen:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-amd64-cross
+    ACCEL: xen
+    TARGETS: i386-softmmu,x86_64-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+
+cross-arm64-xen:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-arm64-cross
+    ACCEL: xen
+    TARGETS: aarch64-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5f607fc7b48..9765c2199f7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -17,6 +17,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-ppc.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-mips.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-xen.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f26626a512..1581e120629 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -488,6 +488,7 @@ F: include/hw/xen/
 F: include/sysemu/xen.h
 F: include/sysemu/xen-mapcache.h
 F: stubs/xen-hw-stub.c
+F: .gitlab-ci.d/crossbuilds-xen.yml
 
 Guest CPU Cores (HAXM)
 ---------------------
-- 
2.26.2


