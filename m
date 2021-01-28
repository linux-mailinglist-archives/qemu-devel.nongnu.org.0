Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0713307160
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:26:39 +0100 (CET)
Received: from localhost ([::1]:33728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52dS-0007Zp-OB
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52an-0005md-CD
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:53 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ai-0005fz-7c
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:53 -0500
Received: by mail-pj1-x102e.google.com with SMTP id jx18so3840211pjb.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l0eUP1VaXHMBkk451t+GkbylYNcWplkEv/ZGs0ScxGk=;
 b=PRSI/+xAowVjX+DPSslJmuanL7/FBksmBGRhaJcmRcv2Qq+cDVNISTmQOjd4EYpmpv
 X0fceRrfMLHnFgPoJLqlzRoMCzXy7HNqZsaoGwqZe8WpUMge9nVdcMs9qdXeRO7mL/kv
 OirQZWUNguWrco5PtRWCr5J+RFzFk0iBluvWaGSME7Av+VCWtkhIEoJ2zCM13uN4ygAC
 PvA709ZoXnFRiynYiEIM0daffMdZeTCFYj6UZcy3edYgkDbixJBokLLvVbBGyaLl0BGf
 0aLJ9fRAVEKaAMUSjh8fTG8Wv7q3LDjNGLdV9G3CMwBosYUv1OhVAElHfgppuYyn/Lwu
 CjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l0eUP1VaXHMBkk451t+GkbylYNcWplkEv/ZGs0ScxGk=;
 b=Cl1CqrUsLu4K+gtpBuyZbzIP2E0uGza3VYn+DczRcl0TLFACrrANmtyVS8wNLHDG+d
 oyvlr5EkEHNYTV/85pVrYDqITGFmebbKxMhv2qbg4l13/trpL5HPN8f196boNdSsMY/h
 TtnecJtIle2OZsYdR0kurGghVGh/4XsPR40o+tg6LfEa9jU8MYn3cBhq4D+3WwvPkPd+
 s1NmMv7H/fw3wVvdY5vuYXxuBjDrCVKxCkaR6854jQ+Mo8T0nin32z85ELjn8F/fEdlI
 zmDxsJHSenmKhkTIYpc7QqTBYkkdwjevQGNKQqcLCQU/6LmLZhTaVt+j6et3M/eTabF0
 Pj4A==
X-Gm-Message-State: AOAM532kvLo5BvvHBwcO01lvoDlPtrTpaUv/MsH8NC8yUV5JJm/GAwv0
 EsDZHbl/WcvTF9ifcwGkIXsCYZcoVWeRWD9s
X-Google-Smtp-Source: ABdhPJzJFRvaDh6+PMUZyD5lkdX6PlqB/8HNeNxGMxapvifh9TwCwj8ckRAxIf8BySt7L67F5eJo7A==
X-Received: by 2002:a17:902:9a4a:b029:dc:435c:70ad with SMTP id
 x10-20020a1709029a4ab02900dc435c70admr15031849plv.77.1611822227038; 
 Thu, 28 Jan 2021 00:23:47 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/23] tcg/tci: Inline tci_write_reg8 into its callers
Date: Wed, 27 Jan 2021 22:23:15 -1000
Message-Id: <20210128082331.196801-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 438d712ea8..7797558b2a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -115,11 +115,6 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
     regs[index] = value;
 }
 
-static void tci_write_reg8(tcg_target_ulong *regs, TCGReg index, uint8_t value)
-{
-    tci_write_reg(regs, index, value);
-}
-
 static void
 tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
 {
@@ -597,7 +592,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i32:
             TODO();
@@ -871,7 +866,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


