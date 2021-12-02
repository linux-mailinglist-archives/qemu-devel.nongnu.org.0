Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31388466B49
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:58:42 +0100 (CET)
Received: from localhost ([::1]:34386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mstA9-0002NM-9J
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:58:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst7h-0005mm-5g
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:56:10 -0500
Received: from [2607:f8b0:4864:20::22d] (port=37650
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst7d-0006sT-Vn
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:56:08 -0500
Received: by mail-oi1-x22d.google.com with SMTP id bj13so1638983oib.4
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAL09uhbua6dPBItU2s08cVfqP4823JoWkfAH5hZ3a4=;
 b=S9QhlB1CghhM11YGlVaOzwbprn8BLLdssqHOcLq0xg4UFBrjM0Twgi+LfxZW4j6HZq
 HOOGZbgQcfTgB4zJddFZmrIcD65tBdRRtzgSZlbq+REZWQpHM6tqvTTuw/QA5HQ2wC1q
 g/ZKnex4n3IOkY9bqyy/4IXrRibgq4Jm+xw66y44AxMncJFVRuttkPPzh/4Dydgf2EFX
 VLYR6RuAV1O2G0X7R/yE3CXTAaP0w8g7bnRTBP5P67Kn/tGqYLX+6g1xURBCB0AnmN57
 hrrHytsIs9bA0dC4yNxKxiAZLpS2Gc2naY67YZluX8Gp9nTpItX++tzif0IpqmyL/mGg
 FfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAL09uhbua6dPBItU2s08cVfqP4823JoWkfAH5hZ3a4=;
 b=i//V6zLiio3R7dXrHHrDeSHYMaXNudaVw1yOsw13zPuJJnr7CesFvYM9H0UXnfbpfD
 aJ4KHB21dI7cALIU7aGGtOOTsNQlLEsQkVXBmrI+7xD2DL3SgHsusgkP4+dE1MSmT/6h
 x2eowD4bdkwZ+MdYPh2Xfih1hmg5/vIjMAvua6gg/+fgVwie+ewGa7K8iDtoIQiRH5df
 NLlYkZMvyjpKtV2RDHqLGRNfxnrHJI9wCDOGpN1uBBRbZF9WCdlf/1SFDv+OSsQrmc4Q
 hwlKpT7U5CDuh5+GHsnjCSoTJas9+lWpjAEABnnOU1176iJt9dxVtFSZZH1czoQSZ3hS
 GBaQ==
X-Gm-Message-State: AOAM532pE9Xg20MUaPFkhIrFQX095cEIXKbUq/EfUTPPAM/RTLcfXbYV
 DScm6Te7Rcgbg1mvjPrv6SOJ20ZE/9S6Lg==
X-Google-Smtp-Source: ABdhPJyhYsfQtXzxuxwwiG5iZZ2Kt8NNiDqhsEQY/vMBX5KHtCYzKn3aRG+TuocAgHrZMyVmWDkZqQ==
X-Received: by 2002:a17:90b:1c87:: with SMTP id
 oo7mr8411040pjb.159.1638478149391; 
 Thu, 02 Dec 2021 12:49:09 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] target/m68k: Implement FTRAPcc
Date: Thu,  2 Dec 2021 12:48:56 -0800
Message-Id: <20211202204900.50973-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index cfe292c929..641f95ff8a 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -5572,6 +5572,35 @@ DISAS_INSN(fscc)
     tcg_temp_free(tmp);
 }
 
+DISAS_INSN(ftrapcc)
+{
+    DisasCompare c;
+    uint16_t ext;
+    int cond;
+
+    ext = read_im16(env, s);
+    cond = ext & 0x3f;
+
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* ftrapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* ftrapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* ftrapcc (no operand) */
+        break;
+    default:
+        /* Illegal insn */
+        disas_undef(env, s, insn);
+        return;
+    }
+
+    gen_fcc_cond(&c, s, cond);
+    do_trapcc(s, &c);
+}
+
 #if defined(CONFIG_SOFTMMU)
 DISAS_INSN(frestore)
 {
@@ -6195,6 +6224,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(fbcc,      f280, ffc0, CF_FPU);
     INSN(fpu,       f200, ffc0, FPU);
     INSN(fscc,      f240, ffc0, FPU);
+    INSN(ftrapcc,   f278, fff8, FPU);
     INSN(fbcc,      f280, ff80, FPU);
 #if defined(CONFIG_SOFTMMU)
     INSN(frestore,  f340, ffc0, CF_FPU);
-- 
2.25.1


