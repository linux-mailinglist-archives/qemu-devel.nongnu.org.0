Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948DF6593C3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2ud-0006Wq-KA; Thu, 29 Dec 2022 19:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uU-0006Lm-J3
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:11 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2uR-0004Eb-5N
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:06:06 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 i12-20020a17090a4b8c00b0022632104a6eso2932501pjh.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOYCCYtPdnKj+yfIPyQ3b3Eju8B6onYQzX1BsWT7Kq0=;
 b=FrRUf/qcH9Q/WrAN1L7qb4gmwYXQzfjik8G8COMXFrVbQi1bzvLiMOVoTJvdrzGk8r
 3ySY/owK9yRO6hJ6K1Dji8hwA8kiLgowIylSm9Ns+eJRX5GKQjsNxv13/CKEqisx5WEb
 x7UtB3u77G5cMDKqDR0aWNa2t2FsLpCO6wujflfq4WKbEEszXRUVHuPwYd6Cw9FuKnUb
 yuPgiX9/RX6Mr+UNIkUwie+h5vP9DfbY/J/nxS4d3DZpC52GYNSXolS0KcSSkUiwcS8Z
 an0eFIZWrsiKljHjyEovWoCr5T6zMGcVr9T8nXwCMCHZyKDKZGp7h3ySqSbeYlc8ksG7
 uEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOYCCYtPdnKj+yfIPyQ3b3Eju8B6onYQzX1BsWT7Kq0=;
 b=BbwuT+2t2SC7MaxshDb9eyaQdKDtte5NUSJqGnece33p8oMXuUhaoLqc5xhqPuJF3g
 bVxz/XE2rzUja2ib2H64IHqHvgtHPJ8EMKShoUOYv2H7JLcBeBUV7zvF2XtuLY/KLkJI
 LN7jacKW+H0Zk9TpzVIM4l+rmOjxSD3f0G2S8wZso947URTKGyTOpwj+rPsI5o8NoRs3
 B7nzgWniddbTZ5eMwujl2LuaSvHEsRvrRNx1Se2UzcGlKOEgAy6BDi2YjDmXXXC+OXs2
 jzoaa26WVmFMsLvFGfbzY3/Ot4/Jbfv0uOx6peW+0fBNVhAo7i84ZQsBgYEpwJFiOIgk
 RvPg==
X-Gm-Message-State: AFqh2ko/INfJlaMDZ/SiQ/nUQcQR/qopKwDs5jMroXz/vpUEGnr1m0QF
 F6/KIzxKu8DEz81BRnucjagEwp3FjrHg2uWv
X-Google-Smtp-Source: AMrXdXvDVXLWWdqrzwX6B0xBGT/ufQrku2PzWW1vFVCsLDy+QiB4FgprJvYfRXKSShqQapd0xCAvtw==
X-Received: by 2002:a05:6a20:7da8:b0:a2:c45f:f0fc with SMTP id
 v40-20020a056a207da800b000a2c45ff0fcmr45394107pzj.27.1672358761898; 
 Thu, 29 Dec 2022 16:06:01 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6286c2000000b0056bfebfa6e4sm12586151pfd.190.2022.12.29.16.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:06:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 42/47] tcg/aarch64: Merge tcg_out_callr into tcg_out_call
Date: Thu, 29 Dec 2022 16:02:16 -0800
Message-Id: <20221230000221.2764875-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

There is only one use, and BLR is perhaps even more
self-documentary than CALLR.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 344b63e20f..1af879e6f5 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1336,11 +1336,6 @@ static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
     }
 }
 
-static inline void tcg_out_callr(TCGContext *s, TCGReg reg)
-{
-    tcg_out_insn(s, 3207, BLR, reg);
-}
-
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 {
     ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
@@ -1348,7 +1343,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
         tcg_out_insn(s, 3206, BL, offset);
     } else {
         tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
-        tcg_out_callr(s, TCG_REG_TMP);
+        tcg_out_insn(s, 3207, BLR, TCG_REG_TMP);
     }
 }
 
-- 
2.34.1


