Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF699643C27
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:18:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POw-0003Uj-5e; Mon, 05 Dec 2022 23:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POt-0003Ti-CX
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:47 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POr-00074B-Um
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:47 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-12c8312131fso16095148fac.4
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Ctn4q8UCWShe0HV3h1VrXrerV51yET9dh87n+Fb5Oc=;
 b=O80g0rrP97tMmLTBVm6DClNTRDd/1So5g5u/0064U9iA/vNfqOZJ6wHsriZyeANpy3
 sReFB3KorNFCocmspxYuuUtlw1vnY0M9IAn/+mHiwgKTk5WLge8dDzPxKDmEM3XGI2OL
 03khekSdlcuau/JDA18Ewf8XElZ8zWmx3MiMgAHcm7wKwqEfmmPDyVUH8nJxYD85Jfa/
 3Lcs54zI8PFUmv/7MMFGBqpehdAOSnPKtIV4knfdNIrH5WCvUMKo/H/BQ37xvqpr2pYz
 2qw/DUqB+rtoiRTc62bYLc+qDX59ZHu30oO8htbfmjHoUR6UsvXl1l8+wyM6GECs9OIU
 k6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Ctn4q8UCWShe0HV3h1VrXrerV51yET9dh87n+Fb5Oc=;
 b=FSSG3gpQWrtDPVt8RgjTTT12apvpIoerSD7YiDXvALHFc3N9XOEyGfCAaPalBQg03S
 mGfl1n0YFefZv/ffjlcRQYWjR0b2iC1N2PNjvCqeLoPQfAY8xnC/zEiK6H8Qz0qLt0sO
 FCNVJ/Eyi/I1XHJqeZ8MzvrBsoNi9I984cWZHEDjQyhkycmKh5y3mi2uvz/HLz/QD//S
 OQVphCyEZFrA6ifBz7uuMmc/JQyQlrIVG8jubTD0AHetYLFppPFOug6HBaTYirL0VW4d
 Uydyv5M3yG2b90wOInu0szzmmYtD67Wrs0uIePyreouUSZRO4D+vrmmZiNxdaz1hHWBc
 uoeg==
X-Gm-Message-State: ANoB5plS2fA/9KX4veqz4A4l21445pvUOFvhLJjC997lNiAr3XlXf11Y
 4pDEpkOibeEC5fR6KYTkkfUDfP7oop6bIcedfZ4=
X-Google-Smtp-Source: AA0mqf47mgHaJZNxd0ghROR5QwK+PcebL6c0hbwWMLLvJsBnagBfW8zmR6RjoUJxckktMYy2msAGew==
X-Received: by 2002:a05:6870:24a5:b0:132:3de9:bdf with SMTP id
 s37-20020a05687024a500b001323de90bdfmr36220896oaq.188.1670300264958; 
 Mon, 05 Dec 2022 20:17:44 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 21/22] tcg/riscv: Introduce OPC_NOP
Date: Mon,  5 Dec 2022 22:17:14 -0600
Message-Id: <20221206041715.314209-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 37baae9cda..de029d62b4 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -254,6 +254,7 @@ typedef enum {
 #endif
 
     OPC_FENCE = 0x0000000f,
+    OPC_NOP   = OPC_ADDI,   /* nop = addi r0,r0,0 */
 } RISCVInsn;
 
 /*
@@ -390,7 +391,7 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     int i;
     for (i = 0; i < count; ++i) {
-        p[i] = encode_i(OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
+        p[i] = OPC_NOP;
     }
 }
 
-- 
2.34.1


