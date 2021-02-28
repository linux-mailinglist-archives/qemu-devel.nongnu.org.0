Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB279327556
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:47:54 +0100 (CET)
Received: from localhost ([::1]:60614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVmz-0006qK-PS
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPo-0005WK-R0
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:56 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPc-0007jb-D2
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:56 -0500
Received: by mail-pj1-x1036.google.com with SMTP id s23so10488953pji.1
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bk2/HEa3eVWiJHWySA58FMUKA4eJmzbnbZ4nVyAtnoo=;
 b=QKytV8i7zTEWOmiupA63yM8h7zzF7CsT8MQoFZQBv4PWJHI1ALn4AZhlAkN+7AXAKB
 xW/VEblDOQ+QEiriNJBDimgr7advnYf0PX2ai4UEcq1HHW5Zk5oPO5/YoMa/fcsMpZa8
 pPejVjC45IrU9s0wFnLfTnlMC8SKV8n5xnLtHKRn7Tj6OT588EHyQIxbaE5Q8Q2sDdpg
 mg3YjY8OL2kTKWDV8gOPRWWKJy2iAAcZ/vO980myMnakikXrZpzeKmYsbDJpcVk2njwg
 5KXmWy6HB24kkgCgRaegO8eLHcJadOygxBC/ARL8ea0BfdQlCGHoxrwIsA8plKox8kNN
 ew5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bk2/HEa3eVWiJHWySA58FMUKA4eJmzbnbZ4nVyAtnoo=;
 b=j3Jve7UAXv3j4klGlB7n8yaIHooomrXGCNc9d/e2dA87zqz1V0UHMGKpu5SlyxBqYf
 Xg58DOyS6o1GMA6sDV+QAO33rEewyLVs4XujIT56ib1UF1ZKaFMkiqDMXKuxFv/R9Acq
 Xsx3SEkwbSry32gz7paDvh6nGyaRnha/kOUmS5PvDXZ/yvIDcKc7AbgluHEpQ7Eoivc6
 GnO+U5gtGzIG0JywvHW5ZuP3onO+wXQ4NpQ9nE8anbF60JlLnOdqXLQHu0zIQ4/7MPX8
 9p4D9/O6RyfIFiihrd9tMcJkM0sC1b3mnQ3TSgXevtSRljWnI0IueiyQZ7Kwy+s4Ehyk
 QaSQ==
X-Gm-Message-State: AOAM530r4krrWxbwX9du7cFFnvhi6WAaND6JHelqQrLUwgrIDz/dzCC+
 FljFt+2oLidKf6DhuGBb3C8enSrDdZGVhg==
X-Google-Smtp-Source: ABdhPJz9QsVhmvm2bXwXKE1kA/+OP6w6V3aKZT1YQrAjdxtV5L3KMbLjMUAA15xkLOksosDnWa3uQg==
X-Received: by 2002:a17:902:369:b029:e4:b5f1:cfb4 with SMTP id
 96-20020a1709020369b02900e4b5f1cfb4mr1184184pld.60.1614554622071; 
 Sun, 28 Feb 2021 15:23:42 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/50] target/i386: Reduce DisasContext.override to int8_t
Date: Sun, 28 Feb 2021 15:22:52 -0800
Message-Id: <20210228232321.322053-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The range of values is -1 (none) to 5 (R_GS).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 39af69585f..19c2034344 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -77,7 +77,7 @@ typedef struct DisasContext {
     DisasContextBase base;
 
     /* current insn context */
-    int override; /* -1 if no override */
+    int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
     int prefix;
     MemOp aflag;
     MemOp dflag;
-- 
2.25.1


