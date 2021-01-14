Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0E82F5731
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:24:24 +0100 (CET)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsJC-0003PI-4j
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCE-0003Nt-7U
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:10 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCC-0003PO-1F
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:09 -0500
Received: by mail-pf1-x42f.google.com with SMTP id w2so2435193pfc.13
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AC87R9xtxutHL4s1/n8odbHgwbxpwhaLEHoWjKyBlaU=;
 b=DjzjC54TGmJxdQOByP3MvVXBxYbz02nYRtqlhSvX08aWyXqfcQAVvFJ2VdkL4khI1U
 12oCg1K5ezCkc3BhK79HyB5UXv0J2mMXcMWEzyU/EJtt2xYINeZbcVQX3xQHd5mb4KpQ
 bl/S07VcneAPr7Lnrwe2i5LWa2Y528h6k01ecg9GJLIotC+wSp0rgyd3AM5Bp2cI+tf9
 t8yDcVnJC/u0132Kphu3v0B60aZ1UTSDjCi3mfBu+WF29by+FwjK9Inm+9ZglFEbUzN7
 Wa/argGI+v4n16CN/U8ELhthGDoogvXEtt8KqlI0oHITC56tEVXSaeYn7spRZHO9RmOk
 dhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AC87R9xtxutHL4s1/n8odbHgwbxpwhaLEHoWjKyBlaU=;
 b=iqrRh+BQPmctmfkPeJd//GnEk4fxmcfeeFZwErxgYjuWrtf+JjV0/UHC85dqbNZ80b
 AUzJ/HKZTN89/ijZrPJeijuAAeAI42Gj2DHwk2mf6SmAq9UbbWiYKZ2CeVPgH90Jsj53
 b+qvV5Ikl/eejiCxvV0X9YGfZoOUTOGJoupOfzIwtDEydVpfSMGPHwjpTGg940YQ4RXZ
 WIiQ6EEijYTl7NGPmdibUpdUXtNCWj03qcUwkinWooPYaZAM2VxGOLNFvff6p4eYYzRz
 Uaxuivknw8URyFBXgF86Atln8ft4KcjX7mEr25XwRXc6g+4SOG0PsRU4URLlao5fah72
 dn5g==
X-Gm-Message-State: AOAM533GpraasjJ7yLkNP4qePahv/b/1XnnLbs3FRtqjihyn6t91k6g/
 2lP7p2a1rM/CX+dW9Nrv10g/NafI9ZbhcQ==
X-Google-Smtp-Source: ABdhPJwqIPdoejrzmm3dIwnBTP9K/FtSuYSbXsIkF5qnUZjWYepAECy893mhOFlXxWyG4zNUGcoqjQ==
X-Received: by 2002:a63:50a:: with SMTP id 10mr5027713pgf.273.1610590626558;
 Wed, 13 Jan 2021 18:17:06 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/24] tcg: Expand TCGTemp.val to 64-bits
Date: Wed, 13 Jan 2021 16:16:35 -1000
Message-Id: <20210114021654.647242-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will reduce the differences between 32-bit and 64-bit hosts,
allowing full 64-bit constants to be created with the same interface.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 2 +-
 tcg/tcg.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 2bdaeaa69c..e7adc7e265 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -506,7 +506,7 @@ typedef struct TCGTemp {
     unsigned int mem_allocated:1;
     unsigned int temp_allocated:1;
 
-    tcg_target_long val;
+    int64_t val;
     struct TCGTemp *mem_base;
     intptr_t mem_offset;
     const char *name;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index e02bb71953..545dd2b0b2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3176,7 +3176,7 @@ static void dump_regs(TCGContext *s)
                    tcg_target_reg_names[ts->mem_base->reg]);
             break;
         case TEMP_VAL_CONST:
-            printf("$0x%" TCG_PRIlx, ts->val);
+            printf("$0x%" PRIx64, ts->val);
             break;
         case TEMP_VAL_DEAD:
             printf("D");
-- 
2.25.1


