Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324ED3C353A
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:40:58 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F69-0002Cm-7q
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exd-00064I-V7
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:09 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exc-0002SG-C0
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:09 -0400
Received: by mail-pg1-x536.google.com with SMTP id f5so13163192pgv.3
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0TpBf4qKV0D0B2PVgq/Ik4yquVh/66Vd5JijaCSKrFk=;
 b=BGBFyYHDYLo2NrsJ6QyUsaleBRRm7lCJq1UeKjqx+znKYk8yn0Ls0TIAPWcL8g1rrR
 5oDuQ1OcFCFSG1HLyH0OSgLdmvmoRBhH3mUZln4N1cIp5vmXKXctcNA6UyrWAgpsHCGU
 xwzODdpOTCzQbp8SAWfDwqillga+d2L6y1j186JSSik6EeEg9TRhxJEOv5kkjVwLlZoz
 NaTn/GqR83m31KoR6j/QvFzw9Gx0gH/CZxMRp+ww3WtcneJiExI3q4XY1KeSlm2ssNk8
 UsHjk2BgkkABMEZy36AwL2HqC3seImF+DJPwMlh6euqzAkcgb8XBzgOB0zdr2XEUFpab
 SfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TpBf4qKV0D0B2PVgq/Ik4yquVh/66Vd5JijaCSKrFk=;
 b=glTcPfvfQ+Fopp0DyZcoW5icM98vJaveWdJAQmibNlyBPTtFBXrbEeMFH8nbSINMrC
 qOIThTT3LgNnsSFKhwpx6y75kBBs8I6wfkovnFs5kCbB0Pb3uhE7BJdBr0kXtb0FmRN2
 FsYjGKnS+xcFWzwdaIeXN92jWyh13TeJnooWnDdvEa66+vOYLQnijO0UqReSwKYL1nGL
 PDCtKLI8GVtg8Vy5E9rKTnn6f3VqWKVkmHTrxLyF06zkmSV8QE/KG1d7+dfU87hoL6MH
 uP37WHSTOyFq7EXZ27pCm1JGHGOIB5/g+O2wEdBlXJyOWZabtnsQHTvWbY7tjCLmtZbI
 gZig==
X-Gm-Message-State: AOAM530KftKdiJu7StfiJoV6X5f5OWaQcqIKDbyyfcfceHWlI6+8BUyM
 8btdWXZslB+FLiIHK+KwKQzj8rgJpPiCLw==
X-Google-Smtp-Source: ABdhPJyWBeFyiBG4ZQqYAiiPFhfIRiZhB+sxiV4mvkadVWbuo+p8gBSpFWMfZWtZp0r1aKMvaV8xsQ==
X-Received: by 2002:a63:eb04:: with SMTP id t4mr45165865pgh.84.1625931127054; 
 Sat, 10 Jul 2021 08:32:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/41] target/xtensa: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:35 -0700
Message-Id: <20210710153143.1320521-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index d5da35f4fc..7094cfcf1d 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -405,11 +405,7 @@ static void gen_jump(DisasContext *dc, TCGv dest)
 
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


