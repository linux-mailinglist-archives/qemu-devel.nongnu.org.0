Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9404518F47
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:46:38 +0200 (CEST)
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzPp-000537-Lt
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZV-0007mt-Ac
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:33 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZT-0006Gw-O4
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:33 -0400
Received: by mail-pj1-x1030.google.com with SMTP id fv2so16244417pjb.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WUEAwRDb5qP1q/+HL6ZwAjNwTCoe4kc7v8P7IB3q304=;
 b=m8wAy9WckIp3wIFAFtgEOxPx2juQE7YbPgyd8WcRtnFEemxKCNbo9DVw7nBvcmMtrx
 9m4KGAh2gAFenR0HagczRcCuVPoxMa9uDu2WJ/RjxR0ATzTHz74LC2nfxdgV5TXVrzaI
 vNMj7tSp88uJwwJsAzYl/93VHXKRWElntX5YVUHo5N8K3628u0RQ1pqgARMaGit8yZSu
 kUH2xecQc5vgLLcHhIx1qQCdwFAqDRmVkCMC/MBlFEisZXEJcGtb4FA9y4VwsVWnJpUD
 8PV8OW5PJz78WdL6GoMijO20/QU3O4wk3uqSYKZLmXO94tfLidmPDlCdZfPypRSPyIH1
 qMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUEAwRDb5qP1q/+HL6ZwAjNwTCoe4kc7v8P7IB3q304=;
 b=IUBbU0mhYimupL0m0r+G3A+FYyOH4XSGOfX2sAeZpMozIdIHkUuTI/verXh2c9PKIr
 ZJZIZAFx2Qf1wAAy0zI2MauiyDsnT8w82bJiwFOgIJHEKL9azBflDaONNO2oTkiR5fy3
 spN0SRkOBatpZiuaKhdKlUMsvwH9TY1kL+WX6KpcxEKdUyEDSEW404jbxwYjRC/488zV
 vkSpf4R3DFWcbbv2NKQUfGHJX4SF8SVmRqn3wDw7RrdAF8+OyY+5hjb2Xz2VFxiG++7n
 cR1SzAWp+08hVEbPaxLMrq8f2AuO1Jm24GAgf4IrNdnxNIqGs5LWyfpbLGDMD8+l/rlQ
 h81Q==
X-Gm-Message-State: AOAM530iFWseTGOIC4oEFqZ6WArQHyD28+P3e985LdNvXOn6SJ3xnXct
 fMS6b2kXvSJ9IsuGFoi7INpURsjGJ+NFEA==
X-Google-Smtp-Source: ABdhPJz88941/fanPcwDeUW0Aicyt5/bUoNl4ktQztnAEbz1fK4+aGzIcPRIcXlLstFcwLC7SVlGKA==
X-Received: by 2002:a17:90a:af98:b0:1d4:67d4:d122 with SMTP id
 w24-20020a17090aaf9800b001d467d4d122mr6495288pjq.166.1651607550370; 
 Tue, 03 May 2022 12:52:30 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 45/74] semihosting: Use console_out_gf for SYS_WRITE0
Date: Tue,  3 May 2022 12:48:14 -0700
Message-Id: <20220503194843.1379101-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 430cb4167b..3f8e1b70d1 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -427,8 +427,15 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITE0:
-        ret = qemu_semihosting_console_outs(env, args);
-        common_semi_set_ret(cs, ret);
+        {
+            ssize_t len = target_strlen(args);
+            if (len < 0) {
+                common_semi_dead_cb(cs, -1, EFAULT);
+            } else {
+                semihost_sys_write_gf(cs, common_semi_dead_cb,
+                                      &console_out_gf, args, len);
+            }
+        }
         break;
 
     case TARGET_SYS_WRITE:
-- 
2.34.1


