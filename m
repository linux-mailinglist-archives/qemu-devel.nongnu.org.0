Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAAB33F529
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:11:15 +0100 (CET)
Received: from localhost ([::1]:39316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYlN-0003Dg-Te
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCi-0005JH-VN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:29 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:42942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCW-0007Fy-B9
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:24 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so2163567ota.9
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YcapVGXUoGp07kgKFPx6ejwAMy88itYZPw7dHfwRoZM=;
 b=tCxj3zFmVtSGKQvIZGahMhqXE2CGyHmRtuXsCDN0eYLM4Tlfukv0sTahSBlucrkyUP
 lRhQSsdVTnYgz6PUlyCDjVgkBXrzR32oiNdBpzW2a5sivQ6bIwcENfrI/p9WEzRY3kzn
 UjCKNnwlmj0efjD/hVr/upYZdfhrb3isFi9natHOUP82UiakENmRZWWR/DF0zTF7alaI
 lHU9chO0BoZnlKSlRsMk4oCWSBuSbEGYrGlQM+ivmYpxbSorX0F+sUftiAzUko2VeylB
 7YXGF9pvWjG+O2BjE8Ipab8ncZ6sMx6SqB6AV9+O3b7Z5gxW5M/rkPfBYyfbze1CMh+W
 Fj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YcapVGXUoGp07kgKFPx6ejwAMy88itYZPw7dHfwRoZM=;
 b=b+OuoEMcs4S9GjBt/swB9u35JUNvLgZ7xhARo8eLHfiPfGhX36swhRjhTfF8Dec2S4
 WBDGFgg/f9N/ZTqyFGHJpt4noekBhSdHTKBVCfR9YumXMTv2B0+XL+ttP4NcSyBxFUXV
 A+dbinADNI6VGbXkRiqJa1oVK+DddCrhZ9m58uNKPUqFjl6PUHDsu7mxCQvVtpQVTBgm
 Z8zme1vIK6bL7bV2dafHguZCR+2RPAMeOTyl9CBIQRJVaPQUZJqNFW0RM/oj3CsmPnRv
 fut/UPHDs+lanhUmkSjgYHu0V3WKsWo9ATDqk5HydlZiB5OsH6CnWvCCEEKMaGlm/C3+
 CXAg==
X-Gm-Message-State: AOAM532EOoWfxcl5KgQeQrSZ9TvmfWUm4bPUVdVayDFF2F0f+05+mvuh
 0PlGVYQsGQsN++xSm32ShYDjlH7/GWe9jCyy
X-Google-Smtp-Source: ABdhPJzxe0xmBqD53jS2p8Mm9UyQn/U3lJucQZdDJWlCpBXT53EHFZXEmY8a1C9fmClbDfNc4CcwIg==
X-Received: by 2002:a05:6830:1282:: with SMTP id
 z2mr3888211otp.30.1615995310453; 
 Wed, 17 Mar 2021 08:35:10 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/38] tcg/tci: Split out tcg_out_op_l
Date: Wed, 17 Mar 2021 09:34:30 -0600
Message-Id: <20210317153444.310566-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index bb4dd76211..bf2733d42b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -297,6 +297,16 @@ static void stack_bounds_check(TCGReg base, target_long offset)
     }
 }
 
+static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tci_out_label(s, l0);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -408,9 +418,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_br:
-        tcg_out_op_t(s, opc);
-        tci_out_label(s, arg_label(args[0]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_l(s, opc, arg_label(args[0]));
         break;
 
     CASE_32_64(setcond)
-- 
2.25.1


