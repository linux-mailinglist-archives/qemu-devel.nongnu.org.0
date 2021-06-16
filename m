Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1793A8E52
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:24:47 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKIQ-0003oX-1B
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6Q-0005PC-NE
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:22 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6L-0008Nx-01
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:22 -0400
Received: by mail-pg1-x532.google.com with SMTP id v7so593949pgl.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJ88hjzMPCGkvsQLrCHEXf9qcVpoODBdkqIpV1aB2qU=;
 b=QGFgaaDcyTvM1hVoJGpb7bJ2+HaGfWLBYjhelO9M0wKD3OCtpEs8mnZANdkFVYsZZT
 I6/x2CsNq2nyX17DzaEjOKdy5oLvUeEHbOks6sC4MpLcs13y9xLYBTNN1n2gcU+XTId2
 Tx73gHVaGPpidUA7UhHgv9g9HmWxQ7TAtaw/QVdzY9zUhSQa4yi8665rlFv3yzvz5fMm
 KXQ5zGKtO2v+1prBRm+lJSUx4Bw4heZKgFEEKmYDPCDi+YM1PN25au8qELaG9cgByasl
 dY6el2ir2402rkvSlcSmlQvhe9aeVCwQY/PYSnmf7faxk1cOyNko1llcqYaK2Ys7FLhr
 Xm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJ88hjzMPCGkvsQLrCHEXf9qcVpoODBdkqIpV1aB2qU=;
 b=XZmNunCgYsmhI83XLyE9MB6GfCxlmWqbElfk4NhPlhlXahk72nkscRMPLpUPCd71i4
 4lU4eCZEovMU8K+1u8h+Pig/xzZvsk984uwUzG0jtrTWfYPmYCgw+DOcwNC6XYtOsqtB
 c0+e0QHT/pkbwvdR+nmxSNTH1ebaI2Mt+33xM2EjPXZTDRedtrHFxxppT9CyB56ciGG5
 ZiWW+TK6HzpaGEb4jBxooRACLzm7sjq4k6fIcC/reAYY4mvWkOyFzRiI1KhDqKtgGtzu
 XiB8SYDk3y8fPxs9K5GNqFApC2h8CBQcKsOWJiEb5yaguh5e9xfHEUt5JKPpzEx5+Ljh
 yXIg==
X-Gm-Message-State: AOAM53150dONjROBDSEVBtQhDjJfoTh/IokOYleHPcplomd2yR68YgqH
 Db5QN16LjMthpillauw50yIJlnwBzYpY9w==
X-Google-Smtp-Source: ABdhPJwUjrzO7EXnZ4ILOjMm1Qj80fJiRZoCWtwMK489eJdKyNpkd1yFZt9/AaznNqNIiuCMdSSdWg==
X-Received: by 2002:a63:6884:: with SMTP id d126mr2381817pgc.368.1623805935732; 
 Tue, 15 Jun 2021 18:12:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/21] linux-user/hppa: Document non-use of setup_sigtramp
Date: Tue, 15 Jun 2021 18:11:56 -0700
Message-Id: <20210616011209.1446045-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We cannot use a raw sigtramp page for hppa,
but must wait for full vdso support.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/target_signal.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index 7f525362e9..d558119ee7 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -71,4 +71,18 @@ typedef struct target_sigaltstack {
 /* mask for all SS_xxx flags */
 #define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
 
+/*
+ * We cannot use a bare sigtramp page for hppa-linux.
+ *
+ * Unlike other guests where we use the instructions at PC to validate
+ * an offset from SP, the hppa libgcc signal frame fallback unwinding uses
+ * the PC address itself to find the frame.  This is due to the fact that
+ * the hppa grows the stack upward, and the frame is of unknown size.
+ *
+ * TODO: We should be able to use a VDSO to address this, by providing
+ * proper unwind info for the sigtramp code, at which point the fallback
+ * unwinder will not be used.
+ */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* HPPA_TARGET_SIGNAL_H */
-- 
2.25.1


