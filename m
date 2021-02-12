Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC6031A53B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:21:04 +0100 (CET)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdzz-0003Pp-9x
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVP-0001cH-DH
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:31 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVJ-0007n0-12
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:27 -0500
Received: by mail-pg1-x532.google.com with SMTP id r38so217698pgk.13
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yQsfFLSfc25MKTB1YP7F63Xt2EDDu36nhF4pLSCWcTU=;
 b=IYpLkHfrOWbNFeuKcPbZP73rNO5Snp/NDdAGmf41g8E6nTcU1MLATq09O42w9M7Zrg
 4/vuk0GgPSD5dlOAwU+d0F/HyWP1LqUUitNHLj2gGVMX4cyECme+Rh7wqlWaCVY4mn88
 U6NG81PC19N7io/4Ov646opB+F0WXqdqX9WDCe6+MoUNiCWnmDXusUaMfHCcTH9w8h+c
 cmcvFHRf25MBgfRsNuQcCeXSOIca2XRlOheCacRnwxvUelZy2/ahko5DstbajoQsZgv0
 EvFtqYd1gWrQ1SNMhn30vNL1evV5srhNNPpAVysDqFPJiEssszHjwPDisx0yTPylUaQR
 0+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yQsfFLSfc25MKTB1YP7F63Xt2EDDu36nhF4pLSCWcTU=;
 b=bjacpfAcMTUOg0zUNwLkVyuMiY2SZ8QxvOEjG6No0SlnkotTrXkfSDHPQqUpUf59Tg
 aIN5vVwIBefNNSwi1YqKPiuhmOVGiiIgnJM9P/GtArDfKqKne+NxpQkS0I3DHUMScViU
 VlLybawPcVbwzKMzPRCyAiy9tjD5FZMyT4OS8pDhzE99Y3uWv60YBMh2Gb3kKaW1LoYT
 mNaf9SJ+HSdIdrSwkOkGt9LWhNVaEA7S54fZ/EQmUusvrLkuuGgMkEJGSg0qRBs1vtMJ
 tDg1RK1fH6xXYKiVAvRSI90lIwDpMhLW+NTMWgWsI3sKfOyxveSgEw7XpDFT7JOYziEA
 4ooQ==
X-Gm-Message-State: AOAM530NrrBpN/asMnfXuxXV26eWMKE5nEbjg53ySxfwW+lhNKzIDc4K
 C4ovc6e4a7kQ86xD2fNHnJKNuM5DzASR+g==
X-Google-Smtp-Source: ABdhPJyzQ2rfR/a5DrZ9ZAU9PQQ5P4ZIfoZe99RfAryF5oTywGQPOr8/0lV21FoJoO66wwWVSgeL9g==
X-Received: by 2002:a62:2ec3:0:b029:1dd:3eb1:bec9 with SMTP id
 u186-20020a622ec30000b02901dd3eb1bec9mr4059950pfu.62.1613155759233; 
 Fri, 12 Feb 2021 10:49:19 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/31] exec: Introduce cpu_untagged_addr
Date: Fri, 12 Feb 2021 10:48:42 -0800
Message-Id: <20210212184902.1251044-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide an identity fallback for target that do not
use tagged addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index e62f4fba00..d9dc1de414 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,6 +69,13 @@ typedef uint64_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%"PRIx64
 #endif
 
+#ifndef TARGET_TAGGED_ADDRESSES
+static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
+{
+    return x;
+}
+#endif
+
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-- 
2.25.1


