Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BBD460D4C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:32:34 +0100 (CET)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXP7-0007OP-Qq
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:32:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1e-00023s-GF
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:08:19 -0500
Received: from [2607:f8b0:4864:20::62d] (port=33479
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX1c-0000k2-Nc
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:08:18 -0500
Received: by mail-pl1-x62d.google.com with SMTP id y7so11029884plp.0
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHSoKgnP3T2hrrnes3culunWEOlYvAFk2n+yt2jlwtA=;
 b=Mtqbj9p6jEGHmH3KcCNsuu3I8E1/K6onFqFUoSvKWl5yNxa9notnZHr5pv3q7oUpMC
 BrXl8CIjn3xZuhepkgV7ralx8vZ+6QzTzbtSDdgST9ye6gElNkwkI1xywBR6A5R1rJZR
 DNQdTDfLuW3w9PZzAjqQeFcA/PpbkwUhl7Ezy3h1K7HWJHCriQjg6kOxXlTKstU05CvO
 67dTzQFZkPID8w4DSLzj29I93fkbb6LET6k6LANi3Ml9bhJIRYgczJN/2kFFZw7E7oxo
 1HJHc28guG/zyxzJeRqQaXNjNnMm55NH5RnuIJyYeIqvzWz6XTEgwTjLiQZhBHwb+doY
 cDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sHSoKgnP3T2hrrnes3culunWEOlYvAFk2n+yt2jlwtA=;
 b=Y4xyzT6+PiW0zPKUBQ9rUfkc7Gxxy9DyRUvQMGHvDUPECjTGwhaQlkwTwfkpsW/76V
 PAZG5XHL8WTkDj6jjMgjMWrB/rgFIhQQOZE3EeIg/BfOLj/GjyQASFIFnF2Mi/sfDyfB
 qL8x5AmPZJ4PVl+G9mWnKOKwshxwiRqO/UlGS8qk9xqjJiVM1cv9A8mNkcO16ihStjpF
 eAEOShl17zwzlnrIBRFKs/QUHCUngbhNrVOBtUs1/rnels1E7XI1M1kfoEMp6xOtWGbm
 +2vTn8lpDiYGk8BhtzqoiY9f/7hCyCfSxgIRghdp8+xKx42Di7i2XJ1JnjWwwGfTZ4sj
 at3w==
X-Gm-Message-State: AOAM5304DKOXkHQcSVpbOr0OEN0zeklUsUUcd7RrLams1X8lleIvKr4y
 0f/iH2KgPL4pSoiMEScbDvVIe+NR8CPFZDrx
X-Google-Smtp-Source: ABdhPJzXLupIVh10tJscvh9oUR6hg+D6sTbDC6iN1zPnqgs4UEo0zVSdykodT9seYT4dzj2E+LiDeQ==
X-Received: by 2002:a17:90a:6bc2:: with SMTP id
 w60mr35236923pjj.88.1638155295459; 
 Sun, 28 Nov 2021 19:08:15 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:15 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 55/77] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Mon, 29 Nov 2021 11:03:15 +0800
Message-Id: <20211129030340.429689-56-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

log(SEW) truncate vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index b43234ed3ff..03716ad7066 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2030,8 +2030,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_TRUNC_SEW, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_TRUNC_SEW, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.25.1


