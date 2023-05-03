Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4196F5247
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:51:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tr-0005SB-1g; Wed, 03 May 2023 03:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tf-000506-Hp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6td-0005gn-Sl
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:31 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f315735514so11346135e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098849; x=1685690849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Br8zXaVAOKNlB9xv5g9cPNHLqbtW8oBpWMoxXID7zwE=;
 b=yNe/voETvwqBJYLRPM55/ix6c+FQyZ+R9aVFaWWVcBZ1vN1MJoBXsm3Fv3XjWher6l
 aw/4cfqZiBM3Gs5+jIeD/T8GNf3lngaNcPcmr9Ptp91RuPiCYPdMEFJRxwTqEJW0ruq/
 /aYBBX+9UWikU5IsiR5VlzE55vz9O++FDdqnax9LoKoiw8l9HBnhcIfIebT/2xsmztga
 EYUZQyBKmwNQVt99MNENg+PSsgUs30PgcEkgEfAN4iq71vhvWKcVqcMToFiUK21jrbB9
 DVdUCtAZpdAZ0qXrLgjcbL2XnIL3LJ2kNfLGmcv7vl4EqYTFz1s65fKoTm14uDdQ9SKe
 eC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098849; x=1685690849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Br8zXaVAOKNlB9xv5g9cPNHLqbtW8oBpWMoxXID7zwE=;
 b=ZVIFKDNvqMTQMINMHwtqfytyrE4/fQx7VHMoDFmuM4skrZ1pvI7zUTK4cxXtTKogBJ
 0m2gHZLO1BFnONyeeDn5fjpD7PyFo0R407MRgtsec6verTbtN9Q+W5OSUPeeNIH2FPZB
 T+J/Dbj9EeOXxrOMQDSDyAn4aA2Enl222zxx4kpioUtI1O7C8ImE4UQAtTE1WNYysoIe
 JDOWCIPh8pja25TOk3Z/0wSHcgKMm1iaU8j22Z67VQz+Bqk5+2IJ8hNB4AudkPZJkcga
 z45ITqjM71EzY+3sVUkHd7v7Gxx9CJVFIknGUaSI1wOu14C/mrtHZ5QdabqZZwc/Is1R
 GbTQ==
X-Gm-Message-State: AC+VfDzLmvKbgqO8pRb46vUsHvz/bjFHJKaQo7p2sqWASf1TUbLSXvbB
 UzEG/oxi4ENxLYPlKEr/lInPt+gwk3irMbfuZAh/oQ==
X-Google-Smtp-Source: ACHHUZ4Hc5RpA1Ztb+FG4v+PiMOZFTuhjQ97DdColmRvPCB1a9Vrd+F5qi5G92HH284uFfPqEQ4ORQ==
X-Received: by 2002:a7b:cd04:0:b0:3f1:8129:2c53 with SMTP id
 f4-20020a7bcd04000000b003f181292c53mr807253wmj.16.1683098849085; 
 Wed, 03 May 2023 00:27:29 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 75/84] tcg: Move env defines out of NEED_CPU_H in helper-head.h
Date: Wed,  3 May 2023 08:23:22 +0100
Message-Id: <20230503072331.1747057-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since the change to CPUArchState, we have a common typedef
that can always be used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index a355ef8ebe..28ceab0a46 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -22,6 +22,7 @@
 #define dh_alias_f64 i64
 #define dh_alias_ptr ptr
 #define dh_alias_cptr ptr
+#define dh_alias_env ptr
 #define dh_alias_void void
 #define dh_alias_noreturn noreturn
 #define dh_alias(t) glue(dh_alias_, t)
@@ -37,6 +38,7 @@
 #define dh_ctype_f64 float64
 #define dh_ctype_ptr void *
 #define dh_ctype_cptr const void *
+#define dh_ctype_env CPUArchState *
 #define dh_ctype_void void
 #define dh_ctype_noreturn G_NORETURN void
 #define dh_ctype(t) dh_ctype_##t
@@ -52,9 +54,6 @@
 #  endif
 # endif
 # define dh_ctype_tl target_ulong
-# define dh_alias_env ptr
-# define dh_ctype_env CPUArchState *
-# define dh_typecode_env dh_typecode_ptr
 #endif
 
 /* We can't use glue() here because it falls foul of C preprocessor
@@ -96,6 +95,7 @@
 #define dh_typecode_f32 dh_typecode_i32
 #define dh_typecode_f64 dh_typecode_i64
 #define dh_typecode_cptr dh_typecode_ptr
+#define dh_typecode_env dh_typecode_ptr
 #define dh_typecode(t) dh_typecode_##t
 
 #define dh_callflag_i32  0
-- 
2.34.1


