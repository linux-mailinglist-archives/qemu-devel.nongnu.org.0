Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EC54A6822
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:42:43 +0100 (CET)
Received: from localhost ([::1]:57446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1rG-0005OK-5m
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:42:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-000877-Cq
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:35 -0500
Received: from [2a00:1450:4864:20::630] (port=36582
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExlz-0000cD-Jf
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:34 -0500
Received: by mail-ej1-x630.google.com with SMTP id s13so56992724ejy.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vu0I9U59bZWZDRHZ0y4P2PGP4T2MyrmhsrSziIlkWNs=;
 b=SxEZYzRnB5L1MYQvqMv6DjVFsJLIx+y84QTCtouw6B8YbuojoR/IBTWVq1EPaZQlog
 d+9FD42Zunv0UWtNJlAgzJBMJhPckoBk7/jeTFRiQWip7Sv2lmWnUubRS1Vwuw7t1UJE
 BUwySl6ktHE+d+LGFUkcmaFOYVuGX4t2X03+3UivIfzYBvEI7U6qFjpH2C7VNSIin8GN
 uAtcGu1DsUCx8fKxUVPNcH6CqPkWMzrVaucrryYm2LzukMuAKQa6MlI89mEFlzX7pLSd
 /48iB7QzB2bypOQXQeYXHmX8dChiPL38uq1gdbFv/ercXLSHAn2qf7zozC1HNRo/r5gb
 QHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vu0I9U59bZWZDRHZ0y4P2PGP4T2MyrmhsrSziIlkWNs=;
 b=0kzbzq6gAbaJ7XItB4GaakHeJG2SZt/JnJpPghUBUUgKQhqoVA9w29bWEvApSGH+2x
 nHEStBAfc3r2E2w2WOzVaxhv7EycnB7APQvB7SJEV5vxRKnW0hQsX5X9jtBqTw+ECPTP
 f3OU/z9v06Lxiaa7y5deMTuDE0wPkJ5PNZKs5dRlE39uX0Qm8C7TqqR6Y9EgO11jX4St
 qP0g/sQ9I4e/PUvAstSu7bPS4CgCD6UbxMw7M4UV23PCibWqFszHkduzQqCwqZ7TlM2D
 pSKQEEj5IBOLwxv7mWyl0b16MIWAwPkv1J3adlznxa7EfPH7Ld0YUw49vDqaAmPtfXma
 UDJQ==
X-Gm-Message-State: AOAM530QgRggbsZmapaaKvXZViAw25+MR0D9MmBc7ZEuqI8Sd/dIbcBw
 Bq/mVqJYWClW6eulDONGZKSzww==
X-Google-Smtp-Source: ABdhPJxET4oGyeHq+Rveh5PnOBCCtyWRobi7lwyh3BfGqyvtSbJmshN8BqhA8x0EbrJUeqsxo0ryGg==
X-Received: by 2002:a17:906:dc8c:: with SMTP id
 cs12mr21494140ejc.215.1643739656053; 
 Tue, 01 Feb 2022 10:20:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g27sm14807001ejf.108.2022.02.01.10.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:51 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DAF521FFBA;
 Tue,  1 Feb 2022 18:20:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/25] tests/qtest: enable more vhost-user tests by default
Date: Tue,  1 Feb 2022 18:20:27 +0000
Message-Id: <20220201182050.15087-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, aaron@os.amperecomputing.com, robhenry@microsoft.com,
 f4bug@amsat.org, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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


