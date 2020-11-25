Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDD2C37F1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 05:16:07 +0100 (CET)
Received: from localhost ([::1]:44454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khmDu-0008Fz-J4
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 23:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm54-00050S-IU
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:58 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm52-00065C-Re
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 23:06:58 -0500
Received: by mail-pl1-x644.google.com with SMTP id x15so461733pll.2
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 20:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f97D77kFtW+HRq202SBVTA2C2Bh99/g/k3cnzM7yNVs=;
 b=DV3kYu+qBd+dgDvVz3rVr18hb2jU3aBK4pbAxcxG1O+f2bYJjleUeKirIXnuwKLSox
 cuA5+KLfPfSMBdUwdxfRKBR2/TLSuqeHk7fyhMysBZnD2N8qZmCb6tidWjnBwNmtVrNT
 fV1qUV8P/7kTSeuEsyVMHRO6t39VninK93moAY7BGFOevuVreJd+QVLpAX0iMOP1SCQ5
 5S/xwFVqZL3Q6cErtnml+POrpWfl+/nmCW+wpDGsWNwTZnHx8BGIRI1WIp9NxzAFxJgY
 kjq5heJTP2zFWagvZyGd3d6SL4mt6Nsrb5AvNSvZBZUe542bQlp0IM2KwG3uYdNTjGmv
 o9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f97D77kFtW+HRq202SBVTA2C2Bh99/g/k3cnzM7yNVs=;
 b=kLKtZgLktNV9hor3/JYpxcnwGEO4r2m51OiGLR3ljGXMQUX756htKYG2Rxe2ecN/HI
 BWTkj94scD7ng9d9P0isEvE6nI7lfpoc+Lku+1nP8ss0vca2x4XhtsnMWGxiDMxqMqLc
 OwEv+NCmb8f3Q4qCcZD+ezAW0sbPKdFOydajpay1qp4LhDeZXr3o4asUGQZVvkz6TtZe
 KBVOtqxvB/X2j8BRKRiM+rdpMNM3cjf2KqRiXrVH7RZVaXqYef7gh4lgM37Srlq66LoL
 Xy6FSjRllbBbvKCdWAbf9N0+RjPFRnpW+Ult4TLwsoLEA95cRijxuGxyJSamdilmouwN
 1HhQ==
X-Gm-Message-State: AOAM5304KD4H38LzL/xBywlrZr5iP2/cjJ+dRBeZyDaRMj8aiE9oGr96
 DvUjiSr9S5msNcRhdqhph3QU0r0eUMYdmw==
X-Google-Smtp-Source: ABdhPJyJ06r+JinSUmshFEKVAlobdHsMT6uCbqL1W+lLl+/vrMPHY09MT/OVyNGZ3MEVDWazgP6sLA==
X-Received: by 2002:a17:902:8d82:b029:d8:c5e8:9785 with SMTP id
 v2-20020a1709028d82b02900d8c5e89785mr1452546plo.5.1606277215199; 
 Tue, 24 Nov 2020 20:06:55 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] target/arm: Enforce alignment for VLD1 (all lanes)
Date: Tue, 24 Nov 2020 20:06:39 -0800
Message-Id: <20201125040642.2339476-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index f6c68e30ab..32e47331a5 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -518,6 +518,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     int reg, stride, vec_size;
     int vd = a->vd;
     int size = a->size;
+    MemOp mop = size | s->be_data | (a->a ? MO_ALIGN : 0);
     int nregs = a->n + 1;
     TCGv_i32 addr, tmp;
 
@@ -559,8 +560,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     for (reg = 0; reg < nregs; reg++) {
-        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
-                        s->be_data | size);
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
         if ((vd & 1) && vec_size == 16) {
             /*
              * We cannot write 16 bytes at once because the
-- 
2.25.1


