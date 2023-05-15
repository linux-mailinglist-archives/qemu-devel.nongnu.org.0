Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697C3702890
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:29:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUUn-0004pi-Oh; Mon, 15 May 2023 05:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUT-0004n4-Js; Mon, 15 May 2023 05:27:37 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUS-0002vN-5L; Mon, 15 May 2023 05:27:37 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-51b0f9d7d70so11484004a12.1; 
 Mon, 15 May 2023 02:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684142854; x=1686734854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDS8H8TgM41kNb4ppQTLDBtazoazirTT+YfL2ECPnfQ=;
 b=mV4BDDTbkbiQRaK3B+fG7N3NcxO5J+OIHeJPsEEMmk9WP7qQIai5QuzyDTztNMO7F3
 jFcq94A754tpzdxoDaQ9KUDMKCHbI/IsrSmrq+8rw3SACsh/yWDpIAL8jll53ZjZO1eH
 MVzqcU8JYqM2bcKFwUke0ejg70zTqTo8KDrfMhwr3JwrZLAQj0C2kwk33hERUXS2Aftw
 ByzYzBiwbZknALfqu01u3oxIdTJVh3vufxTE1VLlhLcZz1vBJvSRzl6lnk56lr0as5ZC
 b87D3vou7rcA7bK3L4ktQmGk/heb/zFlVL+u09dNR+ESf29J0FmiWgmOWZ9owMElWHio
 IwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142854; x=1686734854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDS8H8TgM41kNb4ppQTLDBtazoazirTT+YfL2ECPnfQ=;
 b=K6VREyzxPaJhX0fn4EWrCikk1dLNZF51gwrY/18L+8Cgr6oIl6veRXOdTniIrambpV
 Dx65jvysKd33Ni7H1x10I5bbsZO2VWJIvXH2EGcTSq6pZz7TNwpdO/nJEl0xGQvjKBOS
 +cIgexAGiufukyrohco7T/BcKQ2bEClwn8j+hQQL3/8zFCKYXJ1f845TiWJrMJFvy3Cg
 fq6AXRL3vDEPA0n9KuZRyvEr8wsoQ3/e8raiuWW6OvOX2V0t73XVCuc18Z7EQCDohTfy
 /ko4FZW5dsbL+jEmGMwztTNHqDNXGchJnp8JQTosxGkTxJD/rTLJVkxRRWQZOu1MxLhZ
 25QQ==
X-Gm-Message-State: AC+VfDwmEHUGgRXX2Cb1s0OJqUKF2AngM2OjfvDMt2z9J3Yaidu2eAtF
 Q65W7EdWqYDCOn+AIdks/3GZSIIy0ho=
X-Google-Smtp-Source: ACHHUZ5dHIiZnwbuQMy+PsFvBPopnqbEfAXfgWOcy9xEoSmdNAXNFEIfe8z1nqk4t413EpJXxJW7hQ==
X-Received: by 2002:a05:6a20:8f13:b0:101:2160:ff89 with SMTP id
 b19-20020a056a208f1300b001012160ff89mr29678783pzk.38.1684142853842; 
 Mon, 15 May 2023 02:27:33 -0700 (PDT)
Received: from wheely.local0.net ([202.168.30.146])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa79054000000b006466f0be263sm11387818pfo.73.2023.05.15.02.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:27:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 8/9] target/ppc: Add ISA v3.1 LEV indication in SRR1 for
 system call interrupts
Date: Mon, 15 May 2023 19:26:54 +1000
Message-Id: <20230515092655.171206-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515092655.171206-1-npiggin@gmail.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

System call interrupts in ISA v3.1 CPUs add a LEV indication in SRR1
that corresponds with the LEV field of the instruction that caused the
interrupt.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2: new patch.

 target/ppc/excp_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 529a4513a3..25f9fa9d3f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1559,6 +1559,10 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
             vhc->hypercall(cpu->vhyp, cpu);
             return;
         }
+        if (env->insns_flags2 & PPC2_ISA310) {
+            /* ISAv3.1 puts LEV into SRR1 */
+            msr |= lev << 20;
+        }
         if (lev == 1) {
             new_msr |= (target_ulong)MSR_HVB;
         }
-- 
2.40.1


