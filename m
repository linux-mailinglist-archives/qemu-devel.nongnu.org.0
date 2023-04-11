Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5576DE208
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHWR-00044t-Vf; Tue, 11 Apr 2023 13:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHW3-0003t1-9K
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:47 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVz-00066J-FS
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:47 -0400
Received: by mail-io1-xd32.google.com with SMTP id e22so173107ioc.13
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l99iuyDis+ctVd+0faqWp4cAF+qdh6VL+GNIiYIncI0=;
 b=4tELa2fu61Y/ao/QkTH/9hmr5PPeeGVaHX5NAx9FPn6jYU2v7H6wgRRVXRwKOjuSOo
 eUD8sLBcK0DJqrYVyT2Tg4rWiKi4hm0JmIfNvldnak0X99VlTpFAPnnh02X0plMjuaRd
 zT/fMMyrUYiNefxQCsVQiCYN17Y2+rfds4n/BSwgpQ4Eqjlae0Ss+Lf44N944jO3SBA8
 yKJr/ygUURO5mLW+KSFgJ67xyklS0pdOefOp/S11oj25He2ZrIeL+Am6ryRAGPRl7kE+
 ddBoOC8wiAjl5YkVl16YxKGVagKHSQHkVbTpZqOA1sZAoLbORGguRg/gCP8aU67yfNLL
 oFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l99iuyDis+ctVd+0faqWp4cAF+qdh6VL+GNIiYIncI0=;
 b=N5igeSZDiDU+9/2b/2zrEmt7nmgUsAR+whDebtxc2hQ9ehBTHfe5XRKbJoHZOqNP+F
 s3jN31CYhZ5bEJJTj6G3p5ZfxUvF0SBvpv/dyk37QIypopCNEltfnm+cI5yAvFjkjYZE
 8Ey19aPFuS0iX5YAD8xSXOID/DmeCtIb7LCfgkPvEP0Gqat7gJwhMpXT8e82W0F4J/0+
 2BgUxgKggiExhiFX1QCynapYb77B0takV6KAza3FkC2LWpTznw4xBksD74I8rUAkBTN4
 nts3zXxIysfgRlIURtILf7FpfaqI8vEfQDIGTDsRaVp3E6Rzg9JhnLLQoycHxFNX+VOn
 1Nww==
X-Gm-Message-State: AAQBX9fzkVoZudAlQjwIZFAMV84K+qR1Zd3Hh57OuFcGXP85qGFdFTgU
 bwSdJo54AUvOMz7Kvs6gca4yAEwQlt5t27jyP1Q=
X-Google-Smtp-Source: AKy350ZqD1efmWAU67ZAX+Wkl2L61AiAkwZD6j9IHwgNZH+yECWNI2sDjACod2V9Rl+0myhFubLFtA==
X-Received: by 2002:a05:6602:340b:b0:753:87a1:3198 with SMTP id
 n11-20020a056602340b00b0075387a13198mr14500497ioz.5.1681233040716; 
 Tue, 11 Apr 2023 10:10:40 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:40 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Subject: [PATCH v3 18/20] bsd-user: Automatically generate syscall_nr.h
Date: Tue, 11 Apr 2023 11:09:53 -0600
Message-Id: <20230411170955.17358-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Automatically generate syscall_nr.h from /usr/include/sys/syscall.h
since we can only run on a system that matches... This should reduce the
churn in the future.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.h | 2 +-
 bsd-user/meson.build          | 4 ++++
 bsd-user/syscallhdr.sh        | 7 +++++++
 meson.build                   | 2 ++
 4 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/syscallhdr.sh

diff --git a/bsd-user/freebsd/os-syscall.h b/bsd-user/freebsd/os-syscall.h
index 1f2c0acb1c5..b04d44ba78c 100644
--- a/bsd-user/freebsd/os-syscall.h
+++ b/bsd-user/freebsd/os-syscall.h
@@ -6,7 +6,7 @@
  * OS-Specific portion of syscall_defs.h
  */
 
-#include "freebsd/syscall_nr.h"
+#include "syscall_nr.h"
 
 /*
  * FreeBSD uses a 64bits time_t except on i386 so we have to add a special case
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 7d1b4de78b1..67480dc5290 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -21,3 +21,7 @@ bsd_user_ss.add(files(
 subdir(targetos)
 
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
+
+bsd_syscall_nr = generator(sh,
+			   arguments: [ meson.current_source_dir() / 'syscallhdr.sh', '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@'],
+			   output: '@BASENAME@_nr.h')
diff --git a/bsd-user/syscallhdr.sh b/bsd-user/syscallhdr.sh
new file mode 100644
index 00000000000..c991c2df1d0
--- /dev/null
+++ b/bsd-user/syscallhdr.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+in="$1"
+out="$2"
+bsd="$3"
+
+awk -v bsd="$3" '{sub("SYS_", "TARGET_" bsd "_NR_", $0); print;}' < $in > $out
diff --git a/meson.build b/meson.build
index 29f8644d6d0..aedf0798d81 100644
--- a/meson.build
+++ b/meson.build
@@ -3470,6 +3470,8 @@ foreach target : target_dirs
       target_inc += include_directories('bsd-user/host/' / host_arch)
       dir = base_dir / abi
       arch_srcs += files(dir / 'signal.c', dir / 'target_arch_cpu.c')
+      arch_srcs += bsd_syscall_nr.process('/usr/include/sys/syscall.h',
+					  extra_args : targetos.to_upper())
     endif
     target_inc += include_directories(
       base_dir,
-- 
2.40.0


