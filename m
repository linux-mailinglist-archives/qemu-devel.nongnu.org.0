Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E012C68AB59
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:38:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLU0-00055x-ED; Sat, 04 Feb 2023 11:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTx-000549-Mq
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:41 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTw-0002Ug-5g
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:41 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 l4-20020a17090a850400b0023013402671so11503865pjn.5
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+teQY6hM374j7zI9pNklyKGVfwDlTPag7AVypMwhnZU=;
 b=jWO0eiIRYwo3XzUtpolT+k+8kzlB6y2nCuANXh/pt+netm1DoLIlnf0wArWhwqzL0P
 8t5+f19gEFYLMazTimIIgDu+4+NnGZ/vwP8aFHRQo39atzSl+I+f3TOHcED2xo2vSXX4
 rh5dl7WmlWYWkeTxZFK5yLf7YP5bfiypRJENtu81U4UwO7UvvkOcm/H820qfEop8o0PM
 eBV+Ow1WLOT/B4lxKk/NFwZk7OyVpuniuV5283b4T5mOC6lUggPBAE2vatdBC0QBDJOi
 MjYC9ZI6zGLyg8HFxlmfmeX/GsFwNbznPtqVUQJ2s/8Gj4ZNUH2Y8wFBON9CrNckdb0d
 tyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+teQY6hM374j7zI9pNklyKGVfwDlTPag7AVypMwhnZU=;
 b=WDzaujAxxd90cLu5InYvMyPl/rsgZcNvZHZEfFZ94kLjMcvl74+NO0BnFGjEotH7ga
 ca6GrHAGUlcGLuvtrGDQPCjZGNb0PsnnjsF/twv0HWgHUVG1mlLWQA9jnLRjpZWiiEwg
 DhNf+z6enGCf5S/saLAIBLTKQsTWI6l5yxtlXgGYxfwNNjj2v7D4sLHhKNc3ps9dJEAa
 7DNj89KL+tGgVoCrijUyack7hVWwiI+S4eXVKV6mSPAOM2ym6yGKbsZns9qUTAvZWFWl
 7K8wEC0yetXVwbi9TGDVNXOQ9qFJ0mxqGpYX85KRDfh5ut1rDncn9FsLMrAb3li6Y7LP
 PKow==
X-Gm-Message-State: AO0yUKUJldf/H5F2ExwW9FnxbJZClY6wD7Urfnh8SfAWj9Vmd5o3yJFK
 cbUeMcwkog8dcQDBAuNC4EmSX6iw6Z1CE0Gr
X-Google-Smtp-Source: AK7set/1xlDApA97oaAllghzfaOGhiIjiuDUVxi9y6r2usH+fhSOBY3E2B0sK9ghxYwOPmbeyMoxCA==
X-Received: by 2002:a05:6a20:bc90:b0:bf:73d:485e with SMTP id
 fx16-20020a056a20bc9000b000bf073d485emr13431526pzb.54.1675528419178; 
 Sat, 04 Feb 2023 08:33:39 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 16/40] tcg: Add basic data movement for TCGv_i128
Date: Sat,  4 Feb 2023 06:32:46 -1000
Message-Id: <20230204163310.815536-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
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


