Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C2E5F5F92
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:24:25 +0200 (CEST)
Received: from localhost ([::1]:53354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHUm-0001zx-CJ
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIQ-0005zQ-QC
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:38 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:43774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIP-0006w3-7y
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:38 -0400
Received: by mail-pf1-x436.google.com with SMTP id 204so841484pfx.10
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=I02Pd3AEii+oy/pB87AZKJX0kpqM/XYrou+bQ1J7ZKA=;
 b=ShEDNP/Tg7hniRioTAVxFalPZBS1odnhA4sP3ndXdU6VCp+6cIx0MpQ7X9dBk+uoSz
 F03MzA0LX3H1HB+6ii1NHDunNtLgI1Swmn7jzqysXmyMi4tv+VrHzUnCMRpD9sLWlpQ2
 Yd5ItN0FsDNUR81LJKII8vjUBpSGv8cb74dVko6xIilT5riH8cxyTHOmvJ+/IvkEAyse
 MGK0VwnxtjD4D899Q15u0cdohy/GQzHWiaT4HUr7wcGiRspxT27O0UmkXE73KbMU3+Lu
 udlbeCQQs1l7tX0Bv3DEo7M+rZKXLlqSHlGbbDqeBoa+PZCSIyr9hrHD9ROcgdfixHgD
 wzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=I02Pd3AEii+oy/pB87AZKJX0kpqM/XYrou+bQ1J7ZKA=;
 b=ZoAZBTOlSSnDPZM7ChIfCO/uYPKcZ1e8Ll3ozfU5KKvC9HnO6GHPuV4XiRFJvcwK3H
 0BtaFBO07FMvQ+ZWpsIKwt6bj5hyb8/9OBFDac5BF3u1uu/vugediKXthpPjeelcxZVo
 w/r5CXnrlC/27Jt8iSXwBxVqXlnaK9mOYpbaTX36yOgnNwD2+bzGY+ZpL4buuVCgfXht
 KoatImyd2d0wTsKb+0MqVTjBuSOo+AKI2LGhtENyKRFkNgTK5tYS3XbxZ06s1natjmc8
 tR41qFpnipOX5UerH/fgb6AFvCgb8eBH7QSN67kAebbwBjVID0aj+yqY1TosLoYXb6Qk
 /9AA==
X-Gm-Message-State: ACrzQf1oSRVJXU+sVkcyQBGNxhyYxiQRRQrDEShXWGyss6KgVNzVieiQ
 LzzSdjEzaYVtWbR6OfyrY4sy3nQBf3SBMg==
X-Google-Smtp-Source: AMsMyM7HPzHpv1orLtW7qcKCbRLW+a0YYlBaZKCiYJT/IrvcMV2aZPXdT7/lXIa2dgkFXOGf4G0Q5w==
X-Received: by 2002:a65:6cc4:0:b0:412:35fa:5bce with SMTP id
 g4-20020a656cc4000000b0041235fa5bcemr2516477pgw.466.1665025896472; 
 Wed, 05 Oct 2022 20:11:36 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 17/24] accel/tcg: Use tb_invalidate_phys_range in
 page_set_flags
Date: Wed,  5 Oct 2022 20:11:06 -0700
Message-Id: <20221006031113.1139454-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Flush translation blocks in bulk, rather than page-by-page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0006290694..04401ceac7 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1352,7 +1352,7 @@ int page_get_flags(target_ulong address)
 void page_set_flags(target_ulong start, target_ulong end, int flags)
 {
     target_ulong addr, len;
-    bool reset;
+    bool reset, inval_tb = false;
 
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
@@ -1388,11 +1388,15 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
             && (reset ||
                 !(flags & PAGE_EXEC) ||
                 (flags & ~p->flags & PAGE_WRITE))) {
-            tb_invalidate_phys_page(addr);
+            inval_tb = true;
         }
         /* Using mprotect on a page does not change sticky bits. */
         p->flags = (reset ? 0 : p->flags & PAGE_STICKY) | flags;
     }
+
+    if (inval_tb) {
+        tb_invalidate_phys_range(start, end);
+    }
 }
 
 void page_reset_target_data(target_ulong start, target_ulong end)
-- 
2.34.1


