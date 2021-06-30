Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728953B88C1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:50:15 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfHq-000731-1Z
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0v-0005dk-39
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:45 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0r-00026z-Lh
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:44 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so1983238pjo.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W7Bf8v32MRSYl5delt6pF1CYpdgvOX/1OeFQMhwwhYo=;
 b=zLdNxDS/9nIA/hJzfGAANmqjF72c2ANkI8RjF0uZrGy6jnhrVWcbzaPvHy8kB51ibg
 LLPdZgnhGa+EPCgekHtH/sOnnYlR8T9Sv8bkk3K/zVwjqxaclUa4xBFX70zVgTNHSR10
 RLJV6jHx6KruEjNbRX4Ro2tJR8rZtR1rqHuq9aXZR8pLcdFl1vfav40+YAgORLW/cf7h
 ZFqfP1LiN5vQXNnfeQ/Ao19DiorkWHyH8flgpL1hgsfK8plpuDXL6pieyDWG5oxN9Oso
 Hegp4WaUfJXAADDYSZaqFCApgD1wyhONXd4kt78oYdo0Nyz46xWsccI3Rp1QyosvSZdR
 e5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W7Bf8v32MRSYl5delt6pF1CYpdgvOX/1OeFQMhwwhYo=;
 b=Yx4zzXthQrvcxdp5OWSBpO4srfde6UMNKpmyEzvw3auIl9MuoY4Gt4+NLLUE18rKMT
 1aUTKNSTkRfA55CS5dVPOX7dYIFg+MP/0kUik8Eypms8pi55H1Oc7RAXA1ZL+Nvz/3yt
 BDX/JAv2k3hNC6BVVJ5NtOqsnmptQmymu5qJiFwiPqUW0KDrr3pVkudu1qbKiTARGnGC
 nZ3rqPDuZDQZHhGa+B4Nl6mvqSPjPdF8p2YVvk3bppj+JHg4k+E6uwbeoqHvyL7GIDez
 q6Pkucsgk06FQjg87KEduoMzb0QvpjGC8EsdG4vNmly1djrqDyb2KAC2bC2i259PGZ/v
 94Ig==
X-Gm-Message-State: AOAM531v5al/CrSrvsjXVlGJ0OUjFW6Le1EyBW+1bXPUBqucd6nTlsgR
 9QifTaqRou4ZJEcKsjku8tCuqq2TUw0zjw==
X-Google-Smtp-Source: ABdhPJxt0M5JfOzkRL1mdYqan5E7oD6av9aMrh7MVOx1t5bJ/DmfrF5wvrnXUHKN76YkJVOIRYjEYQ==
X-Received: by 2002:a17:902:7402:b029:129:aef:6e3d with SMTP id
 g2-20020a1709027402b02901290aef6e3dmr6593937pll.60.1625077960447; 
 Wed, 30 Jun 2021 11:32:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/28] target/rx: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:19 -0700
Message-Id: <20210630183226.3290849-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 9ea941c630..2443406de5 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -143,18 +143,9 @@ void rx_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-static bool use_goto_tb(DisasContext *dc, target_ulong dest)
-{
-    if (unlikely(dc->base.singlestep_enabled)) {
-        return false;
-    } else {
-        return true;
-    }
-}
-
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
-    if (use_goto_tb(dc, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(dc->base.tb, n);
-- 
2.25.1


