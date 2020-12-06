Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF2F2D06D5
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 20:07:34 +0100 (CET)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klzNd-0004G9-EW
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 14:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzCF-0004mM-Tv
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1klzCE-0001zH-0G
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607280945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICTgDX+4v4WDebhKXLX3qGQtibzA3mRvScrd6C7n6Ec=;
 b=aRApqZ4PbsbUtaZMEJs3B1XVmD/Ebgu2jnyneijYMZ4hMVCKlArNDBR80AO+1dVGh7VBH/
 09YDmKab6pg4m8tC3hBnDGm2kIwzHg88fdeMTrjEqJJr6NSmz2yECvWgMLgJ2bIKjq8Th2
 5GOZCzm3Ex9WAj7lgc6+6F5ZVoSH67U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-s9UuBBtnMRC9zfrP5-zCig-1; Sun, 06 Dec 2020 13:55:41 -0500
X-MC-Unique: s9UuBBtnMRC9zfrP5-zCig-1
Received: by mail-wm1-f71.google.com with SMTP id a205so3197986wme.9
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 10:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ICTgDX+4v4WDebhKXLX3qGQtibzA3mRvScrd6C7n6Ec=;
 b=YvCJbjeK2mGkrVe01TdxJes6AJb5C+k15S+XX98p48fuBnvfOk5s3GHdn420kE3/Mx
 yAK48VWQ3b6LiBcDa4k5ygqNEotxtaiO45B+y/ulLhmhYBNRKyrC3dJfBoUs9XiGziQM
 lyYJiL/f/0/jv19H/kUeXWKmO2iNDq4TNTOvPueLVI1RhDgd63lXDAs40SpimGlA8Tti
 M+YogPFkNy3E0x/blDvzXQpNEuvueAWvVxR9JX621I1n6+mihfNO9IMCNI4YdH0NQmp7
 vrnog4q0mzyetQReVTE4Nac7OCSFxvDc+ng2r11J10dLXRDUvnaebFOFNBMrN3JrieYi
 Q/vQ==
X-Gm-Message-State: AOAM530XDK4JD3qn4RQwqDXzGPI52AkXNOZYb1jZAeK3+74RnlypJuUk
 yc2GiS1gxNzcQ3ZKXEAqASUvBi+NivZnlKbZX85vDFb7QrPRN9MuJrx1iOq0/mOb7zqUc0kx7NI
 yOLQ0rJmPs3CHdPUlld5Hk/JMbA70HtEhWmx7H033hwFGMBvYB3Uw0TM3/fZvdMie
X-Received: by 2002:a1c:9d8b:: with SMTP id
 g133mr14902042wme.189.1607280940175; 
 Sun, 06 Dec 2020 10:55:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS0gmyZIlDu9x3zdPI4XoBOwxS0bhZqQbF0DZUVSQQ25mAYsGy/bDy2iLLg12EuoAvmHTkDA==
X-Received: by 2002:a1c:9d8b:: with SMTP id
 g133mr14902001wme.189.1607280939914; 
 Sun, 06 Dec 2020 10:55:39 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l1sm5951733wrq.64.2020.12.06.10.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 10:55:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
Date: Sun,  6 Dec 2020 19:55:05 +0100
Message-Id: <20201206185508.3545711-6-philmd@redhat.com>
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

Cross-build s390x target with only KVM accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
 .gitlab-ci.yml                         | 1 +
 MAINTAINERS                            | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
new file mode 100644
index 00000000000..1731af62056
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
@@ -0,0 +1,6 @@
+cross-s390x-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-s390x-cross
+    TARGETS: s390x-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 573afceb3c7..a69619d7319 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -14,6 +14,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 40271eba592..d41401f6683 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -417,6 +417,7 @@ F: hw/intc/s390_flic.c
 F: hw/intc/s390_flic_kvm.c
 F: include/hw/s390x/s390_flic.h
 F: gdb-xml/s390*.xml
+F: .gitlab-ci.d/crossbuilds-kvm-s390x.yml
 T: git https://github.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
-- 
2.26.2


