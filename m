Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AFD3AE186
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:46:40 +0200 (CEST)
Received: from localhost ([::1]:41576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv91L-0001zc-8S
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q8-0003wn-6i
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:05 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pu-0005CX-AQ
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:03 -0400
Received: by mail-pf1-x42b.google.com with SMTP id q192so5839041pfc.7
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wtlIXfVTIDAcxOMm3S62qcgJG1xzrj7M5573CnR6cAM=;
 b=ZPxUmzqV8Qx/mMGuqNNL0Yd/NspN+N7734ReQNBEblNncmLWjNIpE0d0GmwHUFSMKv
 7LaV7ehjWMRJLnWrSvyu9qLaZwnnZv8ZWCfxCHLUepMDN3YjRuuL5Zu9ov83cXNYku3S
 O+3TKyk5MHO5Pgple5C9N2B/PhGh7KiNpTeNX082tJeDsqioYImjC+rVjP6DC2P+Awe+
 WtoVvT8Rm2Wz/qcHEUXrGOndLBSk/LhrkKd7GsxAUAy3KFN6oulWb6o3N+k+OdWJcwyC
 s6FrpotJgAH/Uq0IVRbzoY9IZdFct6twKEL6saTkTwQuyjuAFkoT8i5ocWHaCi2T1ZVC
 A40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wtlIXfVTIDAcxOMm3S62qcgJG1xzrj7M5573CnR6cAM=;
 b=jpW1U2c9Dets1suCVCkaUH4mccOW0AjML2HnO3Vcoy/yu5OS/rdgN+zsFq5UOrHLa1
 WviqSP58Yj47I5AdoRVNxBok112lRvplJfL4KNUXgJFk4Ltg6SLzCDSAsrFvn+q4MLFF
 hiYFAaCk4FPHpmQMP51dfTdIo4RIk8KyqdXuZ9BmmTbCDRDDP9wYMR3K8GCw6PWvkqe3
 +w7Wnf48k/pzO8FGRBTptp+qX7ffHhjRho6RJuMXTtDgRYrfY7m2UFzN9Gn4pfzJg9E/
 HYBm2H17KDUmw8GOMzyi7WoNRigIKaBhr5bGnpVZ3iJRL0eo/O9oWScVXqUQsLwvFV1N
 wXqw==
X-Gm-Message-State: AOAM531HP+obZf8rj6ltaZ67EV/u1pGEOvSeViNVN4wtnIOQGlKEgwxx
 PqduuGQZCdiry7yIXCV3MKX5BW3jhb371g==
X-Google-Smtp-Source: ABdhPJytCFhVLC2rpVF7pnoWw5WHW1FGuwn8KBS83QRcJrCQv+/QJYjDCnNYSiOmXv9w/KxjeiWHyA==
X-Received: by 2002:a05:6a00:810:b029:301:f08c:6b0d with SMTP id
 m16-20020a056a000810b0290301f08c6b0dmr7830708pfk.8.1624239289106; 
 Sun, 20 Jun 2021 18:34:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/26] target/mips: Fix missing else in gen_goto_tb
Date: Sun, 20 Jun 2021 18:34:27 -0700
Message-Id: <20210621013439.1791385-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not emit dead code for the singlestep_enabled case,
after having exited the TB with a debug exception.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index d59986b340..99827ee740 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -5030,8 +5030,9 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         if (ctx->base.singlestep_enabled) {
             save_cpu_state(ctx, 0);
             gen_helper_raise_exception_debug(cpu_env);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
-        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
-- 
2.25.1


