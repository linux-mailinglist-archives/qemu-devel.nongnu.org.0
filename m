Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EDF2D06D4
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 20:06:49 +0100 (CET)
Received: from localhost ([::1]:39562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klzMu-0003jf-Uq
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 14:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzCR-000560-Uc
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:56:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzCQ-00023K-5h
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607280955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1vxVlVvkT3sP8apHjKZ3bpOmMfnVbEari6EJ9mVBVw=;
 b=C0o3h9AKYsREy3BIwJrwDIb1WUj9F5x1R+Gx2Fh4K1TFZuK3EGNxj8nv5i2ndR3ilY56wC
 mf3Omv44bpVce6O3R65ZiG4lb7JYVlNppbShxWloyDHoXz6MhOuV4MUDe6BooDdFCVamUN
 AB3gyXazN1dmVG0j5vFqGc6WhMe2rrg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-XBTYI3RHOziSlWfANt4GfQ-1; Sun, 06 Dec 2020 13:55:54 -0500
X-MC-Unique: XBTYI3RHOziSlWfANt4GfQ-1
Received: by mail-wm1-f71.google.com with SMTP id k23so4347454wmj.1
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 10:55:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i1vxVlVvkT3sP8apHjKZ3bpOmMfnVbEari6EJ9mVBVw=;
 b=H79Xp9NuZyd+VA46uAFGE3MyCsHylvuM/CvqSpGw1AfgMzQai6/M8lbHAa/z7ecsfu
 v6wojlXI0R5Y+m/MfkiK8qQdNlfhPhyLfRZoecd5NI/jHPbZk7cpAx1yg0bWNCN4AooT
 PmVZgeh7k5+ZJD3X7bNxBU7yWD7yL9iQzvPfcRp4WWCnVmrXldlhjLQRgGpO6+TkiZIm
 CCSqefz2mUTjb145qkvASwx2LlCX6IGzxAp/x3VdpCW7/N1LmTHWlvlF7J8mJfFkW2sQ
 GpPrEU6yPIkbwlhRbwqrCwzcRMn+57WWutbsTdLd10/ulnsO+Zi2O/yuPX4UT5ZicVRg
 grZw==
X-Gm-Message-State: AOAM532cx294YR89HL2DXnRG6JishXJTU8K0vdAAriZOWU8XhFkldtCZ
 skoYcl5nTLSL1vJ10mdHhtmT0PSjvlrdU33HwAYLuSVPFHhaTmQIOR2WP0ODT8Ko4fkwKPOxdly
 t00dH9IwP+cH/jPvJMzq/Xafv53/nYhrd+Z4tFD0k13u2+7rN1b6APxtFRg2Sp7Zh
X-Received: by 2002:adf:9b9b:: with SMTP id d27mr13324098wrc.125.1607280951524; 
 Sun, 06 Dec 2020 10:55:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjk3rMrzMdcRMBa9qbGydj+XoVJdnBoRtt4fTfXKTXx014IQZfLKKyL1tpFnUZLU9IFuOQ5Q==
X-Received: by 2002:adf:9b9b:: with SMTP id d27mr13324062wrc.125.1607280951287; 
 Sun, 06 Dec 2020 10:55:51 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v20sm10922213wml.34.2020.12.06.10.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] gitlab-ci: Add KVM MIPS cross-build jobs
Date: Sun,  6 Dec 2020 19:55:07 +0100
Message-Id: <20201206185508.3545711-8-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Cross-build mips target with KVM and TCG accelerators enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
later we'll build KVM-only.
---
 .gitlab-ci.d/crossbuilds-kvm-mips.yml | 5 +++++
 .gitlab-ci.yml                        | 1 +
 MAINTAINERS                           | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-mips.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-mips.yml b/.gitlab-ci.d/crossbuilds-kvm-mips.yml
new file mode 100644
index 00000000000..81eeeb315bb
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-mips.yml
@@ -0,0 +1,5 @@
+cross-mips64el-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-mips64el-cross
+    TARGETS: mips64el-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 024624908e8..5f607fc7b48 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -16,6 +16,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-ppc.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-mips.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index c7766782174..5f26626a512 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -392,6 +392,7 @@ MIPS KVM CPUs
 M: Huacai Chen <chenhc@lemote.com>
 S: Odd Fixes
 F: target/mips/kvm.c
+F: .gitlab-ci.d/crossbuilds-kvm-mips.yml
 
 PPC KVM CPUs
 M: David Gibson <david@gibson.dropbear.id.au>
-- 
2.26.2


