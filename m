Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7163B78DE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:51:17 +0200 (CEST)
Received: from localhost ([::1]:60364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJlM-0004xz-7r
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItN-0008P3-N1
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:29 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000uB-4V
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:29 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i6so124574pfq.1
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mHNvh8GQr8Ns4Dt4cntg6+kxVIm+bnqy/XzRJW5X88=;
 b=W3NRwJo7Q5v1/ls0JwKb7vZF6M+WMEfpGDEmNiLuUNO8h4c5jTumkwnc9OZ3OQ5Pvs
 z9OcVP/AvndfPZ/UmQDWKlVU3FGHii60ykdfvs4C7Ti2zd9Ymf6gOQ0J1AMFQGYyyS6l
 u0PXpiS6xC9g14B7j3afceM+I69r5lf2Ck16fgJAJziO1bpV0inrO3e1PjxB4FLIbrCa
 LnR1xGrMpT8mye/1li1RTHAjQHzARPgrExxQOjHoNp5q5itFEH71Ynu2TSbnGstcK4OD
 SV3OKPiN+rHCtU9+Tmb67bugIw969/lZsKOQ07zkSf2cKUfuZhkV0DIgJopP+jRhxdfc
 bskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mHNvh8GQr8Ns4Dt4cntg6+kxVIm+bnqy/XzRJW5X88=;
 b=nWYN3TZsmNbsKJE+4jMlOr72jmCEQ46s8hVsn8CMiW2Mc/lyY5a7F2daJFEOwltaQS
 S/BHyhpnAPem54SmlhKNea1UpX013DnGj82EO+FrXyC/mWj2C7eFakbL4JRFj6rqg9BH
 dLxUjxBP+fwdcAFtcHEmFl0cgEVP2eNLz/sVhi6yufZn91XD8+8jeZXlX8fQp97HcQRa
 NYVjBMQVdaoVI+8AXlew2tkgowk/ddFE1iiZhlEW47CJFgw8I6kK5F6+TszbvKAQ3zVT
 nnD1IPnR3GDRd8xCR2k/0nF5FD//wPld/msMX2WFtw5hT8q2vwXZ/9Gj9rFcFm3H6IWk
 xPtQ==
X-Gm-Message-State: AOAM532FMUYfiTxzQ9GWwdJG3v8YS9/lKTvcxsdccc7Is3LmH4v091Xu
 1N73SsTY8SrWqX/fDw3z5ugJfd7xl5rStA==
X-Google-Smtp-Source: ABdhPJyApmCOW0yjf/2Tp8SzXCpvWyTCICX4o8UR+iSAn/qvvYqTPh+Io+vM7AG/WzJrlex8Tzc6DQ==
X-Received: by 2002:a62:77ca:0:b029:30f:7c5f:8a4 with SMTP id
 s193-20020a6277ca0000b029030f7c5f08a4mr446511pfc.59.1624992912205; 
 Tue, 29 Jun 2021 11:55:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/63] target/cris: Do not exit tb for X_FLAG changes
Date: Tue, 29 Jun 2021 11:54:20 -0700
Message-Id: <20210629185455.3131172-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We always know the exact value of X, that's all that matters.
This avoids splitting the TB e.g. between "ax" and "addq".

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 0be10390e9..4cfe5c86d9 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3162,9 +3162,6 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         cris_clear_x_flag(dc);
     }
 
-    /* Fold unhandled changes to X_FLAG into cpustate_changed. */
-    dc->cpustate_changed |= dc->flags_x != (dc->base.tb->flags & X_FLAG);
-
     /*
      * All branches are delayed branches, handled immediately below.
      * We don't expect to see odd combinations of exit conditions.
-- 
2.25.1


