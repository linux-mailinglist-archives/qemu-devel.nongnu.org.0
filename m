Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D70C46FD03
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:51:39 +0100 (CET)
Received: from localhost ([::1]:52388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbcw-0001s0-Jg
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:51:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoP-0006Pn-6k
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:28 -0500
Received: from [2607:f8b0:4864:20::529] (port=33378
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoN-0006xp-Fl
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:24 -0500
Received: by mail-pg1-x529.google.com with SMTP id f125so7447269pgc.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U8W/YJuhSDwrsD4NJSt8qyd2a4JKkszrSU/dKj2pXE8=;
 b=QzhGGKOtUs+B63cC8G+sfmo3j1OCLzPs3s2Iyv8vY10J8AYMJC6qGTgU2e43+eJ3oY
 mqEf1zIfInG98ieJLytx+JD/QDVsuNEr1NgUlisVy+VSJju6tcH+PFQxr2UoW373lQmr
 TxHjAoxCS3jUH2nW3sSImeiVfPqPZEo2svVz/GhfRCAPc9C7HYSczO5DmaLBoaTtfljf
 OavY2vhnU9eB2qXia/f4QhxD0SP00hkfYg37cgRw+4crR7CrM1RsmffR84XpO13zpE3D
 glcsdC+UEKH+c8p0ZTWVS2rZEH7GN2U0si7JpyhK6yqDayXzS5mhuTWDbZabwZmoeGZP
 K62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8W/YJuhSDwrsD4NJSt8qyd2a4JKkszrSU/dKj2pXE8=;
 b=Vp+Z+XKrGLUngg5Zy98a1haYD59x84C4hsi+ivTRYL+p+MPKL+4YgSWGV6iQyALKmh
 9tL/jQ1Sbpf7+aiwPnkiab2wmG91NEiDtljwuGgbQg+Y4j4KpzQrZbD024l89qWU8sB5
 Fqisq9xEC8kogEBlsSDZY9NWJzA8GmMFaEmKzDTQJ/f7WRvEwl4EUTEc8kpjgab19I7X
 ieykrY0dZtwFvUQ4tyut1GPdeT7O/ZEsjtQ1MKlzGXjfDK1l0WQe+7t89Vx2uAf9Hm6x
 I2Xzel3kLj6raOmlwqgyCAMTlLEoeJ35ZU/0x+5IBWXbLjhSC/KvbxtnDn8DINFQV2F5
 LvUw==
X-Gm-Message-State: AOAM531QKe2xOGf15E1N0i5STBShnmgYMd/RmWeTEO0qKxJUTOENcrri
 3RGM8X+cgEqaYFyfL2yz8UrqC4v2LI/RyQLO
X-Google-Smtp-Source: ABdhPJwlJBQjF83nQx0T55Hubr5Q0HMlNN2wDNQF9gaLt34e4fQQzOf7fkfraOpEnxT/+KIsDGogow==
X-Received: by 2002:a05:6a00:1343:b0:4ad:99ae:d4b3 with SMTP id
 k3-20020a056a00134300b004ad99aed4b3mr16584750pfu.64.1639123161918; 
 Thu, 09 Dec 2021 23:59:21 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:21 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 42/77] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Fri, 10 Dec 2021 15:56:28 +0800
Message-Id: <20211210075704.23951-43-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0076ce5a0a..4894212913 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1685,9 +1685,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_TRUNC_SEW, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
-- 
2.31.1


