Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E8B2D0FEB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:00:42 +0100 (CET)
Received: from localhost ([::1]:43796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFC4-0006Ws-Q9
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEdU-0004NQ-QO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:24:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEd0-0004bJ-7w
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607340256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g8YbOmB7dREvSr94Ah+ZfiHf5NH/XpXwyjPJvESlyyU=;
 b=Ys9lvdx6okvnYPvX2CLGyGO4uqbxWwdcKZ5cmIBPcmU+TCiblaFT65V/FGHBnInSAVSWqC
 I1DNMjyqf6Yu8kQd4Aulr+Uzn01B6pJ3DxoKw5cubBkfc1DK3iAKZP2Xr/rbzRFfVFAONJ
 Mah/fXjxdTo8VYfCT88i5AokEvo2Hb4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-YR5RoMzxM1Gf3PMMvfpMNg-1; Mon, 07 Dec 2020 06:24:15 -0500
X-MC-Unique: YR5RoMzxM1Gf3PMMvfpMNg-1
Received: by mail-wm1-f72.google.com with SMTP id k128so5201944wme.7
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8YbOmB7dREvSr94Ah+ZfiHf5NH/XpXwyjPJvESlyyU=;
 b=YcWw2lH2rRTjQ7IhWES+QWuc86Npy9u5ijzaCFRfIpk9RVbBFn+EZJgof6z9ki6wqH
 1o8Nlo2bybxuYSdrF/ONGOJQEhWD8xVxrTkgS7/ttaNitY2OVVFZXncRE+pMMfEipaDM
 fcYo3hBi9i2kugUgKQqZ2A+z+0jf+VvvoevkFXdu62p8vSU161l9VgtdNlKIEEP0/THM
 7GrngRUsGfsDbOGDPLeEiVUY/jVE8VsyZTjC2MPbrHrQNgRZ1XgIa0XytkRjLwumG2ip
 KkDCNkdHyQ8nMlT3sfx7b4Psoro9usoaCpfz+RVQMWIjdtG6kuXe88wzrmJeiNyEXZB7
 pPWg==
X-Gm-Message-State: AOAM532SNs2uw35VqhJm+HU8wYQha3hLUAgZFud3knC8e+m0zqK9/rif
 hlIeyli8F1QdvAqVP/hQ1l0pi9+ft5o7Dabla0feJ/EHNSpKxkHeBRunrgH8YGKZq29XVqFg3wo
 2zn4Ct0JcS5Q/nFtG0iwjfw4McniglhghJd1ms1C/p93ycMEhyd918UEQpdG8F0D1
X-Received: by 2002:a5d:6805:: with SMTP id w5mr19619074wru.266.1607340253514; 
 Mon, 07 Dec 2020 03:24:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRhB+8o3YIMMi0wDgCqDhu5Xr6LYssbvv4B7yWBshnzqnJb7A4bMr+1Oelyf2ZqMu7nwNEpg==
X-Received: by 2002:a5d:6805:: with SMTP id w5mr19619019wru.266.1607340253057; 
 Mon, 07 Dec 2020 03:24:13 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h15sm9685217wru.4.2020.12.07.03.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:24:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] gitlab-ci: Introduce 'cross_accel_build_job' template
Date: Mon,  7 Dec 2020 12:23:51 +0100
Message-Id: <20201207112353.3814480-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207112353.3814480-1-philmd@redhat.com>
References: <20201207112353.3814480-1-philmd@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a job template to cross-build accelerator specific
jobs (enable a specific accelerator, disabling the others).

The specific accelerator is selected by the $ACCEL environment
variable (default to KVM).

Extra options such disabling other accelerators are passed
via the $ACCEL_CONFIGURE_OPTS environment variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 099949aaef3..d8685ade376 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -13,6 +13,23 @@
           xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
+# Job to cross-build specific accelerators.
+#
+# Set the $ACCEL variable to select the specific accelerator (default to
+# KVM), and set extra options (such disabling other accelerators) via the
+# $ACCEL_CONFIGURE_OPTS variable.
+.cross_accel_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  timeout: 30m
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
+        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
+    - make -j$(expr $(nproc) + 1) all check-build
+
 .cross_user_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-- 
2.26.2


