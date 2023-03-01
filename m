Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0E56A6F63
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:25:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOJz-0000wx-5y; Wed, 01 Mar 2023 10:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJi-0000bA-AG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJd-00011o-CJ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:29 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h11so1882095wrm.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VU+h4Jn5F0O340fdlBYKwzTtZ82+fr2bw9CLNQZMJ+k=;
 b=VxB1Qel/qphHjwyOcsc/1uZZbzdjP4rues2beQaZys69aa02p1mgMYNwqov0HiKLoz
 ltbOVd8UKV1VRV95c4MDToMDVJsKll8XeZR9Z2w5CM+5MJSoDh4jVQJ8GnUoGa6vo8ZP
 bziRQvvFRHGzCJGfYsA6TehX+wG2guJuJg44ps87/lrXifQzhwWONH48YgI7zzTZqbB0
 fkbR2e4jVLbSKfTg+39QWpXn7qkyx6JEr7jNX5bty7foenoTiSqRUYX5VEIuMCoiWONr
 4wbhIaPOn73wnpX5km2gaCDkZDNVvodM9xLBiuNk4/SbLzlccWlPt+oEeaj5T0tRXrVi
 OGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VU+h4Jn5F0O340fdlBYKwzTtZ82+fr2bw9CLNQZMJ+k=;
 b=qDBd9vqLTL5O2PvQMTGtn4+mJ9l0WcpJb4Um7s07CLA2sjCnX7V3FBJ6MvgQFYo/oN
 ap4kxYl3TWSNW4ok6+Wr8TxlXJjPYTk02N8jiN5CEbZj9mVCmDJDNHh66yGeYNUOBt4G
 E85PLDk/469xdjLVrXij4KVxPAnezdp/U6z7uA3IILU1UETxn5eEVPRBo+pFmNADPEH6
 Fa5rpoC/KNAbNlOkOAp4llOso6mnuhEl16jzUbQJV+fR3uQifOE+lKLxOV1oeHZkBC0G
 gabncdj6+/yx6pPz9nrwcD81Ao/thdYJvA0dDQQuSV9rkCYMTy/SOrF65+yZcC2pTxyt
 RiBg==
X-Gm-Message-State: AO0yUKWtNYOPiz++MLOTNkKWk8mNV7OdZf5kbdxu5zJRJR9pp+3xcauA
 5G3xNZ8O2wU9WtmB/XRu0Etm5lP/po+0wA2N
X-Google-Smtp-Source: AK7set9tqeTLTKKaD7/efCzDpkKf1T3JA6w2s0/ze1OizutHvmkXVUDAXlOmZyKD8Yz94rYPNnzG+Q==
X-Received: by 2002:a5d:4ccd:0:b0:2c7:19ad:8141 with SMTP id
 c13-20020a5d4ccd000000b002c719ad8141mr5142025wrt.52.1677684261841; 
 Wed, 01 Mar 2023 07:24:21 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d51c5000000b002c70d97af78sm13163567wrv.85.2023.03.01.07.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:24:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F70D1FFC6;
 Wed,  1 Mar 2023 15:16:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PULL v2 16/24] tests: Ensure TAP version is printed before other
 messages
Date: Wed,  1 Mar 2023 15:15:56 +0000
Message-Id: <20230301151604.1948813-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Richard W.M. Jones" <rjones@redhat.com>

These two tests were failing with this error:

  stderr:
  TAP parsing error: version number must be on the first line
  [...]
  Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.

This can be fixed by ensuring we always call g_test_init first in the
body of main.

Thanks: Daniel Berrange, for diagnosing the problem
Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20230227174019.1164205-1-rjones@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230228190653.1602033-17-alex.bennee@linaro.org>

diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index a9254b455d..2012bd54b7 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -112,12 +112,12 @@ static void test_lsi_do_dma_empty_queue(void)
 
 int main(int argc, char **argv)
 {
+    g_test_init(&argc, &argv, NULL);
+
     if (!qtest_has_device("lsi53c895a")) {
         return 0;
     }
 
-    g_test_init(&argc, &argv, NULL);
-
     qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
                    test_lsi_do_dma_empty_queue);
 
diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
index 1beb83805c..4bd240e9ee 100644
--- a/tests/qtest/rtl8139-test.c
+++ b/tests/qtest/rtl8139-test.c
@@ -207,9 +207,10 @@ int main(int argc, char **argv)
         verbosity_level = atoi(v_env);
     }
 
+    g_test_init(&argc, &argv, NULL);
+
     qtest_start("-device rtl8139");
 
-    g_test_init(&argc, &argv, NULL);
     qtest_add_func("/rtl8139/nop", nop);
     qtest_add_func("/rtl8139/timer", test_init);
 
-- 
2.39.2


