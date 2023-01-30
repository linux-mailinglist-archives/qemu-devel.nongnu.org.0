Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085CF681D55
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:52:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1c-0001y1-Pj; Mon, 30 Jan 2023 16:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1a-0001xg-R9
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:14 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1Y-0005dV-JC
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:13 -0500
Received: by mail-pj1-x102b.google.com with SMTP id o13so12403844pjg.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+teQY6hM374j7zI9pNklyKGVfwDlTPag7AVypMwhnZU=;
 b=y7NyaXLE+G7OQa/WDOnjFUEL1HnvpbwoygfX0uFhQ4B/l8eFabDxqOocdEnOTMQCMQ
 v5DTvOnPFmAq9ofXqo/1Ooc8btgckD+YceAgOjEA+Se6xRUDw5gJ3bjal8BA6dQO4RiO
 /Edf5kliaylfE8+XVgKIS40kFmq1jpAB4vBUWx25y8sCytUIkfQVCyFKWtsEYY1KRJKU
 uT2IR48DBb/a9qAb+QNhbQaMoIaIhXTf6EkJ1EccG1qifT+r76VADyGedfEsB0gMM/t9
 IGThWzOHkyQkc2/hNy9/dn6uUtguxmU+N8Zt2SEGk31BQ3MRK2yjon+i8rNaoPBewddm
 ZPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+teQY6hM374j7zI9pNklyKGVfwDlTPag7AVypMwhnZU=;
 b=SfvJNggj+4At/wM0flkHfUKi/BNh7q2/TLe2QzQlYFdgC9KuMfd5twx4QtfqmMXkpJ
 f9UPGoh0x5uoBlfsTgiaaJqU0mWqUHTdVwXzfdB6dD98yg8gyss9dteKWMRnYpIjqaeF
 fiZCd6YGojcSMgziZfn/TuBzi8v6MAje6Rom4nwCx71yL5wi2wZg+e3KlgVZKInphHR0
 RfwBbi7FMLJi6vkw46BoZ7L/U0Ncpun77j+91JpqKhKNMsaKIhqXWArNOls8ZWd81+iH
 8xs7xexFcmzxc3vktSBiDHn058yFNsh6xLl+x5/o7iLNSLpJEdApTZ8ESth5YK0LJZ7D
 fLqg==
X-Gm-Message-State: AO0yUKXYKU/JEPl1IkbtgqyhFVXIqsY3ki9jiBV7Ijr2u2Rid/QaxO2H
 4mYIN9zDmEvVQWQakwRoxnsjXXjh8VvbP+WI
X-Google-Smtp-Source: AK7set8a7XP4MiUae1XiT8I+J6+T8XFD90PjfNzcERnJz+CaimKMb7h6oVbuMnJ8RAkvoLe/bM0aeQ==
X-Received: by 2002:a17:90a:1984:b0:229:f4ba:e3e4 with SMTP id
 4-20020a17090a198400b00229f4bae3e4mr11254270pji.13.1675115351351; 
 Mon, 30 Jan 2023 13:49:11 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v6 14/36] tcg: Add basic data movement for TCGv_i128
Date: Mon, 30 Jan 2023 11:48:22 -1000
Message-Id: <20230130214844.1158612-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Add code generation functions for data movement between
TCGv_i128 (mov) and to/from TCGv_i64 (concat, extract).

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  4 ++++
 tcg/tcg-internal.h   | 13 +++++++++++++
 tcg/tcg-op.c         | 20 ++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 79b1cf786f..c4276767d1 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -712,6 +712,10 @@ void tcg_gen_extrh_i64_i32(TCGv_i32 ret, TCGv_i64 arg);
 void tcg_gen_extr_i64_i32(TCGv_i32 lo, TCGv_i32 hi, TCGv_i64 arg);
 void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg);
 
+void tcg_gen_mov_i128(TCGv_i128 dst, TCGv_i128 src);
+void tcg_gen_extr_i128_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i128 arg);
+void tcg_gen_concat_i64_i128(TCGv_i128 ret, TCGv_i64 lo, TCGv_i64 hi);
+
 static inline void tcg_gen_concat32_i64(TCGv_i64 ret, TCGv_i64 lo, TCGv_i64 hi)
 {
     tcg_gen_deposit_i64(ret, lo, hi, 32, 32);
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 33f1d8b411..e542a4e9b7 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -117,4 +117,17 @@ extern TCGv_i32 TCGV_LOW(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
 extern TCGv_i32 TCGV_HIGH(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
 #endif
 
+static inline TCGv_i64 TCGV128_LOW(TCGv_i128 t)
+{
+    /* For 32-bit, offset by 2, which may then have TCGV_{LOW,HIGH} applied. */
+    int o = HOST_BIG_ENDIAN ? 64 / TCG_TARGET_REG_BITS : 0;
+    return temp_tcgv_i64(tcgv_i128_temp(t) + o);
+}
+
+static inline TCGv_i64 TCGV128_HIGH(TCGv_i128 t)
+{
+    int o = HOST_BIG_ENDIAN ? 0 : 64 / TCG_TARGET_REG_BITS;
+    return temp_tcgv_i64(tcgv_i128_temp(t) + o);
+}
+
 #endif /* TCG_INTERNAL_H */
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 326a9180ef..cb83d2375d 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2747,6 +2747,26 @@ void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg)
     tcg_gen_shri_i64(hi, arg, 32);
 }
 
+void tcg_gen_extr_i128_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i128 arg)
+{
+    tcg_gen_mov_i64(lo, TCGV128_LOW(arg));
+    tcg_gen_mov_i64(hi, TCGV128_HIGH(arg));
+}
+
+void tcg_gen_concat_i64_i128(TCGv_i128 ret, TCGv_i64 lo, TCGv_i64 hi)
+{
+    tcg_gen_mov_i64(TCGV128_LOW(ret), lo);
+    tcg_gen_mov_i64(TCGV128_HIGH(ret), hi);
+}
+
+void tcg_gen_mov_i128(TCGv_i128 dst, TCGv_i128 src)
+{
+    if (dst != src) {
+        tcg_gen_mov_i64(TCGV128_LOW(dst), TCGV128_LOW(src));
+        tcg_gen_mov_i64(TCGV128_HIGH(dst), TCGV128_HIGH(src));
+    }
+}
+
 /* QEMU specific operations.  */
 
 void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
-- 
2.34.1


