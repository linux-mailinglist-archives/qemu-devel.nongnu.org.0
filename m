Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7ED460D24
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:18:49 +0100 (CET)
Received: from localhost ([::1]:34918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXBo-0006Tn-KV
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:18:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzP-0004Am-8C
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:05:59 -0500
Received: from [2607:f8b0:4864:20::42b] (port=36429
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzN-0000RU-E4
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:05:58 -0500
Received: by mail-pf1-x42b.google.com with SMTP id n26so15323326pff.3
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RkcJRBFfgWRMLE0q4h8ibzmlGf09nN5PtQGtP90osKY=;
 b=cH8u+Ex0NUFC0GSt0/5keHiODHvNrUaSVtNNBVmCFPvquYsrO+EvDXdgun++tbGFUO
 UePixlzFsLCq8cnQ8PTMJ01ALnh50/qVGF6weWniC0ba6yZ3ruSDMDmEjO8sKM+EpdT/
 m72O0nva34rGz8tOCiqBCWjzOrVk4bDIgwlPnkNlr/do+/D37Jn/DS5jp6kocpT6Zj1v
 FV/AUvjjJlg/+wOHI4Jh3TAGYbpvKrUGA16s5mWQk5Qu3YI1w2MMj+eAApisXr6hW4/8
 RX3G2huktYwirmRvkdfep0ECtxOTSetQjkwWQwdfcIhYyN6SnjGmwg7jkISZpSY9N3Y7
 hM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RkcJRBFfgWRMLE0q4h8ibzmlGf09nN5PtQGtP90osKY=;
 b=5mGOXXUMAkxMftU5se2Y2CNFXMfniOiynFo+BqjpjK+UV5Fw5qtblo3fQvqIsKaNXd
 uASHnLkqmzbJ0tug4q17wG14Q/oa1vCRcPZN0T/vvSAeMbB1GFgdDcNPAXaiaQcq/ob2
 gGy2H040KwlppXVFef4/FgRijgBmM5sDDGkw94CzLkrErHSvJYQoYaJ14lTaE4/HWhrx
 e3LAg+UywS/fCvvKLvGTdUZdOf3J/r/CZGxcvgn8DUpFVeBvvUT40sKkF9xR6yo3FcAP
 htviW9KtPYGDRFpi0Wr7v5FN3ubn/x0HTsjkOxmTr9UqbmOe2ZIblSAoHrDoB4d+ftDa
 go7A==
X-Gm-Message-State: AOAM5302KGVbvQNo/IPAnGwZeQo7o1X2yB308Cx74REdY4ifi2P2SVIG
 6HKRgJVg7mElI7L21SkcV008l7cWRpTB3Dcm
X-Google-Smtp-Source: ABdhPJxOwRMXFsGLTsad31Js+/1RZcXT5E4bMWlcigl+TKZoTchsyvr9d2MXLNgkG0dEoZBTJ9c2mQ==
X-Received: by 2002:a63:f24:: with SMTP id e36mr32955130pgl.4.1638155155986;
 Sun, 28 Nov 2021 19:05:55 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:05:55 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 27/77] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Mon, 29 Nov 2021 11:02:47 +0800
Message-Id: <20211129030340.429689-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
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


