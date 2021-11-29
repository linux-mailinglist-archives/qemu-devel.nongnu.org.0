Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5F2460CF8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:08:09 +0100 (CET)
Received: from localhost ([::1]:56520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrX1U-00080k-1U
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:08:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxe-0000Wx-7s
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:04:11 -0500
Received: from [2607:f8b0:4864:20::62d] (port=35649
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxb-0008NM-RB
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:04:09 -0500
Received: by mail-pl1-x62d.google.com with SMTP id b13so11005088plg.2
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=75FqHO76p3wvGuD/DvwG2bgRfjy9Isc5XCefh375Zng=;
 b=NmCBxCKGGPCiNJRa1OSrtBOs2OGCQQCcRhvtS2Wa6Qx95boG+ZAmwJAhDy2RlNKyhY
 Tkx/Mj+dl5ohEtT8FSGiPWnCznX83SOqJZKajz3EnwcMbwTFyfSzsEhi72RQl55uJD/Q
 a5QQ/pnIRgChdKYLMQTwDZd8xdR4S6h3zGzeEt85Sjf3oR7IVX+oYVDlT6O9xJk1DKVC
 Mv8gU4LVfLWQKgsM0olvs5ptDBIhtPhKJ8Vxlm0yAKrsCvGd62TGYeOcGyxMpdCTr576
 pQcM1gqIo6aktdI7IauoMKlzKdGLVvD3QFvB4z+9uE/GDQ9VwW4QjvT7eqGTw5v5c79f
 VuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=75FqHO76p3wvGuD/DvwG2bgRfjy9Isc5XCefh375Zng=;
 b=HR8bmxeTn5yXRCWtlMDxkK3ezB1ZQd8GSxRtfJPI+aF6y//v1VhN7WdsGk1S2DoHqk
 EzV7/M6XMah9l/69ShffY71mdgnOj2b2H6ui9/etnHvShVjtfkRgeinXOyU2LqfdaaEn
 c8lLZx9WJKUnogTJoVbAU+HBsUkrz0URIywnPuCYgejQg52mMAh5f3FPWdMCSpsjMCTo
 jpnf4IyH77+jd7pbpg+ZCmWMWGeUmbUY1cGlVoF15xlqx/Rlbq9BbQC0LiRz1GcMpJ3R
 eInzehqpKDk8+8Z5ZvMKD82n9/pCmItPCTBc7otTnfaQF8dd15foayKMiGn0terMBSEt
 qc2A==
X-Gm-Message-State: AOAM531tbu54P/zpwjlKUdOChhjXSLslyiw1vkG/9WEIicpFeQmSQW/U
 DTzPDiDa4lsOPokV77V4QGM+jAv+VLVDvo5M
X-Google-Smtp-Source: ABdhPJyqkdyfEdFD4cvJk+YfRbmdz/770PbEOSDlBk3YyQ3WG8gkwgIQkKets4kU/TFpobhu6gSgVQ==
X-Received: by 2002:a17:90b:4a05:: with SMTP id
 kk5mr35282478pjb.232.1638155046473; 
 Sun, 28 Nov 2021 19:04:06 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:06 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 04/77] target/riscv: rvv-1.0: set mstatus.SD bit if
 mstatus.VS is dirty
Date: Mon, 29 Nov 2021 11:02:24 +0800
Message-Id: <20211129030340.429689-5-frank.chang@sifive.com>
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
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/csr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9b5bd5d7b49..bb500afdeb5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -502,6 +502,7 @@ static RISCVException read_mhartid(CPURISCVState *env, int csrno,
 static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
 {
     if ((status & MSTATUS_FS) == MSTATUS_FS ||
+        (status & MSTATUS_VS) == MSTATUS_VS ||
         (status & MSTATUS_XS) == MSTATUS_XS) {
         switch (xl) {
         case MXL_RV32:
-- 
2.25.1


