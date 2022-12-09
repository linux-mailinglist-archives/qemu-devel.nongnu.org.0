Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC23647D30
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 06:21:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3VnC-0004cj-CO; Fri, 09 Dec 2022 00:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3VnA-0004aV-04
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:19:24 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Vn8-0008Jj-F2
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:19:23 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 z14-20020a9d65ce000000b0067059c25facso2172324oth.6
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 21:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b5THxRKqmxaz+6umsqe7zfRMO2w6Ovl0lmoeFxEODUk=;
 b=H/6a5+8sp8Vn0LeNS9W8t5ssLMRL4cOw7P8IMRN4PSmnrLXWo1eynKk4c1QSd9zNjJ
 N1dwSGccdNzh6f9sXI3kyAKLFYlj/8LyOGfqXcJPOuRjcO5tnNLG5jEwvCZRdbTPUtFB
 klN7czhpXss/72bsybldyEZstP2icjoTL1uf9gLXusZc/pdCEaqCZYqhbqGrf5kMXA/a
 3Hd3j5CaJw24egS46PdQRSwysN5IfgK8cS8vn4ffXbME+chRazwsYJqf48WAASJx6oER
 GvuPQutAcPgmZGAGblQlwsaBS+ZtIlg5TsQoT/xP0vXQ2L7Is5TUOc9wBLDoRXR9nN2H
 xlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b5THxRKqmxaz+6umsqe7zfRMO2w6Ovl0lmoeFxEODUk=;
 b=chil2jxFX1A7XolWou5yeXuSqzqA0OzmvMIf8zpWF0YfHeeceEpfLtYHwdYfMu3iUG
 7OwbwrNCCM9MBrVEiRMfywI0uEtoR+UIMgfSKTQpzhQFh/KhtF+S4+GsrC4bEAc/6D0S
 a1XO+ICseaklqxxXCURjWrYvcPIVNnk6CPOqPLBw21jhfeiYNq5X7seZqD0Z66GsIKfj
 fr6lx18ewUsXA1x7rGA5grZ4BMKdQOpE2DySincKrJJgKfWYWx+tuqYvdZ7Aa8lY4Hsk
 L+5oZxQqz/+XBK3pkvRWg7a4n1kxeolmEcCfxKx+zsAnZUM7Igb7/f7YMNM7qe7o9r2p
 Gb5Q==
X-Gm-Message-State: ANoB5pngugHXLyjCxu5tmCQ97aRCHDnfY8HANgpLaVWJi6KqrAE5Noy7
 twUgY7uvLfH41YUf1fu60ntsVU+vnKRnffKGdNQ=
X-Google-Smtp-Source: AA0mqf7decCPLazzxfEo6Iog6VB1J09S2fim9nRV6HKgN5/h8H9WIQrEO6cr2Gdm2B7SjRf8uaJ6RQ==
X-Received: by 2002:a05:6830:4412:b0:66e:a35c:c051 with SMTP id
 q18-20020a056830441200b0066ea35cc051mr2864086otv.35.1670563160877; 
 Thu, 08 Dec 2022 21:19:20 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:95e5:48b1:fe60:b74c])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a056830244f00b00661b46cc26bsm224657otr.9.2022.12.08.21.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 21:19:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v3 2/8] accel/tcg: Rename page_flush_tb
Date: Thu,  8 Dec 2022 23:19:08 -0600
Message-Id: <20221209051914.398215-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209051914.398215-1-richard.henderson@linaro.org>
References: <20221209051914.398215-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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

Rename to tb_remove_all, to remove the PageDesc "page" from the name,
and to avoid suggesting a "flush" in the icache sense.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 0cdb35548c..b5b90347ae 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -51,7 +51,7 @@ void tb_htable_init(void)
 }
 
 /* Set to NULL all the 'first_tb' fields in all PageDescs. */
-static void page_flush_tb_1(int level, void **lp)
+static void tb_remove_all_1(int level, void **lp)
 {
     int i;
 
@@ -70,17 +70,17 @@ static void page_flush_tb_1(int level, void **lp)
         void **pp = *lp;
 
         for (i = 0; i < V_L2_SIZE; ++i) {
-            page_flush_tb_1(level - 1, pp + i);
+            tb_remove_all_1(level - 1, pp + i);
         }
     }
 }
 
-static void page_flush_tb(void)
+static void tb_remove_all(void)
 {
     int i, l1_sz = v_l1_size;
 
     for (i = 0; i < l1_sz; i++) {
-        page_flush_tb_1(v_l2_levels, l1_map + i);
+        tb_remove_all_1(v_l2_levels, l1_map + i);
     }
 }
 
@@ -101,7 +101,7 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
     }
 
     qht_reset_size(&tb_ctx.htable, CODE_GEN_HTABLE_SIZE);
-    page_flush_tb();
+    tb_remove_all();
 
     tcg_region_reset_all();
     /* XXX: flush processor icache at this point if cache flush is expensive */
-- 
2.34.1


