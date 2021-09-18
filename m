Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA19141033F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 05:29:02 +0200 (CEST)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRR2D-0003HF-N7
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 23:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRR0K-0001G7-Pb; Fri, 17 Sep 2021 23:27:04 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRR0J-0001Cs-97; Fri, 17 Sep 2021 23:27:04 -0400
Received: by mail-ed1-x531.google.com with SMTP id v22so32849025edd.11;
 Fri, 17 Sep 2021 20:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9UGvQgNDOux1KcVFOnFWj9ZR0ax4TNbaNOeIAarsFHA=;
 b=Uuk7890+0WIvm6Naleazoxyp7EsPx9uXn1TYyski4/PRDU3f7nRSVi9QK0e6wR88Kf
 FL9LOvJvdUTa/vtjkMr/8T695FXzeXq/GYsi33IPJxo0CSAae2Zsg21SghT9MZCfx2hh
 R6ujPqoWDcufpCr1IMdjg0AsvE9cqYNRxJlBG1wYlxOILVIR2EXLBnV+Jfoe9shfIJUQ
 u5PWDe6Aoz8nq7721g7o/ZMC0yknCJaGCTB0S2EGEf1RHxXvKvG+tURXiOoa61EwaSze
 TRybLCRgD7OfLBbz7Mv2OGGlloas67iCyKQgRwrfvt65EebUJlkz0uhV8LC+J9YMqMMO
 JMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9UGvQgNDOux1KcVFOnFWj9ZR0ax4TNbaNOeIAarsFHA=;
 b=gkovu9ncARGYzKUCTpIh8KZRuqbURwKF8f894SzFbUlP+7vRYdyVe065G3YQVGOqkg
 SMZJhgTVZtjs1RiwDEzYAgQUnZrK6CoSm2lzKaLMXHG1fDSFFp9ApWx3RSxlJbvDXo0x
 QlKimSHaCPNdsZGjg5ebaoYR4tnax0d8QlCtZJqOAmV2hKwkYXZxskMX/w/C6lP6hdGk
 hp/u4QM18IQnLIF7xDF+6VczZDRooqk0yiCZcLKUgjgKPc8PoiPosJnPD61SIEqA/ptc
 +8PsWv0ZwKe7L3PbhfuSdLXRvX666sto73aqhCMzPuQkEJm6JqiTHmpI/zHoEdv0OzWK
 1qRQ==
X-Gm-Message-State: AOAM53184VDxLIM/V52uNpZjNgqjFgoWSkqCc/Dh+qnq68SVoRTfALda
 GQ4fd7MmXvj0Z0Ud4tuQ2hk=
X-Google-Smtp-Source: ABdhPJybk5KGMfbqstBrnKGsIJuZBoth7t0oVKnsQVGQjfGAaSVBvyreMPy7tgqajEElQH47lX5mKg==
X-Received: by 2002:a17:906:31d7:: with SMTP id
 f23mr15243683ejf.190.1631935621119; 
 Fri, 17 Sep 2021 20:27:01 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id k4sm3439693edq.92.2021.09.17.20.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 20:27:00 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: [RESEND PATCH 1/3] hw/intc: openpic: Correct the reset value of IPIDR
 for FSL chipset
Date: Sat, 18 Sep 2021 11:26:51 +0800
Message-Id: <20210918032653.646370-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The reset value of IPIDR should be zero for Freescale chipset, per
the following 2 manuals I checked:

- P2020RM (https://www.nxp.com/webapp/Download?colCode=P2020RM)
- P4080RM (https://www.nxp.com/webapp/Download?colCode=P4080RM)

Currently it is set to 1, which leaves the IPI enabled on core 0
after power-on reset. Such may cause unexpected interrupt to be
delivered to core 0 if the IPI is triggered from core 0 to other
cores later.

Fixes: ffd5e9fe0276 ("openpic: Reset IRQ source private members")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/584
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/intc/openpic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 9b4c17854d..2790c6710a 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -1276,6 +1276,15 @@ static void openpic_reset(DeviceState *d)
             break;
         }
 
+        /* Mask all IPI interrupts for Freescale OpenPIC */
+        if ((opp->model == OPENPIC_MODEL_FSL_MPIC_20) ||
+            (opp->model == OPENPIC_MODEL_FSL_MPIC_42)) {
+            if (i >= opp->irq_ipi0 && i < opp->irq_tim0) {
+                write_IRQreg_idr(opp, i, 0);
+                continue;
+            }
+        }
+
         write_IRQreg_idr(opp, i, opp->idr_reset);
     }
     /* Initialise IRQ destinations */
-- 
2.25.1


