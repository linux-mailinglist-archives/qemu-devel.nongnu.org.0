Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0778C370FBB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:23:54 +0200 (CEST)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLRJ-00057Z-3w
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMW-0008HQ-DN
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:56 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMU-0002uO-Nm
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:56 -0400
Received: by mail-pg1-x530.google.com with SMTP id s22so2452477pgk.6
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+GW/FjdFE0LjCNjl+PKpujGwHht+vUuynWRRTNqZ50=;
 b=ynpYBzhTcxaiE3SUl1tIz4geQnWN7S21LcTW9hRgX/HtOuKvCHnyPHfF4fnrDCClmA
 eU36oVGpjgwNvXYrE10NF2//9R8jFYJ6sSR/AQ6UPXAA+lJgjj7L5Bu7NcdCANfbQFT8
 yjSUJbJo8y/YS4zbVmJYBusFRTcCQTXEXOva9Zgc4W2EjojvrtK1JWhhFiFY4b3k4tSH
 mnCl4AWWd15909oiI2vZcmdJh+KDT3ft82u8kuEmcEunEJWFTsf3sGEireQ4aHNic4Vv
 EoyEp2+03CFFOy6pr/wfVqgo2c9kNL60dRpXs+8rg/ydmUUtkXW4jFvvB/JdAMvEsAYi
 LBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+GW/FjdFE0LjCNjl+PKpujGwHht+vUuynWRRTNqZ50=;
 b=N3G2GIbKI4tERc3s3rnrkax61mTCdY14W2UjMCGIWJvlvkXyLnvtYWGiNUoAvBBdtE
 nJXsckdg6vvkC636rS5rhCr0740vtl97P9CZugcfWyvwcuqCk4YsVSLReqkDxQaH1M4y
 4L9uw8u5o1bQ8/RFJQTYx9Ei9/2tWyt2T/YmwytZj8z8M6Gb+6mOvsH06u4AnPRWohWx
 9/IN/b0YlLtFDBomyJ6WUinY/h1JD+p1CkGrLDKpwDp0hLVN9/C6/Rwrhq8z+rFpTJnF
 PoklAfXbLabADYJ6zuEBAXlpwg+n44zCIBq3pOm6cl6M0g1c0RAHiSMgs6NKNosDEaKe
 FhGg==
X-Gm-Message-State: AOAM532hQy7gCnahWeyCNa/q5019xhTL1+tDt50TkLE5JrhJPhZTtqG+
 jImRkpqls+EgIEUF8cGTc2O8jOwW8vqffw==
X-Google-Smtp-Source: ABdhPJzhBvspVZ4tfrjPi2NUfVX9brjUuAO5aqhB0oPZ4r5RIMINWgPqgm0IIZ8msplJzeNS2JeMSg==
X-Received: by 2002:a63:f90d:: with SMTP id h13mr15712450pgi.18.1619997533531; 
 Sun, 02 May 2021 16:18:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/28] accel/tcg: Rename tcg_init to tcg_init_machine
Date: Sun,  2 May 2021 16:18:26 -0700
Message-Id: <20210502231844.1977630-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We shortly want to use tcg_init for something else.
Since the hook is called init_machine, match that.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index f132033999..30d81ff7f5 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -105,7 +105,7 @@ static void tcg_accel_instance_init(Object *obj)
 
 bool mttcg_enabled;
 
-static int tcg_init(MachineState *ms)
+static int tcg_init_machine(MachineState *ms)
 {
     TCGState *s = TCG_STATE(current_accel());
 
@@ -189,7 +189,7 @@ static void tcg_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
     ac->name = "tcg";
-    ac->init_machine = tcg_init;
+    ac->init_machine = tcg_init_machine;
     ac->allowed = &tcg_allowed;
 
     object_class_property_add_str(oc, "thread",
-- 
2.25.1


