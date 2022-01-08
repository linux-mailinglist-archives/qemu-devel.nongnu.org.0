Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F90488295
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:48:17 +0100 (CET)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66fY-0004RR-J4
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:01:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65LT-0005eq-Nf
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:36:55 -0500
Received: from [2607:f8b0:4864:20::1030] (port=53022
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65LS-00047D-4I
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:36:55 -0500
Received: by mail-pj1-x1030.google.com with SMTP id pj2so5883021pjb.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zVgPy1si4yjxxz6mZk4TkdamYUEEeS8CxpBgD8+viKw=;
 b=QhjJqBqyHaj8QOIEYINho78lXXWmEOfCvSjca27mxgIsuJq/GjWBUdD1G7EJtWk2Xg
 FKTAvRWK+eXiGEpfLIIyNe99i31JaIsf+S2rcs972jV6g2jUQR8YAHCcQfM8KSjn2IyR
 S4qwzPJY4ptqE4ZAfJ8r/AQotW4ahBiqHhU2Qte56eYzMFdMMxg5VWO9GZvRpnJbVyc2
 mhaMdmEwNwaceYBXqSfocgh16+B63uuKRKYKCgIjRWbldtU7GlWG4B4dGsm9pQrypjPC
 mXM73DlYr9qabguBzEm1lV8/CXkISNe17J8Rkwb3YzV1tI2ZIoyiszbBVlrByuMdsBYI
 lB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zVgPy1si4yjxxz6mZk4TkdamYUEEeS8CxpBgD8+viKw=;
 b=qBGjTsdO2tOI0lvlD3zfAHW0qfZg8EjafMWRgvjaKRhuSs41FcdG/R/CUPRG5/V7a9
 zHQwxbFPU4xzCrUEfqYZfvZLxIwX/y/oMfwkSnxMkBigPzM95vp5wpFQyzNLr8WlKNt9
 8nHbdMW5+4yh+CIG647lERxnJ4GclCDMRAcaCeCrdZmyYxZ8tktDJ9BR7oqqHmWVGPTd
 v8C2EwYi1WxpRuB6gSYuNHGc0owSd6zr/2GJhlogOB8Kl4Rfwi8PbfspY/4dPEPcASz/
 9Aoa7d5y+syO8C9iw5EIDiPLxYpkLrX/G7sV4iX1wn5Dcs9ZXeZ+4J4MCdCdPESbmTxr
 VPbA==
X-Gm-Message-State: AOAM53374cWmNh6RkML4cQMjt8NeHeZZMUoseS33VIxCDAi3+l38EWRz
 AVemwuqsvLpRRTllGWLicX+LqjLuLsqhiQ==
X-Google-Smtp-Source: ABdhPJwDrorNwSArxmtJeob9FL+c88qag/UuKBLXL9NCKIQYfGfkvlMORXOEEHVD1/sODRBgH7JW3g==
X-Received: by 2002:a17:90b:1c05:: with SMTP id
 oc5mr19091105pjb.31.1641623812876; 
 Fri, 07 Jan 2022 22:36:52 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:36:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/12] tcg/mips: Move TCG_GUEST_BASE_REG to S7
Date: Fri,  7 Jan 2022 22:36:36 -0800
Message-Id: <20220108063644.478043-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063644.478043-1-richard.henderson@linaro.org>
References: <20220108063644.478043-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No functional change; just moving the saved reserved regs to the end.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 5702a6ad92..1bfe6aea0e 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -86,7 +86,7 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #define TCG_TMP3  TCG_REG_T7
 
 #ifndef CONFIG_SOFTMMU
-#define TCG_GUEST_BASE_REG TCG_REG_S1
+#define TCG_GUEST_BASE_REG TCG_REG_S7
 #endif
 
 /* check if we really need so many registers :P */
@@ -2555,7 +2555,7 @@ static const int tcg_target_callee_save_regs[] = {
     TCG_REG_S4,
     TCG_REG_S5,
     TCG_REG_S6,
-    TCG_REG_S7,
+    TCG_REG_S7,       /* used for guest_base */
     TCG_REG_S8,       /* used for the global env (TCG_AREG0) */
     TCG_REG_RA,       /* should be last for ABI compliance */
 };
-- 
2.25.1


