Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632555EC2A8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:29:32 +0200 (CEST)
Received: from localhost ([::1]:47110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9iN-0003JD-Fk
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rl-0003Gi-QF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:18 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8Rk-0004zA-5p
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:17 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 u59-20020a17090a51c100b00205d3c44162so2053729pjh.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=csizl2w+78rIPzv75NHpVHqQ4bo3e7STiugOOCph1bA=;
 b=BOhw1/k+UId/b76hOMZjCDzF9RdMWRcMXMqxAduWaAHrY/PKjLtwYeerLFl1nhriY+
 ju11ud3Vc6i/WPogaFMLSncAFi3dZnhbm565pvZkzlcAcj9z8k67PAyNBNgvA6jmBZor
 W8EeXwpAW7o0a3qC/TBztPYFV6tdy2oDzyg4d47Yx2X/Iwo3rDrAokP+BenZtfhaFLgq
 Jcj1HCBhf60B7n2xaAzJb36qVMGlvjSFcNBYm2JSGKEy/kyLQIjdRvcHveGqV/tO2qtB
 1NgFyD+MayyKuo0F5kumECgWppvgd3EvYjHcox2wPirbYiHrRcj74QdoT+3kSWq/89BB
 ovJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=csizl2w+78rIPzv75NHpVHqQ4bo3e7STiugOOCph1bA=;
 b=Z20GBlgx+nqpXhRqtqs1q51vmykIjJ8JyEAy0SuXC4OqCwznEa534TaCfeEa1I7Yvy
 Yi3Py8Vd/fWmEcvALygR0qx60l98xFweOZBdp0rbrxo/wfqoZEgbXznp044ojjMNcRUm
 /9t0NbS7EY20GMHSDJCJOmcbHLaSfBlpimY2UQzt2vR6Ng73zls7nlhW18PLxQUjp6TZ
 IbcMfKRB8QP0A+uFHjjbRtEHNOETzwmnndIOKL831FfN6s5F+wn85WCfe5Xu9o3TFd4q
 S5DQfthZZPW6aoWlvZF2cdvz7hx4syv+8nhIH7Dr3yNyCnyMbh3YD3Y2zC4wI59JySoq
 L+lQ==
X-Gm-Message-State: ACrzQf3iHizVvsslA0Se2CNdb7pLhJME36rl3b6sOzIhhwhz2epwIeeg
 ZQAOqoN53t1FgQYIrOSSxc4Sw2lFX9k=
X-Google-Smtp-Source: AMsMyM5TPhzuaDAaw83mtYTi2Qs2BQZodFGp+IAFQLlu3ObWU10q2YGVf5TKOj8x5Eyw+CNz+QFdbw==
X-Received: by 2002:a17:90a:e7c5:b0:200:ab1a:f32 with SMTP id
 kb5-20020a17090ae7c500b00200ab1a0f32mr3922567pjb.100.1664276895256; 
 Tue, 27 Sep 2022 04:08:15 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 35/54] tests/qtest: libqtest: Install signal handler via
 signal()
Date: Tue, 27 Sep 2022 19:06:13 +0800
Message-Id: <20220927110632.1973965-36-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

At present the codes uses sigaction() to install signal handler with
a flag SA_RESETHAND. Such usage can be covered by the signal() API
that is a simplified interface to the general sigaction() facility.

Update to use signal() to install the signal handler, as it is
available on Windows which we are going to support.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 tests/qtest/libqtest.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 269d622fe3..f0ac467903 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -66,7 +66,7 @@ struct QTestState
 };
 
 static GHookList abrt_hooks;
-static struct sigaction sigact_old;
+static sighandler_t sighandler_old;
 
 static int qtest_query_target_endianness(QTestState *s);
 
@@ -179,20 +179,12 @@ static void sigabrt_handler(int signo)
 
 static void setup_sigabrt_handler(void)
 {
-    struct sigaction sigact;
-
-    /* Catch SIGABRT to clean up on g_assert() failure */
-    sigact = (struct sigaction){
-        .sa_handler = sigabrt_handler,
-        .sa_flags = SA_RESETHAND,
-    };
-    sigemptyset(&sigact.sa_mask);
-    sigaction(SIGABRT, &sigact, &sigact_old);
+    sighandler_old = signal(SIGABRT, sigabrt_handler);
 }
 
 static void cleanup_sigabrt_handler(void)
 {
-    sigaction(SIGABRT, &sigact_old, NULL);
+    signal(SIGABRT, sighandler_old);
 }
 
 static bool hook_list_is_empty(GHookList *hook_list)
-- 
2.34.1


