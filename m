Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591314088D0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:12:43 +0200 (CEST)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPix8-0006VY-Cs
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifs-0007Io-KL
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifo-0001uQ-OA
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:52 -0400
Received: by mail-wm1-x331.google.com with SMTP id g128so1737018wma.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PsqyvwVa655omQdFIHqiDmLC7YzT5aRUDOlK0c8rs+c=;
 b=cEEkTQd2laaceVcbDBsnMVz7KuOGiVK1Z+EN0pjb6S4xob5tUd36jqka/iwdlyGqRa
 jUmvMG72mcLBGdlRwwFcOuHTUZCmnj3oCrLYhZ5Yihm9zpj/c3fMDOAWreV9GBMz87wP
 k1w5Hp4wqkczGpBRnjDvesErT0GNOr1Unmdc8dyYK5TVpCHwJ38PCerNRz/hESIu6a4n
 dnINQztDhO96iK63wDXeR8f1xcoiiW1klqSS/LzEbMzmJADgEfz7yU1q0Xwu2UrXVFL0
 N9r5/1SF76LvnSAya4INQcLzTmpxP0UEm/nRJ8CC8pmPsHPjjQnNm6mQH9lgPr2gfH8R
 Owhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PsqyvwVa655omQdFIHqiDmLC7YzT5aRUDOlK0c8rs+c=;
 b=Ixqt4t3+qpWi+IsCaIx47fJIeE6y2oe6haxYLFpTUCgna8szBp0ltuIjG2J/SX/nYV
 OxBq8htod7SdDoPccQ0UL8vCeKhdFK/uKH+/jmnAsGYR358/GMH2bXSJ9bVITggneh4y
 Gac9Y8OBSKCb/4g8tZ9P22RktmTlvTBQi+qFgHjtRy8JzO9j7dAX/EcksYcnzAH6gYQq
 5NRbSuWsLzoiVQtwlJYZwGtx55Pity7GiNqnaN9AmWsflzYMgtGUp0jQxojrOB/Fk17y
 DIp4hw/lkeYj+nRn32swWaBaMoDZ6/2Oyd1uYWU5E5F+oy2PL8ffdt6V0R1ymvnDm8Qd
 NCvQ==
X-Gm-Message-State: AOAM5317anI0LrvFvrEe4CzIR1Qnu4VdsehoZTunr1wA0MjdxKUAgUF4
 ie+4cteytXOJOg7a0Cen5ReNZGUYRxP5Yw==
X-Google-Smtp-Source: ABdhPJywCsgHx6HAofFC0+1X0qjgwQmgB+o/2+IOCbVIFHhvuK6XEVkR+tCnBIvX4HMfykyK3zJfFw==
X-Received: by 2002:a05:600c:3392:: with SMTP id
 o18mr9259153wmp.92.1631526887472; 
 Mon, 13 Sep 2021 02:54:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] target/arm: Optimize MVE VDUP
Date: Mon, 13 Sep 2021 10:54:35 +0100
Message-Id: <20210913095440.13462-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize the MVE VDUP insns by using TCG vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d30c7e57ea3..13de55242e2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -500,11 +500,15 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
     rt = load_reg(s, a->rt);
-    tcg_gen_dup_i32(a->size, rt, rt);
-    gen_helper_mve_vdup(cpu_env, qd, rt);
-    tcg_temp_free_ptr(qd);
+    if (mve_no_predication(s)) {
+        tcg_gen_gvec_dup_i32(a->size, mve_qreg_offset(a->qd), 16, 16, rt);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        tcg_gen_dup_i32(a->size, rt, rt);
+        gen_helper_mve_vdup(cpu_env, qd, rt);
+        tcg_temp_free_ptr(qd);
+    }
     tcg_temp_free_i32(rt);
     mve_update_eci(s);
     return true;
-- 
2.20.1


