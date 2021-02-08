Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B65312902
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:43:13 +0100 (CET)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wW8-0006PN-C3
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR7-00010w-9W
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:01 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:32987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR5-0005gH-3O
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:01 -0500
Received: by mail-pl1-x633.google.com with SMTP id d13so7034662plg.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTk7Zu1K9am+nHTK4Qgzw1qdbWz4Og49PpMunTWLZww=;
 b=qsKurlwuF1Sziob0r/Jut42Pv1j1M6EDjm6SmvdzCSA4QGdv3U3GoII8FRRcO3SxR2
 ctb957mgB3SjJbH4oQXxSOOvffYwpPaxre39HtRD6vRJWX9OWD/bD0vMHiLtGEC099xr
 D3PvKSGhq7lm4lkr5TeE2q25UDp5FnNtf+ugydSnEhgF/8SL/OUUgN4zjq//5MdkYpp1
 fqAntENs4fW3H3L7PN6mvfhsZagTL36a1NQSQt6OlAgkp8APMZgHIkefF51j6dGqOYBC
 9O9O3y+mQ9Fd2Bfkmg6KPpRY3uZgPuBQ8VQPRjvDbYpEf8BdgUbH405BmcFxH883hH4a
 6qZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTk7Zu1K9am+nHTK4Qgzw1qdbWz4Og49PpMunTWLZww=;
 b=F4R7WuAdf2oJ3AYCv5oYcTxgSLvikEuGAsHv8nlUETTqTOcp+1luFObRCD6uRMZ8dI
 ER8N1XlTGJTCDcwdN20ku4bG5LH3MPhYa8GAB20LHeYKBdDydhBSHR5+2365H7RGaXjM
 6Nvctxjnb9OtH1z9DH6rJmvczPwbG14I2rc8FJdNYrby+EqcsfQT/P46j//KRcevNhJ5
 i4vKIXV/9QDre6mtSgMf4FbSDBfihFi+H7xz6caI24y6OgHNj9JsFkFhC6mp+K29+6GB
 /eSoMUMXSClBd2RaP2xpYLDqD/p90IPXcJ4qMpkByWLRUX62C/7Hyz7BjxtWja+Vopc3
 W8pA==
X-Gm-Message-State: AOAM5331ogDzQPDRFvE6cOpp7brq+i2IPRqSAPMB0AdHSGBhonP7ihuN
 vDcmJ71GmXqX8F6QquIPXbMrMF0BxfdHTQ==
X-Google-Smtp-Source: ABdhPJxfInwqNYAqbNVHnfK0hbUYy7MGRJV3eAVhbxKqriS2TcBAV8izkTvtnja+hDhL2rG8AHWGBA==
X-Received: by 2002:a17:902:be0e:b029:e0:5b2:659e with SMTP id
 r14-20020a170902be0eb02900e005b2659emr14362854pls.74.1612751877654; 
 Sun, 07 Feb 2021 18:37:57 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:37:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/70] tcg: Split out tcg_raise_tb_overflow
Date: Sun,  7 Feb 2021 18:36:44 -0800
Message-Id: <20210208023752.270606-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow other places in tcg to restart with a smaller tb.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 63a12b197b..bbe3dcee03 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -346,6 +346,12 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
     s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
 }
 
+/* Signal overflow, starting over with fewer guest insns. */
+static void QEMU_NORETURN tcg_raise_tb_overflow(TCGContext *s)
+{
+    siglongjmp(s->jmp_trans, -2);
+}
+
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
@@ -1310,8 +1316,7 @@ static TCGTemp *tcg_temp_alloc(TCGContext *s)
     int n = s->nb_temps++;
 
     if (n >= TCG_MAX_TEMPS) {
-        /* Signal overflow, starting over with fewer guest insns. */
-        siglongjmp(s->jmp_trans, -2);
+        tcg_raise_tb_overflow(s);
     }
     return memset(&s->temps[n], 0, sizeof(TCGTemp));
 }
-- 
2.25.1


