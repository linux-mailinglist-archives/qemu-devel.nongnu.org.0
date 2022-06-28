Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EBA55BED8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:43:00 +0200 (CEST)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64w6-0008TR-LV
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jm-00026G-Ca
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:21 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jk-0000Y5-VU
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:18 -0400
Received: by mail-pg1-x532.google.com with SMTP id g4so4176140pgc.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JTrVkXiF8A1/K/SnVM2m98TUbaMDWvrW5Gsdia3GE5w=;
 b=zpL9D2ZTPgE6bxTr0m803jXyixiJXkm7MyexsxIyPg1oD9xA9xAbVyYX4AqKxQxk/3
 idWo21HUrtLESE9WrxfB3thd2x+5+9NERN76/EZ34SiMEz1mZt+I3UE7btDsq49ROUpO
 RH6FLMl2B672GQWZDnU0J8RtWcqFmO1YaBwpMa9Bcis9UNxIhurCxBw3fh8ZANGL5hXg
 VPE312FwYw0t2uIpp/Z5a8oXAXWw0wXeLP+SEbkouuTIhUf9064DBOK8sPXwx3OQJdFC
 LII37v5cdmkC+IJ1UBiut/QldA3h26Qbhz1QserfhSJ7qups8w+y4Cu1LH2HwgbDjnTo
 roIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTrVkXiF8A1/K/SnVM2m98TUbaMDWvrW5Gsdia3GE5w=;
 b=svSYDLbFOI6MfCyJThf7XnM/O00DLO+mg7+qgHZPcZdhku02FC/Wm8TnnJ5rYnV3Ih
 EA6dFqE2GjIporTJvoerfdENTNQytgp5dlEhcGojrsq3Odfmr2UzJMdiZ5NxouxWnlWq
 yOe5WYEuWgtIvIVRZSQNl8l60LkNhfk2q7lI+Dr8EPm8SSKLiE8kzbBskAb9IGs6Y/b7
 Ko/X3ldPDzLHnEFAK9T9SXenay9/Og92T+MhNt/LCArqLFxvTWn0i3pxq3G4JCY6UIh7
 XmSfhzP0RdBjP38DF4KaYAMByqaIxRFICA2LkzpEuGwp3zj6yfJtoRAtwMvFIrOeTYVl
 W68A==
X-Gm-Message-State: AJIora8R/oETL3JA7XK1VZ9sAOJPLCUTzdbXmqFY661dwRHqADbpeZCu
 IXRZzep534oqvIKSpKLUkFsUa+7xg9Z8Jw==
X-Google-Smtp-Source: AGRyM1vKF7JtLsctrSD/WthDWn+rpRhr/6vaxxI9Utka8CIm5TeEnARz0VqN8jehdiOng8D6Wp0D2g==
X-Received: by 2002:a05:6a00:c91:b0:525:8c3f:269 with SMTP id
 a17-20020a056a000c9100b005258c3f0269mr2830253pfv.66.1656392355521; 
 Mon, 27 Jun 2022 21:59:15 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 51/60] semihosting: Use console_out_gf for SYS_WRITE0
Date: Tue, 28 Jun 2022 10:23:54 +0530
Message-Id: <20220628045403.508716-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index d61b773f98..1a1e2a6960 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -437,8 +437,15 @@ void do_common_semihosting(CPUState *cs)
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


