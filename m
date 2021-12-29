Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C6A480EFA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:41:07 +0100 (CET)
Received: from localhost ([::1]:41416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Otm-0004Y9-Rl
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:41:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnS-0004Qh-UA
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:34 -0500
Received: from [2607:f8b0:4864:20::1031] (port=37589
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnR-0004fh-Aq
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so23229208pjj.2
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F575T9dO+4ZW9fmdR/aCWDdFX/Ryz6qGcvsU7gxpyus=;
 b=J2S4ZVKJg/H4zv9rtkD7q4vT9e7Ra/F2E2PUclIMif1RsFMkbDSU/oiVWWH/KLrRIe
 Wnjxs3PPjVB1maDbZqI0hyghwJ2NUtUzhpSl207G0kYF3ABvKSONQA8g67QeUxGg7ANg
 BtaEm9eI3xt9VJn6lwew1x3TTk+0P9XVm8uxPVj2GiQtzcTeK5ppLi7rSA0B4VG9t6t5
 7KGOPl27WNE15LcbaG1nfIcNAsqdx3IvC+UeySca9xO4bDQ+LXSEK9x2oKcG7EdEk0vm
 h/62bPMlJ48VWFN1sz3aFlr9zYShV4X3KwEDcU48T70MsyCk4+E/TWNzjHfmGRPGN0WR
 Q7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F575T9dO+4ZW9fmdR/aCWDdFX/Ryz6qGcvsU7gxpyus=;
 b=5XzRPejVHEGfK8ol55aIUaUthbHFK941kKR4GWqfpOevcr69u8XCXRuA9RSLgzA7yH
 unQ0oHegOXNy1Rt51VWpOWDmFvYwcRCtHjerXkKnuSAqekgm9iKiNXv+Dq8iG+lHaply
 VGjFM1yC+3bUBqd/UlryghCNzvFQGwjWPqY8OuYqAlXCltg5JZnuTQ85Yt23d6Sh5b/v
 7tfU8w9lr3O09BXi/bY/wXPgJbxpBGFU77wnH3jb47AuqtxP6zYPk8te6tmNLSrjDnqx
 ag1Go+Nd44GDcwfd2xVHzd3q+MNTlM/+qMRQJGHt6qID7JoqjP4DSba81G8oEcHN1WEX
 Z2Kw==
X-Gm-Message-State: AOAM531YMa5Hu8V6WowMK1mV/2pkQy3+usjncrLW0I2Bdp2RumLx1QDS
 wDd18UJ3nlrl6Q7VwcfUhKDIMehmiGzCHnpZ
X-Google-Smtp-Source: ABdhPJwe/9+R01wjhZE3CF62kE6WGLHTCtYkFft7v8Hs61+impyo75hg20M6hEA+abh43F5HGC/crA==
X-Received: by 2002:a17:90a:5b:: with SMTP id
 27mr29465918pjb.148.1640745271823; 
 Tue, 28 Dec 2021 18:34:31 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:31 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 12/17] target/riscv: rvv-1.0: Add Zve32f support for
 configuration insns
Date: Wed, 29 Dec 2021 10:33:39 +0800
Message-Id: <20211229023348.12606-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 230c475d6c..c6280c7b0b 100644
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


