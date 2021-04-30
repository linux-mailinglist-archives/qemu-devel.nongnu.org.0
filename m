Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F58B36F3C9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:40:25 +0200 (CEST)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI8m-0004cG-6S
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlY-0003KI-Ox
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:24 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlB-0007aT-34
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:24 -0400
Received: by mail-pf1-x42b.google.com with SMTP id d124so4591864pfa.13
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I+1Opv8OfoIKa40K956dLubZo7qmKRPssU+1heK4KSo=;
 b=ACISNkjSh6DG/vXolUzRnsbNX+Gc8xHTOqLS+Jy5YEkrCzXnUPg33hnJpXh/HYcSEO
 ql0HrD8C5ebkRW+EJKklMB88hPvEEKiGbWdUnocp7ngaq/bx55lGD8qB1SJLp3dN7kp5
 /l5rYtxs+tO0Yg4G0glG8YVlNctb2U3UjsBJnUW+mBByz86AKC79RUhQsTMZBl7rELvu
 GbXG0I6U6qXIbPl0eXRrtXAOVQEaFIsATkm41iyjMZswlId5XHbbsgWV8ERb6jPhc8FY
 69VhtkvVLcPfvexMEJEdu8HnHoszU5X5ZGUcKT9Mqly4Qer8y1JPcKa6gSLXMiP7V77S
 TLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I+1Opv8OfoIKa40K956dLubZo7qmKRPssU+1heK4KSo=;
 b=NBlUqOQ3n4I3QkzOL4O8yVuLG+621D/efjeHZYPUc5/ZMk1M2cAVWSObDOFo14RFe+
 TxE5YJNVbzQDKAfGEYu4RggGqt2HyTJVWNLQ7Z/S5gJIbVIH7ZPKdcoYDuDL23uB9WAN
 ieVl2JhDitU3ymTp9D5z+lyW6LESHGl3wQgzXA5Y+8/pFhQtNoK+nettITmwc6LbKsKr
 pxmjcekeAUszHt6NjMs2m/3ZKkB0hkaYe7p1Fhug4I8ClsXPZh6jejlHKMXL+iwazprb
 UQSNehh81RjiEb3OM1D8A8+kPOhDXQ7FHDwUagWy9zNRqjQSiKs/ttAN3eDYQX/39h4R
 DpNw==
X-Gm-Message-State: AOAM532AskvF6uT1s/UFmr4MGaGxajjnTlTz0MskrEXTLLTTKg1Mm4Ic
 O7HdNDpOEz3+/VIMDBZDbeyYwBfq/NAcTg==
X-Google-Smtp-Source: ABdhPJyIxC+bBmPcxikfMd/f2Pw3LkX2A/hkMLy5gUFqFdvBScuYlHu0BrWgfDDOozfhMW9+WTQ6Hw==
X-Received: by 2002:a63:4c4b:: with SMTP id m11mr2282201pgl.245.1619745358792; 
 Thu, 29 Apr 2021 18:15:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/30] target/ppc: Use translator_loop_temp_check
Date: Thu, 29 Apr 2021 18:15:34 -0700
Message-Id: <20210430011543.1017113-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The special logging is unnecessary.  It will have been done
immediately before in the log file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index fe3982e289..112afd02d5 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -8046,11 +8046,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     handler->count++;
 #endif
 
-    if (tcg_check_temp_count()) {
-        qemu_log("Opcode %02x %02x %02x %02x (%08x) leaked "
-                 "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
-                 opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
-    }
+    translator_loop_temp_check(&ctx->base);
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.25.1


