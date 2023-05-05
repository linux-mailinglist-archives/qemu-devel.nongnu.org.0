Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C593A6F7A5C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:06:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujs5-0000RR-SX; Thu, 04 May 2023 21:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujs0-0000Au-Ad
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:25 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujry-00070g-Om
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:04:24 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1aaf2ede38fso11257525ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248661; x=1685840661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mEzcRbLfJm5D5Qt3BEMThpbyDkKnvKMH/BrAOrVTgag=;
 b=DLALL8JRvAnhQmG2L234aS2lLAJB9yv+1gq4+0dZGpzqFYJMKeIrc0p2rAvjDEhFgn
 Slyq43kQXAkNQuXWsCDT2qF+aQNr/MSg1K6/IAZrWJQnm764XOogokMKD+Hb538xB2bI
 ohHSrdU8nlW6AY6AFMXGDg3V3TaIe6O2TcePBWOKqaHB69g+mhm3TTHJHqIlH+pVlbNQ
 spse99Yv/2D54dictSKvNVb2OYx2GugOJ4vS+ct2yIP3j0oXI4v0FwsXi8dyd0rqfVhb
 G3PgP2pl9UvJYjLxNxxIMHOnj7YolKqIR7xbPwtC5sLg7seV5IL1iy1U1HUNkmFMnH3L
 lUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248661; x=1685840661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mEzcRbLfJm5D5Qt3BEMThpbyDkKnvKMH/BrAOrVTgag=;
 b=Jo9DMD+/Ph2CLJ4NBy7A/k1hQk0lTXVTB6xbH0zd0lApW27Yz6mXOH/m85l0CBcB+7
 1sJYVJ0U8X081OoUpq1NE0CP9TzCUywkrFbq6JyPNetsP4LKYrryDz6OL9iZugMPkkM2
 g0N+AfVkZHq1qkbK7am3ePgPDdkBwtmeCoPvXHkbQbw+tGlHsbgvBb6HlssuvnH/eEzp
 3T6Vtv4lSupNIxyoNcmD2jPV2ozgj85n0DdMVGwJLvzsMH37cHvBq8haKDMY49v2VNOV
 btQv9Y/IQ0WnO57vo+TN+kNaawkG+ezKZhJ5RS6kXTlfB5uE2f64Zz4iO2EzopIkA0y0
 VS1A==
X-Gm-Message-State: AC+VfDwNOQjcqwo6TJpyrZOsh+V5ex1BJ2Dkmp+GPd/ABTV57Ev9fIpA
 of+x2dBZTy33a1RaWI7//VbMneuvkl9JtA==
X-Google-Smtp-Source: ACHHUZ5+os7302pbUyGaZGC0YxnlSyzvGnKXazllmosAUGY0wRFcsvQQrRDQF2BVTSsKl3dmclLn6w==
X-Received: by 2002:a17:902:82c5:b0:1a9:826c:8f44 with SMTP id
 u5-20020a17090282c500b001a9826c8f44mr5959921plz.32.1683248661320; 
 Thu, 04 May 2023 18:04:21 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:04:20 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/89] target/riscv: Fix itrigger when icount is used
Date: Fri,  5 May 2023 11:01:31 +1000
Message-Id: <20230505010241.21812-20-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

When I boot a ubuntu image, QEMU output a "Bad icount read" message and exit.
The reason is that when execute helper_mret or helper_sret, it will
cause a call to icount_get_raw_locked (), which needs set can_do_io flag
on cpustate.

Thus we setting this flag when execute these two instructions.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230324064011.976-1-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_privileged.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 59501b2780..e3bee971c6 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -77,6 +77,9 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 #ifndef CONFIG_USER_ONLY
     if (has_ext(ctx, RVS)) {
         decode_save_opc(ctx);
+        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
         gen_helper_sret(cpu_pc, cpu_env);
         exit_tb(ctx); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
@@ -93,6 +96,9 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
     decode_save_opc(ctx);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     gen_helper_mret(cpu_pc, cpu_env);
     exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
-- 
2.40.0


