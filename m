Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F273F6F42A0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:22:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3n-0000hf-O9; Tue, 02 May 2023 07:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3j-0000gT-Kk
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:39 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3d-0003Gb-L8
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so21546685e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026430; x=1685618430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EoXYOQHQNeBbfwjUDNzuW/Is90ENoYHXRPtx24KBX6U=;
 b=fcvibkHtVI4CAQdVLjvckJfkVEEA/7Ly7E01KhoAOiFamjNkZFW5nFysORDqWUNJ/K
 XKOt1rLLL2kIelyWG+Vq1Jzx2oEdaubcDaZj36qnF1WK2MpGiihvuNCnWbC+3/REk5oT
 2R/uOx6POCZfRtroSyVhcmJTUZWgqtYo3ka3e2BoBZOy2ZtHMxrdjCouLEgR41eh5Zca
 rid9DCa98SjhvyFTjF75m4LdcVEJc/2xi9PiaebHNmwIzRTZAh7U0CSGVoYTZkVSi8Cu
 rJpsXk3ZEN3f3h+8Fu7qa1BnorXtatU/l5P1V4OvMkqbRcmbSE41MbqKPGC8lVHuzLiP
 4jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026430; x=1685618430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EoXYOQHQNeBbfwjUDNzuW/Is90ENoYHXRPtx24KBX6U=;
 b=Kvymx6bDLF4HQEHMhgLCfV4SAsmbtLOEe9vsDy5+9i+HpMVOXZkmMEz/58fctN+Iai
 F/u2xl2mdcmVnuESvIV3yZ6mIdjMRuMlg5O4voMm8tj5QQ+Re0VJZmvfyI2VLAys5Bbr
 KvMRJsGI15o/9PojflEkDlgNnvaouEkF2k88VjhZ3aB2SsNjA8WVdU4euQqt2WL9Vkwb
 ZBss8XswEArTA68sMzXHnx6o9tkSenZ3y62O9zrNowyipFOzW19r0/Z0jDfrDbOpMWk6
 ffGZy6CIZNrz9N9viBtCs7+GdPtHuxpDwL849EvivD+FHmbZJQAwZQ9qpBTZWBBisomn
 yA0Q==
X-Gm-Message-State: AC+VfDy8+oyIvM8HMK3/uQR4w+4won8SwnPJI+BCV0k4CXSWR9WqPMPm
 27R7bchG9FXfdojU/QsLOlYlQC0PbDGb9aDNFaVCYQ==
X-Google-Smtp-Source: ACHHUZ4urDmsR4wlklGCGo+1h/3fdNxt9bOneoceVGIOKSj6STuD+Y+f2zpXs3vclyBjUJjwT16JRw==
X-Received: by 2002:a7b:c407:0:b0:3f3:481a:902e with SMTP id
 k7-20020a7bc407000000b003f3481a902emr827794wmi.15.1683026430530; 
 Tue, 02 May 2023 04:20:30 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/12] tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
Date: Tue,  2 May 2023 12:20:21 +0100
Message-Id: <20230502112023.776823-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Since TCG_TYPE_I32 values are kept sign-extended in registers,
via ".w" instructions, we need not extend if the register matches.
This is already relied upon by comparisons.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 21c2fc9e98..0940788c6f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -463,7 +463,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
-- 
2.34.1


