Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3400381ED0
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:38:18 +0200 (CEST)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG2D-0001kX-Rr
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyh-0007DP-Ul
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:39 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:39929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyf-0007hG-1b
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:39 -0400
Received: by mail-qt1-x82e.google.com with SMTP id f8so3012693qth.6
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WCooW+37Z0FxZm2Vga9KGLb5BfCR58QdDfT18gmnbx0=;
 b=ZeDISgmZHPvHyI1DWuDMQ6dhjakWxLPKfcGiem1eP6J8lJEiQUhi2zdW6oS49jpaoh
 rD4ZVb3x9zHlaH97Nd3rGjBIvfmIIvvEvFg1Gh63K1GN1QO70gym4x56EjYpgEt4LghK
 94xCSqLz1ulbsvLDUf1JmXfZyEIKVGBjkyqTNl7ix7JpzzqUCp2eLgjIiA7hHpPYhVHX
 sWS/ax2/4JIlVBYDFOvhjgmMUXDngEqXT63xzX2DJarVAii/moLgmzNmYk3vd7W/SyL0
 aEJhHSkCrlLqwe4O4dUzXhlhmA2CnphjywYVk66a6/xO/JRvUK2/kEuzMTGRj8zJi0vk
 8a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WCooW+37Z0FxZm2Vga9KGLb5BfCR58QdDfT18gmnbx0=;
 b=Kr79T1VMYJeZwjLpgeXmxHDrv/X2f2Mqa11o49Cn/vRYp48m39X7eRuCNp2RqyXbsu
 tCZo2MdMWarNB9IHgwaFYEWKuuJ45U1e8mQdLCrnhaVsp55JVF+OxSeAMUhPR+QKFoJa
 QUyDvN9S6FSVt5yWMGlrEka9piKS4nDAfk0bX/4LB7tO5KHZxBfRp3/jIqqWwztW/d0r
 PLfXJtK57amc1vYtGdSUuyHg7688dQtwPcKkqVqr36rpckbQoSLTUgU28rwkXsiGbF1i
 E5YbUuDwZYnce0u6WseEXYXE1FYvsKH24GEjcM/QaB8BbYavQ+GabrrLLMpIBAiDKLVi
 yJ/Q==
X-Gm-Message-State: AOAM532TXdhIekadVVEPFkq+aSiZQXbyfqGh2qmWVY9mL/myfPWFpLZi
 wF9hMJnWRMUMuK/dvb18JEvznehmTEjMMRotK38=
X-Google-Smtp-Source: ABdhPJw40qS2V77qSnmI5m39un9s4e5rIBdm2KRn9cMFm1JhoYFsBU6z0K/TDKrufpln1cengorigg==
X-Received: by 2002:ac8:4750:: with SMTP id k16mr35381823qtp.13.1621168476251; 
 Sun, 16 May 2021 05:34:36 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/46] accel/tcg: Use add/sub overflow routines in
 tcg-runtime-gvec.c
Date: Sun, 16 May 2021 07:33:49 -0500
Message-Id: <20210516123431.718318-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Obvious uses of the new functions.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-runtime-gvec.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
index 521da4a813..ac7d28c251 100644
--- a/accel/tcg/tcg-runtime-gvec.c
+++ b/accel/tcg/tcg-runtime-gvec.c
@@ -1073,9 +1073,8 @@ void HELPER(gvec_ssadd32)(void *d, void *a, void *b, uint32_t desc)
     for (i = 0; i < oprsz; i += sizeof(int32_t)) {
         int32_t ai = *(int32_t *)(a + i);
         int32_t bi = *(int32_t *)(b + i);
-        int32_t di = ai + bi;
-        if (((di ^ ai) &~ (ai ^ bi)) < 0) {
-            /* Signed overflow.  */
+        int32_t di;
+        if (sadd32_overflow(ai, bi, &di)) {
             di = (di < 0 ? INT32_MAX : INT32_MIN);
         }
         *(int32_t *)(d + i) = di;
@@ -1091,9 +1090,8 @@ void HELPER(gvec_ssadd64)(void *d, void *a, void *b, uint32_t desc)
     for (i = 0; i < oprsz; i += sizeof(int64_t)) {
         int64_t ai = *(int64_t *)(a + i);
         int64_t bi = *(int64_t *)(b + i);
-        int64_t di = ai + bi;
-        if (((di ^ ai) &~ (ai ^ bi)) < 0) {
-            /* Signed overflow.  */
+        int64_t di;
+        if (sadd64_overflow(ai, bi, &di)) {
             di = (di < 0 ? INT64_MAX : INT64_MIN);
         }
         *(int64_t *)(d + i) = di;
@@ -1143,9 +1141,8 @@ void HELPER(gvec_sssub32)(void *d, void *a, void *b, uint32_t desc)
     for (i = 0; i < oprsz; i += sizeof(int32_t)) {
         int32_t ai = *(int32_t *)(a + i);
         int32_t bi = *(int32_t *)(b + i);
-        int32_t di = ai - bi;
-        if (((di ^ ai) & (ai ^ bi)) < 0) {
-            /* Signed overflow.  */
+        int32_t di;
+        if (ssub32_overflow(ai, bi, &di)) {
             di = (di < 0 ? INT32_MAX : INT32_MIN);
         }
         *(int32_t *)(d + i) = di;
@@ -1161,9 +1158,8 @@ void HELPER(gvec_sssub64)(void *d, void *a, void *b, uint32_t desc)
     for (i = 0; i < oprsz; i += sizeof(int64_t)) {
         int64_t ai = *(int64_t *)(a + i);
         int64_t bi = *(int64_t *)(b + i);
-        int64_t di = ai - bi;
-        if (((di ^ ai) & (ai ^ bi)) < 0) {
-            /* Signed overflow.  */
+        int64_t di;
+        if (ssub64_overflow(ai, bi, &di)) {
             di = (di < 0 ? INT64_MAX : INT64_MIN);
         }
         *(int64_t *)(d + i) = di;
@@ -1209,8 +1205,8 @@ void HELPER(gvec_usadd32)(void *d, void *a, void *b, uint32_t desc)
     for (i = 0; i < oprsz; i += sizeof(uint32_t)) {
         uint32_t ai = *(uint32_t *)(a + i);
         uint32_t bi = *(uint32_t *)(b + i);
-        uint32_t di = ai + bi;
-        if (di < ai) {
+        uint32_t di;
+        if (uadd32_overflow(ai, bi, &di)) {
             di = UINT32_MAX;
         }
         *(uint32_t *)(d + i) = di;
@@ -1226,8 +1222,8 @@ void HELPER(gvec_usadd64)(void *d, void *a, void *b, uint32_t desc)
     for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
         uint64_t ai = *(uint64_t *)(a + i);
         uint64_t bi = *(uint64_t *)(b + i);
-        uint64_t di = ai + bi;
-        if (di < ai) {
+        uint64_t di;
+        if (uadd64_overflow(ai, bi, &di)) {
             di = UINT64_MAX;
         }
         *(uint64_t *)(d + i) = di;
@@ -1273,8 +1269,8 @@ void HELPER(gvec_ussub32)(void *d, void *a, void *b, uint32_t desc)
     for (i = 0; i < oprsz; i += sizeof(uint32_t)) {
         uint32_t ai = *(uint32_t *)(a + i);
         uint32_t bi = *(uint32_t *)(b + i);
-        uint32_t di = ai - bi;
-        if (ai < bi) {
+        uint32_t di;
+        if (usub32_overflow(ai, bi, &di)) {
             di = 0;
         }
         *(uint32_t *)(d + i) = di;
@@ -1290,8 +1286,8 @@ void HELPER(gvec_ussub64)(void *d, void *a, void *b, uint32_t desc)
     for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
         uint64_t ai = *(uint64_t *)(a + i);
         uint64_t bi = *(uint64_t *)(b + i);
-        uint64_t di = ai - bi;
-        if (ai < bi) {
+        uint64_t di;
+        if (usub64_overflow(ai, bi, &di)) {
             di = 0;
         }
         *(uint64_t *)(d + i) = di;
-- 
2.25.1


