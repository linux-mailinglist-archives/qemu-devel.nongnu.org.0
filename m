Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E14681C1B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGO-0000Pz-JF; Mon, 30 Jan 2023 16:00:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGJ-0000E4-OE
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:24 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGI-0005XE-3f
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:23 -0500
Received: by mail-pf1-x42d.google.com with SMTP id cr11so7081721pfb.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYlbBIJa3L4VxKtWFLrCymT5XGJJmqWmz+eEQQNGFFc=;
 b=PiEMRmhmmBua0+T345WVGtB1rACpYO/hgL5PqbXmrI1Bc2cDNBDK9uOA4Ttd1URshb
 GBjFTv3lCZ6Z9V9K2Og2ChXVhKTvlyODd0Eh7jgUiAeHUFrf5GxrkAHlotAjbbm6TtJD
 w6CDhv4tjuD2MhNlcJjkWZGELUfsjaSwXl84fZbtrZkAr+GC7hcEK2ackUFwHUx9mW0O
 8K+p62uOORXpdhVQybI0hU6zQFvSrD+/mDV6bgHI/qwA/9dQNR4ab3PCsVJXvumej7Ic
 6gv/PJ8ZRRl4feqodEUETTlXIeCYl2kRXNnPd1ZCuPPTQrMieQlz/MBC1+BvetJCfmWF
 WxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TYlbBIJa3L4VxKtWFLrCymT5XGJJmqWmz+eEQQNGFFc=;
 b=rocW5OH+Fq4wdkhdCiLS9WwPDHdC0bE06zBDg9CX/fdNbCPq8TLA85HI+zxi512ERP
 7oWp660F46wkqugnuwcWYOKAoM0lW/O/oaDs1Ad+oTbvK/TD9kszDoC7G24FSP9vHub3
 RttCTSiAH5cxs49GM3ITwVY9FoE0aaNT5UCW7D5o+qKJosEOXuvw79UwPNh83OyAu2b1
 ifBJV/KJdROtJPXCi79+qgmUneS3fFYIQkxwwjJSA45STIkfljAJwAA/PO43ReztPJba
 fPBM5Mnh+5hd4M54vEmsQiKzf8g74LmPdAxQnX2p6vun04j8xtEaeqZNVRYEQT45i5tf
 IYuQ==
X-Gm-Message-State: AO0yUKXSZWNAqvQM1YhG9bsnTVxjApQgw4begMO5Bst240bn15PhW7N9
 +DLN9R52jkpkj/gFVK5eLYMuf/k4JZXp83Ks
X-Google-Smtp-Source: AK7set9fD28JrderBnQjgVoRreFn+UBQpXYM1ogC+J2JQRqACYVfHHhRLNIhA7ghiB60J5DMwXN5bA==
X-Received: by 2002:a62:5484:0:b0:593:bc80:2d2d with SMTP id
 i126-20020a625484000000b00593bc802d2dmr5518222pfb.17.1675112420724; 
 Mon, 30 Jan 2023 13:00:20 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 25/27] exec/gen-icount: Don't use tcg_temp_local_new_i32
Date: Mon, 30 Jan 2023 10:59:33 -1000
Message-Id: <20230130205935.1157347-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Since tcg_temp_new_i32 is now identical, use that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index c57204ddad..21a1bff8b7 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -19,13 +19,7 @@ static inline void gen_io_start(void)
 
 static inline void gen_tb_start(const TranslationBlock *tb)
 {
-    TCGv_i32 count;
-
-    if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        count = tcg_temp_local_new_i32();
-    } else {
-        count = tcg_temp_new_i32();
-    }
+    TCGv_i32 count = tcg_temp_new_i32();
 
     tcg_gen_ld_i32(count, cpu_env,
                    offsetof(ArchCPU, neg.icount_decr.u32) -
-- 
2.34.1


