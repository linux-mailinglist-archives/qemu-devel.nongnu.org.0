Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA79042B34D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:19:35 +0200 (CEST)
Received: from localhost ([::1]:50336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUnm-000225-M9
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL7-0005fW-EH
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:57 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:40849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL5-0001Ak-HM
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:57 -0400
Received: by mail-pg1-x534.google.com with SMTP id q5so886992pgr.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g06UIpFMVvSvANx+Qg+u743yK9fN9ISDaQhh0blxyhQ=;
 b=rWH2sNAyl6VwARlJuXiYuEPh8vKbGXHX2PcFXHgVO5WrLk2aMnPqDoSXH3sLozgDTV
 bdHPlG8UrxrqZrfFXjKZ895GFx2bz6bUmmghH/UT1HmEwMA+fPwPhv9rZ1xbqYbw7uQf
 YL/1+tUkX6XSSxeNVQGVAYyB24CvNN1ToApMB6Vsw3setmpYseXYdUZY22BcYlx5sdlk
 GRSXjrZ36IxM2PM46BFMK1GQkNiO0LKbpY411lDKr+/F54ha+gGXaVvEtWA+j+DF7pPA
 jio/5+n7l8P0/w7lWFX5NRgi3mWrSTIew08OWXwRg2pXi7rVnOac///WcO0LkIk7vCJh
 hDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g06UIpFMVvSvANx+Qg+u743yK9fN9ISDaQhh0blxyhQ=;
 b=Shi5lcX9zhF8bUWfgyb1eoJZSGZZiHNAnND47wUtl1Dfe8W175/7bNvEJRPd80kEBZ
 iRGHopPxwRW4toBwE+s+gTzRGTpckcXG1nnJ6OH83LKqPab8IkFNEuzDO9NZhFAPCcur
 dkDzd3WSP2GCiB8MW3LoeZ86kb2rIWbKfSCyxhJOrRA89FRmntb2pknUNabPvxI7LTMM
 G5EHOmOFDL9d6310zUHnvcnqg4Tugp06L3qoY31dy1dV320PSXt8OqGuDq7wUwJvusGz
 zF+Et1O4iPNURFYrQu3ACipFNYHX4kuTZuOUr+g58F4EWP4b+NkRkTrCNISO1BL9Q3IO
 eO5Q==
X-Gm-Message-State: AOAM533gJ5SVkZ1vAvyCnjkAlzHyZXS8UFdHCNSLH0gdjsagSHBaECyR
 FPr9Pff6BoiqFkrzNqjWLIUeAEsVbmrv2w==
X-Google-Smtp-Source: ABdhPJzkNNtSH4bq/WsgTqS1uea8dEV8Xft/juf7NlXOOfQmQESIVM6rk5EaqejpUYm6XfEI100Tkw==
X-Received: by 2002:aa7:92d0:0:b0:44c:ab24:cce7 with SMTP id
 k16-20020aa792d0000000b0044cab24cce7mr35084278pfa.6.1634093394172; 
 Tue, 12 Oct 2021 19:49:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y20sm12579610pfp.68.2021.10.12.19.49.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:49:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 46/48] tcg/tci: Support raising sigbus for user-only
Date: Tue, 12 Oct 2021 19:46:05 -0700
Message-Id: <20211013024607.731881-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index e76087ccac..92a7c81674 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -292,11 +292,11 @@ static bool tci_compare64(uint64_t u0, uint64_t u1, TCGCond condition)
 static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
                             MemOpIdx oi, const void *tb_ptr)
 {
-    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
+    MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
 #ifdef CONFIG_SOFTMMU
-    switch (mop) {
+    switch (mop & (MO_BSWAP | MO_SSIZE)) {
     case MO_UB:
         return helper_ret_ldub_mmu(env, taddr, oi, ra);
     case MO_SB:
@@ -326,10 +326,14 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     }
 #else
     void *haddr = g2h(env_cpu(env), taddr);
+    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
     uint64_t ret;
 
     set_helper_retaddr(ra);
-    switch (mop) {
+    if (taddr & a_mask) {
+        helper_unaligned_ld(env, taddr);
+    }
+    switch (mop & (MO_BSWAP | MO_SSIZE)) {
     case MO_UB:
         ret = ldub_p(haddr);
         break;
@@ -377,11 +381,11 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
 static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
                         MemOpIdx oi, const void *tb_ptr)
 {
-    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
+    MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
 #ifdef CONFIG_SOFTMMU
-    switch (mop) {
+    switch (mop & (MO_BSWAP | MO_SIZE)) {
     case MO_UB:
         helper_ret_stb_mmu(env, taddr, val, oi, ra);
         break;
@@ -408,9 +412,13 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     }
 #else
     void *haddr = g2h(env_cpu(env), taddr);
+    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
 
     set_helper_retaddr(ra);
-    switch (mop) {
+    if (taddr & a_mask) {
+        helper_unaligned_st(env, taddr);
+    }
+    switch (mop & (MO_BSWAP | MO_SIZE)) {
     case MO_UB:
         stb_p(haddr, val);
         break;
-- 
2.25.1


