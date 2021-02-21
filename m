Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B32320B04
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:43:49 +0100 (CET)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpxc-0007UZ-Gw
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqP-0007GE-IV
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqO-00038b-7e
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b3so16335546wrj.5
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MC5oi9TPKAczNKXq5Uj4eOA8fenPPAC5Jz7BQ2K2UHA=;
 b=G5MwtcUasLf6Auc4IBP/XfCNv8xWuerft2SMqxGjOnKwf+uJF1DqXol81+0jIAHWcy
 b7HBqq9+fDEnZGjSKnHhAakNr7ChFRPNYrfsYPW9es7cJDlyfK+57fPqUnnbdy8Ypm/s
 OuvAe45F8doPAdByra16Ct6NyyTPNjS8u46GhkLfHfBC/+FJ70yKwJ3AV4DpLq+KfWov
 7txSYbkHIsZY10hfzMWaZxVPQ7WDCdsO7wxCgq0GcMwGhx65v79SwhiLIXTRxMBhAe6P
 7YDRYkvHcfbBtVcQFEcRX34ZnW9M9mNq9+6dHHbT/Ql4Y5aFwyCM3uDYzkkbHpPxA1q4
 MyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MC5oi9TPKAczNKXq5Uj4eOA8fenPPAC5Jz7BQ2K2UHA=;
 b=b3En0hZu9pNphR3ygm/5LRQBFw6wYN/z/SidebbGMVbPpGgD7xJ4MWp5Yk4MjdZ7eI
 2Y3doXlz+rWXTR4+PLLYLWkfp37mtE/CGUZgdn00W6+PYXWKbPNXf+hmRf1rLyPmEHda
 8MvD690Idvzi/r16+8yFh+BO6rMxxBd+1eSrX9Z9cvGmZCJLtjsaAPpGFPzc4++Wwz9s
 y4Qswh3ZNFi1m6zH/vLkzMdxdHWN/q/AdIxUYFLwAP4EthPbsmNQuHReXPVGolBnZ0K/
 9HCYj9lNsRS5SgCvBiPVtGZBC+szcpv3lq0X0ZR2MAWspXX4eFJ955JE8KjiMyFUfilk
 UqEA==
X-Gm-Message-State: AOAM531qCak9aBRGqR2eSBS0+dC9ZuNtuIFNKXge936lVZEhwe617WgI
 H/fjQHYxYtdOJ689/MJWd+CYQERvzsw=
X-Google-Smtp-Source: ABdhPJxQPzndsGHkSrSwqpqWvZs3tHHrsuC7VMdlBOrbZREdzEgziDQ426ui0a8XjFsNYXEH468Czg==
X-Received: by 2002:a5d:4848:: with SMTP id n8mr1015337wrs.241.1613918178483; 
 Sun, 21 Feb 2021 06:36:18 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x13sm7695051wrt.21.2021.02.21.06.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/43] target/mips: Remove unused 'rw' argument from
 page_table_walk_refill()
Date: Sun, 21 Feb 2021 15:34:10 +0100
Message-Id: <20210221143432.2468220-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the 'rw' argument is unused, remove it.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210220202026.2305667-1-f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index b48f892a513..8d3ea497803 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -622,8 +622,8 @@ static int walk_directory(CPUMIPSState *env, uint64_t *vaddr,
     }
 }
 
-static bool page_table_walk_refill(CPUMIPSState *env, vaddr address, int rw,
-        int mmu_idx)
+static bool page_table_walk_refill(CPUMIPSState *env, vaddr address,
+                                   int mmu_idx)
 {
     int gdw = (env->CP0_PWSize >> CP0PS_GDW) & 0x3F;
     int udw = (env->CP0_PWSize >> CP0PS_UDW) & 0x3F;
@@ -879,7 +879,7 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         int mode = (env->hflags & MIPS_HFLAG_KSU);
         bool ret_walker;
         env->hflags &= ~MIPS_HFLAG_KSU;
-        ret_walker = page_table_walk_refill(env, address, access_type, mmu_idx);
+        ret_walker = page_table_walk_refill(env, address, mmu_idx);
         env->hflags |= mode;
         if (ret_walker) {
             ret = get_physical_address(env, &physical, &prot, address,
-- 
2.26.2


