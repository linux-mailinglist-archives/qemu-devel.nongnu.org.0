Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54BD480F01
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:47:18 +0100 (CET)
Received: from localhost ([::1]:55462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2Ozl-0005eF-NA
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:47:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnJ-0003vA-Ua
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:25 -0500
Received: from [2607:f8b0:4864:20::436] (port=39691
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OnI-0004eD-A4
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:25 -0500
Received: by mail-pf1-x436.google.com with SMTP id s15so17565173pfk.6
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SaewoL+pQeacrjgH2M0YD+Yq4KGUykd58jmJ9cpH35g=;
 b=XlrwDQZnSk8ECns/6XQixEsNCkxAg2t9NOEskYGiWk63eZ9JJf6cIoCYxO7r6qDmL5
 YCZ6AFSSnb0U4SLIAmjN26ZEXjCL6q36LpQPpzoQqNqiwMqfaroWuoZUePbtAn1/rpGD
 YjUNOdVmOzXbi4H/8HSAeBJPS3gdHJ2WVXLxabOcE0pa4pZ6dP74rP5Oi1synvqmy/Ve
 QDGciup4oeENSAcfItJvfuK2hOpsWjWOS4+2pGKt991i+rsjAGoyENs3Vksyvgmv1kmS
 saItF9FidGpye15lu0MqptJgRz6hYuyuQQPj4TWotKdW5XCK/b5jWYAA2frU59ZanhBA
 GwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SaewoL+pQeacrjgH2M0YD+Yq4KGUykd58jmJ9cpH35g=;
 b=jxeVIYwZevy3Te7N7E9300KNETuLnWgfWBwdntZQGFKpMUEhsyJ70vPLDT8yn2kiPa
 mJTK0bgYSpjYYz8lkuRMQvOXGK3YSLmDXkgMawZS7GVAD8qWFKryiHck0OkHqCcS3Zcs
 GDHx2RoVF3uoWl1nvlrt4M1NPdg+Xpsdb1iP8MAtff1cOWhEnQh+vcQMsYj9Tqhse8Fp
 nsgkga4LG1En7IHjnL+cP8rf89U/En+f5WlasDDqqAmuUMixhzlc0ae/lMcoq9bVFEHG
 xJ1845wlL02MHVdN8wiVma/yv0+ewE59ge/6N7FXfU/ahYEvS2ftnwUzc9RxVFXfD7ZB
 lLLQ==
X-Gm-Message-State: AOAM531HgtzgR0aGH5JmFWM5lhtI+ls/A+vVKOpD1AAzY98hg87cXgjS
 bgE+GpbzeSU7syav9MNqm+28qHb9sruVFpGz
X-Google-Smtp-Source: ABdhPJwI8KBpMtnOoWisg2cZUZ5JdNJMVSsvNOfZ/YLNnO1y3s3Qf/knMXYPtrfhQ9jjpsOUcdVBEg==
X-Received: by 2002:a63:b54d:: with SMTP id u13mr20504695pgo.62.1640745262744; 
 Tue, 28 Dec 2021 18:34:22 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 09/17] target/riscv: rvv-1.0: Add Zve64f support for narrowing
 type-convert insns
Date: Wed, 29 Dec 2021 10:33:36 +0800
Message-Id: <20211229023348.12606-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
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
supported integer EEWs for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9ca8d502b2..230c475d6c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2824,14 +2824,16 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
-           (s->sew != MO_64);
+           (s->sew != MO_64) &&
+           require_zve64f(s);
 }
 
 static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew != MO_8);
+           (s->sew != MO_8) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
@@ -2880,7 +2882,8 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
-           vext_check_sd(s, a->rd, a->rs2, a->vm);
+           vext_check_sd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
 
 #define GEN_OPXFV_NARROW_TRANS(NAME, HELPER, FRM)                  \
-- 
2.31.1


