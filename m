Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F399E4AA16C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:52:59 +0100 (CET)
Received: from localhost ([::1]:41520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5Zj-0003yv-3B
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:52:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Ql-0006ef-PD
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:44 -0500
Received: from [2a00:1450:4864:20::42a] (port=36725
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qj-0007Ko-3q
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:42 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u15so13464200wrt.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vu0I9U59bZWZDRHZ0y4P2PGP4T2MyrmhsrSziIlkWNs=;
 b=J2079BF8SZVc/7fo0edE0Xp5+Y/Tj0ZT06+IUZpU00lSU91Qxg/bK5zWOTFbHze9YQ
 BH/wEufnkAGFwPN3Os+m2o3fexFfxjeoY/qQJgs7Rr9zzqCUTVwafrHu+ZDvP2XJOoAE
 3RYRKv29Vuqo4E3VEbnef+gRLWSe6PD1KBEI8dSvGktWb+//AP3+7D3TaXzUPDbNu0kp
 kgllpFYIvNt3nFBtJ4esZZVxMTjc6Y3VpAzbbbZSCxciJFnHJhEnJZ5YAHvnLyDfg6Ht
 ZB5C9ohGupaLUQcHJpzbhf3+036L0zGhzshb6a4etMJeRVDKV5u25kpWpfPiZiRSxy56
 n3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vu0I9U59bZWZDRHZ0y4P2PGP4T2MyrmhsrSziIlkWNs=;
 b=JedW/dTsGH/GZkozQPJ2Q23qv6ibh1V3/vkFc0zXpQgM+5ywFvZuTjaIxN+3xYlqFd
 kRRkIdXdPRWXdX6nXUDx3mczzCTquiISdQPhhQTvKMVxSiIivxbxzNzHpaI+l5kpbXhh
 OH8xE+595R1YX4PUed3TXzS5LFcKUW+2IUPQrEC1ndXV7Gx6xrBTIwfVKsRlxTwkUpsl
 CjUrtK3srH7sXW/+PeotXcfw6LcLnLf0uoNStnqHTN4rAC7sPYkCAtRXGLB1FTxTV+G6
 OxDERgsceobFpBl0kqTVVZoIP9dWonpto/DAxe+wrc6RdZFNYHx8ZCsOkyA7TW0rrrj4
 01vw==
X-Gm-Message-State: AOAM530/ALoaPCc+nwpPNvL7IYR18xSeLsKtV2BQD/g1M0imf5dBhrka
 mGDXHp9o9/dpK0lPS37q1ze+Cw==
X-Google-Smtp-Source: ABdhPJwiUMeitarA/Uah/DUbLeFC9AWcR0oXM5P0XyJtU7W0ehjX2t/4ao7V867H56b4TkZ0eb8I2A==
X-Received: by 2002:adf:de0c:: with SMTP id b12mr543861wrm.26.1644007419745;
 Fri, 04 Feb 2022 12:43:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 5sm3194631wrb.113.2022.02.04.12.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 457181FFBA;
 Fri,  4 Feb 2022 20:43:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 02/26] tests/qtest: enable more vhost-user tests by default
Date: Fri,  4 Feb 2022 20:43:11 +0000
Message-Id: <20220204204335.1689602-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If this starts causing failures again we should probably fix that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220124201608.604599-3-alex.bennee@linaro.org>
---
 tests/qtest/vhost-user-test.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 3d6337fb5c..2a4568cd7d 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -995,20 +995,17 @@ static void register_vhost_user_test(void)
                  "virtio-net",
                  test_migrate, &opts);
 
-    /* keeps failing on build-system since Aug 15 2017 */
-    if (getenv("QTEST_VHOST_USER_FIXME")) {
-        opts.before = vhost_user_test_setup_reconnect;
-        qos_add_test("vhost-user/reconnect", "virtio-net",
-                     test_reconnect, &opts);
+    opts.before = vhost_user_test_setup_reconnect;
+    qos_add_test("vhost-user/reconnect", "virtio-net",
+                 test_reconnect, &opts);
 
-        opts.before = vhost_user_test_setup_connect_fail;
-        qos_add_test("vhost-user/connect-fail", "virtio-net",
-                     test_vhost_user_started, &opts);
+    opts.before = vhost_user_test_setup_connect_fail;
+    qos_add_test("vhost-user/connect-fail", "virtio-net",
+                 test_vhost_user_started, &opts);
 
-        opts.before = vhost_user_test_setup_flags_mismatch;
-        qos_add_test("vhost-user/flags-mismatch", "virtio-net",
-                     test_vhost_user_started, &opts);
-    }
+    opts.before = vhost_user_test_setup_flags_mismatch;
+    qos_add_test("vhost-user/flags-mismatch", "virtio-net",
+                 test_vhost_user_started, &opts);
 
     opts.before = vhost_user_test_setup_multiqueue;
     opts.edge.extra_device_opts = "mq=on";
-- 
2.30.2


