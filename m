Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3C23FF859
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:24:14 +0200 (CEST)
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLx09-0001W7-CO
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRY-0007UD-Vd
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:30 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:41550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRV-0003IF-9L
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:27 -0400
Received: by mail-io1-xd2c.google.com with SMTP id j18so4713126ioj.8
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6GBjuhX2fM+yuA3ZiSTfZjEtKLqjwbAkhKtzWAoOwUI=;
 b=h2Cu0B6ZolUKLsGR0hRaQ5Jwc24mb5sUJ+aGu6WDzxlUnpHRuhb8GmLQJi2gHaw3v4
 u7aIQ1kHU3kKam/nulcdhSIQUl2NleGh9mHsuz38QeaGph4EOlxM7lZly33rxyBv5mSh
 sFVKgtmymf/N99mxt/gAQf3kAEGXsBA+QJVEPYdca39jzSvTeNXWunh2jkJ+qyCdQAen
 OM754afb5Co7WEwxQ4k1NYoSu9fHNdZRFL1C22XTx4k0Dj3VmmsqQ2B/9iap/S4vVoIg
 5BvFq0imIXeHZJumMaOgycxWao3mlimFU1Zky6V83XZSr9vJe+xrBYl4erIFzh1vfMYc
 Novw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GBjuhX2fM+yuA3ZiSTfZjEtKLqjwbAkhKtzWAoOwUI=;
 b=TVkmzTpuDukoTtgEoFXw8hDbdbCR650OPMZF+OplN/fiQzspm3I9Fs082ZkF6ozvNm
 sFRe1P3lsgTWfzZQfgnXKVLQYWmdDv4YFraQH/5xbdGkNcN0sVqN2Nzlkhen1LyGuPAo
 4iyJ5RpNi0nQhxwLCeCjomazIeHUnNDj/X2UC548qLlsMPTBO0lDXsOgRixIjoCd8JMj
 EjUJPOK5yFsuAR+83ONzi7Zvr/TnOXpybSMHcbeIunMoZyWQZiGhWHciyh8s3Dgymfdi
 bH+8p8rpTS3QfoJZlYuRXLHvmukBz1rOPgciCd8SftxyxeeUqPC1xPvhDbsOMF2J54FJ
 gDCA==
X-Gm-Message-State: AOAM530JlUGV18KK07rHYaA5fXqqI1ofJuaz/rO/Xs/ZlnMwtLm1ypKt
 3CzxKugK+hOuaziuSgpayqc7IWYJhtcy3g==
X-Google-Smtp-Source: ABdhPJylgwY8Zj6U1QZ6gpWzOao4Ek9o/ZDNrHfY+Fae6+OOQWnnmq6UAC7E4VsyTG6l2W9/LAD92Q==
X-Received: by 2002:a6b:f114:: with SMTP id e20mr733967iog.41.1630626504037;
 Thu, 02 Sep 2021 16:48:24 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:23 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 42/43] bsd-user: Add '-0 argv0' option to bsd-user/main.c
Date: Thu,  2 Sep 2021 17:47:28 -0600
Message-Id: <20210902234729.76141-43-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
Cc: kevans@freebsd.org, Colin Percival <cperciva@tarsnap.com>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Colin Percival <cperciva@tarsnap.com>

Previously it was impossible to emulate a program with a file name
different from its argv[0].  With this change, you can run
    qemu -0 fakename realname args
which runs the program "realname" with an argv of "fakename args".

Signed-off-by: Colin Percival <cperciva@tarsnap.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 88244eb8fe..1602a02aba 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -243,6 +243,7 @@ int main(int argc, char **argv)
     char **target_environ, **wrk;
     envlist_t *envlist = NULL;
     bsd_type = HOST_DEFAULT_BSD_TYPE;
+    char *argv0 = NULL;
 
     adjust_ssize();
 
@@ -367,6 +368,8 @@ int main(int argc, char **argv)
             do_strace = 1;
         } else if (!strcmp(r, "trace")) {
             trace_opt_parse(optarg);
+        } else if (!strcmp(r, "0")) {
+            argv0 = argv[optind++];
         } else {
             usage();
         }
@@ -390,6 +393,9 @@ int main(int argc, char **argv)
         usage();
     }
     filename = argv[optind];
+    if (argv0) {
+        argv[optind] = argv0;
+    }
 
     if (!trace_init_backends()) {
         exit(1);
-- 
2.32.0


