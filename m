Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97156DB862
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 04:52:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyYR-0007TE-5m; Fri, 07 Apr 2023 22:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYN-0007PN-L4
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:47 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY6-0005Wm-4x
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:47 -0400
Received: by mail-pl1-x629.google.com with SMTP id p8so425630plk.9
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDeASIhXoXuX3vLvF4wYaR7o+wyDzGwiI17/AXuSlGM=;
 b=bX5r0PoiTGPh+kw7i5vjujE6O4dHH9iKb23m1GNMZ5EBw8thUk0VNZ5M5gKuLfMjKB
 ijrrv/6b8FMM4djGDY/HE2cizf2MhcX5xxATBXSQzVc4TKfJZYcfhRk70AUqmp8s4dEZ
 KLRollHOEjdkgFi+mbPDX9fTD1RA3dwQ1jkrKd1HzPbFLORIe3Kx+D9E2+bJeyq6lpEg
 u6PRVs1N8HyzdKhNQVFQLokVihNorFtpvuw2h7Ti5RjUzQY6sJtxb3O9Xwh8Hso1xVn/
 Gm7KTTYugjTh/AzTxX9bOW55MkEuwXesNG4J5GnKzVwsdMexDnC3lL+nbKGb5MYNHICN
 JgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDeASIhXoXuX3vLvF4wYaR7o+wyDzGwiI17/AXuSlGM=;
 b=RZda/1tL3/RvwjaEtd5dfnxoDSp+e/W7sUDPTZPNKbegyAKKF5sAjgQhn6/3pVgbOZ
 PaxTQbK2atTqhTtd0s8s7KPbqQ37Uhkj56qRGy5+mjNXJLoeLAjhyDR7T7wxy8NHgqLH
 Zp4IcO7EoLTDAmrKY1fp3WdM7xkwazxsEQt5Vl1v1/Mib6qkoQFwleJ/Vd3ct9c/ieCB
 jq8oXiDItz0QvIbdAOkWxWFvw8lh29rhFI/YPvmYbXTWY9hvCAY/l+4HKDH8ELA/hx8r
 ut20WZw10S4nDGpZXJB5xxt4zp1jhuagapCbTlkw6NacEy40wzGoKvVVb5u4e8FyK+Ea
 fMSw==
X-Gm-Message-State: AAQBX9da1ULZVpu7e2OG0g4xwo2ew2q3lsRiPYGhamr7cejLj96dIUqm
 XymVaTHv5yEY250ohErDr+kzwUtRwWSBoTG8BpI=
X-Google-Smtp-Source: AKy350brlMqd7F1ibt7xsBb/+NvTFqDEQXuQQa/rlEhkM0CPq/wGUQjTbq5nKEDqTHr1drnE8Y8JDw==
X-Received: by 2002:a17:902:c111:b0:1a2:9051:f0a3 with SMTP id
 17-20020a170902c11100b001a29051f0a3mr4066030pli.24.1680921809232; 
 Fri, 07 Apr 2023 19:43:29 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 14/42] tcg/i386: Conditionalize tcg_out_extu_i32_i64
Date: Fri,  7 Apr 2023 19:42:46 -0700
Message-Id: <20230408024314.3357414-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
index 818e7cbc3d..71a2bff234 100644
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


