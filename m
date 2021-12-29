Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F1D480F03
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:48:39 +0100 (CET)
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2P14-0007Vu-AL
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:48:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Onf-0005GH-OM
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:47 -0500
Received: from [2607:f8b0:4864:20::531] (port=33605
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2One-0004he-1E
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:47 -0500
Received: by mail-pg1-x531.google.com with SMTP id 7so4665881pgn.0
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jbLe1H2YPzqkbRWWQ+VDyla260n74cDi0uoHKqxIf+k=;
 b=Slkod0h518utOxYraByj7qZKRVYm2xGMUdmoPL3JS9yuRC8YVdzAMpbBtx53DwbDaO
 QnJor1rYuN9nU4t8UzBC18OXIihXZCKcqLXgNnbhh2FXbvGI4l6HKoqCdQpTYUt8lB8d
 vg5qq2W8Xqn01WYCO63EEfLM9T5BmrRS45m/2Ey1Ihv/XNb1Lq5Q2p2X2SZDqU5vWRj4
 ytRDANZ81z51PVwdtYSQSNXjB9dCG1WzALlDruebYlK/8ehmIHAsN/DKYZ0Zgr6V11GE
 1l5GS9L0eCstXEUv+ilrmz/bbay4ZUBsT3Ihg2EPokQ7fOj5UibQt6Y7TtnyyYkoNXmt
 N2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jbLe1H2YPzqkbRWWQ+VDyla260n74cDi0uoHKqxIf+k=;
 b=Fx6dTAY1fmgvJdwu2raUBEIJzIcxYE6GAaguZRj0khzD+fbN/sh2ITYmBBgjiV606m
 su21SH3H/9bl8cz1cRTLtsM5+WZZHHuXy3vU2BBCCIQCAa0nhXyzR+IEeDt1rnANqEjj
 aS3ZD32GxTJxnveo/IAVDg1TeYNXZ+tuJilmjFbC+sCohViFQD6pf5JwP75qdsG+n+HK
 o6cg1V49aaNWGjI0GuGqLue1pbz8so36dNmZmjMoPlCUov4XnarKyg9iNW5P+iHNCqVN
 v8TT3CeSq1QorUUMTVAr3+SoSFQwqgWn55Qs+ZejoRxGfeIILR5m9ALVd8AT7f4FAqyX
 s6sg==
X-Gm-Message-State: AOAM532aAIDryFITtwE8WVYkfkBIJ58xnXNcFaaLqJJadORJdtAF5IMU
 80XdG92oqpYXRY5ePLxgMyRuc42VFzhc7xSZ
X-Google-Smtp-Source: ABdhPJwxTBrSoON7JTgbjkdulCtAfIy5MaRegcgq7CtmCPSEjtCs2x5k864lDeA8eSEIeb38hvwWwA==
X-Received: by 2002:a63:7f58:: with SMTP id p24mr21873523pgn.109.1640745284647; 
 Tue, 28 Dec 2021 18:34:44 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 16/17] target/riscv: rvv-1.0: Add Zve32f support for narrowing
 type-convert insns
Date: Wed, 29 Dec 2021 10:33:43 +0800
Message-Id: <20211229023348.12606-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
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

Vector narrowing conversion instructions are provided to and from all
supported integer EEWs for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index da0e501f85..5214cf08db 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2860,6 +2860,7 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
            (s->sew != MO_64) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2868,6 +2869,7 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2918,6 +2920,7 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
            vext_check_sd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
-- 
2.31.1


