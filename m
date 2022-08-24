Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD9559F81F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:46:44 +0200 (CEST)
Received: from localhost ([::1]:48520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnuG-0001JW-0R
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmv4-0004TI-3j; Wed, 24 Aug 2022 05:43:30 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmv1-0001ol-7O; Wed, 24 Aug 2022 05:43:28 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso957368pjd.1; 
 Wed, 24 Aug 2022 02:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MHfTEu/249wVV9m0rBn3cA/BnwhFgurm/PYKRUtzg+o=;
 b=ZZK1hRnYE1UDVwGvYkKI2LanoP3FgMW+1eLQGcXLgaAknQhWlHpDk1G1aG0/uf8LMu
 y54chOAX4JZPoMJ3LzQc2GDdCS4qknDTBFAFMSiR+O5GaI3Rt2CBMB3GyydJ23FOgjWz
 oArmj5LDEvjSzwQQsGVDz1N1NLCsOGGgkl9dm+G00CCJMGy76vZG6hiwkiLwWSYUJs2i
 +qa4ykgb0OWlUWRb+7t3W7KE+OoR2lEmYaE9n9G8AHIoC8SzzX3TDyNAgufQ5lMRcxX9
 Tv3RrNlb0wwFgN39PpH6SKXvzC7f0ZJWrHTbP5Bm5NIqJ8mlJMy3xWsRQkQmsNZFg3pr
 J7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MHfTEu/249wVV9m0rBn3cA/BnwhFgurm/PYKRUtzg+o=;
 b=L2lHWrGPrUuH5BG5wTYcq7ERwjtXdI/yQQEidqZ4kvnJC2Yh5kRd4bYDwF0NqAWD0K
 KXX/MV3aym/zs5LpLCHaV96FWMbAPptlm+msDdmRqDiAOF0O/45314mofcudkqjSAyA+
 O7hvs+3Zv6l8qad/1jgCyTL4WW7HrX7/SQ1V2XTWF7TrRzej2kUVK0V0cbOfLo1KZE0y
 IBtmjBQ4DTIV5a/4OaFOq6sa8dk5Q38L8ZDSTfc1l0ta5DM1VcVgZGEQrrbWnJYWrJfc
 HeKYUuiHWO0UtpUkT2HIvEWbdcj7ba108CYjprYw7uaSAmDkQSkAOjuLsi8q+OlGk+Rj
 BoUg==
X-Gm-Message-State: ACgBeo2ResUmzdux2zf1bsh7VqC1m7JxoNRq8vl/1pc2WqW/UUIOLQT8
 y9Yv8xrAzGm2l7r0wFCtz21becNF7Rg=
X-Google-Smtp-Source: AA6agR4xoekxEgNHaKoZU/b9XwWIXxLm5ZQP4bl1zHL6rBDjhPECybJknIQ+cPD4IzWj/LolL81Ldw==
X-Received: by 2002:a17:90a:e543:b0:1fa:d591:12c4 with SMTP id
 ei3-20020a17090ae54300b001fad59112c4mr7302607pjb.91.1661334205265; 
 Wed, 24 Aug 2022 02:43:25 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm@nongnu.org
Subject: [PATCH 43/51] tests/qtest: npcm7xx_emc-test: Skip running test_{tx,
 rx} on win32
Date: Wed, 24 Aug 2022 17:40:21 +0800
Message-Id: <20220824094029.1634519-44-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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

The test cases 'test_{tx,rx}' call socketpair() which does not exist
on win32. Exclude them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/npcm7xx_emc-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index a353fef0ca..c373d24e1e 100644
--- a/tests/qtest/npcm7xx_emc-test.c
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -209,6 +209,7 @@ static int emc_module_index(const EMCModule *mod)
     return diff;
 }
 
+#ifndef _WIN32
 static void packet_test_clear(void *sockets)
 {
     int *test_sockets = sockets;
@@ -243,6 +244,7 @@ static int *packet_test_init(int module_num, GString *cmd_line)
     g_test_queue_destroy(packet_test_clear, test_sockets);
     return test_sockets;
 }
+#endif /* _WIN32 */
 
 static uint32_t emc_read(QTestState *qts, const EMCModule *mod,
                          NPCM7xxPWMRegister regno)
@@ -250,6 +252,7 @@ static uint32_t emc_read(QTestState *qts, const EMCModule *mod,
     return qtest_readl(qts, mod->base_addr + regno * sizeof(uint32_t));
 }
 
+#ifndef _WIN32
 static void emc_write(QTestState *qts, const EMCModule *mod,
                       NPCM7xxPWMRegister regno, uint32_t value)
 {
@@ -339,6 +342,7 @@ static bool emc_soft_reset(QTestState *qts, const EMCModule *mod)
     g_message("%s: Timeout expired", __func__);
     return false;
 }
+#endif /* _WIN32 */
 
 /* Check emc registers are reset to default value. */
 static void test_init(gconstpointer test_data)
@@ -387,6 +391,7 @@ static void test_init(gconstpointer test_data)
     qtest_quit(qts);
 }
 
+#ifndef _WIN32
 static bool emc_wait_irq(QTestState *qts, const EMCModule *mod, int step,
                          bool is_tx)
 {
@@ -843,6 +848,7 @@ static void test_rx(gconstpointer test_data)
 
     qtest_quit(qts);
 }
+#endif /* _WIN32 */
 
 static void emc_add_test(const char *name, const TestData* td,
                          GTestDataFunc fn)
@@ -865,8 +871,10 @@ int main(int argc, char **argv)
         td->module = &emc_module_list[i];
 
         add_test(init, td);
+#ifndef _WIN32
         add_test(tx, td);
         add_test(rx, td);
+#endif
     }
 
     return g_test_run();
-- 
2.34.1


