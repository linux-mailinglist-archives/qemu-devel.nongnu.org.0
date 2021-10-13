Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8068F42B31C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:08:27 +0200 (CEST)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUd0-0006fu-JE
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHx-0004wl-O0
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:42 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHu-000558-UF
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:41 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 ns7-20020a17090b250700b001a0937b87b7so2815261pjb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kL7S1VIhGWd0zPGO5R9RGYtF+Izlm+bII/GL/xjRg10=;
 b=uA3ACiR76wooQe3fpRNAtoEJQiE+V61ATB/0qVvdFDmwjRkbboFmZR5jCytt1hkfGT
 DMFNbB5w2LlbF5Aq/2+BExVCRvTbgQgLTidcmQ10MYwSNLByzKmAem2g/dAMe72x3kwq
 a5Cg/G4Cv3Q8/0MQVHsMzaQE3J/QRzcVU0fu8l89HoOr/X/rPe9srD/8XfdnWUE34ppp
 Iwzh9f9qkRVYTw2hFmw24EnHpE39kHNyv/i1qHD/vfWHXeTtzlJAKdDBcTaqvZzlIQ6S
 Q7nwgmkGSTBm57xTVyYSKOgMZAp6SIfEPy1R3K4M0igWyY83zlI0b0U6SRzMyzkO3Scr
 JYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kL7S1VIhGWd0zPGO5R9RGYtF+Izlm+bII/GL/xjRg10=;
 b=ax8Kpg+jSj/k3OABwGFVyIh/4H38Ke+hmvbcPSfL9wQfhvbeqrvz4MkIyPrA6phsSB
 AkN0l6hKjiCzU5AHmqY1HnuJHMda5fEZBVV43bdHr0D7xnZxHRBRzCDdmL2eoxpGFpiO
 JitFNz+STjodd2U1D/3XLdevMVlTaDkGFls54wcL4gVLL8fFWYVMldZIO9kb+Y78s2yW
 vYpLstnucN0wMpIo7beo+U4ed63qBWIUSqP1yMsitkdyy30++seYcyUWALnKx5DGzmoq
 a8bLX+7z4xwNgctuXm5u/gBXepVjg8SerxPcgpbMH5UjYn1o6tJe2u1LDCQiu7n0PYIQ
 eWvg==
X-Gm-Message-State: AOAM532c8DmwlXkeAh/qd5ld6GFyhmyAeCtCItxMPDekdwLdwTbEiyYO
 b6QUntRqVL9pefXgyo2uxOT1YAuwaqm4zg==
X-Google-Smtp-Source: ABdhPJwgwbWtPmDwi0T/8ne07b+LxS5c6rigjhqv27rI/wfxCGtUaB3YGT6UHcU/xnW99WRtqhJkkQ==
X-Received: by 2002:a17:902:780f:b0:13a:3919:e365 with SMTP id
 p15-20020a170902780f00b0013a3919e365mr33354705pll.63.1634093196404; 
 Tue, 12 Oct 2021 19:46:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/48] target/sparc: Use cpu_*_mmu instead of helper_*_mmu
Date: Tue, 12 Oct 2021 19:45:46 -0700
Message-Id: <20211013024607.731881-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 299fc386ea..a3e1cf9b6e 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1328,27 +1328,27 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
             oi = make_memop_idx(memop, idx);
             switch (size) {
             case 1:
-                ret = helper_ret_ldub_mmu(env, addr, oi, GETPC());
+                ret = cpu_ldb_mmu(env, addr, oi, GETPC());
                 break;
             case 2:
                 if (asi & 8) {
-                    ret = helper_le_lduw_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldw_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_lduw_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldw_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             case 4:
                 if (asi & 8) {
-                    ret = helper_le_ldul_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldl_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_ldul_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldl_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             case 8:
                 if (asi & 8) {
-                    ret = helper_le_ldq_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldq_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_ldq_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldq_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             default:
-- 
2.25.1


