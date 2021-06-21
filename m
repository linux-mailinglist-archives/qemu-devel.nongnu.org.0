Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E13AE18B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:49:34 +0200 (CEST)
Received: from localhost ([::1]:51598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv949-0000T4-Ec
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qF-0004Ay-SG
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:11 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q1-0005Fo-Hj
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:11 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso9328511pjx.1
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fx8+qdcju9NPtj3eCrU8zuRjZGAw5A7xVtYSk1jWA7Q=;
 b=s6RqCuzZOPMCNZR+2d6/X7WhC+ixC98pEIGIR4pG3nQCZ6/9j9EY86MDkab1ooMD7o
 dnMQnTILD4HQ92PrZ79ojF0tFhH4EEPkERvnMBDDBZUS3bCdlHW5WXg3oTTiJRup+siX
 E3QVJJVNuD7GjKWFTCSH34Tg2NcmwPGV8EJby0Z9Xw7TDM5mOPmqNGCLWcKPzzPGReVj
 pywTN/t5Jajj8dt5cep5C8UACWY1NIIBOaCvB+sUVNNDx6/L6DlcY6XMWjIUSnvnHhj+
 Zhr1r31xhTboHkTfTzXVtjoQH/OTnNn2It9VZb1BtnB8igD3VJ1cFrLnIsEaatFJWST8
 Kmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fx8+qdcju9NPtj3eCrU8zuRjZGAw5A7xVtYSk1jWA7Q=;
 b=R2HWrwVlpJ3bzHguinxAccnkVHslb0y07q3hU6FI9tacwv9xrNhcz6cM4iuu1rK/mo
 RwVCePPKM8w8u+vAWM3uNPsfg2ade1+GMJdTFhJaZxZZoGLITy+OluZkdiBmeX4nHwF7
 lxx1nKDVUoF8Ktw4rWD40/wTCUw2PQc5N9VhBaThsoAOdq71AwVrukmeYA7dLytySvpj
 PDHlUFc4q4ZodHtM/AMrZm2xBrnzcRWDdYj29Z0EdjJG1jYPEdIPZqhGGMYv01T2vuqt
 VGsxbdw1bOufxycW/kXg0TC+7t5G4WwEainnTOlzaaD0ZeS0NPT9MLvUYfcmoBqIs9cs
 q2mg==
X-Gm-Message-State: AOAM530YiZrmwoJpcRaxxkNHJVUAoBDCxVUUXojr2+Ty7FlXamglImcp
 DeQwtFFXYGFe341uoa/nmJNkLaquiH1Qgg==
X-Google-Smtp-Source: ABdhPJz9igeVKNS6jQH7ubqSNdDrV7PV6nKCzUV8STmj642GrY7ScUh1hTUhHEZCE893U1rdtchgCQ==
X-Received: by 2002:a17:90a:f293:: with SMTP id
 fs19mr1431361pjb.149.1624239295878; 
 Sun, 20 Jun 2021 18:34:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/26] target/xtensa: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:39 -0700
Message-Id: <20210621013439.1791385-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 14028d307d..ac42f5efdc 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -406,11 +406,7 @@ static void gen_jump(DisasContext *dc, TCGv dest)
 
 static int adjust_jump_slot(DisasContext *dc, uint32_t dest, int slot)
 {
-    if (((dc->base.pc_first ^ dest) & TARGET_PAGE_MASK) != 0) {
-        return -1;
-    } else {
-        return slot;
-    }
+    return translator_use_goto_tb(&dc->base, dest) ? slot : -1;
 }
 
 static void gen_jumpi(DisasContext *dc, uint32_t dest, int slot)
-- 
2.25.1


