Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24313FF843
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:09:30 +0200 (CEST)
Received: from localhost ([::1]:38804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwlt-0001lw-VN
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRJ-00074H-IM
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:14 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:47005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRH-00035s-4A
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:13 -0400
Received: by mail-il1-x12b.google.com with SMTP id r6so3544255ilt.13
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uSyVlG03IYdBoQBPQevMhSvwngS6ne+tRsYrRAa7d30=;
 b=RbTQCrHYkNHjDDx6VLgr0OLcPi/EnkeeTlRgjqfWOB+XZA3gF4MAcpcwdxinP+txDb
 DPnBNytALoO7YAIP3+eQFXPWpymmpTtsDEv9swaaqqdM6hg0GIr7I22Xyfespc9h3nVV
 ca/p/obLonbXX2S6fH1p7jTq0HZtFYrtKp9EETOL0X0GWutubqFRrsABjdTdmQOdN1Ug
 Yz1Kxpn9LyRpWrtCKk4G23yRDDGNIwzTkqWZnTOHP31we4fEe4I21utWC1gwuGoyZcdM
 QvW3+eA0CmexX4V3Gzi7tLU6hV8cuUrs1dQbH/pDV8vGxuCmx93bkyYPZKOIwssSf0M7
 eg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uSyVlG03IYdBoQBPQevMhSvwngS6ne+tRsYrRAa7d30=;
 b=HAyRR+glD89o/b8k+mimU4ej+KB0GSIBa1Yv2FqMIEgOmJ+u2W0UXB9l2+Bn/4ai6s
 w7H9YeX9K0IrbPlPvQj3Ry+jGG9BynHSEs8J9WfnurhDzpwiFuX9vzoTYvOWqruBXg1K
 QKh/exOu63hB9jq2oushtFIFKNbxee83WZqRHgAr31j6Z2uUkT1+xf/zYTBucgWVNMIE
 bgawAevpa6J4X5NfGFO4anJik4L0i9CWDa6mgZoA4504tbmC7JLgqAVogFdogE0tSMb9
 GHlcioDGSwfuIWB07GND+xMN9mz/Gz1x1Eq/Fq2Zbp6TZ96dJvTI1d68I6y592YcDbuj
 QREQ==
X-Gm-Message-State: AOAM530uOjLqFxHJ4ylXEe9EFleMhw5i+OLl4myWFNIvb85vedFMK7uh
 prAdbfbl26jOPq1ZkYbyPO/lOqxpIRM/iA==
X-Google-Smtp-Source: ABdhPJxN3IIrQPwKdn6IoYf7pn6GVhzHvsYc6YOIX4GxxKriZH9CVqC0wu32VQKUzc/EmYfY7JlfeQ==
X-Received: by 2002:a92:6606:: with SMTP id a6mr565851ilc.182.1630626489622;
 Thu, 02 Sep 2021 16:48:09 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:09 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/43] bsd-user: Implement --seed and initialize random
 state
Date: Thu,  2 Sep 2021 17:47:13 -0600
Message-Id: <20210902234729.76141-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Copy --seed implementation (translated from linux-user's newer command
line scheme to the older one bsd-user still uses). Initialize the
randomness with the glibc if a specific seed is specified or use the
qcrypto library if not.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 19bf3a09a7..71fd9d5aba 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -45,6 +45,8 @@
 #include "qemu/cutils.h"
 #include "exec/log.h"
 #include "trace/control.h"
+#include "crypto/init.h"
+#include "qemu/guest-random.h"
 
 #include "host-os.h"
 #include "target_arch_cpu.h"
@@ -203,6 +205,7 @@ int main(int argc, char **argv)
     const char *cpu_type;
     const char *log_file = NULL;
     const char *log_mask = NULL;
+    const char *seed_optarg = NULL;
     struct target_pt_regs regs1, *regs = &regs1;
     struct image_info info1, *info = &info1;
     struct bsd_binprm bprm;
@@ -331,6 +334,8 @@ int main(int argc, char **argv)
                 usage();
             }
             optind++;
+        } else if (!strcmp(r, "seed")) {
+            seed_optarg = optarg;
         } else if (!strcmp(r, "singlestep")) {
             singlestep = 1;
         } else if (!strcmp(r, "strace")) {
@@ -403,6 +408,19 @@ int main(int argc, char **argv)
     target_environ = envlist_to_environ(envlist, NULL);
     envlist_free(envlist);
 
+    {
+        Error *err = NULL;
+        if (seed_optarg != NULL) {
+            qemu_guest_random_seed_main(seed_optarg, &err);
+        } else {
+            qcrypto_init(&err);
+        }
+        if (err) {
+            error_reportf_err(err, "cannot initialize crypto: ");
+            exit(1);
+        }
+    }
+
     /*
      * Now that page sizes are configured we can do
      * proper page alignment for guest_base.
-- 
2.32.0


