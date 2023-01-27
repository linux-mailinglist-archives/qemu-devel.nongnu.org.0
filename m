Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D825667EF9B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 21:37:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLVSG-0007lA-Fq; Fri, 27 Jan 2023 15:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pLUEg-0000Ru-GK
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 14:18:06 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pLUEe-0003Qk-Hh
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 14:18:06 -0500
Received: by mail-pl1-x636.google.com with SMTP id k18so5995690pll.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 11:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jKhtk5rxl5pbRoYF48eqgFTbbHBid5hhGXVt7A76ZuQ=;
 b=wWDF3wH2lRlUNDfL31XNRJubXFLFTBIA6G9pbwph5HDfvrb0v/rjirMzU2fSes36Te
 6yWp6D6t/fdNDibC2pWdHEJcI2gaJGx04it7MGZJx3ECpvtWI1E0+Hp9mh4sGNK/5IlD
 y0OKQvQmtXHx3Nyso4a+CmjrFcLqm5KwICzz11tEI3Dd3Hvyxzhuq0EMYea8tgttIbfq
 K8Mg1M/HjCCFd7PQGW59thRerWPIiBWZwpTHc8pvlzI+hH4sSDh7LyG4lTKhaQYDJIXr
 BA6wirLKgX128OaY1Cach4lIiP5cbsrSvRo2+5I5S+FGt75LR8XeHP0aDz3SA5gD9+iA
 yVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jKhtk5rxl5pbRoYF48eqgFTbbHBid5hhGXVt7A76ZuQ=;
 b=rRZ8YMultsth6/boMkGidzZPS+d0zDt0I15b2CUBROBvPdxM/tTlcjldjduZx0iVK2
 kU8XepZtXR+0EJbOiFpYKJszBg41JAINqmfs6mydKyFE3eJYxpGWFtTt+gJQb3UdDUIh
 +b5kDlVD0OdARCBh/SNyn9u1OsNvfLahE3O11S48rwIO3L11JQuoVTsfEfCN/muuTF3k
 Idj53AjVEEPZSlFv8wJXikjsbX6VaSpJ3cC3tTszA2DwvhUwowJn927n8/n4EKfmdemz
 RBYKoGCDbsuKYVG1SSBHYlEr3bwCPUJwobD7BTzutOb+WnTqppe4zk46qWFZWXe+1naV
 peag==
X-Gm-Message-State: AO0yUKU/B7t9B39068REqvH1TcPQxTAFsdGERtapMESdCrkjBQk6HpaA
 OOiSSmnDe1U3Ye5KuFJm/nDVOzipLd4fV1ihr3A=
X-Google-Smtp-Source: AK7set9yNRXsltA8qo988ramLfgHzev+mzmI7+Iwt59hUoigxQ2jx5/VsPXJpKQClKcrXCtFORubmw==
X-Received: by 2002:a17:90b:3852:b0:22c:5360:684e with SMTP id
 nl18-20020a17090b385200b0022c5360684emr2519743pjb.29.1674847081785; 
 Fri, 27 Jan 2023 11:18:01 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r93-20020a17090a43e600b0022c01ab2899sm3030088pjg.49.2023.01.27.11.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 11:18:01 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH: fix for virt instr exception] target/riscv: fix for virtual
 instr exception
Date: Fri, 27 Jan 2023 11:17:58 -0800
Message-Id: <20230127191758.755844-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Jan 2023 15:36:10 -0500
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

commit fb3f3730e4 added mechanism to generate virtual instruction
exception during instruction decode when virt is enabled.

However in some situations, illegal instruction exception can be raised
due to state of CPU. One such situation is implementing branch tracking.
[1] An indirect branch if doesn't land on a landing pad instruction, then
cpu must raise an illegal instruction exception.
Implementation would raise such expcetion due to missing landing pad inst
and not due to decode. Thus DisasContext must have `virt_inst_excp`
initialized to false during DisasContxt initialization for TB.

[1] - https://github.com/riscv/riscv-cfi

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 target/riscv/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index df38db7553..76f61a39d3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1167,6 +1167,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
+    ctx->virt_inst_excp = false;
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.25.1


