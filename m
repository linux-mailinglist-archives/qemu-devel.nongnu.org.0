Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08A4584E59
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:47:16 +0200 (CEST)
Received: from localhost ([::1]:57006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMaS-0004in-37
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA4-0002Vq-Eb
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:02 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA2-0005st-T4
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id id17so2242743wmb.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AlNB6s7eS5tHMbJtmXxfFR2VmBSojG056RBlQYn6roU=;
 b=gGDp4erUISlQ+OXdDXgVLDUPpq3JPj0W3in8+aGe8o+vDacIwEc8feGxVcrUZNXQ3+
 NfB7Ag3eSMn0BKxAB41OyhIgUiCf83DaCqNJvAGmCfynYrlAHtBxn72v67Uboikc23R/
 QH6ylvtNT04Eoq/8j/HK0WMDjN8V/fO2KUCazHBchT++qrkr2tm2GPqehI19pvw7hDYT
 1KkglaRBhGMqi9Nr07WTlcs31PQCF/qrQ/pK+xF88aIV5QvmETHabKbIdlWcI7D+swIr
 GE81se8dp1QxWPi+SSv6JtWOBqiIRRzXrtvM63mm4cvqALBpZ8u2KVNPZN6Gcln0JeA8
 XlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AlNB6s7eS5tHMbJtmXxfFR2VmBSojG056RBlQYn6roU=;
 b=PAzlMFidS+H0lisZoYgAIyWfzcKHJDJQchpNzfV2I4LAkC+Wp3zPo6tQggqu6ZL5dV
 A2uDo6VTnL/vxdvWh1Su7Hdk2AFrfbNvGxl+rBQ8Z42mE9HnlUvhGf5RnOmKVE8NyWVT
 LrfVazjIWwGwE5RUSAcv0AHnvCXrFV+FyqnMGd01X3L7xOmlvTq1woIww5vMQL0QRJ0+
 wgIGnw0Pb7sgf+d/y5H7cePtF+sCnhgyPCZMEiQdtlOyKBOxKYzfGDRpufv6ZtVTMMEp
 FVSOxD6HCEp+pV+bcEtGTjOSWGSqJj7p7qlqkoChjV26InVkqUVYpSMpuUW3/+rlzoEM
 TrfQ==
X-Gm-Message-State: AJIora9O2zCH9kgWxOYsrRQEYji4/hPLGZ7rcvICgvAAvnZG/Mdt1h48
 hIq2hEyCtnPFyd80kSLHbdUNQw==
X-Google-Smtp-Source: AGRyM1sSkO37cGBUYoBCA3iAb7tsrNSXPCUVz/RcaCQKARyv/q6n4XrhO+boYikB2qXrh+Zn8rxMyA==
X-Received: by 2002:a1c:740d:0:b0:3a3:e1:179f with SMTP id
 p13-20020a1c740d000000b003a300e1179fmr2128647wmc.17.1659086394930; 
 Fri, 29 Jul 2022 02:19:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a056000011100b0021e6baea4ffsm3182090wrx.29.2022.07.29.02.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 738F11FFBF;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 07/13] semihosting: Don't copy buffer after console_write()
Date: Fri, 29 Jul 2022 10:19:37 +0100
Message-Id: <20220729091943.2152410-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

The console_write() semihosting function outputs guest data from a
buffer; it doesn't update that buffer.  It therefore doesn't need to
pass a length value to unlock_user(), but can pass 0, meaning "do not
copy any data back to the guest memory".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220719121110.225657-3-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220725140520.515340-8-alex.bennee@linaro.org>

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 4847f66c02..508a0ad88c 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -627,7 +627,7 @@ static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
     }
     ret = qemu_semihosting_console_write(ptr, len);
     complete(cs, ret ? ret : -1, ret ? 0 : EIO);
-    unlock_user(ptr, buf, ret);
+    unlock_user(ptr, buf, 0);
 }
 
 static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-- 
2.30.2


