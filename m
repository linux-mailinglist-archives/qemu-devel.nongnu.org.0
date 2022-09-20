Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35675BE728
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:33:46 +0200 (CEST)
Received: from localhost ([::1]:51188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadNh-0002Db-FI
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZE-0001I4-NT
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:28 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZ9-0004z1-4X
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:24 -0400
Received: by mail-pg1-x536.google.com with SMTP id u69so2141992pgd.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bEwOXOJ9Zq3iyxOAwW3me2XI/Y7DXiJdYrVP5pYxEfc=;
 b=nwDCQ7dknbqKRyq4oqh1GsGFjx/JhszMKRX6pmCjn5wbUu9BQKXfeA2ExPGCZupijR
 lF2ik3qeSEdRwPS2IvmHmwAtFGGSOE6qRwsn6NWHgroGVoE9QfH0q9oJg5vkmEDs53h+
 UAvwFYmwf9yBTvzL74TyOW3NX47MV8O1MPdkeT2SFawlfE4ODahnmuSbSdNOSrbzBLrF
 gRDZEjXDgCV9tnQc3P/pyiueYZ1CT6JxMwnXUsywqRoIt5c9lotw0PSMQbyOTFn2FZgl
 1HGK7Cszz0U8c/7q24Nh0QNuWZLK+bwTDqfyER1+fTAOSu1F7bss9wXjYu/dJ4LmIQ+z
 80sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bEwOXOJ9Zq3iyxOAwW3me2XI/Y7DXiJdYrVP5pYxEfc=;
 b=rHejCfNCupdyolJdrbmH53v/fHFwjw1H7cxdAghWZm7f53d16GZ/ss0YpbPX+vq4Bm
 /it6iduCvosDAH02CZZZUJfiGodA0eBnWCx16W7UpHAyAJMjt5ukxZq4L6BOCUwkGn43
 IBKF2J+KdYT+QCz/gFxALHq54yBeInkp1GcGOM1ep/xBhTUDpmq+cjiwQqZrSRW7Ndc/
 GW7kg1Ct5abDZEZHCwWAnYPY47n6ht7YY1ZcAsiCqvw3+hqqj2Gc0Q3npRyehDt8yX8g
 dWUVuEWK2sgacf8uwxRMEhEZ1KVpHSkpnlJQop8LnHS1YLk2YDXaOF0qCf5Ll/5xtgu6
 TalQ==
X-Gm-Message-State: ACrzQf1BAkbZE3EGWmg0eGLtjBaRKetoZ9E5bidf7o0FNY6Hn/H2Sj1X
 DMeDQDB7XDT9BOv8icS6wIZUy1w2zlo=
X-Google-Smtp-Source: AMsMyM61t+RNs6Q0+/fgC1UQzTtIY6EGfFAEeXsqxyXUiG37qMrYg9Fh1M4c8wBZFl0RWxEVcsGj8Q==
X-Received: by 2002:a05:6a00:4c91:b0:543:646e:9 with SMTP id
 eb17-20020a056a004c9100b00543646e0009mr23030881pfb.40.1663669998878; 
 Tue, 20 Sep 2022 03:33:18 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 24/39] tests/qtest: virtio-net-failover: Disable migration
 tests for win32
Date: Tue, 20 Sep 2022 18:31:44 +0800
Message-Id: <20220920103159.1865256-25-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x536.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

These tests use the exec migration protocol, which is unsupported
on Windows as of today. Disable these tests for now.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

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


