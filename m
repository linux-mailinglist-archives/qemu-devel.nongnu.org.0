Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A136F51F1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:40:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tj-000579-Jp; Wed, 03 May 2023 03:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tT-0004Ui-VV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:20 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tS-0005fW-7A
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:19 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so30168705e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098836; x=1685690836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDxG1Fumi/VCBapDyQzvtsqcUgkmKE+Qvv/KLvwRg5E=;
 b=Rvd+k0oSgftU0K+4DWUPUc+vF+FFMuqaYvcXByZSAm+NLlThIfEtZ0kgulakP3le3j
 jmZTdZEl8dMMGBANb0nKHIitpTUo4gwji3pAD353eOTK1+BhG5HKzr3n/2/UP/u8TnRn
 CMYZkLnHrvc7kn4xB5+5fDddrwvl5Ui0qgAc58TReBFUarb7MNx8t/TJa/C5+Q4iY2fw
 q0GYr9kJp3Q+AxJAr1qZC0dPV8Fq4mw2NGAv3Yl5FXcY0Ibv90d1YYBT+O1QPn5wBdYX
 J0l/AutxCQ4di9vrChBkXxrASISNzwgQR46dbzwShEMB34aiRXcakMi0IW9JXZQv72k5
 zquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098836; x=1685690836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDxG1Fumi/VCBapDyQzvtsqcUgkmKE+Qvv/KLvwRg5E=;
 b=iY5/NCjk7hslZBP8T5HGC4Hz1jItUQzeEwPXNb+E9EVBZGPZ7Ejl3F1u5LPq//eyv4
 30LvUJ3qzaj1SgebTuKR7WkisbXbI9Dly7CZbQ+1eov8bVAlocUmT3wc6bAMXuiZ2ejo
 pzcvPg4f1vgZMXSdHG2ZqJ2mguu50QgC56iMrhKKH4JJxS/dnCiZ5GxVtEwaUW3ZPJAR
 PQYBu2nYjOCtb0aaFzRvrat+tunYAe7MNtKemq73bqqZ5r17Q78cr1uXiCjspxZvGrko
 5Th1nsufGhYSBXLxxlL0uxOzd7akR0sXgsLUA/duh/plMOjoofCi/P/FDghoY9frCNam
 gtlQ==
X-Gm-Message-State: AC+VfDz7VLnP1khl5NL4Zkhtws5y6Pq4vKFmxHthbXiqIlPZbzb4/u31
 7dVAf1yMUu1qYzUAwd2hCwe7QASU2vocsDmQtJ0v4w==
X-Google-Smtp-Source: ACHHUZ7KLJo6hadBGssXulc5Pg9nNIiefmhZ+Zt48GoqraCj6XnN3BLqSRCakfmWsCvea+tCNp6FVg==
X-Received: by 2002:a7b:cb8c:0:b0:3ee:6cdf:c357 with SMTP id
 m12-20020a7bcb8c000000b003ee6cdfc357mr13098956wmi.20.1683098836799; 
 Wed, 03 May 2023 00:27:16 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 59/84] exec-all: Widen tb_page_addr_t for user-only
Date: Wed,  3 May 2023 08:23:06 +0100
Message-Id: <20230503072331.1747057-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is a step toward making TranslationBlock agnostic
to the address size of the guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index ecded1f112..8c8526d9f8 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -34,8 +34,8 @@
    addresses in userspace mode.  Define tb_page_addr_t to be an appropriate
    type.  */
 #if defined(CONFIG_USER_ONLY)
-typedef abi_ulong tb_page_addr_t;
-#define TB_PAGE_ADDR_FMT TARGET_ABI_FMT_lx
+typedef vaddr tb_page_addr_t;
+#define TB_PAGE_ADDR_FMT "%" VADDR_PRIx
 #else
 typedef ram_addr_t tb_page_addr_t;
 #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
-- 
2.34.1


