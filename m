Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E682842ECDD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:53:07 +0200 (CEST)
Received: from localhost ([::1]:37918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIxe-0006F1-VA
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzp-0005Jr-IA
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:51:17 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzl-0005ez-JR
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:51:16 -0400
Received: by mail-pg1-x531.google.com with SMTP id j190so1126074pgd.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VjyYcsniSCp0BkuCNDks3Qx0Q6WotnnL36LWygdTzRg=;
 b=CMsLPcD/xmddBLmhSQTMWPIYVBlgmoEZZwQrsqlE4QtK2o9azo15ZEjOUbiozy2kSZ
 Ystqfpyu83hK/Zszi6EA+/Inu54fwWen1rj9ai/EMo5YzoXL9uwjT5TX9C42zuJPwLY6
 cFfl/lnpBi9PnAkJV7bwV4UDqmq//RI3KM+2Y5pGVTOEvMJwRY4FmLOdNgC901gBtFhX
 wlM4S9iwb2qijIjkQiYrm+X2rMd/JvinMG1CVKglCkCfnR5YlcBdXAo5FHaCPtROWXvI
 BQtETJVvqDFrBTug7Y9CYGH/cGmrW0/awCCAJ1Df/+mkR+qZduTbz7fSgb6RpJn9N4qc
 9s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VjyYcsniSCp0BkuCNDks3Qx0Q6WotnnL36LWygdTzRg=;
 b=23Omn4m3c7qI6yhR1CQWv+mY+fvaAmPx07rCB0iAr0bBXlDbwp9GMlUXTKLBTppIRa
 yFkO6sl4DlBtWKpyPCORCc58vGEiB8Vv7Y1v4lFAcgpei3ip9vMwGskcjawcvZn1C+zQ
 EEokyr/VXdx9517JdA9/tnLF+4Vja9DkVnqnrEv5b9ZCoqkLa92vmNNx7+DRFFqKm5Sq
 +/uOzRVmr1skH/zMRpdU/uGxw9IVR/FFIBSdlcomIkySX4vviUMtXgjf7S4fWeBQvHkW
 IBfNjpxgKIjcDMJzO+ND9elTtHXTCMNsWQdgshm7/aRa5FgiZeuauSIF7v7+j3rf9YJt
 Jp/A==
X-Gm-Message-State: AOAM5307RWt0VVs0r3uC+evOexqIIIV+dbxecUgm+I+W3QNRxbfYb0XS
 wGsu/NaBQL6EH1Nr4/3Cjqo3JsJuiNzjNYz4
X-Google-Smtp-Source: ABdhPJwKBWqT40c1fdaDzclGqExNiBH2q0NMUHVqmOYQLai/W4z5I2YbZ8fdmPSBi5YjH+LSemRanQ==
X-Received: by 2002:a05:6a00:1791:b0:44c:d660:d8f with SMTP id
 s17-20020a056a00179100b0044cd6600d8fmr10272261pfg.9.1634284271599; 
 Fri, 15 Oct 2021 00:51:11 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:51:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 73/78] target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
Date: Fri, 15 Oct 2021 15:46:21 +0800
Message-Id: <20211015074627.3957162-81-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Rename r2_zimm to r2_zimm11 for the upcoming vsetivli instruction.
vsetivli has 10-bits of zimm but vsetvli has 11-bits of zimm.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 952768f8ded..d7c6bc9af26 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -78,7 +78,7 @@
 @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=0 %rs2 %rs1 %rd
-@r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
 
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -671,7 +671,7 @@ vsext_vf2       010010 . ..... 00111 010 ..... 1010111 @r2_vm
 vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
 
-vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
+vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
 # *** RV32 Zba Standard Extension ***
-- 
2.25.1


