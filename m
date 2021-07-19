Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5A3CEE1B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:27:51 +0200 (CEST)
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5anm-0005jS-H4
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aiv-0003oC-8v
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:49 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ait-0000lq-KB
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:49 -0400
Received: by mail-pj1-x102c.google.com with SMTP id p9so12413344pjl.3
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lIy9EI7XitWw8lbY9Bxr/rosSq+mhVjP0cNUkw2lFHM=;
 b=V67TnYsattLVHYDdYh1MZTOA8pyxM3GA9j9o15vdWJSoMSi4oEnd36GUbVNKctk7Dn
 ZcoduRsZdSD1MWGe1663TjgQ1RDdbqzKiIZFU70k18bwVLPUobY/T17GXpp2PQHLUDuH
 NZ1UFK+lq56v27ENf36eKcyewERiir6hXcdnmllZbSY2CiclEvvy+VKhLoFkhwlW4zUC
 otRLcm47iojpAgvwW1cAf1Q0xnrH5Vvh+mJ0SfOZG4W/rOdq1t84TmGy875YaWnSQ/YU
 35cXyO4RHtqENGIpV4G/iBnZnpSVLrwIyqW7s+rifJ+Gf3vCrNv0ACPXJKc47a71iBlh
 BNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lIy9EI7XitWw8lbY9Bxr/rosSq+mhVjP0cNUkw2lFHM=;
 b=n/EscIlayWLB1VVjiuqopbkA5BAtVeZIYEqm0zScqdAoWa9ALNZTsK1uF29MgC4ZCy
 i/2n2Q2zUPDrnWDF071zJslSh2Ruz4UyFhLWsF1bXipMGTLhyFjv+Ed85loMtPvIM9U5
 z5LRrF3LIyJmY+qr37/TnXkVIkkVniE9VZMMr3XCQenhZm0lm7BRw5JDjIhjO/SeLjNn
 yoi8WyiFvz2ZosXrTQk0Uqfs7hX4aqJzIePktRSmn97vnogu3lvnVH0aSgEWJg5nv+lg
 bMwLxw+I4kSjyr4nMo8opa3B4muiCx9fM2FGDEAwrPv9EMxanUp8qfKlyPix/ja6oAY2
 p9nw==
X-Gm-Message-State: AOAM531LsEnO3ZX4e0789FI8d2g12Ryn2h3ah8Qv6v+R3zeAItuxV6y7
 cp5s+upGmJ6vEr2wU8xp0Dpqo2GSzO+Yvg==
X-Google-Smtp-Source: ABdhPJyquUKZXhGRjRuMwNwYwpA+7JmvDvP+TGhE1AzZf3GMj3yyliX0pGtJayAwErlFK1eheQ60eA==
X-Received: by 2002:a17:90a:7489:: with SMTP id
 p9mr32746395pjk.101.1626729766199; 
 Mon, 19 Jul 2021 14:22:46 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 02/15] accel/tcg: Move curr_cflags into cpu-exec.c
Date: Mon, 19 Jul 2021 11:22:26 -1000
Message-Id: <20210719212239.428740-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly have more than a simple member read here,
with stuff not necessarily exposed to exec/exec-all.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210717221851.2124573-3-richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 5 +----
 accel/tcg/cpu-exec.c    | 5 +++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dfe82ed19c..ae7603ca75 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -565,10 +565,7 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 }
 
 /* current cflags for hashing/comparison */
-static inline uint32_t curr_cflags(CPUState *cpu)
-{
-    return cpu->tcg_cflags;
-}
+uint32_t curr_cflags(CPUState *cpu);
 
 /* TranslationBlock invalidate API */
 #if defined(CONFIG_USER_ONLY)
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e22bcb99f7..ef4214d893 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -145,6 +145,11 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
+uint32_t curr_cflags(CPUState *cpu)
+{
+    return cpu->tcg_cflags;
+}
+
 /* Might cause an exception, so have a longjmp destination ready */
 static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                                           target_ulong cs_base,
-- 
2.25.1


