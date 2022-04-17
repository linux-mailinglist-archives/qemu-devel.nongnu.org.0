Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E850492F
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:08:02 +0200 (CEST)
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAFd-0007h4-Vs
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fW-0000Tw-MQ
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:46 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fS-0001nP-WF
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:41 -0400
Received: by mail-pl1-x632.google.com with SMTP id q3so10807078plg.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BY6AMJvNmzcszeZ7iu4WSrEG8O0G/uroM/T7KokfH/A=;
 b=bNoB1C5VKWK3iJZ8IPwwSXCPs9nlf+deYNvwl8JEalPdYgZvjK5Yg386pY5gXHCiN5
 Yy6TpfvNcxfkNUPz/K5FggzYVcdMpEuaOQ/1w2T7NgdERJcKCsKC1OneaMKC3/tMX4+8
 18K1AjxnM5JCpC8fotDmayhihr/KHvjUZy/sH7VPm/ygW+uDBV/zdTJQPVUdTeSUQDll
 zbRtpdshFuQp63oqH0ILfyj94NGmiqZXW+Or7YkbAZ7tuEdLfG7bMc9yiPKDSU3mNp1i
 dEgLJ0dqty5bXFk6xqToBXWFUBPqP+vVuhX/w35m6TqcIT1knOkGDH/aXt4RwobOATd/
 UOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BY6AMJvNmzcszeZ7iu4WSrEG8O0G/uroM/T7KokfH/A=;
 b=f5mvmKVj+edC7KfiDM2B3cjU86IFCNABIwi33Rd7jQbUBLUE8/xNRXO4Hki9gqsL3M
 VIt7sG9I9XBIvkUizpepbh5Z53V4wKLjqG8SqSdPBeu5kSZ1yN6ZaNhe+ovi7jlgQS3s
 DFHW29G4tDDoywL98F0beHECHfmrAf8v5j19uGGWg19hcTFvBQZij5c8UBDJELR0yNND
 s3W20Ymt96iKvhxIjYia2KMqlXUFMP7WG+h0fC7t5YtOKgwwziy5WbB8AOR/kbNamNC9
 URLh+FXdTg09I4KW9ojLYWsOsCzfdwyCMHUo1T/sRdl4sxf/pZ4ez8ImK2z1qMA/FCQI
 tGjw==
X-Gm-Message-State: AOAM533CKfbt1mIxcXm202nm+c3VXPcRNd9wxr3h828Zdm1FzxBq/eD3
 s2L+P3wFuWAgqnBPHgybZ9XTd82zVzw4xQ==
X-Google-Smtp-Source: ABdhPJztoBCkYKYzBNh9UX8TXC/0bfXhJ3YEoT4fY5redsl0mjCcOVDa3u87rbKtfJ+mR+E2tzljKg==
X-Received: by 2002:a17:903:240c:b0:153:c8df:7207 with SMTP id
 e12-20020a170903240c00b00153c8df7207mr7803432plo.44.1650220235867; 
 Sun, 17 Apr 2022 11:30:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/39] util/log: Mark qemu_log_trylock as
 G_GNUC_WARN_UNUSED_RESULT
Date: Sun, 17 Apr 2022 11:29:58 -0700
Message-Id: <20220417183019.755276-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all uses have been updated, consider a missing
test of the result of qemu_log_trylock a bug and Werror.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 2d9455dc85..3a1f3a6020 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -67,7 +67,7 @@ static inline bool qemu_log_separate(void)
 
 /* Lock/unlock output. */
 
-FILE *qemu_log_trylock(void);
+FILE *qemu_log_trylock(void) G_GNUC_WARN_UNUSED_RESULT;
 void qemu_log_unlock(FILE *fd);
 
 /* Logging functions: */
-- 
2.25.1


