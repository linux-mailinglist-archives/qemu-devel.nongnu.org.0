Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F18B5456C0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:53:18 +0200 (CEST)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzQ5d-0006cm-87
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzPzc-0001sY-Ac
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:47:04 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:38756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzPzZ-0003of-FL
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:47:04 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 123so12659659pgb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z2nY90WUsKFnNetakqOAHrGjM16SH+ECu66ryRheE1s=;
 b=cPMe0a3lZu/7Ifu8djXBN8HWj8JP5bMk0ioF0HFRfkghojF215SJG1I8IfvudChrAV
 dL0h2/DhI5/UkNV0OXHHnTd7ZOZqtx/Uwg7BV8VOPbIW8BCfPu5qT11LCzKWDG4KHIxW
 /C0iw1616xIzvQcVL3tk7UHe5iFQ/1/DXk5nl7YCULOG6ym2toHX03HEPYkjDvUvNWTx
 M9RziZS3royCbwrhlxNXKgNkbh82fYnfMTMgPPlpVFjh+WaF1JSwPaJ8VSrPRy0fzgk5
 ecrbI/ie5ClzEige/0g8QQ8sNCwtexEBe7canNFcacjlN9Iq2peZ8IBsrM6pOVxDgAWw
 NeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2nY90WUsKFnNetakqOAHrGjM16SH+ECu66ryRheE1s=;
 b=6JW3Lbgj5ucl+oHBJ/DSLx66aMVlX6X5O8apIUIOkSdZ71so79k/ejpgDH/hQTR+3L
 7+unncVa/mW4cSWGgmd9hjECR1h+3hN6fHZa8ll7zSgYmDzauDe5f9ZXw9Kv/1xKKAMz
 EtlcgnnCO/bg4KmrBB4ABjjd8Fs8g6SQQCWISVCdBdqJFWnuW/wgZxYPZSo8FIulS1yl
 GHKtXOxy9lsy9KJy2ATtL6+Fm7AeDMd+/h4ebpmvTHOSYKtssOD8gBdBmSEPjJhLlKs1
 JYcZbLKdEk7uo5ZlVoipSHumhshfeaUEnHqN3N5b3FI3SSUXbIoVa2yjseJ/uoiTT0h+
 JKIw==
X-Gm-Message-State: AOAM530GlEWf0Pg2fhhSCj2s7YtOtyTj2BaU2kctGIg6tEB1e82cSUiS
 fybD1AWWjHpNSJYiZMCjc6HroXmxxSx2gQ==
X-Google-Smtp-Source: ABdhPJwYbu0lXL6NaQaxL/wRWr8p9NbFjgPh+aKAqKNc4+CL7M1z5BEKof0zSwVLmXWY+eYxyoLQig==
X-Received: by 2002:a05:6a00:2349:b0:51c:29c0:82f6 with SMTP id
 j9-20020a056a00234900b0051c29c082f6mr20155487pfj.32.1654811219207; 
 Thu, 09 Jun 2022 14:46:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 gw9-20020a17090b0a4900b001e2f6c7b6f6sm179167pjb.10.2022.06.09.14.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:46:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] target/arm: Adjust format test in scr_write
Date: Thu,  9 Jun 2022 14:46:56 -0700
Message-Id: <20220609214657.1217913-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609214657.1217913-1-richard.henderson@linaro.org>
References: <20220609214657.1217913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Because reset always initializes the AA64 version, SCR_EL3,
test the mode of EL3 instead of the type of the cpreg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ac9942d750..d6818f281a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1738,12 +1738,14 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     uint32_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
 
-    if (ri->state == ARM_CP_STATE_AA64) {
-        if (arm_feature(env, ARM_FEATURE_AARCH64) &&
-            !cpu_isar_feature(aa64_aa32_el1, cpu)) {
-                value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
-        }
-        valid_mask &= ~SCR_NET;
+    /*
+     * Because SCR_EL3 is the "real" cpreg and SCR is the alias, reset always
+     * passes the reginfo for SCR_EL3, which has type ARM_CP_STATE_AA64.
+     * Instead, choose the format based on the mode of EL3.
+     */
+    if (arm_el_is_aa64(env, 3)) {
+        value |= SCR_FW | SCR_AW;      /* RES1 */
+        valid_mask &= ~SCR_NET;        /* RES0 */
 
         if (cpu_isar_feature(aa64_ras, cpu)) {
             valid_mask |= SCR_TERR;
-- 
2.34.1


