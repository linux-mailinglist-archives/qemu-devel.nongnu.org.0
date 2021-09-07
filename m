Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A04030D4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:18:58 +0200 (CEST)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjQf-0003FY-Jr
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2c-0005wv-DK
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:08 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:46594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2a-00010m-C0
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:06 -0400
Received: by mail-io1-xd2a.google.com with SMTP id b200so431221iof.13
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oB7YQS6n+Ad0k22+YCJB5aT2A3DAQAm+CIuWvIJbrCw=;
 b=rZbTopgmmVljBpLNjBKnTGXFmyzXVF3kGEGnZRbCpdOdMZD43t3pkV6OcD3t91mcTg
 IJyJf3UXODYMcwXpmTG0Y1XIar7dr3A+zo12Sb0gXoHkf407eO9xPYEJrKbnmYKaSkVi
 lTFOD/4wo+kdGn/gw34IAHDNUp4vUP4ArPU8pUXKpljMHz3orF/Ku6d54rjF2stW6xiq
 HUFnxks98Rvabes2aj3tv66tnyX3wEYfxmwEBrfBDP4OpXGwEGCN69k/zTmE7Pir7ct2
 QzQXwlTNfqfAqJ7tzAOOrcJ7X/1xNqpmdYwG96nNPlTaaPyaDa1LLIAJOByWgsxAG4St
 y3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oB7YQS6n+Ad0k22+YCJB5aT2A3DAQAm+CIuWvIJbrCw=;
 b=N6CstoMrJiCbn8bO5NgdERuiG14Tp3UvoT1mJKGzcm/QRguoknUWlEapjx+I8BlWbH
 gGiuSEUA6wMsQLugJOv/Nv7DM3104IOpWLEoahtBg/Z+Ik1shvkKtoHplKjt2/fQv+m6
 rQUJfODuPgca207ScZfsVUbsDaJ20j8iu+d6QaYaIp8bCoqL4NvJOwgBDZU4lr6BWM1g
 cGC+1e9K+2w39I6X4gAWCB5q53KZZPXPTVj8PYbWu9d9psDhLwWgNqGJwqaiwCTjGbdS
 iQJw0v3CUwuL+tb4N203ibIeAdBVZ3wZTlBaRqJfpZ9Ubn5hp+tcAoA1JTNDtp7SGIhy
 TKfQ==
X-Gm-Message-State: AOAM532ECKX8RBhgQHWfBHvGpTGxeBvqqfWFWzjHnrswz2e2FNgmqCwk
 m3SVby4xGmX6Oi+n1O78p0uEw+X5NWs+OxSMtHI=
X-Google-Smtp-Source: ABdhPJycJ19tsVc43CX5uBONGfgq2u+SsjbgG0MOGKL7z2SupcpmDg10TWaMZEbewqDA7bwNAZH+2w==
X-Received: by 2002:a02:2b14:: with SMTP id h20mr453472jaa.116.1631051642521; 
 Tue, 07 Sep 2021 14:54:02 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:02 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 27/42] bsd-user: Implement --seed and initialize random state
Date: Tue,  7 Sep 2021 15:53:17 -0600
Message-Id: <20210907215332.30737-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Copy --seed implementation (translated from linux-user's newer command
line scheme to the older one bsd-user still uses). Initialize the
randomness with the glib if a specific seed is specified or use the
qcrypto library if not.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


