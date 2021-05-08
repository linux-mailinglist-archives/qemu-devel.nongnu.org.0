Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056C0376E21
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 03:51:06 +0200 (CEST)
Received: from localhost ([::1]:47560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfC7V-0006yF-24
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 21:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4i-00042p-IT
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:12 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4d-0003Ve-Pl
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:12 -0400
Received: by mail-pj1-x1036.google.com with SMTP id g24so6197601pji.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62inUraaTVgAI6l4Edj8J42LMU7wWh7GjwLbvqFnK/4=;
 b=fFy18+OadbygXgGrQQ4cw0p2IgbCeFaCIXub/VlDcu/WP2pP0CL0izgWE2HhFVSrtF
 KhN/ApbxwfwBC+6Oi7+XOcEJ2wh+qLNCnGxVvsWFWPgFPY4qnO45LDCqfPVvIwQsnKen
 nFH/Rm0M2RjWE5cNLEFsKeKrzAlZKs4BQVTnNVwrAHK3RErmxSSvSL7UUfNpM/sVQsua
 2ssrns8Xv/FSRSY8SMKs5E8m0lGwU8OgkZdl90kCUcivQ6jfaqesI07sSRdkFvgfDngS
 XI/Qxm2AdltXkPTqHB55JgcwemBpKEPcdnR289z0gZVj4FDvDpP+jPFwVZf6iM3vDReb
 ZZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62inUraaTVgAI6l4Edj8J42LMU7wWh7GjwLbvqFnK/4=;
 b=Hg3i8ySDQXIp5fDuthe7nMRqsDpTJETcczZSJWqH3z4eDwcgNjh7SghfmyQzNZJc93
 X2fS4R+wWotPmxgKGQX+SmWxjkY4BTjtcwttyMWqZdpYA0hbuCObziJEnGKiiQpcyqL2
 OuJu1NAs7Y86Z8lrMGmo58koC4K/zMiZ0iUGzmvffFR+Eru/XRkCYDhAJCKTaTxy1v0d
 cWd2kBDKDlmp0XoZJEDECM8g68QG3VE6vdLhIPyJybu2+I+XAAj2P+sSafMKio2vM3Td
 QoLinwv0s3h8v95PS8NgS9LAtwOomP+8WEEKI0EAFrF6eRT3PrN1dFgHBaeFV4W3nFOz
 uXIw==
X-Gm-Message-State: AOAM532Jx3mPf665LOLuH+dLHJ/ERE+anJX0pfHTNJO1uS8Kmzff6e0s
 QQQZ7d26u3MEF2GGtz5v9yjtXyMuxvJHVQ==
X-Google-Smtp-Source: ABdhPJyO5i++x7gCTwjUNbeacpnamd00adP4QhJVM4siy8lfNfFzS7hnmJXwcT5FLPbSlDlqFJNg4w==
X-Received: by 2002:a17:90a:ea92:: with SMTP id
 h18mr14025808pjz.105.1620438486534; 
 Fri, 07 May 2021 18:48:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/72] accel/tcg: Use add/sub overflow routines in
 tcg-runtime-gvec.c
Date: Fri,  7 May 2021 18:46:54 -0700
Message-Id: <20210508014802.892561-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Obvious uses of the new functions.

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


