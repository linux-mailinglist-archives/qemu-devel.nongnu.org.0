Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1400E6DCEC7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:10:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2Sr-0005Hl-Qf; Mon, 10 Apr 2023 21:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SN-0004eJ-W3
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:00 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SJ-0000V9-Td
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:05:58 -0400
Received: by mail-pl1-x62a.google.com with SMTP id la3so6096364plb.11
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5kfPeOZxNEGGOBoG05frDf+J9LPWAmPL1Hbxg7J1Ic=;
 b=pwXZhKpan0IPi+5Q9W/jlStrSUj+zZ9TCBlwY7LbNs0YF1GZ3cjFcZCFsjqd+OGUTk
 NGoji/Ov55oIYfoi1MI45Etd0JAE31RP3kV/NAs5qCDacNQ1jm0iL67lGpehWrvtYtHh
 +kJ9nHlZCYtFcgfsWlp1BgJASPmQA2MtBea/4WO4z1eWrH4v3QvbckJSoFLi23U32CQw
 8zGgpiFLY/O2vi/k0Q5VbQkoUVLwritOLH420cjI/ErfVkC28vhvD7uj1ieYiCqyOhfG
 Wh8KVNGrwxHFdIJ8U9n3HK/atCpYOX6KZcIn2dRNbE0WX9Pu1Fc2CviDsG/Ry9bbqyVd
 F6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5kfPeOZxNEGGOBoG05frDf+J9LPWAmPL1Hbxg7J1Ic=;
 b=Hb+RoBCf6Wg299JV5pSMKy5MchtMdmtFoJm88O0LPPETwShC64k7fbQRRX5uLOXJxS
 RLuTmBQz5xRfXY1bOSKpietFGlQ4raqVVVGgdHUQR/QiI6/4OUKXuBEPQ1xrPsyVDMyg
 JIWapu9xPXN72B4M2IDgBO/oPlkuiHi0hTN+MEwfdS5QM6XitsRaGdMfjrRRlxSBjk1x
 ROouibgrmQjJUIQPGGXrTevpbOvonMSJ5z0AFYn/dUq4DAuXLjKEwoVnbsb4CM+R/uzf
 AlB2ETOjbSsYtk4iooNFvWJpsppqwGW/kFrZ0It84htLUg69XGKXHxvs5YRbCcGwcU18
 uqXA==
X-Gm-Message-State: AAQBX9d0inkood2cme/TAIkZFNO4HS2c8BOosLelfMHSmq+K4B+wtuKk
 ZTW2noppRU09I3A8RK3qFK5l1SI74c+hU5VEa/LyGg==
X-Google-Smtp-Source: AKy350Z9aWkHnIQe1IjMeRs24pay2g1n2X0EuVCXb9V/Jpr3NkkvO87ISMC7ovUl8QdQp9G7jClPNA==
X-Received: by 2002:a17:902:e392:b0:1a3:d5af:9b73 with SMTP id
 g18-20020a170902e39200b001a3d5af9b73mr750305ple.58.1681175154474; 
 Mon, 10 Apr 2023 18:05:54 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 14/54] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Date: Mon, 10 Apr 2023 18:04:32 -0700
Message-Id: <20230411010512.5375-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since TCG_TYPE_I32 values are kept zero-extended in registers, via
omission of the REXW bit, we need not extend if the register matches.
This is already relied upon by qemu_{ld,st}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 40d661072b..a156929477 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1306,7 +1306,9 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg dest, TCGReg src)
 {
-    tcg_out_ext32u(s, dest, src);
+    if (dest != src) {
+        tcg_out_ext32u(s, dest, src);
+    }
 }
 
 static inline void tcg_out_bswap64(TCGContext *s, int reg)
-- 
2.34.1


