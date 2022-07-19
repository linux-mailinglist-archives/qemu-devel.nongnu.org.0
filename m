Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7D857A719
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 21:18:52 +0200 (CEST)
Received: from localhost ([::1]:55414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDsk6-00077s-Ab
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 15:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDsj2-0005g9-NG
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:17:44 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDsj0-0004oX-Vr
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:17:44 -0400
Received: by mail-wr1-x433.google.com with SMTP id d16so23023934wrv.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9v21Ix66GTJcQGhQxKIODW8bSYLFeuijiK0JgwHYvl0=;
 b=O+1WgJzfE3IiydKBLQUjnh2jLsr9Jhks1X8i6mvrmwwftsJ+8nX63/rR4+UlZ2UP+T
 JTNz5C+YAGJZkP8dknBWgMisuVO0biUtPg9YXyOwmNY3hfy1OQ0DwxWJDmyVo4JAATrx
 lb3hMt31GA7QNTOXIRp8bTi7YLgzZ0Y2pRewMKLku2pkjfMgHGnGGmEm85eCUVHFiF/C
 t9aVpfThoIPHAUmVMpUHo/2D6xs1ZLX4cl9GygWgNDCtyMjprfuZAFMspL8kMIv1lKnh
 FFP+cFqTyzkF+D25rpTUjIAY/a+EgpMsmzRbzp5Ed4VE8ASn4KTW5o51h321136qtoek
 W4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9v21Ix66GTJcQGhQxKIODW8bSYLFeuijiK0JgwHYvl0=;
 b=EKIwCm2pWeMdRIyZ8WJehgU2YlwdZ+LIUbnY/6xX6TWE6Acrjtw0Kn7oqIk3eIvwRB
 0U3qHAqLLtXMomO4xCQtKpZ+0N1yEPbZCoF5+ctSR/psZNa/pR2lOZdYHFHjOY/nsfVl
 s1TgSKSJzK/aaRamUg7J5M6i/K6etrWFmbfwbLlUi5JSVgHkzh4gxak+cl3UzlNtyrdv
 6bwXo0PDtFJzOaiZhrA3h4JtjSUhAddaaVuq4ne6aFyjyv5HjgHqMCun9fHMXYcg1I3e
 gKjINcg5fZc0ZaVQulegKvV2YzHwmwAR5NShp812VAlUQOsZZdOIzeC3MGzHH8VhKpMH
 tysw==
X-Gm-Message-State: AJIora/RIYY1EVtq25pTadAJgn4c4tgEEuOOAH46AXhfWYroM+R8TMpK
 Kcir6MVcJ6FaCaTUSkjURtf1HRNCvGkuDg==
X-Google-Smtp-Source: AGRyM1vWFiCumi41qFIvXbiA+Tt64VMVaWU7KsXlSP0kFrAU607mKPlCUMFAryHfWQ5y0IruA8ktuQ==
X-Received: by 2002:a5d:6502:0:b0:21d:f19e:602b with SMTP id
 x2-20020a5d6502000000b0021df19e602bmr14031981wru.714.1658258260515; 
 Tue, 19 Jul 2022 12:17:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a5d6445000000b0021bae66362esm14017692wrw.58.2022.07.19.12.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 12:17:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH] target/mips: Handle lock_user() failure in UHI_plog
 semihosting call
Date: Tue, 19 Jul 2022 20:17:37 +0100
Message-Id: <20220719191737.384744-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Coverity notes that we forgot to check the error return from
lock_user() in one place in the handling of the UHI_plog semihosting
call.  Add the missing error handling.

report_fault() is rather brutal in that it will call abort(), but
this is the same error-handling used in the rest of this file.

Resolves: Coverity CID 1490684
Fixes: ea4210600db3c5 ("target/mips: Avoid qemu_semihosting_log_out for UHI_plog")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: only tested with 'make check' and 'make check-tcg', which
almost certainly don't actually exercise this codepath.
---
 target/mips/tcg/sysemu/mips-semi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 5fb1ad90920..85f0567a7fa 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -321,6 +321,9 @@ void mips_semihosting(CPUMIPSState *env)
             if (use_gdb_syscalls()) {
                 addr = gpr[29] - str->len;
                 p = lock_user(VERIFY_WRITE, addr, str->len, 0);
+                if (!p) {
+                    report_fault(env);
+                }
                 memcpy(p, str->str, str->len);
                 unlock_user(p, addr, str->len);
                 semihost_sys_write(cs, uhi_cb, 2, addr, str->len);
-- 
2.25.1


