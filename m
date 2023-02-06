Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC6468BCAE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:18:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0RX-0007x9-R9; Mon, 06 Feb 2023 07:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RI-0007jl-Cy
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:43 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RC-0005og-Eb
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:38 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h16so10141227wrz.12
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZQQqvS93Cp9O320hulFrJMLKiPY6Is3cKN8j3DtZno=;
 b=tP9ZTFEZteL6qefhcYSx3zLrP0tSgupipS2jh75FsggQLEUxITcXJ/QSm6QISJrTmC
 ozFDJ63BFDoqsODbFUm2ctx7XoYhoioi/3H43wr2FOjHOtLYfbM8czYvAeBad/aAGQD8
 m1ytOxLcwGeRuVEVpob7blJvMOBMgUe5vPLRDy3kmys7WbLC5MlcRpEBCb/IeFMq5nqD
 t6cMa8ScZ5LvMseIDHrom/xqZjlSl3qg2R7ARQDcMToZN9a0rTCcuVZ1AstaCbcSvvfx
 CUs7TOs9Q3NZrdINvy+pW6JE2j1ofQXAV50vE2lYKts4vlbLn2VInKK4BzU+YuTmTt/h
 uMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZQQqvS93Cp9O320hulFrJMLKiPY6Is3cKN8j3DtZno=;
 b=ZLD7KepdAq6CdgiW3UDhtgDhEFfeFQEwAfsOumFJHNWXsSYHQcduEc4rh4hRKdsbxZ
 dxe5vtg19n0vp/wOONK+/vpA3XgW84aZxNBCQtUVo3SXmL7hV05+fPZWrFRjipXs1Onp
 4Fiy7mhlTe4CeOb8JWWv+bAuU6Xuu3YhGTJ0xowI0UUXal/17c1dNZREzUf/rMJftDMA
 PNetw3DmWGoQSxLmGmAg1arEwv6vD/s93R6beFoLsD9qKb71GdHIXr5JmlaOb630C9iC
 d3Xo6Yz83mu9Yxd2v8UrUt7mC3ZffJNLKLRd2+xLreZiiPGy+Odc49LSGjVEPp8Ulu5G
 hsxw==
X-Gm-Message-State: AO0yUKUqZjjtoxFPJf973sh22Pa1aqBPDWKgyeipb4q4KytAQfrgF6an
 H72g1JBzp7M+ctHcaKF/PR4gvWD68eXNFHX0
X-Google-Smtp-Source: AK7set/oVVg1z3RIGwqN4kdFGwGq9t+LLVdL2lOTrM5A+4JwS1K4fdsPnK8eieM5XPtMbTwP00+tIQ==
X-Received: by 2002:a05:6000:68f:b0:2bd:e87a:7fb7 with SMTP id
 bo15-20020a056000068f00b002bde87a7fb7mr18421515wrb.26.1675685852075; 
 Mon, 06 Feb 2023 04:17:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a0560001ace00b002bfb8f829eesm9171354wry.71.2023.02.06.04.17.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/9] target/arm: Avoid resetting CPUARMState::eabi field
Date: Mon,  6 Feb 2023 13:17:08 +0100
Message-Id: <20230206121714.85084-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Although the 'eabi' field is only used in user emulation where
CPU reset doesn't occur, it doesn't belong to the area to reset.
Move it after the 'end_reset_fields' for consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7bc97fece9..bbbcf2e153 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -721,11 +721,6 @@ typedef struct CPUArchState {
     ARMVectorReg zarray[ARM_MAX_VQ * 16];
 #endif
 
-#if defined(CONFIG_USER_ONLY)
-    /* For usermode syscall translation.  */
-    int eabi;
-#endif
-
     struct CPUBreakpoint *cpu_breakpoint[16];
     struct CPUWatchpoint *cpu_watchpoint[16];
 
@@ -772,6 +767,10 @@ typedef struct CPUArchState {
         uint32_t ctrl;
     } sau;
 
+#if defined(CONFIG_USER_ONLY)
+    /* For usermode syscall translation.  */
+    int eabi;
+#endif
     void *nvic;
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
-- 
2.38.1


