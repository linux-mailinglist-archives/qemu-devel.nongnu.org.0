Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC69B5E930D
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:25:14 +0200 (CEST)
Received: from localhost ([::1]:50046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQh7-0007w9-Um
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPs9-0003O1-Mm
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:35 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:46662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPs8-0006SC-7c
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:33 -0400
Received: by mail-pf1-x430.google.com with SMTP id c198so4138892pfc.13
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=szrrAWQi57rwmVvkIAS0k/zzBtjmcZYK/YPRpaNr+UQ=;
 b=Ac8zwGnmGEkBx+sIGgR5ofdu27upsvLWQjI7ItCxyNFxWR/H/qIDBZT1EnKn8jlDit
 bFFv7kFOUfIaIW2RsWr50f/CgGHQ8Tj0+QaMNVoL2XY+W4QsAZrGjyO74HiXNwvrXW7d
 EQjN1G39ehRyzp9GL7k7IyQbkFS3F7zDm08GkO2km81c5s4U8iEg64s8N8YH7dq29sb4
 brBEj1do5EuRNvsipKsJNlcoCtxjxVa7aFuWeqzPE2KZkqAW+eFohJFW7JkQXAauSNn5
 GfdbrVJqmzJg2SNOd5fhO9ttQspZDDciD3Bgjv2c7dBUjabR/l0VKOKK7cvifeUieb0l
 3v+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=szrrAWQi57rwmVvkIAS0k/zzBtjmcZYK/YPRpaNr+UQ=;
 b=rPtqaweyq7L9BA94+e2iiLPixcrkFEjvO6oAshxUS1RNmw6Cj8okZhc8NfJ2UB0aHl
 53PIkAZu8/5BBxt2u83Iy8y9zSOOCfCvdyYGepE69nKdKfcswiMx4AV8RVkxY4VWATQQ
 Jay2wMl9hqMf3l46DTp7hoG4buPJzXPY+zFEF62lWK3IaQzFb9ejQh8bxvFIV5GKIupY
 fB6m/1v4ZcZEbbHAHwy35G/J4osO1NVj8jzIWai4kLU6JR5Xl8nUqJTvlUluQW4D31SU
 IGefHTs+udOlx2b2oqqVuQzxFxJODBCWzimmMegqHcAneBymlpOyZtu3/W11F/nRqvi0
 DoWg==
X-Gm-Message-State: ACrzQf1xyQCBd0ebEm/w1swmUYhyLd4FI9nQDatM9B/1CaeMogdnMdz8
 SFvA/VoTYz3VEdsizI6QnitObiDzhvg=
X-Google-Smtp-Source: AMsMyM4UppYF8Bvy2NzVS20xvywW4F1yUk5nykbcJn1aUxjokm8yYhg3fe4rE1WAM6iak8/r4dv1Ow==
X-Received: by 2002:a63:5fd6:0:b0:434:96fe:f508 with SMTP id
 t205-20020a635fd6000000b0043496fef508mr15319120pgb.306.1664105547217; 
 Sun, 25 Sep 2022 04:32:27 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 41/54] tests/qtest: virtio-net-failover: Disable migration
 tests for win32
Date: Sun, 25 Sep 2022 19:30:19 +0800
Message-Id: <20220925113032.1949844-42-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x430.google.com
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


