Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD83460DD4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:48:59 +0100 (CET)
Received: from localhost ([::1]:56414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXf0-0003m4-J0
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:48:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX55-00011H-Ao
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:11:51 -0500
Received: from [2607:f8b0:4864:20::22a] (port=39703
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX52-0001Hy-LW
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:11:50 -0500
Received: by mail-oi1-x22a.google.com with SMTP id bf8so31952002oib.6
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3TlB4v4OvGuye+bayybDFINi789G9gn0hTUvZHgOfM=;
 b=gYIRTwRi/kUo+KGKro9STEp7ItJ/7Q1nyfIxEjTgEH4CL78M0D3hKrtTMrrZ74SdUP
 C0p/pz4xU7Nk4JPgut+ceLAjJCLF7DsfsVmeVtVrcKQleLw/MbbqGJet1aWukZVCXMIS
 2mNWL+vv5b4yskx41OfOmHPvmKKDNTI+thLc8RzYRnn88/Pf8fAcJHDJQ3HjtOnQjgHd
 45RQYn2Vddt2FNxMw/UEhmt6mmaYCBKgKlfxwiwC4zbsU7LpH1nnULsroTkTaHjCTE30
 33ZHz+QRk9295LbhGtwwmOj5MVNIN4zYjsAvWl5ZieW1bJR6A6eIQS7vP+pd3H+qN6pv
 KGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3TlB4v4OvGuye+bayybDFINi789G9gn0hTUvZHgOfM=;
 b=YLVcJWkzktj1VP5Iu6TLbL4E3EIveZWoJPXhdFznmfYV+4puZg1HnBYuJ4yg0uWM6O
 8q4O+pwUKN8peMT5jT+5yrgEvhaCh6Xh4J4iS2+2PSnNXoMtfeaUIGK+9HzxjD8N2lfk
 Oc3mG78MT0BqCq4GzQo4qWVSBGnQ0jS4+H0OOMNi/hZ1BGZwGixfYqhHOuMCMxz+RHmv
 b2io5u+GLVZ+4ge+905H5aiVU6NBU7cw5UNGwbav4hco5c2/qnPeV6TFn1BnjP4YESHt
 wuAPANGPdnvvsNT+tWUxzQp7oXqKEcIj1SZxP3FFfE6jwq1MZroqydC+8HIGinwArPw6
 U14w==
X-Gm-Message-State: AOAM531DP56s18pobJ1EiS2zkU6SOvImxi+PQI9idRXCWMauZsAjDXh4
 gQ6KvHdiIyyJr98EEZ3kahPadpxU+ycOhs/X
X-Google-Smtp-Source: ABdhPJxLKEa2IeDTplhP+h7pPsFB+TLMt3fDwiI6nGCM3pbM6JKIxNP5Co9zVVud7AnYgrAqshfvZQ==
X-Received: by 2002:a17:90a:e7d1:: with SMTP id
 kb17mr35201555pjb.124.1638155038232; 
 Sun, 28 Nov 2021 19:03:58 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:03:57 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 02/77] target/riscv: Use FIELD_EX32() to extract wd field
Date: Mon, 29 Nov 2021 11:02:22 +0800
Message-Id: <20211129030340.429689-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=frank.chang@sifive.com; helo=mail-oi1-x22a.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12c31aa4b4d..70f589813ed 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
 
 static uint32_t vext_wd(uint32_t desc)
 {
-    return (simd_data(desc) >> 11) & 0x1;
+    return FIELD_EX32(simd_data(desc), VDATA, WD);
 }
 
 /*
-- 
2.25.1


