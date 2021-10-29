Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C143FA00
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:36:34 +0200 (CEST)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOJN-0005OK-Da
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlG-0005wp-AL
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:19 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNlC-0005w3-Bf
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:17 -0400
Received: by mail-pf1-x432.google.com with SMTP id p20so3403918pfo.12
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RkcJRBFfgWRMLE0q4h8ibzmlGf09nN5PtQGtP90osKY=;
 b=JkJyl0h73b8+Hs2MigF7wWQT8qFskY3RcdssvVksn+4jttFs76oiBTsHPnA16HTnNG
 oF+/dG9lLHe2mWteBJQoXPz/3VcUUuptVYhnP07LKshK4iKyxCr8aoF1y7B79JJeE9Fo
 xEVg9FjxqgPBnQB9Hkzbb7Zu57KnCNAxm7Bccjq/NjLkrhz1Y17rjimY6VKhkiVxSj9z
 mI+4W+33t2SILW+yaW9Z4q2CMQFXSIq97FTcu5vq2R0wYXoDgTO5nfbShsz0GHX9bg7P
 iYCJkTCig35xfwD9GhM2TxHNpxJgXr+N+Q3l1G/hpD5O209PIsI5QKaE3OC6tsyL/1E4
 upDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RkcJRBFfgWRMLE0q4h8ibzmlGf09nN5PtQGtP90osKY=;
 b=dh3/NXqHj5GERHC2eXTaHEEuyELRQGMG0xrHgHAYnF5OHtTCApJdjFvIi6GSEdq7oR
 0z04hfUpxD3cMYa/WccIVONXQlT37Qd/OHd+6B+XHI/gb/WAEjsQBoM6B3OLOzjcV56q
 BIZSBQjqJqLJwJfQ4hs28AYAI37iBIcJP5U7e1Cphd0IYNoc9wmCRF9w5uDINM9wkrE4
 +AGdiSPq/+2H2BMgczNShO/OHg0LTR4bVcOk7fyec+4DVLJs5kXymTfNQx0opV61WAIt
 EP6es8/DLtwh4yrGZul6mzeFiWzfd5f0o8pV1kqcFivyz4MXshOT1qdul0SdRQBbsze1
 0kdA==
X-Gm-Message-State: AOAM532mHHETR9O6Pa2iK2yw0MuRPNilHsgbjmkvnfqV06WRXpA/KB32
 DytnXjowAjgosqDYZ2rwvmYbPS2SlsAvNsC2
X-Google-Smtp-Source: ABdhPJzE33YLy/xa5JyQ+Db8gZHB5qWwWHLnFNASPUPfGtmqjAcGEUdvB9GLx1sWbDy6VyAG+gVvqA==
X-Received: by 2002:a05:6a00:a23:b0:43d:e856:a3d4 with SMTP id
 p35-20020a056a000a2300b0043de856a3d4mr9715115pfh.17.1635498072806; 
 Fri, 29 Oct 2021 02:01:12 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:12 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 27/76] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Fri, 29 Oct 2021 16:58:32 +0800
Message-Id: <20211029085922.255197-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7d8441d1f21..92a0e6fe51e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -563,7 +563,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
-- 
2.25.1


