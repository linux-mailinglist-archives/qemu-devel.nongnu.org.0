Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29553A4B99
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:06:45 +0200 (CEST)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrrAi-0007VV-Sz
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmu-000364-8B
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmq-0002m8-D5
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so6725283pjs.2
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svHo4xej4hLH/cZ+9yekBSSnKW0cEWwyz3UL+6E6tak=;
 b=LsSnWWNhZCKZXxErGASaJSbSaVhnrMmLqcL986FDj0XABrKmWhkKC7fKSPr5fg31q1
 DB7tr4/JV9cc5FpDgX3x7KMN8pebQxZDhSitSmNqX0o1n7gLbv8TS2pfwfyqoyp/tmIk
 rWmMWxc74IT/mAXOp9yjhRemrdtineOCL1D0WfGVHqguhOoYLx4GjjsNGOS0Tat7cjAM
 zulwdL3LdfuovuGbo5rAVxYlcgSNuwiA/ihow40J3vryD7COrl8tpYaIiuNBGBTGQ8Dr
 rq3hsHVhDVS+rw4ih+6ltQds6dSXc7T+KPmuIBWLU8duaib3AZzVsSZbKyw1tBqQsPpo
 epXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=svHo4xej4hLH/cZ+9yekBSSnKW0cEWwyz3UL+6E6tak=;
 b=UXzXDEoHetqDLrMXiv7Upw/9tZ+2BHv7+I2Miz0m6anUtZA8giao5SZCGUluLTfjeW
 Eire4yr2X6unJNH8MOGDSBTTcqYUl07zS3Hu3B1RCFzK67eSF6xLQ9KBo75nvtFKsGpU
 KxTLAME1WurrcrZdL5wiBAFphzi7q6kmdGHRVy6CR8tODF9mftUuBuAfxiahipHP93h4
 NwJ8BCGZdgIYDN5wlJISX6OLThyGIvoLhk9wBh5IcosiRTC/cYAaS/LiBGgbixgF/pMY
 9d9F5VECQ2mYO1ZF2kNHZ7bmFSawbSF/4Frhmi7qRJww7L+A1gt9ho6MOgoRewghFf32
 90eQ==
X-Gm-Message-State: AOAM533ookCP+DB5fWAx730LyxiuquRem6pwHx7bDghd1VPqgjvqfM/9
 KQ/4mQeLwDcfq15lYrnUqp/I1sFYRT649w==
X-Google-Smtp-Source: ABdhPJzAHaWRVbTB1XEy5jekOF1DjhuhctWRtaLkfHPH8hyyJR2ozmLt4p2mIfV9Zl9lvD8rtLpgOg==
X-Received: by 2002:a17:903:8b:b029:119:7c28:727 with SMTP id
 o11-20020a170903008bb02901197c280727mr860199pld.3.1623454923084; 
 Fri, 11 Jun 2021 16:42:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:42:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/34] tcg: Move tcg_init_ctx and tcg_ctx from accel/tcg/
Date: Fri, 11 Jun 2021 16:41:39 -0700
Message-Id: <20210611234144.653682-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These variables belong to the jit side, not the user side.

Since tcg_init_ctx is no longer used outside of tcg/, move
the declaration to tcg-internal.h.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         | 1 -
 tcg/tcg-internal.h        | 1 +
 accel/tcg/translate-all.c | 3 ---
 tcg/tcg.c                 | 3 +++
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index f48b5aa166..e95abac9f4 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -689,7 +689,6 @@ static inline bool temp_readonly(TCGTemp *ts)
     return ts->kind >= TEMP_FIXED;
 }
 
-extern TCGContext tcg_init_ctx;
 extern __thread TCGContext *tcg_ctx;
 extern const void *tcg_code_gen_epilogue;
 extern uintptr_t tcg_splitwx_diff;
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index f9906523da..181f86507a 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -27,6 +27,7 @@
 
 #define TCG_HIGHWATER 1024
 
+extern TCGContext tcg_init_ctx;
 extern TCGContext **tcg_ctxs;
 extern unsigned int tcg_cur_ctxs;
 extern unsigned int tcg_max_ctxs;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 59609d62d5..7929a7e320 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -218,9 +218,6 @@ static int v_l2_levels;
 
 static void *l1_map[V_L1_MAX_SIZE];
 
-/* code generation context */
-TCGContext tcg_init_ctx;
-__thread TCGContext *tcg_ctx;
 TBContext tb_ctx;
 
 static void page_table_config_init(void)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4bb35b455b..81da553244 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -149,6 +149,9 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
 
+TCGContext tcg_init_ctx;
+__thread TCGContext *tcg_ctx;
+
 TCGContext **tcg_ctxs;
 unsigned int tcg_cur_ctxs;
 unsigned int tcg_max_ctxs;
-- 
2.25.1


