Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0857959C58F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:57:33 +0200 (CEST)
Received: from localhost ([::1]:33734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBg2-000366-Lc
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ox-0004lR-LE
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:46 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oo-0001gI-NL
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:41 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r22so9693650pgm.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zmm5wl5wUr/T1I9FyVRhCcaj7lDWNVq0kdn79O03klA=;
 b=PVG96sQEAFM9Eep1MvLNTFmcZaWKFU5pYi/deeJAON9VRAbaRGGr6Vi2mZ5LTsoI2D
 plpUeaqsOoLvrC1uEDfNzL2l1MSNiW+GVgbA5UICuN0/hKqYx4JNpr4/CrMyqYptWG5Q
 mG3fsT+EHBc/NJroE5+FQlDA9OY/N+hwEDe4D+rx4TSDh65Dj3wIREzWdPN6Kd2I1J/t
 5n1ICUIdpFuF2rUcWnXS8n3F6r04udOdai9Tejl9qiCi5KUb3eOvgk96d0VVgRMXfa7w
 vXJjg0bdMZpnestAhb4Ga+N/GloJfzcAFSp67KvAdNhJzEjVuFsiQYJnjPsvgHV5lY2C
 jTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zmm5wl5wUr/T1I9FyVRhCcaj7lDWNVq0kdn79O03klA=;
 b=FvwCdgwUtDajYBbVhJxBCUxJCKB+CW+8E26zkbBZwqmocdcb8O4yD/XHZ5+FQ1Xz/g
 C8c+1BqrhRZ0B9IZ6M06o6F1mV1zx+curpOxXEV6frLEeI7SPCxB3iO+uT0ygykiX5On
 HCOqfitW5Iegv/E+ra2D2yNdD8sOMwJFJwLFspLQ6sAyEvrX+HMA2WSZkQ7xHMzkAHKH
 wvEhRaex+Zx4WEZNwOSeko4VnvDbkVZWu0PwYmdnZj5petM6sUYAdAYoHkqWhMnAgTvC
 WlBCTLj28IU735x7U1J1QeNWaXhCQXaqBB5ATqBqFBsAeXaGbIwwfz6vu5BWHT86XsKv
 OzrA==
X-Gm-Message-State: ACgBeo1OqAXUcRggye/OE4LUTF+xVZsOLeuRIeAT5Ehkup52QSwnfcin
 IfH/mHQlaCKDe213wL9ss3w+YBe9sYdAFA==
X-Google-Smtp-Source: AA6agR7HjYTCB7dO3rG+bIKQ0RYN86SMzZ9Yd7eMZ1dVtPwy5l/otSyE/iOi/jjgh5gS+ihFuHas+A==
X-Received: by 2002:a05:6a00:2302:b0:536:c7c2:10a9 with SMTP id
 h2-20020a056a00230200b00536c7c210a9mr3089355pfh.11.1661182292672; 
 Mon, 22 Aug 2022 08:31:32 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 57/66] target/arm: Extract HA and HD in aa64_va_parameters
Date: Mon, 22 Aug 2022 08:27:32 -0700
Message-Id: <20220822152741.1617527-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index bab3e89227..de8b3392a8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1014,6 +1014,8 @@ typedef struct ARMVAParameters {
     bool using64k   : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 765638f002..9f24940d20 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10109,7 +10109,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, using16k, using64k, tsz_oob, ds;
+    bool epd, hpd, using16k, using64k, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMCPU *cpu = env_archcpu(env);
 
@@ -10127,6 +10127,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         /*
@@ -10151,6 +10153,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10222,6 +10226,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using64k = using64k,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha & hd,
     };
 }
 
-- 
2.34.1


