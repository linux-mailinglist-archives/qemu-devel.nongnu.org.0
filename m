Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D284C62F1E1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:52:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzj-0007wu-O3; Fri, 18 Nov 2022 04:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzJ-0007gx-Lu
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:45 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzI-00027s-3j
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:45 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 b1-20020a17090a7ac100b00213fde52d49so4574316pjl.3
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t0Huvl5EDl6S+kJ/E4VV+nKvSC60vdV8IvOI3pEWJ4w=;
 b=opL7CccQ+GmlM2XHZaoSy4bBoFojwd3rmF1hM8Xtmh5sNvqE8vH9zAPtb+NB7gtqx1
 gBQDRZ2+vjFzSKAtsOcSpY3vkYRiO1P/WT0bb6I0nsHDhoU6wWWX/+AXO4R7klbSScSB
 AarXJSNreaYNCIJYOM6IWeS1WYLFaoiPVPn/PCHkZ3wHJhx8CXBOYSdK4K9hDMXsO7A9
 fcBtqyFZGmrwT33VNWB7HDXlQ/169CN2g5xoog5uSv4Vx51DaFVRSAuSBxMlb+mIqFi+
 FcyCp6gIuOhuzrISTE47/3yPtybZ99neWmuKrdQrcZRqfCG2USFofX/zRGqDhIVUOMLn
 pVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0Huvl5EDl6S+kJ/E4VV+nKvSC60vdV8IvOI3pEWJ4w=;
 b=CahMuHi8HPhfvM225Dqk2jr6AdiNSkRb1ryvw1zfup39tX3zMrqQE7d9rmhBRO1abg
 JaKGljeB5MG71/D28581CD4DKekPf8ly/gRKL5FVfO78gZaD6gEh+GoV0AdGK3Y+vaTK
 sCzRWs9wzh3qhwVXf2/B1DtoXKch9q7mz/SKrxXhBRbwtUYviHokTThyitJjPcrpPXsI
 NStzithC7MGiKR0leSJBnENo2R7Ou9Jz/5i1dwkpjEwmwxNNZEmoNn3GYYYLgkcdZJu8
 uztAxQxKOie0QgEqbD+i8EAiBS2hruplGdY6xazFkw+MmHXvoJjRdsmRCGemyCfeIv1I
 kUag==
X-Gm-Message-State: ANoB5plbJ9lC+dtXIkn+ShPK7r2rkP5mC+SbRDBoiEYpBmPSmaGAfrBi
 Hn4gn5WEAjn+XAhgLmToHcvasq18WmnWFA==
X-Google-Smtp-Source: AA0mqf5Zk0sW2/sq6iz0jvZmuWE+oxxP1lVKQfrIoVHn07ocSTcmejv6qIFYY2wI1oogJ2eRIA2ciA==
X-Received: by 2002:a17:902:7d88:b0:186:5c72:1081 with SMTP id
 a8-20020a1709027d8800b001865c721081mr6799264plm.71.1668764922881; 
 Fri, 18 Nov 2022 01:48:42 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 25/29] tcg/i386: Mark Win64 call-saved vector regs as
 reserved
Date: Fri, 18 Nov 2022 01:47:50 -0800
Message-Id: <20221118094754.242910-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

While we do not include these in tcg_target_reg_alloc_order,
and therefore they ought never be allocated, it seems safer
to mark them reserved as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index e38f08bd12..e04818eef6 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -4224,6 +4224,19 @@ static void tcg_target_init(TCGContext *s)
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
+#ifdef _WIN64
+    /* These are call saved, and not we don't save them, so don't use them. */
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM6);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM7);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM8);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM9);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM10);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM11);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM12);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM13);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM14);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_XMM15);
+#endif
 }
 
 typedef struct {
-- 
2.34.1


