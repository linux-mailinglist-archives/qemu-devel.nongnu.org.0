Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABF35092D1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:28:51 +0200 (CEST)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIoc-0006PH-Hq
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdr-00008v-Dw; Wed, 20 Apr 2022 18:17:43 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:44162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdp-00068B-KV; Wed, 20 Apr 2022 18:17:43 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e5bdd14b59so3494408fac.11; 
 Wed, 20 Apr 2022 15:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gtIx46PnRaATwI461AIvmk5NPN6A/WZxJ5nnU8864RU=;
 b=PXC5k58E0g7PVa25oSWrPa0wbhKnqNOgZVGj/+YEjDIHrtYFrNyIH1YaZaHPBqO8n4
 NWO3G9wHZWp3h5mUDCzGjlj9AKUOPlLBb1aUb4hB5FLgacPVBYZfncabegm9iQgKxzXY
 Atbo7Gp7k6TOKOWawYZIDm9EW9GqeH3++rn11I8N2I7BYw5tod3Mpk8pMhgdDr9I3iv5
 4dvevGe7KcianW2BJLlk7j9TleaJJm62zuMQGxCBrSVLyS+wB8WtHDtfCAMB8b4OJJhK
 +6N2icwx3S0SpvaIePcFyTe/nyvpwGnJmKljtOeavd2tHp8MNyO/9v3az3m+Npu/Qboi
 ujCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtIx46PnRaATwI461AIvmk5NPN6A/WZxJ5nnU8864RU=;
 b=V6bx5k2QZjBHD8DzTW+M4u7zgQDYCr0uU7Cpah4N6KQ+3mwyL1KiRQ85v7U51rJ00g
 A5eNvyIG423Ym9JVM0y7eDVbdfm1OPODBZLgn4fS8f+FPvGEXJQdTZz9j4ru+qTVx8cJ
 Y3jui7K2SJwnDI5an3L9K2O+aDKc3rmpoPrnAvRDKCSRUQPG0tTG7H1jMda0QOtN2hgo
 MJNelsvpOKsDUNCJ3hRsbWcNZKOMXmQalrz5SOAkg31lRrHcmYGQDX/EuuKXfwByo4Gm
 P9gCwe2YDht6BlTejLVQLgsVDq0Oya8Jbr0nyOFN7iq9z3qT1z7drTLoyLj1h/0hGrk3
 Vl8g==
X-Gm-Message-State: AOAM5321fdXiCWszA/rxxD7l7DMLG4j3NoVa/9ba6AQQSLHmoRav/B60
 7+uoOfXT8LTZdAdFJ1gwD8V0ZoqsHJc=
X-Google-Smtp-Source: ABdhPJwk2KRdL1yVwpTkUC14zNDDLeRaG7Lx+Oqtm8XnNvpGY2uQWLvRMohADrAELY5PswU8I3Glrg==
X-Received: by 2002:a05:6870:8a0a:b0:e5:b7dd:9a04 with SMTP id
 p10-20020a0568708a0a00b000e5b7dd9a04mr2562146oaq.96.1650493059678; 
 Wed, 20 Apr 2022 15:17:39 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:39 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/23] qemu/int128: add int128_urshift
Date: Wed, 20 Apr 2022 19:13:17 -0300
Message-Id: <20220420221329.169755-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implement an unsigned right shift for Int128 values and add the same
tests cases of int128_rshift in the unit test.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220330175932.6995-3-matheus.ferst@eldorado.org.br>
[danielhb: fixed long lines in test_urshift()]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/qemu/int128.h    | 19 +++++++++++++++
 tests/unit/test-int128.c | 50 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 37e07fd6dd..1f82918c73 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -83,6 +83,11 @@ static inline Int128 int128_rshift(Int128 a, int n)
     return a >> n;
 }
 
+static inline Int128 int128_urshift(Int128 a, int n)
+{
+    return (__uint128_t)a >> n;
+}
+
 static inline Int128 int128_lshift(Int128 a, int n)
 {
     return a << n;
@@ -299,6 +304,20 @@ static inline Int128 int128_rshift(Int128 a, int n)
     }
 }
 
+static inline Int128 int128_urshift(Int128 a, int n)
+{
+    uint64_t h = a.hi;
+    if (!n) {
+        return a;
+    }
+    h = h >> (n & 63);
+    if (n >= 64) {
+        return int128_make64(h);
+    } else {
+        return int128_make128((a.lo >> n) | ((uint64_t)a.hi << (64 - n)), h);
+    }
+}
+
 static inline Int128 int128_lshift(Int128 a, int n)
 {
     uint64_t l = a.lo << (n & 63);
diff --git a/tests/unit/test-int128.c b/tests/unit/test-int128.c
index b86a3c76e6..25db2455e8 100644
--- a/tests/unit/test-int128.c
+++ b/tests/unit/test-int128.c
@@ -206,6 +206,55 @@ static void test_rshift(void)
     test_rshift_one(0xFFFE8000U,  0, 0xFFFFFFFFFFFFFFFEULL, 0x8000000000000000ULL);
 }
 
+static void __attribute__((__noinline__)) ATTRIBUTE_NOCLONE
+test_urshift_one(uint32_t x, int n, uint64_t h, uint64_t l)
+{
+    Int128 a = expand(x);
+    Int128 r = int128_urshift(a, n);
+    g_assert_cmpuint(int128_getlo(r), ==, l);
+    g_assert_cmpuint(int128_gethi(r), ==, h);
+}
+
+static void test_urshift(void)
+{
+    test_urshift_one(0x00010000U, 64, 0x0000000000000000ULL,
+                     0x0000000000000001ULL);
+    test_urshift_one(0x80010000U, 64, 0x0000000000000000ULL,
+                     0x8000000000000001ULL);
+    test_urshift_one(0x7FFE0000U, 64, 0x0000000000000000ULL,
+                     0x7FFFFFFFFFFFFFFEULL);
+    test_urshift_one(0xFFFE0000U, 64, 0x0000000000000000ULL,
+                     0xFFFFFFFFFFFFFFFEULL);
+    test_urshift_one(0x00010000U, 60, 0x0000000000000000ULL,
+                     0x0000000000000010ULL);
+    test_urshift_one(0x80010000U, 60, 0x0000000000000008ULL,
+                     0x0000000000000010ULL);
+    test_urshift_one(0x00018000U, 60, 0x0000000000000000ULL,
+                     0x0000000000000018ULL);
+    test_urshift_one(0x80018000U, 60, 0x0000000000000008ULL,
+                     0x0000000000000018ULL);
+    test_urshift_one(0x7FFE0000U, 60, 0x0000000000000007ULL,
+                     0xFFFFFFFFFFFFFFE0ULL);
+    test_urshift_one(0xFFFE0000U, 60, 0x000000000000000FULL,
+                     0xFFFFFFFFFFFFFFE0ULL);
+    test_urshift_one(0x7FFE8000U, 60, 0x0000000000000007ULL,
+                     0xFFFFFFFFFFFFFFE8ULL);
+    test_urshift_one(0xFFFE8000U, 60, 0x000000000000000FULL,
+                     0xFFFFFFFFFFFFFFE8ULL);
+    test_urshift_one(0x00018000U,  0, 0x0000000000000001ULL,
+                     0x8000000000000000ULL);
+    test_urshift_one(0x80018000U,  0, 0x8000000000000001ULL,
+                     0x8000000000000000ULL);
+    test_urshift_one(0x7FFE0000U,  0, 0x7FFFFFFFFFFFFFFEULL,
+                     0x0000000000000000ULL);
+    test_urshift_one(0xFFFE0000U,  0, 0xFFFFFFFFFFFFFFFEULL,
+                     0x0000000000000000ULL);
+    test_urshift_one(0x7FFE8000U,  0, 0x7FFFFFFFFFFFFFFEULL,
+                     0x8000000000000000ULL);
+    test_urshift_one(0xFFFE8000U,  0, 0xFFFFFFFFFFFFFFFEULL,
+                     0x8000000000000000ULL);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -219,5 +268,6 @@ int main(int argc, char **argv)
     g_test_add_func("/int128/int128_ge", test_ge);
     g_test_add_func("/int128/int128_gt", test_gt);
     g_test_add_func("/int128/int128_rshift", test_rshift);
+    g_test_add_func("/int128/int128_urshift", test_urshift);
     return g_test_run();
 }
-- 
2.35.1


