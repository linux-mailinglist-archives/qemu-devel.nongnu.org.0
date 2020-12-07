Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238BE2D11D9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:26:46 +0100 (CET)
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGXN-0001Zz-3r
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMi-0004EY-SQ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMY-00017O-Kn
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607346926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrpyM62Xrmp0dmj6zHS9IbusrVswsePAgvUQq8W1ha4=;
 b=iYVyhUlO7Zg+2vqUm7Wcdm4bsG18bLtBV4hSs+wqhvKK6vb9+sutl90vA4N8eMqEZi4iUC
 NsK9NTsM+q9TxAnVPZ3XS3syAmz13qNdVHLg4ikUy4q5IUeFiO3w2zJPiE5IP2iHbJfE+x
 QiF4zHRa+QkUI/H9qRAfFzIvfzaeRCc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-B1GZVFp6NgWNWCtVpgcIgw-1; Mon, 07 Dec 2020 08:15:24 -0500
X-MC-Unique: B1GZVFp6NgWNWCtVpgcIgw-1
Received: by mail-wm1-f72.google.com with SMTP id b184so4134011wmh.6
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 05:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LrpyM62Xrmp0dmj6zHS9IbusrVswsePAgvUQq8W1ha4=;
 b=hZ0KcOJzSMKe2IsEP8Me4H//Kk6HhKQ3EZHT4o2W/AHPm/jZdvBRIq1VCVRcoa/6xg
 JUla2dby8eJEgyVFvbH83YOA1x1N7iAUzLyVn+xmcZIgiKtVifGSvuRi09KqBUXROOsE
 80287Gp0YVpyUi9LPkaY6XIsCDusueQr5VUmDEVSbv8mS9lSEoARTU0mZ60wgt03pHsv
 e7IOCcofmhT/+FqqNrJ7sh9gzrfa+Lw65U5QG1QYA2keOlEEFkyrZpKj6sVNIo5jozR1
 7ynSwC3zRp67gi/kYYJv6T2wRnLfkKs5MBUhsAf9adaU2w7p2WUTJbOlOc9gCNv6DESt
 POJQ==
X-Gm-Message-State: AOAM532MZHq5+W4jsnGu4DI7iW/hW+NBam2yOgA4FBmWejr4/Y4awMoc
 jKeRuRmXI8m8CD1myHEblnJTz14CLwwG0ezAg/xLc/APyuQuOlEIU0JJ2Jl+2L8lHFLkn+K7pLX
 tvg10DvZvKzCJ2d3bfJZRx/nyDCc3000YyruhxVz4w34rBylY+wI5NOwmrC+cFfoL
X-Received: by 2002:adf:eec6:: with SMTP id a6mr7411054wrp.239.1607346923109; 
 Mon, 07 Dec 2020 05:15:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrSsP/k6tbNGXTd5ADaSfYhwBX1LosPwHROoqvLj3ywUi8jkYDiFzi1eqHTc0kTww1719V1w==
X-Received: by 2002:adf:eec6:: with SMTP id a6mr7411023wrp.239.1607346922931; 
 Mon, 07 Dec 2020 05:15:22 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b3sm14942829wrp.57.2020.12.07.05.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] gitlab-ci: Introduce 'cross_accel_build_job' template
Date: Mon,  7 Dec 2020 14:15:01 +0100
Message-Id: <20201207131503.3858889-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207131503.3858889-1-philmd@redhat.com>
References: <20201207131503.3858889-1-philmd@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a job template to cross-build accelerator specific
jobs (enable a specific accelerator, disabling the others).

The specific accelerator is selected by the $ACCEL environment
variable (default to KVM).

Extra options such disabling other accelerators are passed
via the $ACCEL_CONFIGURE_OPTS environment variable.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 099949aaef3..b59516301f4 100644
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
+        --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
+    - make -j$(expr $(nproc) + 1) all check-build
+
 .cross_user_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-- 
2.26.2


