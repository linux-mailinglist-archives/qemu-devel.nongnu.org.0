Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0AA4117D2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:07:57 +0200 (CEST)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKtg-0002nt-TC
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9q-0002uj-Og
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9R-0000wk-20
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id w17so22055610wrv.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AXBRy08pEErOH7eruwxlYtrLmWIxeuV4R3OA3Hcv0S0=;
 b=fKFaVQ+6i7yMalr6wjxXk4L/aEVgX6ui383zrt5wRQhSFxIfsN0FqEofNz18183e0j
 ShWVqyS2+O0/j5UGtI9psTeUdHslxjv4jTbq3LPNEFDQmSCh3+KGkVp4JL0dOpsacgyv
 UNpRQj6Gy3c1BktxdS6HPiv1VUZB3JL0gANMqygeG1wwSCWRbFZdFzk+NhfmB+Zeesmp
 RRARnRUEtra/CX2T2ejlbpJ4qn94qeX0Rn+UALf+DRq1kuU3cuH4cVQ0OkwiEtKbzvgb
 VRohoDkiFIWZK88FsgRDMKa0meZNHj6UqjVVU7enTQdAaL0veIuzxHXau8o0aHdHwH1T
 xi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AXBRy08pEErOH7eruwxlYtrLmWIxeuV4R3OA3Hcv0S0=;
 b=iB9GsOQKOLc3lm0+i978KbEFdSSHgPiBWkBCpfD05Lt66z1vRIWzFgdVJVm/TcqQwT
 zl2JPeXL/EvbjR+cdPqiL9IUHkfsA3Aehtiq+QDtP1m7p4s4OD63g9zIZsdYHHDtNHg6
 EKskKq2jPzGJ9ZcXs/ZCYkcE+XnAQUj47hNlNMHvr9p0Nyyo3CqcplXNEgfluyBYw++g
 Tqr+coqGtGg1Hx0jgwc7g9mZRX4WNL6q8rg1VvtNo2OcZPcoBJ4xmN2G0OG/U0JYKJ5w
 3cmD4xdVpl5/Ev62i0ZCuHmeJHWP5nBsk0BV1z4mgBwxqLwSBbgWFEuhc/N/EmIBSTmw
 REag==
X-Gm-Message-State: AOAM531kw2YBERAlU3A1aGVxDgVtaUKX3CnndsCVpzdrGnGl/TILiZfa
 Uw2ur9OSrc0IeNpUYjI9u4rMMCKwEMuxNA==
X-Google-Smtp-Source: ABdhPJzNRbb3qngJIsK4t84/ohj+WDqT/GoxYDdMsqx99tGBWkt47S0PlkHlj/KIoNitg9bKZMH3SA==
X-Received: by 2002:adf:e88e:: with SMTP id d14mr29476553wrm.207.1632147606534; 
 Mon, 20 Sep 2021 07:20:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/27] target/arm: Optimize MVE VMVN
Date: Mon, 20 Sep 2021 15:19:43 +0100
Message-Id: <20210920141947.5537-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize the MVE VMVN insn by using TCG vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-9-peter.maydell@linaro.org
---
 target/arm/translate-mve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 13de55242e2..4583e22f21c 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -769,7 +769,7 @@ static bool trans_VREV64(DisasContext *s, arg_1op *a)
 
 static bool trans_VMVN(DisasContext *s, arg_1op *a)
 {
-    return do_1op(s, a, gen_helper_mve_vmvn);
+    return do_1op_vec(s, a, gen_helper_mve_vmvn, tcg_gen_gvec_not);
 }
 
 static bool trans_VABS_fp(DisasContext *s, arg_1op *a)
-- 
2.20.1


