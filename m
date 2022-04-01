Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE14EFA40
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 21:04:31 +0200 (CEST)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naMZR-0003Vc-PO
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 15:04:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naMXk-0002oa-2y
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 15:02:44 -0400
Received: from [2a00:1450:4864:20::635] (port=35504
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naMXi-0000Ut-Lo
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 15:02:43 -0400
Received: by mail-ej1-x635.google.com with SMTP id yy13so7787055ejb.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 12:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qas/d64QhQzK6/1Vbuwj4Rdt35DYGLG/DMoXYM3wotY=;
 b=SCum9YOCkz/T2EO0XIxsGsuhnjGzSRBd0KhgUUFv9U0WAMvUN5BvlRWdJpoVUVKJl0
 TpLpIS3EDryT4fpvTztpodkQsT/pGXXpvlMsp4VCCfmNlC3PcCDfFx3MfKIqCYEsDIVj
 dv7bXp7TWz6PT4NxVI9Uh4f04XpmXI+RAz3Y5LJXrSCt/Dqb3wHYzSIhCZIm/2bMVZnP
 99SOBWkUg55j+bcuznMUj7G9DFeFgOsj28THIQK2Iib9x1Yzxyz+eu/LyodySYs/oFEW
 BXXgPS/dut5ibu/OqtKGx879wjFQO6fz9oxsMUBlef4CXG3xwjpQ862YTOJckk+Maasi
 JW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qas/d64QhQzK6/1Vbuwj4Rdt35DYGLG/DMoXYM3wotY=;
 b=08poIfoAs670AoxWQTLVyoYD8JN7NtgWbgcn23fTDZ8ijW7K1fE3x77bmlGkWCYtio
 ojPIukBKK5+2D9p4T5uggeYaP4+mG7H5XmI9PN8nfbgrk2Yl5A0tSPNUooHVt24M0JWu
 AqK+TSd6rXqAIiJprkODplQUEaN+vEGLHzdI8bO8ayLV5CD+H9puSJ85CpiRjY9Ci1S7
 Vq/X2Aadu8G5FROHF4bsTOHbTi3e+ZWRcbZtsgA1TAw0lsMVLE4qxzsRnj9/gLt5gmUj
 cMpcZOpA2CklkT3RJSeOyjZ6fNGt74kbD0ouB7QiP89nP8pZlk5LSdoPz3qKOXy6Vnis
 UfcQ==
X-Gm-Message-State: AOAM533KELRWVEhfzsSXZt8EmwZO00BgcgGgxUoMoanzZxTCWWpkSy9W
 79bt0gQdnvAX8wsrC7zhL9nqh9FfAAORmODsgLQ=
X-Google-Smtp-Source: ABdhPJy0f4fH1/oAJMO+VODQ2GEH/Gbcs8WXp38cryZZdecDhtkR3akt5sk58A25pkcs3vFc12wbBA==
X-Received: by 2002:a17:907:97cc:b0:6df:83bc:314c with SMTP id
 js12-20020a17090797cc00b006df83bc314cmr1037885ejc.587.1648839761140; 
 Fri, 01 Apr 2022 12:02:41 -0700 (PDT)
Received: from localhost.localdomain ([185.81.138.17])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a17090635cc00b006e055c9c91esm1264231ejb.101.2022.04.01.12.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 12:02:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] plugins: Assert mmu_idx in range before use in
 qemu_plugin_get_hwaddr
Date: Fri,  1 Apr 2022 13:02:33 -0600
Message-Id: <20220401190233.329360-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reports out-of-bound accesses here.  This should be a
false positive due to how the index is decoded from MemOpIdx.

Fixes: Coverity CID 1487201
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 plugins/api.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/plugins/api.c b/plugins/api.c
index 7bf71b189d..2078b16edb 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -289,6 +289,8 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
     enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
     hwaddr_info.is_store = (rw & QEMU_PLUGIN_MEM_W) != 0;
 
+    assert(mmu_idx < NB_MMU_MODES);
+
     if (!tlb_plugin_lookup(cpu, vaddr, mmu_idx,
                            hwaddr_info.is_store, &hwaddr_info)) {
         error_report("invalid use of qemu_plugin_get_hwaddr");
-- 
2.25.1


