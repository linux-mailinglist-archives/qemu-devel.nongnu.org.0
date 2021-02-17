Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430CB31E10F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:10:09 +0100 (CET)
Received: from localhost ([::1]:48766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCU5I-0005Tm-A0
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMO-0000tZ-Rl
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:44 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMN-0007ak-AS
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:44 -0500
Received: by mail-pj1-x1031.google.com with SMTP id gx20so2402839pjb.1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAWykP8xawhD0n2LEjnvxt6U+It9ZnMCGaTxxtC6jn0=;
 b=RF/wS19OjYDrXX9MRqwQBBfr6rQ2B/b8VxyVB1k6E7/TQrYfhvWORXr1AkvU4DZuA2
 NuY/u0OQGr0oi4qbV3JAC5m1lWFej+cQc1Fqd5cg/WjeTM0qTIvQ9nSqCyFVR6rC60+9
 m4jzDSbvBcgpCoAZBTpLkRDOU/q6hXiJMBuzkVJw0lQDktvB5F2JZAf/gwtw0a3BcjwK
 wPnDzFfgKjL/0uKgzqzeaRWTgvBfhfUHLSO6yNIB2WKme4x3AtS+H6jvF+hSFiA80bkg
 fNtz0oGJxo87Ac3vuw9eyJGXN2e/Ay8t3S6jYK/IdQ5umiBbhHWG0WLUswjNnAkX1sJ5
 tiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAWykP8xawhD0n2LEjnvxt6U+It9ZnMCGaTxxtC6jn0=;
 b=Ajx3uELMM5vHRagZWLFWY8PIFfhTt55DpfrRsgK5J1R3mMu37VIsNZI7hhy0bz3LVQ
 a8oEeFLTDgo9aK9tkilZWD8Y2su+9IsvbgFCrSmwckqgB87KXQ/WMJv4o/Mi+69BAVpv
 dkSY1c/mhk/Gp9ZOIKOqMagYPHjyd9nkI0UvkADhMylvtr88zBO6KrljabXCDOHwxxqo
 XHvyeMpcCAJBVEnaZGDl4TyGle66nRCA1rEeCbXv2tIgNybdnBtw60R7pbGZUl9x05o5
 Dzz81pn2OQ/WvLT+AxBg9lx8+4FYzvNY4qRrLq07ejPtQrJDdQOuPWEXMbDbPEFXSNv4
 I6ug==
X-Gm-Message-State: AOAM532LwWtE2qbrsBp/TULf9EBH4c/4D0TeHHAE05i1olvbsIxVG8jN
 qIgatX+P+/xme1bFI82xwGR6E/RHpxGCYw==
X-Google-Smtp-Source: ABdhPJzatcD9kgRVaKzzokgySVA3bPcqHirNRZnRFwyE9d0m7YwNHMF6IsCrkKpE7S0Iup2bXio5gA==
X-Received: by 2002:a17:903:2093:b029:e3:790:81fe with SMTP id
 d19-20020a1709032093b02900e3079081femr974856plc.39.1613593421927; 
 Wed, 17 Feb 2021 12:23:41 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 40/71] tcg/tci: Move call-return regs to end of
 tcg_target_reg_alloc_order
Date: Wed, 17 Feb 2021 12:20:05 -0800
Message-Id: <20210217202036.1724901-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the only call-clobbered regs for TCI, these should
receive the least priority.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 4dae09deda..53edc50a3b 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -170,8 +170,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 }
 
 static const int tcg_target_reg_alloc_order[] = {
-    TCG_REG_R0,
-    TCG_REG_R1,
     TCG_REG_R2,
     TCG_REG_R3,
     TCG_REG_R4,
@@ -186,6 +184,8 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R13,
     TCG_REG_R14,
     TCG_REG_R15,
+    TCG_REG_R1,
+    TCG_REG_R0,
 };
 
 #if MAX_OPC_PARAM_IARGS != 6
-- 
2.25.1


