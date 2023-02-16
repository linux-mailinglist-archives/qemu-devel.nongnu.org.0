Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D65699649
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:50:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSedX-0001n2-Lh; Thu, 16 Feb 2023 08:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSedV-0001g6-Jx
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:49:21 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSedU-0001an-0n
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:49:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso1691282wmo.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1JlyKJ0JjjfiqaxHOYT0DE0uPZ4Z9yVFsyaFL5lMP4=;
 b=z8OyNv6PwLbA9qZHBXREfFO8nE6v+4rbm/IwW6JEBro0GMRcOUJ9xY3X3fu+NEsgDf
 GS+ajDqzPASWryvzDT8PEFC8R4BUKlyzj+ZXxTcxSz5YlWYlR6EELh7BtvF2vwHSK16I
 1ygZCLo4zR1/JcSYwkRvpdHXvEhI8hN2dwMEPpRedgKZXE0+e0Vh6C9Raw41Der0wcNi
 dg+7TGMYt3WxCDHU4Vs5AhSK48d/xB7/pnShNkxWJS0h4zmd7+uRBcjFVzwHZfjk5AnE
 gkmowx0GUgBwKAE6lMsVglBtPU16k8oC9RQkJMgDA0dxZ2Yny9CIJDbVMKvbwv+TEwAM
 ZL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m1JlyKJ0JjjfiqaxHOYT0DE0uPZ4Z9yVFsyaFL5lMP4=;
 b=ak1RHpiz/xUX8pP1AuhUR0SMSWF+Dzzr3oY6rkQplvp+fnbQXWzVUiyEKlD0zB5SuL
 G2CgYQljUYwJg1f0FFj9we2qwV6ujmAOpDTt4vt8ecN48nX+Yb/RtgOmj/BwC2iiqD1r
 wVE6l17jK1XaY0x0ucZogOwz2M/Wox13kwuKeN3zyJ2mEObvIymdRBkF/nKaJPpHOFxU
 pb5UwdGEV3CSyY6d6r/NuuOwCeBmj+dp20ZEp0pF9bAxm5PRZW3nE1qF7lbL+rrFMyga
 p7VwQ4DCDbw1WxKBsWWo56RW8eDYEo/zVM26cb8yVJfrzvzZ5dwjkURYPVSVFYQEKfA8
 r8BA==
X-Gm-Message-State: AO0yUKWJUOgH3t/L58smIQQZF2jgPUrYlGMIctO6irpNJeF5kg0Y/fgC
 IKrtg+3srk9Kt9dB86B4pti/SAFXt6/RBJteFxU=
X-Google-Smtp-Source: AK7set/Nm4iQrfnh+Kvy7sswpGkcuNOwYKH74hKGX1ULfTiP6OIVM6BEqiTjPSCCsTyl1XjnwXQNaQ==
X-Received: by 2002:a05:600c:5104:b0:3dc:16d4:a99f with SMTP id
 o4-20020a05600c510400b003dc16d4a99fmr4988318wms.8.1676555358051; 
 Thu, 16 Feb 2023 05:49:18 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c364b00b003dc0cb5e3f1sm1557933wmq.46.2023.02.16.05.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:49:17 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 4/4] target/ppc: fix warning with clang-15
Date: Thu, 16 Feb 2023 14:49:11 +0100
Message-Id: <20230216134911.6803-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x336.google.com
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

When compiling for windows-arm64 using clang-15, it reports a sometimes
uninitialized variable. This seems to be a false positive, as a default
case guards switch expressions, preventing to return an uninitialized
value, but clang seems unhappy with assert(0) definition.

Change code to g_assert_not_reached() fix the warning.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/ppc/dfp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index cc024316d5..0a40bcfee3 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -121,7 +121,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
         case 3: /* use FPSCR rounding mode */
             return;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached(); /* cannot get here */
         }
     } else { /* r == 1 */
         switch (rmc & 3) {
@@ -138,7 +138,7 @@ static void dfp_set_round_mode_from_immediate(uint8_t r, uint8_t rmc,
             rnd = DEC_ROUND_HALF_DOWN;
             break;
         default:
-            assert(0); /* cannot get here */
+            g_assert_not_reached(); /* cannot get here */
         }
     }
     decContextSetRounding(&dfp->context, rnd);
-- 
2.30.2


