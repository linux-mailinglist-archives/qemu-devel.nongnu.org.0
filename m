Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FC559F880
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:18:29 +0200 (CEST)
Received: from localhost ([::1]:56952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQoOy-00039z-Fd
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmut-0004RZ-UR
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:23 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuq-0001lq-Q9
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:18 -0400
Received: by mail-pl1-x634.google.com with SMTP id y4so15195427plb.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=EOFKHiRmcE74HgecgSGAabnZE3vUv0bvhkBrDlb0U9A=;
 b=nyLGNG/k8QKO0L9U3XkOZOlFQivxUx6Hz8G6QKP+yFtbDDmLV7blKQmbLXQ+IlGZWT
 EIXAn+7AGT/fC+V0q0m0mAFNJvLEygu2a7YzJGVrRaV35QaJQhQW+6BARRdcz/3jE+L2
 ESiN+e7WHUm+6DAdvwNF/V04ZqS3fUQgaaFy2299NrcyYCqVyU9Rp3q0k5ee+vxcdmO1
 MMFfGU5v6N6URy3kwGs1f3N0prKvDfNerlnuTDWyQDmo5LTmxZdOUGYFPvbhhcF7uqxt
 yeM1+R3WkLcUCC+iQjYQHRJyUdzabHH/BRe5XcbI1dgFAQIHkDD6NIzdX1Ddm9+OiLeU
 rkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EOFKHiRmcE74HgecgSGAabnZE3vUv0bvhkBrDlb0U9A=;
 b=PQh1DIKdypBz9+2h4yETfIa0eJqZ+zkkJxiARXkSATkQ+OivUcNsct88laUYLEEHom
 MUlE/TA0+maGC5xbH4+pvDNCloSeT6TMVIsVA2JdzGq3fav9Hty+WhRyvZ6Io1ypfR1j
 stATWkqHRJZNWOvP2+39SmL8sg1yJO6cVMwaJ8y8/FJdVNXEAm3M2OguKUFeiLbwAbxd
 LMsbZWra1BgMzcHVvIpe/CipAI0qpj2P1RnTgpgXE6YEhsR848UmDL9owRxATcIixOP5
 CAqJwRNd5aAf7rj7MYxJy+qZMZk5WFhwEuPljP7ImFWjwPT1um0+X8KQNt6aROeEpfFV
 xMRg==
X-Gm-Message-State: ACgBeo1AAVfjGNldFNn/E4l/da0GYZkfPSFDq/Ej3fuLe7ov8fHoVtqf
 El057MlssLKmh7qfDMHggGIVgy8TcYk=
X-Google-Smtp-Source: AA6agR6KtzTvp5fnDoEd/kUeMWOU3ajThweLYJ/BWEtVANY8QmJeUSMZD3FJyZwB8pZw4j42uIFdhg==
X-Received: by 2002:a17:90a:d982:b0:1fb:aec:e8db with SMTP id
 d2-20020a17090ad98200b001fb0aece8dbmr7317472pjv.148.1661334195215; 
 Wed, 24 Aug 2022 02:43:15 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 39/51] tests/qtest: virtio-net-failover: Disable migration
 tests for win32
Date: Wed, 24 Aug 2022 17:40:17 +0800
Message-Id: <20220824094029.1634519-40-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x634.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

These tests use the exec migration protocol, which is unsupported
on Windows as of today. Disable these tests for now.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/virtio-net-failover.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 443ee56de9..4a809590bf 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -588,6 +588,7 @@ static void test_hotplug_2_reverse(void)
     machine_stop(qts);
 }
 
+#ifndef _WIN32
 static QDict *migrate_status(QTestState *qts)
 {
     QDict *resp, *ret;
@@ -1827,6 +1828,7 @@ static void test_multi_in(gconstpointer opaque)
 
     machine_stop(qts);
 }
+#endif /* _WIN32 */
 
 int main(int argc, char **argv)
 {
@@ -1857,7 +1859,11 @@ int main(int argc, char **argv)
     qtest_add_func("failover-virtio-net/hotplug/2_reverse",
                    test_hotplug_2_reverse);
 
-    /* migration tests */
+#ifndef _WIN32
+    /*
+     * These migration tests cases use the exec migration protocol,
+     * which is unsupported on Windows.
+     */
     qtest_add_data_func("failover-virtio-net/migrate/on/out", tmpfile,
                         test_migrate_out);
     qtest_add_data_func("failover-virtio-net/migrate/on/in", tmpfile,
@@ -1886,6 +1892,7 @@ int main(int argc, char **argv)
                         tmpfile, test_multi_out);
     qtest_add_data_func("failover-virtio-net/migrate/multi/in",
                    tmpfile, test_multi_in);
+#endif /* _WIN32 */
 
     ret = g_test_run();
 
-- 
2.34.1


