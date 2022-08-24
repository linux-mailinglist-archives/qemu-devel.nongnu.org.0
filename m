Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523EE59F8BC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:43:47 +0200 (CEST)
Received: from localhost ([::1]:39326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQonR-0005fq-Ge
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmv8-0004V1-Tk
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:36 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmv6-0001rk-6Q
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:33 -0400
Received: by mail-pg1-x52a.google.com with SMTP id v4so14531915pgi.10
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dRHhWPJXiN/4/A11QD7zEQfLoQkKTg9o+isZ5w1L5e4=;
 b=DijW74OWB2eWz9Ojal28Y5v6r3SE2TdD7WVXvXriN/6blq08UM7V4dFXNme1gtuqSY
 WSEZu3r2AWD4xcrlQSrXeIScxS6myobDMKPcWwDI2WyQm1pxWlAi4mMlGD0Zi6xRVnbV
 prIRXaXIQtxJzZyySpWBIR54/cJ8xx+mOdr4uX4PAzCUFp1cYbbw+n/Y+EEchqbY3DaT
 UhJJEY7wcOFeoLZkiVtZli5eJ4Z+oGOxFBEsTWD8BohaR9IIYBFIAePcryucP0ic3PWI
 M59M9uQ+AGLS6cb/G4qNvFi3DfqAZsWUYO64XjT97iRteq/hjQYOtdarrT4fSoY30pN8
 I1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dRHhWPJXiN/4/A11QD7zEQfLoQkKTg9o+isZ5w1L5e4=;
 b=LN8K5P9WYM7Gm1i0T28v/MzcrubQx8BDAl2+dpSzoyA5PurITQOcMIjGHoCrN3J9fV
 Kf1WWWKWFYbYbPyYMvlQTtE6cJjh4xcGO4CgD0x5DLl1s+rPPVneK5TS70Yq3GnsQgsj
 B1Sbblo/mEjAkJkHzEeMpDp9W5//nQdQQDFIqAb46WCMDcA7LwGhgbm4quJMNvmsKixP
 YGCdaSe2JDB3mSfcXPlbW+OXHDm5SH3TpVCijDcq7nvnhdaBRA33WEQgJ1QzvDbyG85g
 mlGIAsNR4qKdEOy1GToNG3FRHZyM7T/XaqqmJGKduJWL+YRMG3L0hq4Ac2evjh5Bnqwr
 pTww==
X-Gm-Message-State: ACgBeo28HQgZycSGw6tuM8k07Zj1QjLomoYg+3zPPXrpMsSZlvvw0kju
 PEVF+KDH0UEk04ZL7hs5uhNN42ohXIk=
X-Google-Smtp-Source: AA6agR7cRjAvZg3xRyk3AUzz2mVMwWY4nn+tzhJjiNQJ5clFrSadpzgtPWCkxihhA7Sa+zM9RaRoLg==
X-Received: by 2002:a65:6bca:0:b0:420:712f:ab98 with SMTP id
 e10-20020a656bca000000b00420712fab98mr23713431pgw.350.1661334210229; 
 Wed, 24 Aug 2022 02:43:30 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 45/51] tests/qtest: prom-env-test: Use double quotes to pass
 the prom-env option
Date: Wed, 24 Aug 2022 17:40:23 +0800
Message-Id: <20220824094029.1634519-46-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Single quotes like -prom-env 'nvramrc=cafec0de 4000 l!' in the arguments
are not removed in the Windows environment before it is passed to the
QEMU executable. Such argument causes a failure in the QEMU prom-env
option parser codes.

Change to use double quotes which works fine on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/prom-env-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/prom-env-test.c b/tests/qtest/prom-env-test.c
index c2b0448e55..39ccb59797 100644
--- a/tests/qtest/prom-env-test.c
+++ b/tests/qtest/prom-env-test.c
@@ -58,8 +58,8 @@ static void test_machine(const void *machine)
             " -machine " PSERIES_DEFAULT_CAPABILITIES;
     }
 
-    qts = qtest_initf("-M %s -accel tcg %s -prom-env 'use-nvramrc?=true' "
-                      "-prom-env 'nvramrc=%x %x l!' ", (const char *)machine,
+    qts = qtest_initf("-M %s -accel tcg %s -prom-env \"use-nvramrc?=true\" "
+                      "-prom-env \"nvramrc=%x %x l!\" ", (const char *)machine,
                       extra_args, MAGIC, ADDRESS);
     check_guest_memory(qts);
     qtest_quit(qts);
-- 
2.34.1


