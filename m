Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4D14913EE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:12:53 +0100 (CET)
Received: from localhost ([::1]:49500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9dzO-0007vg-U5
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:12:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZa-0000Sm-GV
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:46:10 -0500
Received: from [2607:f8b0:4864:20::42f] (port=35656
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZY-0007ZZ-Ua
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:46:10 -0500
Received: by mail-pf1-x42f.google.com with SMTP id r5so4585000pfl.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TpvWmX/+OZ6m4HTw/QopOPjllyccvrx++a+Fyq9yx6o=;
 b=mvhXhLXY2CNRkhkENKhI0Vo8pUlP0iEL1qSt7E5NTmbtUOQExqk+2pxUMBMJ7SamcP
 H7Ae0OpnsB3Nl8+5vNEnVayDVkR6JMGpSl3qbJBB98KxpP1L8V6ah7D2Y4Yl99Zm5ZaP
 HoK6Eu8eGVbERTdJzhzWIeMUnMJmHHUcjNPeDecoFd5zdP6LNbSWEtXbaXGSmFhFmkPX
 WYhtt9TKj8oOpcFrJPg5kxc0dKG3QKaLRJngEZX6RpGGEU/NP0JUSil9f0RKcinmkGbb
 eb/4/JJaYgc31bgbybfgdM1nanVDrcbw/MJadlR9VITXgm7sduWnXePqFPQEuvmij/Ik
 CTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TpvWmX/+OZ6m4HTw/QopOPjllyccvrx++a+Fyq9yx6o=;
 b=6i9bHbX7UtkEIk7yzhZ7TjruaAUXEwIBel7K314mTKfqEGozy8F5/7z4Q1l0UWlZck
 IUGHPopf0t/mcABkuQ3fn/0fOZ3JRCzGgLFxA2hlqEFv++aIVLDVSIBkcg3gXT6AVcgE
 fN6LY1JJZ2RhOsrpLRFNCdpDZH5mL4oLjsJCdWHDLfYIhZ1hoOg8lhulb8jSawH3iA91
 wxHDHsNv6qvaH4kPViF8L9SNRsxsOd3G0VkPT54d++gAgG9btd0+w/u1uT4KQHu9JarJ
 D8CSKuQxL6cWuJ/myG+t0JoRDUPFgF2pjp0FuuzN85GhiuKZkolPb+WCPVjeZdRbjHdx
 z89A==
X-Gm-Message-State: AOAM531CbQHF+Ac72YAazm/PsNQWGXhKURb/FSrIZYE0GOyee+T6n1J0
 vCJzWbzK4nfmlGivbrAEG2mqtEvXha+FQ3Qu
X-Google-Smtp-Source: ABdhPJyuO9nBhedk4HQsvrfTN+HydfgqGMyOCahmGxWllpQ0HcsnALEKmVJIsAPIRTHW7MnYNqwAnQ==
X-Received: by 2002:aa7:888e:0:b0:4c4:3ad:9eee with SMTP id
 z14-20020aa7888e000000b004c403ad9eeemr8747540pfe.13.1642470367488; 
 Mon, 17 Jan 2022 17:46:07 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:07 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/17] target/riscv: rvv-1.0: Add Zve32f support for
 configuration insns
Date: Tue, 18 Jan 2022 09:45:15 +0800
Message-Id: <20220118014522.13613-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42f.google.com
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

All Zve* extensions support the vector configuration instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9fa3862620..fd6e74c232 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -152,7 +152,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
     TCGv s1, dst;
 
     if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->ext_zve64f)) {
+        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
         return false;
     }
 
@@ -188,7 +188,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
     TCGv dst;
 
     if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->ext_zve64f)) {
+        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
         return false;
     }
 
-- 
2.31.1


