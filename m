Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C542B55BEE9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:00:45 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65DI-0000Q5-Im
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JP-0001ud-R4
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:58:56 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JO-0000Vk-6t
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:58:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso11528192pjk.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WukvkIkeVaM1+jg6SBYcwpvOTXb/8GOiZ0LXRT6uF1w=;
 b=hm0eyMeYJzygr5X7Snrs3lgwu67nH1l9onFPThhLK078vWR0R+MNcK3m3hhlaCEjmO
 SH/gkTOj6ivZtu+J8ICqBxBx1BHKpDTgPyHGDPiXB9ughOajXLLpfJo3rXxfJdZv/x90
 /CqyqJcumkvFVhTFWHK0iU013V4bF0D9JklNZbhhS9zzxNfIksb/ELCBQNwYY+WMDi3L
 /rMV5wUICtS/ja36WRqbLtS9C9Hf6o5FIrhvbz/RErbV8cjR9XAo0bFHb/hYy91jmXTe
 qE8+3usKB/QVgBmcK9hfDcErQ0GgewUCjn5sZ8lbPrI8pxxVtVe8PLJpigQ0YRagsB8O
 PBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WukvkIkeVaM1+jg6SBYcwpvOTXb/8GOiZ0LXRT6uF1w=;
 b=cgADjuQFSe2oQhcPJkKijd2tsrgHMO9W85yHTVN3GRtcuNc0tgq8JguK/pnASvFIj8
 WTnui4B9E5TJus5YUEqxrK1KBLZAAlL6gFGEVS7jBRLPdOodmTkB37fJiYG13tIlSB8J
 qhyMFwwuP+WLiRxYn+taaeYaaVP0h3lk0DVe815KHsIKQ5PkX8EcKEnU2dpOi01YnTDj
 gmshs3QWfXckyrOl+EYOh98Mij38hqqbaC7JRd9jXF7YEVIe6VXxQZN4wyuSPOvbsUtM
 TMjnVWKHCkxS3JoZxMJB8x8ScoqF+IMwTA3xAKRzJxQtG6r9TONHq0egmDaSOPS6gw4B
 Bsxw==
X-Gm-Message-State: AJIora9B91xxfsn3CCAFwo08hMsvOPmOT7wd6v4TopDNWLFSV23527iE
 mTZdP5A3JG+Y3rMLHEsXKrUai8Tq2VET+g==
X-Google-Smtp-Source: AGRyM1ukS0p62b3jvETRVMZnKT0GwBiX5XMpGvE3wKpBqGCVhhqhS+ooRsCoVl2JU6yqu8/Jia6DRg==
X-Received: by 2002:a17:902:8d98:b0:168:a310:3ea6 with SMTP id
 v24-20020a1709028d9800b00168a3103ea6mr1780874plo.9.1656392332735; 
 Mon, 27 Jun 2022 21:58:52 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:58:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 41/60] semihosting: Fix docs comment for
 qemu_semihosting_console_inc
Date: Tue, 28 Jun 2022 10:23:44 +0530
Message-Id: <20220628045403.508716-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

The implementation of qemu_semihosting_console_inc does not
defer to gdbstub, but only reads from the fifo in console.c.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 0238f540f4..4f6217bf10 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -41,11 +41,10 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
  * qemu_semihosting_console_inc:
  * @env: CPUArchState
  *
- * Receive single character from debug console. This may be the remote
- * gdb session if a softmmu guest is currently being debugged. As this
- * call may block if no data is available we suspend the CPU and will
- * re-execute the instruction when data is there. Therefore two
- * conditions must be met:
+ * Receive single character from debug console.  As this call may block
+ * if no data is available we suspend the CPU and will re-execute the
+ * instruction when data is there. Therefore two conditions must be met:
+ *
  *   - CPUState is synchronized before calling this function
  *   - pc is only updated once the character is successfully returned
  *
-- 
2.34.1


