Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA5C69EA15
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:24:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUayg-0006TK-Ep; Tue, 21 Feb 2023 17:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pUayS-00063A-0D
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:19:00 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pUayP-0005pp-Ph
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f9GqEQZk6knnDg0dhlzqQgUFcqRnrbKBBCEaa0LeH1k=; b=DDuVTjmCEyrymEaKx9hnypfuCP
 6luKBLlTITt2sKaSvbuDCJ3rB1L/61b7zgrUFErb6CknUxK/jna4hl/NEIOaS1++KAE80hmecRQwg
 TBRzN7Nr1inlMszIMteO0hmD3pD6Cy2+gypBAtoplfiFiIdcigXTbfGiGOaaRVuwOAZQ=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH v2 25/27] target/avr: Replace `tb_pc()` with `tb->pc`
Date: Tue, 21 Feb 2023 23:18:16 +0100
Message-Id: <20230221221818.9382-26-anjo@rev.ng>
In-Reply-To: <20230221221818.9382-1-anjo@rev.ng>
References: <20230221221818.9382-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 target/avr/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index d0139804b9..a24c23c247 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -54,7 +54,8 @@ static void avr_cpu_synchronize_from_tb(CPUState *cs,
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
 
-    env->pc_w = tb_pc(tb) / 2; /* internally PC points to words */
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    env->pc_w = tb->pc / 2; /* internally PC points to words */
 }
 
 static void avr_restore_state_to_opc(CPUState *cs,
-- 
2.39.1


