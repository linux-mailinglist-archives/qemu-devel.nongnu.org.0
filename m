Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F73465B6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:54:24 +0100 (CET)
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkIR-0007W8-KT
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKn-0006Hg-Aq
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:48 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKW-0003ow-8A
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:44 -0400
Received: by mail-wr1-x431.google.com with SMTP id e18so21297422wrt.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6eMelu+S4QeZ4ihzo4OphSQWP1cKwxyXRVaJ5b/XIAo=;
 b=hiZJV6Od8IwXEcgge0UpLKF49eM3OS8pZ4n2ANhK8XhjtDzJUP4unR6cI69ISACEnK
 Xn5NMh9GUXOPDIZk1DlVUAjXOsTcSU6mVgV1hflc73XcFArWtu5SZN628tJFvdGQXUy2
 rr9IbFYPspQcTe8ZZYxnoL9g3S+p12dvy8g7yXBnffMkIvndoEB0JMmleRijWVJI+j95
 cm6mWwBFkOwF0gohYdiY+N4xKhKxl+tzi4/gPeRtYNcDtkmmWH5nodZnTd9QyAWBZWem
 6EkcillmRaksbXQOVfBMe+Ji3kbFN94BVaqk7xEKSOmlyp2vTEVRp3tHbTMq3HSyryh5
 6nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6eMelu+S4QeZ4ihzo4OphSQWP1cKwxyXRVaJ5b/XIAo=;
 b=QPZaV5DX/mzJ5vkZMJmZOO1h1bFkgpZk2NGJinv/SLwFi2k0Nha4yrAj/ou3gE9C0i
 ZgUxg4WrkGnYOpxAQRwUS2ZCXjqkJe8Jat19igymjyCBlAfA57l6blfdpJjqHjTwY4WM
 qavd87rfsDI1XGdkbyLh15qimjKfDBrM/zEHLlP+vXAvzSb9XXMUsIi4eZPitd6RsJvJ
 dsChBt4Zq8QvFP15DhFoqCg+s0wXWl3l3pWf5G0se2myd0fDc+CT41G/s7CpUTXrAY3N
 YY50UiBGbY8FAnuxOpE8KZIeDwYGF1q4ip+xH6nAhNy+3hfPqxIB4nyQk9wDUWsXALa0
 L7qQ==
X-Gm-Message-State: AOAM532gmiJC0QLctYyupw6D0g/3c83SzgCfyfiemBWoCYZhbee72Su+
 0y3Z6DJhkOlgP0rYI70+OJzjcGPhO4L2Xw==
X-Google-Smtp-Source: ABdhPJw+9sOvyxasfpGjOlkDfiJD+A+kX2CRgBxKl/Bfk8j18bO+rh6vleDgqEWlMbqpE6ZyYnq60w==
X-Received: by 2002:a05:6000:118c:: with SMTP id
 g12mr4674304wrx.353.1616514746693; 
 Tue, 23 Mar 2021 08:52:26 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s12sm2846389wmj.28.2021.03.23.08.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:52:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/13] blobs: Only install SPARC firmwares if sparc system
 targets are built
Date: Tue, 23 Mar 2021 16:51:30 +0100
Message-Id: <20210323155132.238193-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
---
 meson.build         | 2 ++
 pc-bios/meson.build | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index fccda30ffc7..addea8c39d7 100644
--- a/meson.build
+++ b/meson.build
@@ -100,6 +100,7 @@
 install_blobs_ppc = false
 install_blobs_riscv = false
 install_blobs_s390x = false
+install_blobs_sparc = false
 if get_option('install_blobs')
   foreach target : target_dirs
     install_edk2_blobs = install_edk2_blobs or target in edk2_targets
@@ -110,6 +111,7 @@
     install_blobs_ppc = install_blobs_ppc or (target.startswith('ppc') and target.endswith('softmmu'))
     install_blobs_riscv = install_blobs_riscv or target in ['riscv32-softmmu', 'riscv64-softmmu']
     install_blobs_s390x = install_blobs_s390x or target in ['s390x-softmmu']
+    install_blobs_sparc = install_blobs_sparc or target in ['sparc-softmmu', 'sparc64-softmmu']
   endforeach
 endif
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 27c0f316dee..89efe4359e4 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -41,8 +41,6 @@
   'vgabios-ramfb.bin',
   'vgabios-bochs-display.bin',
   'vgabios-ati.bin',
-  'openbios-sparc32',
-  'openbios-sparc64',
   'QEMU,tcx.bin',
   'QEMU,cgthree.bin',
   'pxe-e1000.rom',
@@ -126,6 +124,13 @@
   ))
 endif
 
+if install_blobs_sparc
+  blobs_ss.add(files(
+    'openbios-sparc32',
+    'openbios-sparc64',
+  ))
+endif
+
 blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-- 
2.26.2


