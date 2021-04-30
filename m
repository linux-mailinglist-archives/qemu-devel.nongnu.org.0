Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE033702C5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:14:21 +0200 (CEST)
Received: from localhost ([::1]:50090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcaSq-00074x-Ms
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmG-0004M7-8p
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:20 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:39544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007is-5i
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:19 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so2349207pjd.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4LOZdC1ItbQynZDOtyUtTS7T/flVKohWME+t/j4leKo=;
 b=OqouuTZeYzkZmv5DeNtksNqG4mz7iKqSX6Ko8pGmHfkOk0jEZ8Z5HdQQv/F8lixylw
 H6u79bTGyH1mEuew9lHwdfeiJfloFEwcHIeC8BC5mg7x8UMC+PiIIkQ3Pri652Fc4GH2
 lb2XfnuMPnh0n5BE6A18t1JwHNsVRs1mFAhEeOiDlOlhhuv9N6Eo6vkk7QoT506zfYOO
 21s+rcr8oz8HUNpcg7KNZdlQs6lssLO1Hs0j4YxEIlS4rVTMA+AR97UkmC2KClyzZ1mH
 27SJ5BShemlJCE2XRe2Ratql3rnKaJkFj9aeU6Ts9ZulkbwSM1WjZdcX/0UBDZ6h+Cqm
 hnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4LOZdC1ItbQynZDOtyUtTS7T/flVKohWME+t/j4leKo=;
 b=DW7cg1Tsk2jfyZ3AlN3sEK/YEhKOLRCd9dNdMfXwKXXK3MhPz+YOXmFZtQmp30MV53
 aYVPoPP//wx+w2Kp3u8C9w+e75kJH1jcKUOcAoZmq0hMccb7mXdtY8kkh1oQBa81Fr74
 JPfg6PnngsuWHiU23nOwiseqcyIqAKVydwZlnLW10E2c8lW666FZZycWEJkiUKpdJ2AG
 HfsC6HAp05L7Di0nPd5L5ogaMtB0WDi8dJGTwlWN4/lnmQ+85ywKbUqdLKcLW31ruMxa
 +1bk6K6uT+Zw99goEyhzGVmVnJI16u65dw1nRfQQoJty2tuoj3PweCFdy8ZhtG4EIVjZ
 ilRA==
X-Gm-Message-State: AOAM5316RzQ38qrTQSOFcrYYuWWWU9ceIsRBZdE1DjHDDi4XJIHs29KV
 3GbQKtJt8AzJ4GFKTghM0ywC6VN9GUAaVA==
X-Google-Smtp-Source: ABdhPJz2LHn0UhsSdKZGiG5wvaU4wTlBHn2EOFfphhx610TJxP7tHQlgS8G3/5qbd3LHPvZEW38wJA==
X-Received: by 2002:a17:90a:f491:: with SMTP id
 bx17mr15463073pjb.176.1619814584204; 
 Fri, 30 Apr 2021 13:29:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 53/82] target/arm: Implement SVE2 integer multiply-add
 (indexed)
Date: Fri, 30 Apr 2021 13:25:41 -0700
Message-Id: <20210430202610.1136687-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 65cb0a2206..9bfaf737b7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -783,6 +783,14 @@ SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
 UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
 UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
+# SVE2 integer multiply-add (indexed)
+MLA_zzxz_h      01000100 0. 1 ..... 000010 ..... .....   @rrxr_3 esz=1
+MLA_zzxz_s      01000100 10 1 ..... 000010 ..... .....   @rrxr_2 esz=2
+MLA_zzxz_d      01000100 11 1 ..... 000010 ..... .....   @rrxr_1 esz=3
+MLS_zzxz_h      01000100 0. 1 ..... 000011 ..... .....   @rrxr_3 esz=1
+MLS_zzxz_s      01000100 10 1 ..... 000011 ..... .....   @rrxr_2 esz=2
+MLS_zzxz_d      01000100 11 1 ..... 000011 ..... .....   @rrxr_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3f54636e11..4fdec08f46 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,29 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+static bool do_sve2_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
+                             gen_helper_gvec_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zzxz_ool(s, a, fn);
+}
+
+#define DO_SVE2_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzxz_ool(s, a, FUNC); }
+
+DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+
+DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+
+#undef DO_SVE2_RRXR
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1


