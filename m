Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE19612FDA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:41:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNXM-0001g5-Eo; Mon, 31 Oct 2022 01:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXI-0001dw-MY
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:36 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXH-0003yc-4C
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:36 -0400
Received: by mail-oi1-x22e.google.com with SMTP id p127so11863564oih.9
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkiTDoffwuSaTr7ke0a+7yV5MGBGA3Q19sPSnhU1cq4=;
 b=M7SAalJgVaK3xLz3SzTtnUQEPeKmWSRbyQNdAooO+muWiATuJLLfSpZb5R5aIVSz+i
 UJaM6RrNy4vfkJ3eUHqhxBFkiB/c5DZeEIP1POCfb2+D7k/EvSWYek5dWvSNvt8L5tK8
 TddnrJr/8E1zoI+kD3kbcjSw5am7NeW7gqoPDTeirhssjgzoqnCOpXR5XU+QQvsoAtZR
 D2hJcMAwFR7+reuBSQlGshrXGUgC8B6+DGCVsJsuhpTJeaO1tnM+Tme3Y6v3RmXsGVQO
 Ntnss0G/f4EFnJ6afZXyXAsXCXfAeiNi8H+fZ9AW26nmFQLjkp/MNvQtCbIc5N1z8Pxm
 aIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HkiTDoffwuSaTr7ke0a+7yV5MGBGA3Q19sPSnhU1cq4=;
 b=qkZOwRXgVYyW9ad6/LbZTpyyj4DchWBH3eKqGnl0nsp8KZtxq2nddNq5zq0dMWrSif
 Fvga+vSaJ55H4H615Jrhr7/zzF02JmtDjZRRHh/wIGmpTZpT8rJSUVj+xOKzveLtv4YU
 jLBLWg0M88S2em0ezCqwrcC0vQkguvtJGJ9yu/BgNtKGpTQ8hmz6C2jnFrF3kG/2fGVr
 9lqdNlvv5jt2C537xi55v2rqileasvsRonb7UiKwLD5cw/G1i6H+ixU0I8vhV75zzf+m
 JJ8VfO9FZHQgumGcr4hbhYgl1uJZ3jmWY7Lr+s2XbYmIkxfL9UAGrvLIqmCp2DcYQIkQ
 Wjvg==
X-Gm-Message-State: ACrzQf2t7SiyAZ4GR8BZZVkoJXpsCkujQNpDGRghZrBSFjZpP5odL8zX
 doIFnL2UTcXnWKpwjfZhrP6elmJxXP3ZZA==
X-Google-Smtp-Source: AMsMyM6+Fnbz88ouSdWddfdOAm4I2KLZ+fqwsdK/SsDlT/1EVOUyxL8NVFy8DLBTWX2WzcmhDQ3M5g==
X-Received: by 2002:aca:ded7:0:b0:359:dee9:7809 with SMTP id
 v206-20020acaded7000000b00359dee97809mr5736225oig.1.1667194834144; 
 Sun, 30 Oct 2022 22:40:34 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:40:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/11] target/openrisc: Always exit after mtspr npc
Date: Mon, 31 Oct 2022 16:39:44 +1100
Message-Id: <20221031053948.3408-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
References: <20221031053948.3408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We have called cpu_restore_state asserting will_exit.
Do not go back on that promise.  This affects icount.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/sys_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 09b3c97d7c..a3508e421d 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -51,8 +51,8 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)
         if (env->pc != rb) {
             env->pc = rb;
             env->dflag = 0;
-            cpu_loop_exit(cs);
         }
+        cpu_loop_exit(cs);
         break;
 
     case TO_SPR(0, 17): /* SR */
-- 
2.34.1


