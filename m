Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5EE31E0E6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:58:40 +0100 (CET)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTuA-0001TZ-Qq
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMS-00013C-Nz
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:48 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMR-0007bg-8m
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:48 -0500
Received: by mail-pg1-x529.google.com with SMTP id 75so5822996pgf.13
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EsUj7sq9+NLQtwJZ+3yHUWsYmpE8j3VuEo3uruSYCgE=;
 b=iJz/xoMHZ4ulwMF9GOFv/Tdv/yPQI/L1pBEFzSM7eMlf1OqIWjXTm0myDO0etsXwLm
 8VXyb81k9PI9oqAE/md8GkW9Nk98pAPZKtmov9dAibSVidn5CQrsm3yFpBqg7g7rC5lx
 taS56WXhmVKJSoEM+QvbJT6IVrHQu5cI4mLR2b/yDzJycn8wnzVgscFJFUvR8aGjAMZn
 PAmnYk7brUuusF68aGD9eggXwUQf9geXlPUBar9TyBHBSIl2e3+3eKunr81OLUuiz5oB
 7RNwBFG+h5PnrNYo6q9SYnCWOKoMahvN/pa/CLhoM0/Vkq24OzIQYD0VzqjOMYZQv3ep
 e/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EsUj7sq9+NLQtwJZ+3yHUWsYmpE8j3VuEo3uruSYCgE=;
 b=GsWXSD9y07BH/mI0ZtQSAfeIiCkagtZ4VBD0vs+K+ZMHSiN9OZXuX6zilR5DeUPwKF
 45ia5bL3lpSDCYw5ERENt59/HIFku3taXOD5FW/R8t4J3+X28py31LXA0gY1pmBaaLmi
 LF2t1Yzr53DTr+eePAhv9p8RYfNVaGnW+eHgQMlePrJnIPpDnqgZ6vhCVrAgF1tG4qC4
 AbJsMds9ZPAlnJsa5RdcOqPNL1NwXUFP2ilwIi9WVfjos3damUU6yvesv+hTUC+5CXx0
 BDpOzB3pOi+IvHvHHf1lw03ezJjhn+LBDG5NsHA4kCo2uqweYHiOwmWOK072A5YY/7mT
 2/KQ==
X-Gm-Message-State: AOAM5302yCZHHMg3L5+jTzcsR8b9FxsvDjPq/h+CN568oQhNvqFWrkrE
 k3UPAWGriEqtU5H40/miqblKz2oDXZRmpQ==
X-Google-Smtp-Source: ABdhPJyw/chvsWySh45xatYyFRz4UH1pxWyR6cUjIvhx/VTexNdXp2mlg6fsskw5+vVzX9UaTw8qjQ==
X-Received: by 2002:a65:4bc3:: with SMTP id p3mr952800pgr.318.1613593426056;
 Wed, 17 Feb 2021 12:23:46 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 43/71] tcg/tci: Split out tcg_out_op_l
Date: Wed, 17 Feb 2021 12:20:08 -0800
Message-Id: <20210217202036.1724901-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 707f801099..1e3f2c4049 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -283,6 +283,16 @@ static void stack_bounds_check(TCGReg base, target_long offset)
     }
 }
 
+static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tci_out_label(s, l0);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -408,9 +418,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_br:
-        tcg_out_op_t(s, opc);
-        tci_out_label(s, arg_label(args[0]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_l(s, opc, arg_label(args[0]));
         break;
 
     CASE_32_64(setcond)
-- 
2.25.1


