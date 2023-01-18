Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF84670FB0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 02:13:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwzR-0002BN-Rt; Tue, 17 Jan 2023 20:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzP-00028I-14
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:43 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzN-0002Fl-B4
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:42 -0500
Received: by mail-pl1-x630.google.com with SMTP id r21so3249119plg.13
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 17:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oe653jAwb+trclLqO5xizolsekcbMLByW/eiNLY2YMk=;
 b=T8Ni+FSxd8awv/RgOySrM1axkRtVYW3VxzPhJ6km9unzqRLP1T/q8JqS7I19wG+r0Q
 zZe92g1lSnpPjTREUrx5g+azQXSZVBHVXgoMMlCAmtn2P5I1HycPvTBEXASuIQFBWou8
 BTSRaFENSLVADRfZleKt1kNsKkRXzKrki+ZIuq9yv88OvEvGBx0brYPEy8ctHKJvC9Vh
 d8vz9sSS1NEWw40xk5ofZN1Q8jrdbc5JWL2AL52I2ai6fBnkAs6l1dpC3dIcQdR/JfT+
 /lxiB1bVwH9e00DLDYXyHuZ0QUYwWdQZZP/ynRRC9bXAV7+dn0MwqDYVwbb7sh4UVAmQ
 iKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oe653jAwb+trclLqO5xizolsekcbMLByW/eiNLY2YMk=;
 b=dfOcnMRGq5ilMBk2pgDzFD824riwxizanvNiszXd2IXasyl2IsWOoXbhdQbSDbpJ1j
 MJ73pdG+VobxDaL6btGJlKVn3bLZ2biXxIXNdxtqqUsYoRnf0eKyYzG5peqoCb0q7Oyh
 QF4CV12nlbEQhHMYZKki17g7J49az/hoyuEsfCbo5LuQt3UpjZzOb0axBfZw57QRvg87
 9A0N9VBcEQKutVpdhMQTximCyC2236jxjwA5X798P5m5o09v72iL4OdS2Lfhn//C75M6
 VSooa+YlHO/rj82eIEtXcz2sHIH/jKH7XGAeAQz2y+ae9z3h1/NdhPmzCh1NSUOrTlwp
 4xxA==
X-Gm-Message-State: AFqh2kpZB2zNHDpS2cvx/9rMiEasRLT0O5jk3UlOQjeZ1cl3csUBF30P
 Xxe/Eo20bD06iIzASfGpdFLKwLQqG8DOcxq3
X-Google-Smtp-Source: AMrXdXu8NplU1Zwdp7oWRetMHiJDzISRFw36JSJChB7CYfqRB7yAZx93Yxw5OpiCFv86X1ouL78y2w==
X-Received: by 2002:a17:902:ab94:b0:194:62d9:9a86 with SMTP id
 f20-20020a170902ab9400b0019462d99a86mr5490670plr.59.1674004299900; 
 Tue, 17 Jan 2023 17:11:39 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0017ec1b1bf9fsm21660259plp.217.2023.01.17.17.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:11:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name
Subject: [PATCH v2 09/10] tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
Date: Tue, 17 Jan 2023 15:11:22 -1000
Message-Id: <20230118011123.392823-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118011123.392823-1-richard.henderson@linaro.org>
References: <20230118011123.392823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Take the w^x split into account when computing the
pc-relative distance to an absolute pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 29d75c80eb..d6926bdb83 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -702,7 +702,7 @@ static void tcg_out_ldst(TCGContext *s, LoongArchInsn opc, TCGReg data,
     intptr_t imm12 = sextreg(offset, 0, 12);
 
     if (offset != imm12) {
-        intptr_t diff = offset - (uintptr_t)s->code_ptr;
+        intptr_t diff = tcg_pcrel_diff(s, (void *)offset);
 
         if (addr == TCG_REG_ZERO && diff == (int32_t)diff) {
             imm12 = sextreg(diff, 0, 12);
-- 
2.34.1


