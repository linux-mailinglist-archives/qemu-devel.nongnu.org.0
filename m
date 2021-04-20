Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7963653B1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:03:24 +0200 (CEST)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYlLu-0000Gk-QC
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lYlJr-0007qT-Im
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:01:15 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.161]:13562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lYlJl-0003pn-SP
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:01:15 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618905661; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=cBEG5L7nh0pOj6g9s0MxPCLb4GS8/SCk3x3Kvbl/ZfmIFOUdKv8cqOrVYyQuLJ9VKl
 mYLwL5p5GAp6OEtoVrZFXxW2rLDrBhkrM3SemgCLBRBu7Jvdidhvzok7cNJHSMybEMHW
 WGReZMKiX7FliOF8JxPWf18WzHNvbmTFMcV5cdSyeKTeb/r9dY6vwt3vfPbtO1kQ5UKR
 t77sT9nQmtySLSHOlod33j7OCe23WqzQTpkKvsUgTS5du8dMNZ4XF2vEXsap00Q4ccuu
 rnx+ePJDH44qfG3hLfeOu65ViTLtD5rmUYgtazJBUi2OnZOARteq74o3BXb3xJyyC5VR
 s2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1618905661;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=7Sh55K/F7w1ZBzAodFu9LVtS5Id0WzEAGTFvmmpQOAg=;
 b=OwFYSjNIqvnNLJKDCu60POuI+yuUfsjppwxy7JPStJMIrTPlqhwsZTvmgn9PJ7w0EW
 yV+N2WLdfIrgMjp5aSSG1wFVhtvuFoEVzA8BcV3L6OnMM8oDyhm7ffEjxJZHhwRhJlJ5
 Dd7iewBJwr//1LOGMDif9+OfmhEQ/a2Y/+uxH3j9CHR++EMI9TRyB7iQQugS4dXRT7Lb
 z59AonIcLX1g9vq2tLpLZjzXgn7Mxk0iqQdqtuWGm9oynWwvAjlD5cvVEU2Y8qwvqqSO
 PeKboXQEhfNrz6Y5/BgLKcGzXH4eRxoSsOBaEncesxBlt69okcVdfIQLlU5Pnq+UDitK
 KUJA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":LWABbUGmf/p3d3fx281mbpk9zOkHG9L8L9MnY9md4b2JTjr0xj1uUQtYCbJnQWxZdfYU8aMV5SG09PnM3A=="
X-RZG-CLASS-ID: mo00
Received: from alwagner-T470s.aisec.fraunhofer.de
 by smtp.strato.de (RZmta 47.24.3 AUTH)
 with ESMTPSA id U051a9x3K810HfR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 20 Apr 2021 10:01:00 +0200 (CEST)
From: Alexander Wagner <alexander.wagner@ulal.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/riscv: Fix OT IBEX reset vector
Date: Tue, 20 Apr 2021 10:00:08 +0200
Message-Id: <20210420080008.119798-1-alexander.wagner@ulal.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=81.169.146.161;
 envelope-from=alexander.wagner@ulal.de; helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kbastian@mail.uni-paderborn.de, Alistair Francis <alistair.francis@wdc.com>,
 palmer@dabbelt.com, Alexander Wagner <alexander.wagner@ulal.de>,
 sagark@eecs.berkeley.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The IBEX documentation [1] specifies the reset vector to be "the most
significant 3 bytes of the boot address and the reset value (0x80) as
the least significant byte".

[1] https://github.com/lowRISC/ibex/blob/master/doc/03_reference/exception_interrupts.rst

Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index e168bffe69..ca4c1be6f6 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -120,7 +120,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8090, &error_abort);
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
 
     /* Boot ROM */
-- 
2.25.1


