Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6F3906B9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:34:36 +0200 (CEST)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla0p-0007Eo-Od
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYew-0002sx-I5
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:55 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYet-00077k-Uh
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so13039821wmg.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rU5dfnAxu0D5jUey2IllvExicqyx3slpp4Fh1t7/rRA=;
 b=nvFf4QYsMeNcSa3krf/OgKicTJT5oRuIT+iyPZ/H3nQu3XagcuuevO3dF3klyQFBDg
 YoCwfkXLn+RqG+2R1xKH820MuIv9uQ4+XzXZaXRrW6Q8i1heF9OEzFfubiAJb0Mq02DI
 9gY/A1zMAE4QDTwh1aXVMqDLad2SVi0afYJmapwQ0Q26yuqSp09TfAZ4lpq+UJzUQeeK
 S6vsW1ynbOaqqKTNK+R3jTK7VxGM9WSPhPOubBCsJj4FD0ryWlSwl6GMstsu0UbuR8pm
 vakIRmatvaBzh/Dq9VC8gIJ1F0sI0afZ5iWOJ7HVGaGH0y6Z36BmbnWn3rvdtnUR9z7R
 t0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rU5dfnAxu0D5jUey2IllvExicqyx3slpp4Fh1t7/rRA=;
 b=d5xD/wndewO3/EUSL3ML1JWjNozocreLFi3UmccoO794CuF1J3vS65oZfRNzArXoSY
 /uFaRy6Rv3N/TS/NQ1FG3e4ZwoJ9rFURTkNv9bPLjsbEqesEx/GeOwxm7KeUuc+QlFhf
 nqOZS2OapyxL0KUoPPX8jgExA4n4QpMhEYfoaV5ZELYvnNhw8qZ/Z+EC9xgys1+NistW
 gCndb/3QJjKtreHpF5mf7tZ1ykEFH/m0bOu0/31MFjIij5iAgv3qdH98STSXvSFqlysc
 HRS5xThHClnONs/I1XUHHBqPqNmL5oSEjN1bgnl11l9acuWDz6eF90AvnXoKmfjIdEX+
 0n3g==
X-Gm-Message-State: AOAM532phb0VmBZG8klqTsDwWMq8mJOGj/vXL4s1wqW7OiT649mbxpgb
 lcawTgWm/qlnus4qf0+BdyjcUHz7ngqv6W4e
X-Google-Smtp-Source: ABdhPJzuil9UV2ZICVORo88gNpsCo2iBtx0yU9mHr3/oHaWeYv5aNWbKyeb9BGtvffaNEt5qIFKYpQ==
X-Received: by 2002:a1c:e408:: with SMTP id b8mr24965326wmh.85.1621955270392; 
 Tue, 25 May 2021 08:07:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 108/114] target/arm: Fix decode for VDOT (indexed)
Date: Tue, 25 May 2021 16:07:30 +0100
Message-Id: <20210525150736.32695-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We were extracting the M register twice, once incorrectly
as M:vm and once correctly as rm.  Remove the incorrect
name and remove the incorrect decode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-87-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-shared.decode | 4 ++--
 target/arm/translate-neon.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index ca0c699072e..facb621450d 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -61,8 +61,8 @@ VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=2 index=0
 
-VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
-               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 14a9d0d4d30..9f7a88aab1b 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -348,7 +348,7 @@ static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
     opr_sz = (1 + a->q) * 8;
     tcg_gen_gvec_4_ool(vfp_reg_offset(1, a->vd),
                        vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->rm),
+                       vfp_reg_offset(1, a->vm),
                        vfp_reg_offset(1, a->vd),
                        opr_sz, opr_sz, a->index, fn_gvec);
     return true;
-- 
2.20.1


