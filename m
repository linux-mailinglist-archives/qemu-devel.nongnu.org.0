Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299464FBA6
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:48:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6cEX-0006kC-N2; Sat, 17 Dec 2022 13:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6cEW-0006iV-FA
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:48:28 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6cEU-0007xk-SO
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:48:28 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso9289512pjt.0
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QcAfqamtpOw+dn5SEBgRlVgOQfncVVhzlX0b5oaNdAA=;
 b=ECbFxnUW+mTIoJm+uvjNd6KHBhIS2cj4Q6e3Iy6mDKz/V5A6vh9zXZ7fvRHaAxegAq
 7I/PNmo/CJ5pOTWvqCuVDw/lU5uQMqoHs+uKuyygBZ818X9vyb66p2/2icZ1Ivc6erGy
 N10jRM2HLqBV8bIELDMG3jX8MC2NHvRtc8dCalNrm2QmWt9hyEXF1bCv2Lpvj7v8oOBY
 8muv7KpKf11mxuydO+6OLCTri7TsyVnxtLWaOG/UfJpetfYraVUB/nZZnFxrqGwKj6Kb
 JE6DAchkH/JKy1XXCJYt54R/8SyFRnFJXGqj9bHSp44uGvq7ANCrjbCEmtepWQ10/p0Q
 p3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QcAfqamtpOw+dn5SEBgRlVgOQfncVVhzlX0b5oaNdAA=;
 b=p3aubBlh2anarol7c9O37OvA3zJ684Q8BTwUxO6oB2ktQeQyByoKXDXQBwas/BaK6d
 0xmWQ/LcCNpt+jcaiTIygOevDT/Wn+973uUrePTVWSS/cF0/cY4xaQRHwpB931Oe9qi1
 9C5jqhq/d+O63PGHaHQzYvFOIwgYOv11o8lFChfqqrAYV6g/TqZhcvmGsXlyT9pcWNPq
 jneWIky/Or4xoNdrQypI79SpG3iFqs3LKLulbNfmsiZphY0Ol5ZC8ysI4Yla+8vzn+PO
 BxlnGb7xIUl2ikmSOdWj9JBkiaW2137W20hG+U2mV4lbqr2SQiJZBEZ5PQV2hPw5nByG
 FnJw==
X-Gm-Message-State: ANoB5pnh2pmgP5zHpluXrgsLLlGOmV8PqZS37eW97Gf4fxDuBb1k9hsI
 qEzuOV31h9kN8o8mwOgzXMqylESRAd3w44A6
X-Google-Smtp-Source: AA0mqf7KQBy1oeLZoZw3Q8GBBq1js0zezvMzoab3Jrz279HMFMNQGUzAOC2Qd6d5N6+ucQXwZhiO8Q==
X-Received: by 2002:a05:6a20:a58e:b0:ac:44ab:be3b with SMTP id
 bc14-20020a056a20a58e00b000ac44abbe3bmr46638111pzb.60.1671302904678; 
 Sat, 17 Dec 2022 10:48:24 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:dbe7:d50a:f977:e69b])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00189502c8c8bsm3853852plb.87.2022.12.17.10.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 10:48:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Warner Losh <imp@bsdimp.com>
Subject: [PATCH] accel/tcg: Drop PAGE_RESERVED for CONFIG_BSD
Date: Sat, 17 Dec 2022 10:48:23 -0800
Message-Id: <20221217184823.3606676-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Make bsd-user match linux-user in not marking host pages
as reserved.  This isn't especially effective anyway, as
it doesn't take into account any heap memory that qemu
may allocate after startup.

Cc: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

I started to simply fix up this code to match my user-only interval-tree
patch set, as L1_MAP_ADDR_SPACE_BITS gets removed from translate-all.c,
but then I decided to remove it all.


r~

---
 accel/tcg/translate-all.c | 65 ---------------------------------------
 1 file changed, 65 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b964ea44d7..48e9d70b4e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -354,71 +354,6 @@ void page_init(void)
 {
     page_size_init();
     page_table_config_init();
-
-#if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
-    {
-#ifdef HAVE_KINFO_GETVMMAP
-        struct kinfo_vmentry *freep;
-        int i, cnt;
-
-        freep = kinfo_getvmmap(getpid(), &cnt);
-        if (freep) {
-            mmap_lock();
-            for (i = 0; i < cnt; i++) {
-                unsigned long startaddr, endaddr;
-
-                startaddr = freep[i].kve_start;
-                endaddr = freep[i].kve_end;
-                if (h2g_valid(startaddr)) {
-                    startaddr = h2g(startaddr) & TARGET_PAGE_MASK;
-
-                    if (h2g_valid(endaddr)) {
-                        endaddr = h2g(endaddr);
-                        page_set_flags(startaddr, endaddr, PAGE_RESERVED);
-                    } else {
-#if TARGET_ABI_BITS <= L1_MAP_ADDR_SPACE_BITS
-                        endaddr = ~0ul;
-                        page_set_flags(startaddr, endaddr, PAGE_RESERVED);
-#endif
-                    }
-                }
-            }
-            free(freep);
-            mmap_unlock();
-        }
-#else
-        FILE *f;
-
-        last_brk = (unsigned long)sbrk(0);
-
-        f = fopen("/compat/linux/proc/self/maps", "r");
-        if (f) {
-            mmap_lock();
-
-            do {
-                unsigned long startaddr, endaddr;
-                int n;
-
-                n = fscanf(f, "%lx-%lx %*[^\n]\n", &startaddr, &endaddr);
-
-                if (n == 2 && h2g_valid(startaddr)) {
-                    startaddr = h2g(startaddr) & TARGET_PAGE_MASK;
-
-                    if (h2g_valid(endaddr)) {
-                        endaddr = h2g(endaddr);
-                    } else {
-                        endaddr = ~0ul;
-                    }
-                    page_set_flags(startaddr, endaddr, PAGE_RESERVED);
-                }
-            } while (!feof(f));
-
-            fclose(f);
-            mmap_unlock();
-        }
-#endif
-    }
-#endif
 }
 
 PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
-- 
2.34.1


