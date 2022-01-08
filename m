Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FDB4881DF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:36:45 +0100 (CET)
Received: from localhost ([::1]:58522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65LH-0003Sr-Fz
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:36:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65I3-0001Lr-Ie
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:30 -0500
Received: from [2607:f8b0:4864:20::534] (port=43629
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Hy-0003bu-NN
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:19 -0500
Received: by mail-pg1-x534.google.com with SMTP id 8so7653523pgc.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z+1Bpm5gmuPz16kiapG0JjFHPuZTPa8QQ9sXQBalCt4=;
 b=taCLNPZqfDZPzzGQ/xcgCYXhgB+pxau+4e5jumxUni3F2Rb4BbGyeIf3UhgNKtmMc4
 cz88TyX5OQdJdDQ7tZdbu7HQL5Br1ceF38OwkQSakoTVJHJ0V5fgKbeYGsblD0Eo9ho2
 KHykZspD4GlgkrKGNRLlP/KHGq+2F9oB1Fv0tbPJ3tazU5+QXV6FnLvmxB2+zyzhBOkO
 NKHEi4TmbrAq1tacu1qOyd7oztaZkQmT6IErIxpdDbGROPi8CAgByUQAh5na0E8gWuZU
 pHaV8OcsCpFXU5mRfxEFXWjvb8y7FHwMzDTFuvLRtkdLfiDabjRxIaFhAd8UwpHbRnx0
 XNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+1Bpm5gmuPz16kiapG0JjFHPuZTPa8QQ9sXQBalCt4=;
 b=C/Sw7YgFfzZG5DkU7grArIHP81Xj3bjLQbWWPthwnSluHzTJSSPJ/zoKMqrfbrU2Ed
 z+JJOPlNE8AGNIbSDmTqFnRLX/4MWn0tdLOEszelwQLF3LWOnHcMpkQeTNskTeHBJQFh
 3fz0y87a63mBCNUgzjbGKrhM/g4N4UxbirQFJe7r3PBNcV0u3yg968sJ2Y9aSxL8WOml
 GQD1mS6j9HO3hmguyYAbMlqIgl2FN1nDZTgVobiOQTJKPve9foWrBGh/JNRuiRzIH8rI
 9wSE9qGZ4yyyVICBITNACXdmkiILHAUDQM5D4xzuYlPpbuygjL36O9kCM2mfGCDKeU4n
 7LgA==
X-Gm-Message-State: AOAM530yfEkobVMy3i4gFt6tjEAEE8eSVZZLWZ0hsBbaOtMkIdkRb8hS
 OtAnQE0nZcOnHv9+3wHacPgDTjYTQpwNuA==
X-Google-Smtp-Source: ABdhPJx6r+ciPyH6Y6YsISdufQvH3+TJUYwcbEpiC2tSf3GjFVpFpxy63nBsWgUgY9xX6etkkEBLkQ==
X-Received: by 2002:a63:905:: with SMTP id 5mr59709924pgj.485.1641623597268;
 Fri, 07 Jan 2022 22:33:17 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s7sm834760pfu.133.2022.01.07.22.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:33:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] tcg/arm: Drop support for armv4 and armv5 hosts
Date: Fri,  7 Jan 2022 22:33:07 -0800
Message-Id: <20220108063313.477784-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063313.477784-1-richard.henderson@linaro.org>
References: <20220108063313.477784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support for unaligned accesses is difficult for pre-v6 hosts.
While debian still builds for armv4, we cannot use a compile
time test, so test the architecture at runtime and error out.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 9d322cdba6..72b384cc28 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2474,6 +2474,11 @@ static void tcg_target_init(TCGContext *s)
         if (pl != NULL && pl[0] == 'v' && pl[1] >= '4' && pl[1] <= '9') {
             arm_arch = pl[1] - '0';
         }
+
+        if (arm_arch < 6) {
+            error_report("TCG: ARMv%d is unsupported; exiting", arm_arch);
+            exit(EXIT_FAILURE);
+        }
     }
 
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
-- 
2.25.1


