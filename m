Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7FE4BAD32
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 00:22:15 +0100 (CET)
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKq6I-0006Bq-4D
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 18:22:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKq1z-0000IC-IK; Thu, 17 Feb 2022 18:17:47 -0500
Received: from [2607:f8b0:4864:20::f2e] (port=35590
 helo=mail-qv1-xf2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKq1x-00085X-V9; Thu, 17 Feb 2022 18:17:47 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id d7so11393457qvk.2;
 Thu, 17 Feb 2022 15:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FHWMqRiXCS1mCvY23GTyCKV0WJzgCnWNA9IsgXk6HzE=;
 b=GGK/FnqvbI3rJHfJ1EYKire8b7kgZ0y4Y3jLm04C9jEQTdRQI5xrlIPx0Jp9AHNlU5
 tUNIfEDSkPI/2gc9hshbx7vtEylkea4YElt/u4T6T6/YI7h7Itc1L1v5TAP1Y2m1lJ35
 N9EpUzrrS2xV/BlziccaMU179NbOJksc8L98njDJjIU5VhgahOoomgg7vzsp2BNYf5Tp
 AnWydidnPC8wrxHMqvJbFgaG9fUBWL8W6BtQ1J6wg44z1OHmpk/R+lMnwZq7xsCLzb8a
 +ZlF8Uu+kJa+IP3Glm27IBwKXT4ZrptSMNhsbUYq2HlbUhCHjz6vQ1ueTAEsP7+CVcRl
 fPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHWMqRiXCS1mCvY23GTyCKV0WJzgCnWNA9IsgXk6HzE=;
 b=awuHIO8pdNmeHC8zmClg82BT3Nz7UxhTVD6biP8YyUfdFXh1p/wVDuVbrkqcyJGI8p
 ZEF93olyflAbzabPryBP1PPRY/DkFX1nGqUtfzMJuroC2m3BiwjdW4sCZs6pocetupLm
 vYVRaavdS1tosuFYXGIbx8a8ZoUEeTQJFxjxmaoknApKhzOeMw8pwkY+VrIOFyv194GT
 BVx/1Q9yW9M9YxFacGTmZGWbWywnUY4+aSvmb14dx7tuke+P1ypYBbYKZg2Iu+QBZkM2
 BrTm1jaaJ6MTa96pj7xHDJhCPHJn6PMER+9dkG/TaHF3DvNxIHx6mGgjOnKmHifUTufz
 EsNA==
X-Gm-Message-State: AOAM5338Cldl4V0O5oNRkQZLiQqhfR7ECATeNH7kGPhZvQShVWn7OBs2
 7ORjX4UP0NJbWAz0MLi3iFtu5gpi/Ys9j8agdh58bqGB
X-Google-Smtp-Source: ABdhPJzn2w7l9PC+kvyx44qRFqZCwN2/Em4Mns0AxjjTgPIQ742fWqyG21VfwrAPFNIseR2mA+Hh5g==
X-Received: by 2002:ac8:5948:0:b0:2d7:14ba:94aa with SMTP id
 8-20020ac85948000000b002d714ba94aamr4411126qtz.111.1645139864453; 
 Thu, 17 Feb 2022 15:17:44 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 h10sm21272939qko.92.2022.02.17.15.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 15:17:44 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 4/4] tests/tcg/s390x: changed to using .insn for tests
 requiring z15
Date: Thu, 17 Feb 2022 18:17:28 -0500
Message-Id: <20220217231728.13932-5-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220217231728.13932-1-dmiller423@gmail.com>
References: <20220217231728.13932-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 tests/tcg/s390x/mie3-compl.c | 21 +++++++++++----------
 tests/tcg/s390x/mie3-mvcrl.c |  2 +-
 tests/tcg/s390x/mie3-sel.c   |  6 +++---
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
index 98281ee683..31820e4a2a 100644
--- a/tests/tcg/s390x/mie3-compl.c
+++ b/tests/tcg/s390x/mie3-compl.c
@@ -14,25 +14,26 @@
 #define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
 { uint64_t res = 0; F_PRO; ASM; return res; }
 
+
 /* AND WITH COMPLEMENT */
-FbinOp(_ncrk,  asm("ncrk  %%r0, %%r3, %%r2\n" F_EPI))
-FbinOp(_ncgrk, asm("ncgrk %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_ncrk,  asm(".insn rrf, 0xB9F50000, %%r0, %%r3, %%r2, 0\n" F_EPI))
+FbinOp(_ncgrk, asm(".insn rrf, 0xB9E50000, %%r0, %%r3, %%r2, 0\n" F_EPI))
 
 /* NAND */
-FbinOp(_nnrk,  asm("nnrk  %%r0, %%r3, %%r2\n" F_EPI))
-FbinOp(_nngrk, asm("nngrk %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_nnrk,  asm(".insn rrf, 0xB9740000, %%r0, %%r3, %%r2, 0\n" F_EPI))
+FbinOp(_nngrk, asm(".insn rrf, 0xB9640000, %%r0, %%r3, %%r2, 0\n" F_EPI))
 
 /* NOT XOR */
-FbinOp(_nxrk,  asm("nxrk  %%r0, %%r3, %%r2\n" F_EPI))
-FbinOp(_nxgrk, asm("nxgrk %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_nxrk,  asm(".insn rrf, 0xB9770000, %%r0, %%r3, %%r2, 0\n" F_EPI))
+FbinOp(_nxgrk, asm(".insn rrf, 0xB9670000, %%r0, %%r3, %%r2, 0\n" F_EPI))
 
 /* NOR */
-FbinOp(_nork,  asm("nork  %%r0, %%r3, %%r2\n" F_EPI))
-FbinOp(_nogrk, asm("nogrk %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_nork,  asm(".insn rrf, 0xB9760000, %%r0, %%r3, %%r2, 0\n" F_EPI))
+FbinOp(_nogrk, asm(".insn rrf, 0xB9660000, %%r0, %%r3, %%r2, 0\n" F_EPI))
 
 /* OR WITH COMPLEMENT */
-FbinOp(_ocrk,  asm("ocrk  %%r0, %%r3, %%r2\n" F_EPI))
-FbinOp(_ocgrk, asm("ocgrk %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_ocrk,  asm(".insn rrf, 0xB9750000, %%r0, %%r3, %%r2, 0\n" F_EPI))
+FbinOp(_ocgrk, asm(".insn rrf, 0xB9650000, %%r0, %%r3, %%r2, 0\n" F_EPI))
 
 
 int main(int argc, char *argv[])
diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c
index 81cf3ad702..f0be83b197 100644
--- a/tests/tcg/s390x/mie3-mvcrl.c
+++ b/tests/tcg/s390x/mie3-mvcrl.c
@@ -6,7 +6,7 @@ static inline void mvcrl_8(const char *dst, const char *src)
 {
     asm volatile (
     "llill %%r0, 8\n"
-    "mvcrl 0(%[dst]), 0(%[src])\n"
+    ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
     : : [dst] "d" (dst), [src] "d" (src)
     : "memory");
 }
diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c
index d6b7b0933b..32d434b01a 100644
--- a/tests/tcg/s390x/mie3-sel.c
+++ b/tests/tcg/s390x/mie3-sel.c
@@ -19,9 +19,9 @@
 { uint64_t res = 0; F_PRO ; ASM ; return res; }
 
 
-Fi3 (_selre,     asm("selre    %%r0, %%r3, %%r2\n" F_EPI))
-Fi3 (_selgrz,    asm("selgrz   %%r0, %%r3, %%r2\n" F_EPI))
-Fi3 (_selfhrnz,  asm("selfhrnz %%r0, %%r3, %%r2\n" F_EPI))
+Fi3 (_selre,     asm(".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n" F_EPI))
+Fi3 (_selgrz,    asm(".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n" F_EPI))
+Fi3 (_selfhrnz,  asm(".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n" F_EPI))
 
 
 int main(int argc, char *argv[])
-- 
2.32.0


