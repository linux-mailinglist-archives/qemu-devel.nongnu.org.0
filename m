Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F80670CD8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:12:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6k-0003Q7-SC; Tue, 17 Jan 2023 18:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6b-0003Jt-OT
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:03 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6a-0001IT-2T
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:01 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b12so23194882pgj.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1eHDtP5R1nPjuMRuGqQtKv92UmnswK6x6In6/r9/IU=;
 b=EK1OQ2DsOmxc6YYzDsnqkGG2df8irUBLoZZ74XJ69el9I4NC6iLPEKZX6l3IdMiYAT
 7uBWIDym09cf2GDcFrvnTX2UJDxz1NgdZhuWsZnzSCmNLLH15cxcAJvEPBKm7wI/CBIP
 0jSGBCgujVAFrWxy6rJT6wFBJm/tME3yMOSAihM+7GCiuUS5OtBDSJySLOVFmEvK1Zre
 TTru3TLE9huLOWP+kj+B6a6qUmWdQtGXvvxIFrAaYmPV7H5MhIrK3lTdoD5z7genBrDM
 Z6b23e0+3vPw62dkAwYpvUKgYxdnn231h4i7XJ5VHDnAQKKLgM1FyyTRqcgeUQTI8R56
 ApJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1eHDtP5R1nPjuMRuGqQtKv92UmnswK6x6In6/r9/IU=;
 b=PIhA6CLo0m45JUTKmBlOCSDTJu27Gtdl1huoKV28ogy5nj8CgTGyI4ovr6ux7PCTj0
 xBGr+cWVb1Vk01mw3aD+CdQMRaWtH8KMtw7wpKa0DW/VAeTA04ukCi/0ZkPo9vfj6Rub
 A510L/TpEljyGezDe1POAlFLSm0k5ZLa+VAH723uV736ApnbXZ8tYo89p3S2+8w7cgVg
 1A7OPRRFnOmo6EFe+wgiPS2EW5L4sDWNcm6NDUJWxLkplg9eeSbTwwmNs7E03BxJTntd
 Z3RT5uO+5h/4cVMoJxrkGRqXb+CtTbaXWpnDDaoLOI8/a2F9vtErPn2v9Ga+xdWLa+hA
 F7Fw==
X-Gm-Message-State: AFqh2kopyZw0dUTpf/n+wTV9PNvCTzyvj5IWyBI8CE6N57x3yzcgg8oj
 qoA/Y6+3yOL33jEh4wRHlNqT+FesbIFsrv+g
X-Google-Smtp-Source: AMrXdXvqQv+rfZ1bIMiA9I61+G6kC+997/bVHUx8wMkm3iG38tbuy6ZK7LrjD2nfF4agMQMdHcYc1A==
X-Received: by 2002:aa7:880b:0:b0:58d:abd5:504a with SMTP id
 c11-20020aa7880b000000b0058dabd5504amr4569396pfo.31.1673997058459; 
 Tue, 17 Jan 2023 15:10:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:10:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 02/22] tcg/i386: Remove unused goto_tb code for indirect jump
Date: Tue, 17 Jan 2023 13:10:31 -1000
Message-Id: <20230117231051.354444-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index feb257db01..c4ff59e9ee 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2383,23 +2383,19 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* direct jump method */
-            int gap;
-            /* jump displacement must be aligned for atomic patching;
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
+        {
+            /*
+             * Jump displacement must be aligned for atomic patching;
              * see if we need to add extra nops before jump
              */
-            gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
+            int gap = QEMU_ALIGN_PTR_UP(s->code_ptr + 1, 4) - s->code_ptr;
             if (gap != 1) {
                 tcg_out_nopn(s, gap - 1);
             }
             tcg_out8(s, OPC_JMP_long); /* jmp im */
             s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
             tcg_out32(s, 0);
-        } else {
-            /* indirect jump method */
-            tcg_out_modrm_offset(s, OPC_GRP5, EXT5_JMPN_Ev, -1,
-                                 (intptr_t)(s->tb_jmp_target_addr + a0));
         }
         set_jmp_reset_offset(s, a0);
         break;
-- 
2.34.1


