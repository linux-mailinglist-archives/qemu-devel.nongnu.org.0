Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A4411740
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:38:03 +0200 (CEST)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKQk-0004Zk-7W
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9g-0002qu-78
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:26 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9J-0000s1-L9
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:23 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q11so30194524wrr.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wc0ECxBzbwUEOvnZ9RUboFNc1cH29L5lMcEOEbYkPvI=;
 b=PjP2cwP8r3EKYr8aOsDKR/lxvUJbKqUORzJQG1R7nmZ0ujmS8ZHWRaaO4eH+p5AkS1
 3bwgBsGRq4U9NJXDo17okDQt8hKQz5NtFjgXiMt4BUeGJz8wvbGdrlFCJhEcY25mJiOg
 a5bCLl+OWgZfrYIg0vRdObRUHnQYsl0zZsNsdls1Xhj9k2EruoEkedpNQzAkvGWy9q34
 f5sK3JYzWDOOqFgBC4RKF50HBeZmmWi9imio40nN/MHTq9SDwu/uZ5GcNWa+muPzCXcz
 nSX11c1bfcFYxJu5NCxBHoh2yjqLLgCAKx1hOAVS3Bi1SV7chpoXiW+nH7Vt+rd5aVlN
 UMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wc0ECxBzbwUEOvnZ9RUboFNc1cH29L5lMcEOEbYkPvI=;
 b=c2illcMnkyVh4Sopjva1fW/Bbvuo7tS03OCAFWvP4TEugbiHC3uYFRmhE+1TQdW/5h
 imXq0Ht26CWKh2oxDkLklCKxOqHTwlNr4TLO+9IM5fzGACxBrvcuSYPB7lV6JFpvNrCE
 lsIKgfuIhtwdIXyzMIK+pOFPEmFUGUW7aOA+PGNbtacmaFs9mfsIDQG8VRBIl2OR6yas
 JNGdGdGNxj/tqwBPi1SRnyA6U3qEfPJ3dlx+I0+r8Sy4XJvBi9i365GXTCeRrNQHXoQm
 SHJcONSCWF6AZYWFVlyW0DzWLHgwNykEJNF1iIWYPHUlTxLYG5W0OgpWEjWFIhlKY6SY
 1uhA==
X-Gm-Message-State: AOAM533WZYVBeDcnrmtikFhsJcjlLDEGeqjL9boHlCdmh+a6rfSxnrD9
 p+mLdWFCHXR61yECPACg2S8SrQD4t1djBQ==
X-Google-Smtp-Source: ABdhPJyfUG8tDd1DmSpFU8GyssF35S8GrUvvJ+yL1Spr7NHTDg3UNsCJZDS7xwrxVG+/GKzHE6LrQQ==
X-Received: by 2002:a05:6000:1a89:: with SMTP id
 f9mr8090668wry.19.1632147600406; 
 Mon, 20 Sep 2021 07:20:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/27] arm: Add Hypervisor.framework build target
Date: Mon, 20 Sep 2021 15:19:34 +0100
Message-Id: <20210920141947.5537-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

Now that we have all logic in place that we need to handle Hypervisor.framework
on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
can build it.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com> (x86 only)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210916155404.86958-9-agraf@csgraf.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 meson.build                | 7 +++++++
 target/arm/hvf/meson.build | 3 +++
 target/arm/meson.build     | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 target/arm/hvf/meson.build

diff --git a/meson.build b/meson.build
index baa28d7d62e..15ef4d3c418 100644
--- a/meson.build
+++ b/meson.build
@@ -77,6 +77,13 @@ else
 endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
+
+if cpu in ['aarch64']
+  accelerator_targets += {
+    'CONFIG_HVF': ['aarch64-softmmu']
+  }
+endif
+
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
   # i386 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
diff --git a/target/arm/hvf/meson.build b/target/arm/hvf/meson.build
new file mode 100644
index 00000000000..855e6cce5ab
--- /dev/null
+++ b/target/arm/hvf/meson.build
@@ -0,0 +1,3 @@
+arm_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
+  'hvf.c',
+))
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 25a02bf2769..50f152214af 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -60,5 +60,7 @@ arm_softmmu_ss.add(files(
   'psci.c',
 ))
 
+subdir('hvf')
+
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
-- 
2.20.1


