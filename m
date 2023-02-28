Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7546A5035
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 01:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWnzg-0006Sv-Gk; Mon, 27 Feb 2023 19:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnze-0006RE-HJ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:37:22 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnzc-0001XY-Je
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:37:21 -0500
Received: by mail-pl1-x62d.google.com with SMTP id y11so4570878plg.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 16:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ySb1mvjSXZ66e2yK3BcHGU3IqS6n9iUd4Z/aLHtfxkk=;
 b=YavU0Zk6UhmnvxJG1bZoCZUmPutdbySIKFxXEW3MkowWrvGRW5U5k886pN8h5MhXOq
 RHktwBnkenNfGO00sVi0uhttapKfNQYCoM8R1BLXsqDBBKUefftpifM0hKyBNIkcWYqi
 qb7nAVWZmtS2N2Sar2EOaqvITqJ/mac6GhM/v49IlBo4BKEHBueksDxo+5u7Tw+0xmpl
 UCGuXc8XkfCj1Cc0jvHXpPtcB3ARHA1KQ/oU5fGz4d86fi/DWeVzBwF4QtCw+Lq793RN
 sYIi2IaxIn3+GKhFog1UK8vrPQvjzHx+Zgdl1S9y/lo+VraVOeeV8AzsPUDJtV/AeBRY
 lsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ySb1mvjSXZ66e2yK3BcHGU3IqS6n9iUd4Z/aLHtfxkk=;
 b=ddcSYLA7fAO7/39z5+ATYAnxZdyyZ19y9+cDxzhlT0mDN3xu7mDIL53tQCJcoFpO1n
 JUtrpnH/51BbowjGOO2btA+NwplvCWPNFdwSIyQUA7PQGPWa+RyvvYvY0VgxI0+m8LKh
 zJx2eymqawkIRCdy2cRowz36/cvqU/9HJBx1KVV+yOO4DG8WW/glItKOkCx5Ujf0KVah
 CKhuWdJWc2SmINOfLrdaNbodeXZo9vFPFus7CN6BjOX5MqVfiuBr+IBaJoLryLBe7FnV
 y1nLGZi060Hem3C9oChCZIuHmzgjLCdJgAIl5gqsQS+T9UdV6BdxvUk4GqBnwvL4FUaQ
 2V6Q==
X-Gm-Message-State: AO0yUKVY6iYEdfet8ZGPU9Sg21XmG5Cc+B4rLvubOWDMttsRvn52ghZ/
 V0p/GFNhbe8ore+BkZcNky8tJVgQgZBD9YiK0zc=
X-Google-Smtp-Source: AK7set+4cxUCW/Q0JmwX55miRpHgGAw7+UrOIYLCwgyIUTdAqABVI1MOpFYKLXuNZXJfbAkUgRNDaw==
X-Received: by 2002:a17:903:234e:b0:19b:64bb:d546 with SMTP id
 c14-20020a170903234e00b0019b64bbd546mr1178025plh.18.1677544639241; 
 Mon, 27 Feb 2023 16:37:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1709028a9300b0019cec7d88c3sm5192651plo.236.2023.02.27.16.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 16:37:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/3] target/arm: Dump ZA[] when active
Date: Mon, 27 Feb 2023 14:37:12 -1000
Message-Id: <20230228003713.861168-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228003713.861168-1-richard.henderson@linaro.org>
References: <20230228003713.861168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Always print each matrix row whole, one per line, so that we
get the entire matrix in the proper shape.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f1f454e7a0..0e54e19b05 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1080,6 +1080,24 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                          i, q[1], q[0], (i & 1 ? "\n" : " "));
         }
     }
+
+    if (cpu_isar_feature(aa64_sme, cpu) &&
+        FIELD_EX64(env->svcr, SVCR, ZA) &&
+        sme_exception_el(env, el) == 0) {
+        int zcr_len = sve_vqm1_for_el_sm(env, el, true);
+        int svl = (zcr_len + 1) * 16;
+        int svl_lg10 = svl < 100 ? 2 : 3;
+
+        for (i = 0; i < svl; i++) {
+            qemu_fprintf(f, "ZA[%0*d]=", svl_lg10, i);
+            for (j = zcr_len; j >= 0; --j) {
+                qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%c",
+                             env->zarray[i].d[2 * j + 1],
+                             env->zarray[i].d[2 * j],
+                             j ? ':' : '\n');
+            }
+        }
+    }
 }
 
 #else
-- 
2.34.1


