Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C157480EF7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:40:02 +0100 (CET)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Osj-0002x4-Kc
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:40:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Omw-0002me-LS
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:03 -0500
Received: from [2607:f8b0:4864:20::1030] (port=53115
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Omv-0004ZF-3B
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:02 -0500
Received: by mail-pj1-x1030.google.com with SMTP id co15so17335709pjb.2
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qaVaNth+UNNyKKt08kGpoylZGoBah63Av7+61N/IayU=;
 b=lWVwlYEw5HRZQYlv1817KmX7iCT7vVxJwPvTPedQuROCmBE1QeP5lj7Nn7TrfiNm1/
 fvqldqLgRapX4e5GSaS+SoDkVh/RJhzI2Nr8ysPNvgVgSSJvV4+Eh6saCBqSMQ1ICer3
 LuGT5MW6JNLIwqRWFMsuGaQjwbKoK9/PvUubticj6nkrhveNhu/q/BCRbDHFu1f96fWr
 oFDEGz1l0qfgaL5JRKPpVdzrCLyILI4jUrZu8kh1d55Ezwc0uPgFDmEh7olihEKi96zM
 /CJBkDR4wfBmdVP8ChnMfnvrfMLQsojpxXIAeCPJIbKvhr4f5Co9BXOKQCsb0UUWc1Dt
 vgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qaVaNth+UNNyKKt08kGpoylZGoBah63Av7+61N/IayU=;
 b=gvn+TGnA+OMyIAGCQinaWQ6SngclD/V5vsvrT3AR0ljJ8825S2mBEgQA3urlV7TKvx
 VU8Vmf/q7uPo70sFCXkjmwDCcrn0EpVx1wBJW8bhfCGgE4fcD9oLnL01G6Il3E/fJ449
 XtQysC0cszdq0xAZZdlxRzxyc4qVcHHJ28BA0CU4rOsLFyzsNVHax1uIdifavJABIlD4
 sT/1uKsxTw5FoOXDapl4epdBi6b9/ru6SC+OvL5RnwLqlgURxlJoefIgXPHuzxcMajH8
 xv+RKlYhGugEYo951k1Hu2sjVfimwfAPV/NtRCGgZ/1WoLq2xt8ZBFfsfxfL3JXS30ve
 h5Vg==
X-Gm-Message-State: AOAM530x3L10OId2/9TllXCFA25fHrn/2+MnJNFS4o4EvDyAhkAFXpAO
 seBnK1zqxJZSayTu/o6KmrITIC/F6EoQRORa
X-Google-Smtp-Source: ABdhPJwwm1PapsekaqyoXS8fFgj8SP9TK1fV/Qc8+xJEc8SvckTzwu61R7US/Sp4YQf+bstQ9CH6ZA==
X-Received: by 2002:a17:902:c443:b0:148:f689:d924 with SMTP id
 m3-20020a170902c44300b00148f689d924mr24491062plm.78.1640745239597; 
 Tue, 28 Dec 2021 18:33:59 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:33:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 02/17] target/riscv: rvv-1.0: Add Zve64f support for
 configuration insns
Date: Wed, 29 Dec 2021 10:33:29 +0800
Message-Id: <20211229023348.12606-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support the vector configuration instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6c285c958b..5b47729a21 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -129,7 +129,8 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
 {
     TCGv s1, dst;
 
-    if (!require_rvv(s) || !has_ext(s, RVV)) {
+    if (!require_rvv(s) ||
+        !(has_ext(s, RVV) || s->ext_zve64f)) {
         return false;
     }
 
@@ -164,7 +165,8 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
 {
     TCGv dst;
 
-    if (!require_rvv(s) || !has_ext(s, RVV)) {
+    if (!require_rvv(s) ||
+        !(has_ext(s, RVV) || s->ext_zve64f)) {
         return false;
     }
 
-- 
2.31.1


