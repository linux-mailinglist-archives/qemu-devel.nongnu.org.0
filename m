Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8D84913D4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 02:57:13 +0100 (CET)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9dkG-000552-D8
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 20:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9das-0000wr-3n
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:47:32 -0500
Received: from [2607:f8b0:4864:20::42e] (port=39649
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9daV-0007eM-NK
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:47:29 -0500
Received: by mail-pf1-x42e.google.com with SMTP id f144so10941278pfa.6
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CiQ7qpUpeUPn7kb7WI+XOp9OTAKSfxy1iCOYUAh4jxI=;
 b=WY2ryExIfzybyeoeTMWtp2sDudgvouRRsJBnMG0tbrTZytJrrwX8tXLJqtIOUxGShX
 MWpnzZ3h1vrRq3aPwpbdwUjQv98aP9D+JUgPQQiq5Mm6vsyzHRPGTPFcDPLelQBnfxYx
 TH2lBqPKz65cLUEqnSUkz+MbtJzb66XqqDh3DSzBL2TbmqCWP8x9UeCh9wP09yxwKtic
 3i9WZAD9+hE+jW2mEiHMCfSgaVrgNN4jZjzAv6+Rzq6G3h/z7AgD/awPGc+RQmfkCO15
 ztJf+SaEaqYI2hKoBBYWIAVgfQw1UKCrsXrxzUVsGSJ8Zx8j0RdRcqDD65n299noNdOv
 evFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CiQ7qpUpeUPn7kb7WI+XOp9OTAKSfxy1iCOYUAh4jxI=;
 b=ku+/6cR+ra1u1J2R4UwiCz16SF+X8je7J/E4I/Dsb/GKs9iPQjRbQC6IG/F0pagdlK
 iNJSqfvFMX3xqQ7s2LUJKSge3Na1Dbs9rg0mpK6PrvGra6tDrLW3JNyCwxXwOU5E+LP8
 VCxJiDpoSAgaDJxQjQMrSLfcPr3miNoh8xVndEGZqVjauQ4PZXH7XkNc7Ukaf8I1En9f
 Q4rZh3SszsvT95p/myOQknvM7g4gG6BRIvQiddv2Hu0QA3Ep7Wh8gutvyFl8eRK2RJEm
 +pjBVIL2Nd9/ys/9uQqOKo6AzjgAMUxI2kP/42t2oLLSybt2sxmig3N1cj4PfKgyxp8s
 B6dg==
X-Gm-Message-State: AOAM5331NPjpFavvOlsAz9DIPjipmJopZK4ljyeh86r5CcUu5YRIkA33
 qkWMBQ7jyTUgfUvjNBczs56KmdTiGS4MpcvB
X-Google-Smtp-Source: ABdhPJyNa88I+B29WL2w7/JFckta+AUliQ3RiMh3DAo4P0lnTGDLjhYCHtqWKFBKzw33V9uKcCSUbA==
X-Received: by 2002:a63:2205:: with SMTP id i5mr1637767pgi.365.1642470380944; 
 Mon, 17 Jan 2022 17:46:20 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:20 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/17] target/riscv: rvv-1.0: Add Zve32f support for
 narrowing type-convert insns
Date: Tue, 18 Jan 2022 09:45:19 +0800
Message-Id: <20220118014522.13613-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
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

Vector narrowing conversion instructions are provided to and from all
supported integer EEWs for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f2d3c9e8b9..7a040b3089 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2862,6 +2862,7 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
            (s->sew != MO_64) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
 
@@ -2870,6 +2871,7 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
            (s->sew != MO_8) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
@@ -2920,6 +2922,7 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
            vext_check_sd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
 
-- 
2.31.1


