Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F63DCE22
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 01:44:49 +0200 (CEST)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAL8S-0004Xq-JY
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 19:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAL5v-0002WW-Pk
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:42:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAL5u-0003kL-EN
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:42:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id h13so5817056wrp.1
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 16:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nF2CPaID+VIHHyjgrg/yG4IgKh5kbi2GWmyHFcP4Gh4=;
 b=NyS1QGTbvNT1A496xSOlAv7v5TyTHcuKQEWXPuT5KDkTsVMg1iuVFs0eMa4nRkQ8nf
 L3iKqS/WLujpUC6V3fC7VPTOlFSbFtFTjjYahQretqjiPMBUAIy9gkZvz39bfdQkkauO
 IVZU/H749ZKAqGJwfFtbRgO2rliS4hyJMa2WbDP/Lh5UAYNGr0/5Lk1Ibab61H10ils/
 9slzpA1TWT3BdLJPg8Akaf0xFup93whqBwLveFM8NlishOrzJz3EJvl0h9wMXGfzdDMO
 QnMewp2TjN1YOLU9SkT5mFYBBrlUxYTrHO3w092CglKIwcqKKR0TSZ0Pt6SE1W1wWWUZ
 QARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nF2CPaID+VIHHyjgrg/yG4IgKh5kbi2GWmyHFcP4Gh4=;
 b=FJVtEqjYw4qkNGkf4Fh7Zpp2VPGzqBTprs0jU+4PFHkGSPrkPtSZOB5VBogs9pEtFO
 T5yO4eNNe0p+UzHRESuJuBx1z8BplJxoewPJ2tzt/sd08pgR5oQViQJ/EGHzn2UmvWnX
 sWeQTFSsBTOnxSyovQzEUi3FO47xu1NPXJlMHDxYwMidwpa+7wihTZFJUaVIVox7YbnG
 SA30egPt/24KI3KgmxmZX63DjBptg0sjGhfrQdNQTfq2XF7cOt6lvqtOevIEN0at3aUB
 5rA4U4H60tAbO6ZT+yHiq9N+QeWFGbM9dT5Plj+T+cJIBgKzsptHMSJwbg4PkwsroeAh
 dlwA==
X-Gm-Message-State: AOAM533khb6QJ2E0mUNmLj7lLGUasNAhw2CZEFTrl9kchKy+d+SUGPq4
 +479mZwJ6XfRImQYXuV36oBuuo+3gw7RnA==
X-Google-Smtp-Source: ABdhPJxkS0gW73A5jvBmWmcVYCgTOH9/iIoiHGHioWrmRKPSzUZdpw87WBXNowYrRTtZHbEmY4K6YQ==
X-Received: by 2002:adf:db85:: with SMTP id u5mr14538829wri.167.1627861328964; 
 Sun, 01 Aug 2021 16:42:08 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m64sm10052931wmm.41.2021.08.01.16.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:42:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 1/4] target/mips: Simpify PREF opcode
Date: Mon,  2 Aug 2021 01:41:59 +0200
Message-Id: <20210801234202.3167676-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801234202.3167676-1-f4bug@amsat.org>
References: <20210801234202.3167676-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

check_insn() checks for any bit in the set, and INSN_R5900 is
just another bit added to the set. No need to special-case it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 34a96159d15..05efd25e29d 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -15738,12 +15738,8 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         /* Treat as NOP. */
         break;
     case OPC_PREF:
-        if (ctx->insn_flags & INSN_R5900) {
-            /* Treat as NOP. */
-        } else {
-            check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1);
-            /* Treat as NOP. */
-        }
+        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1 | INSN_R5900);
+        /* Treat as NOP. */
         break;
 
     /* Floating point (COP1). */
-- 
2.31.1


