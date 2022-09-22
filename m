Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5635E6B50
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:55:22 +0200 (CEST)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRM1-00046s-A9
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBG-0002De-Iu
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB9-0005Qb-O7
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id n15so9519025wrq.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=bhukZinHP19tc2MABOlYOy3TPhufYb3LdwBHDFcAuKE=;
 b=CS47AR3KgcJoOEJE6MR308REqH9N0PmQ0EFuZ20HS0YuCl0OEP88H2Xh7wVro4rlXa
 5Rd8swQfM4ZpfvOHR7apLQbLfG5DUJfIxAI8v72hdKRYRGKlypbDLhrYUFiWGasovsj1
 rIDxvKk6Kk4JgNgVOqArftEoMtfukPjtj2DqkvydxUmFbI4byXZOCOT/xBdHf0xpAdkN
 y0/75mx76U/N3ekLVDxInvUztsmilQ7exsNmqjEIWt8Qo/rKOYzwP2RSzIevPjfrwVsn
 giEGIHQr+cVLauD8mua4iwGvVsRYU8yS4E0gtMwJGRG6yIoLBQkLUdAyX6V6LKnwV98v
 HYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bhukZinHP19tc2MABOlYOy3TPhufYb3LdwBHDFcAuKE=;
 b=hPwicJkM4nSlCNohOHQN098vvyvaFSMii+i2Vx/rwdEesSoXMT1dc0vbNJCeWWkG/B
 e+q7Ql/frZGkTxeDKIP1WuAOPPx6KCiS3qANvRzGOUg05dGo0ssol7LH4AwWpgVnqYpB
 Co7zpkry0EGzN4qKkTi0FThfyAjD9bJmyknu1eBIYugrU0rlJ5PQsdul3eswmC+BB13i
 FtN+3rjvR7oPfnS6l/7N5sbmyI4dSpkRWf5O7tf0r+FlkgOuvq6amkEBsrGM/xIck985
 5Mx+OIiM2VU3E7ODVLYWML5FIA/MaGZmwsHziHqkWwV63zi9tqD8ruoYmd2nSPgvNv0p
 vNqQ==
X-Gm-Message-State: ACrzQf2BriZi6Se0kaXj7k2rIemj9Pw3pTS01ujPnf6K/PlKo+MLnFUO
 71HSTKENBhz9B5aXVR/hBHEF06hRrQXE9g==
X-Google-Smtp-Source: AMsMyM4t6CVVQ9M73LVUtP53wLRRPIF876HuPnhrwQsgeYa4QNmRTHriuO2jYGlcdox9T135JHA/XA==
X-Received: by 2002:a05:6000:1241:b0:226:d999:a2df with SMTP id
 j1-20020a056000124100b00226d999a2dfmr2585527wrx.19.1663864558936; 
 Thu, 22 Sep 2022 09:35:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/39] tests/unit/test-vmstate: Avoid dynamic stack allocation
Date: Thu, 22 Sep 2022 17:35:29 +0100
Message-Id: <20220922163536.1096175-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220819153931.3147384-12-peter.maydell@linaro.org
---
 tests/unit/test-vmstate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
index 72077b57800..541bb4f63e3 100644
--- a/tests/unit/test-vmstate.c
+++ b/tests/unit/test-vmstate.c
@@ -87,17 +87,16 @@ static void save_buffer(const uint8_t *buf, size_t buf_size)
 static void compare_vmstate(const uint8_t *wire, size_t size)
 {
     QEMUFile *f = open_test_file(false);
-    uint8_t result[size];
+    g_autofree uint8_t *result = g_malloc(size);
 
     /* read back as binary */
 
-    g_assert_cmpint(qemu_get_buffer(f, result, sizeof(result)), ==,
-                    sizeof(result));
+    g_assert_cmpint(qemu_get_buffer(f, result, size), ==, size);
     g_assert(!qemu_file_get_error(f));
 
     /* Compare that what is on the file is the same that what we
        expected to be there */
-    SUCCESS(memcmp(result, wire, sizeof(result)));
+    SUCCESS(memcmp(result, wire, size));
 
     /* Must reach EOF */
     qemu_get_byte(f);
-- 
2.25.1


