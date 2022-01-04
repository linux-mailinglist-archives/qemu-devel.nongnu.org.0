Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9080F483A93
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:24:45 +0100 (CET)
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZVE-0006Ml-N9
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:24:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMc-0002ke-NQ
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:50 -0500
Received: from [2607:f8b0:4864:20::102c] (port=55914
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMb-0008AI-6V
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:50 -0500
Received: by mail-pj1-x102c.google.com with SMTP id iy13so30130277pjb.5
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 18:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g06UIpFMVvSvANx+Qg+u743yK9fN9ISDaQhh0blxyhQ=;
 b=RayTa0ycU6LGpG5heatUGzR4CuZLKoUWs2ksQLp7YH7/q34wC7BooM048P624IGXS2
 /yP5MuX3T6uJHmn+b6su923vWmYpBvo4KXlIP5+PtN2PB+2B8LS9EJ/9I/k3LhDeIuvg
 vEbGCUBIlzisQhs2D+YNB0yN4jBhFd4++QL/BOB248fWW7xCxYUKvuCpcRlTYukEbUfi
 oFxV4sShlG7bI8GpbChEJsPKxCb2uOLGFcCpa4Ds0UTuLxKia/59KOphyhffla4OMI1q
 bVcnSPxyMu5H2MX4k1HpOyFOBXnh2xrpqML4W4JtaRCCu0xSBaq8UvredsOcPSevliXm
 XeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g06UIpFMVvSvANx+Qg+u743yK9fN9ISDaQhh0blxyhQ=;
 b=uDWHhWDg5Rw0V/UcmHh0y02A11nSBAK0p/KXmtZ12VcySxmP5IocJHr39cBCZA5xpO
 U9JnH1uy4TgR9YVuiW+IEaBBwdEnll2sWc8pWgy8l8PKsZBEUbr6hXU15hcPMa4nL88K
 OmxCEUllLyrBhiIWYHQ5gn5uHPocwEM8r2YGBTe8df89nWldtDNGw+U+c6vzDxYbgYxW
 468JhLO0/gH6X9IbFy/rsw2PQudL5K6R0rEkiaG+8znBhdmdnzzRigbcpDks8Puanbly
 5ugC+8fZqi2uOnfCSkqbV4gOHxLBZ6R4U8XLFrwFVw+e0Y2ahTUMDeIXAhXx8s4A3iSh
 /BhA==
X-Gm-Message-State: AOAM5302qRHsoQTWEdLLX/EqI54T53mmGufS8FnWHboGmR2LEoNVPp9o
 SORe0oRgdU2OxbRzUioYWc0+Tn/B0Lbrfw==
X-Google-Smtp-Source: ABdhPJzASGCfhZ9Fp+03WBhtM2o2DO9m7o/1s0m7dtpwLRnNDb7SZquMiSdULONkDzbdHpWX8eTMjQ==
X-Received: by 2002:a17:90a:cc1:: with SMTP id
 1mr20280370pjt.124.1641262547919; 
 Mon, 03 Jan 2022 18:15:47 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b4sm37395501pjm.17.2022.01.03.18.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 18:15:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] tcg/tci: Support raising sigbus for user-only
Date: Mon,  3 Jan 2022 18:15:42 -0800
Message-Id: <20220104021543.396571-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104021543.396571-1-richard.henderson@linaro.org>
References: <20220104021543.396571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, peter.maydell@linaro.org
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


