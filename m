Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A9A37232B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:47:10 +0200 (CEST)
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhLJ-0004vY-6H
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrA-0006lr-2i
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:00 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgr8-0000Lb-9f
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080158; x=1651616158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4cB81cuCi7CF61xWNyzUpBRYweYXQ5ONP/FYfOtczs8=;
 b=JVZCzCxO9NE467FkCuYt8GW8OmpJXx8TqnRQ0yDui0vuEMKizHW4+AEf
 K8kI8JRVVZ396jVZh8F/s98QFt+DIlpbXuh8ybJ1exEaxAhap4HjLIaKI
 3H2hPZBIcdGYxTYZMD8HowIVp30Xocv/Ch122bDXOh7BrIELCwtkC3tk7
 EjD+xK6rjNoe93r/cqex3JIhmaj/uATfrEC/Mc5NwJ7smuubQZUlJC4++
 cudlWw9Gy3l/6OnRkX4xGle9lr8ejpSrKoaItzyp/IUNAPBLsTAgbZQmh
 ylT3lrhe2M8hP2Q60SjAH6yrUppnsz5z1uWj0LneV05S8680SKmA+Ybqm g==;
IronPort-SDR: 74tHSHQTZoq+W0vDun0wR3nCuRBy/ALfL4acufsmovhvk4uGoiDxWZVv6yJR+76zhOa7HU8n93
 NEvXgi1kygJ6rdN71AEmXkFcK0vVphW4bMuy0wo42cTvCOVD9gwuxHr0elKz9qGTnBkmr8lOcb
 1GIvEZWcVJKPn3aAQ73driJEXKFc2+AulSDiKbZ+6ReywIPilHg6QkDg9+BvS77rptAOVB41ef
 Rt8rErusD6MK0OkcLzIRSHp+4lA201EnXxR9zhNktUPAkTGdugr6N3bHXh2Bmp0VF/BmLP5PH9
 p8g=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114691"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:19 +0800
IronPort-SDR: qrbLmROfeD55eFTepWEA38n7WHMzery2gBpLysjCLtw1SgHBgcD2uIntasCA1w98oXUMU25+mk
 A2Mm3y1ffzjM5IsYIF4orCcZ5rTTHAYVP1Z2Kl+ozbQjJFx4C14vy+E6r7Hx3jTisBTyMb7USe
 fMBwX6zTADIWebbPbuGi8r8hRdoEIPt5TTBvve9qpx0kYmYVrKUg0dcBt6wuiXcS8qALULQyZ0
 bWnPwnVNZMztHrLdvA7wZoLsMf6Kcn4WGpC7uWtAFsNIG+8//dOm4ghdqYR+UbzE76IfNZ3m2l
 S8nYFCyfYRWLL4wFFLY51W0m
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:30 -0700
IronPort-SDR: hCwYAs7t/5LcLG2jbw9EPANJnAHgPe5fehf6aWh96lSDaZpXIqsLQPtB8jkLPwJDF5e4KNjVM6
 hZdAybw1j/gDjoMgeP/VPaprab3jCPeIte4JQ67L7704KUqzHw9F965FuSrEM6hgSVkdPbL4yZ
 r7lTp7qugDy1aPyTPfmMH8qvhYhR7T4yE8/u27PjfZ0eMbZUQH2eU02hP7J+urTLj+h4SH4+0/
 lrIA1XQv2CKLzOHpcrcw89VVgE1vk1NITdspM1ATtyJEhyM1py8idxOtWXfjusNOv3a5sCmgr4
 0yg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:17 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 30/42] hw/riscv: Fix OT IBEX reset vector
Date: Tue,  4 May 2021 08:13:15 +1000
Message-Id: <20210503221327.3068768-31-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Alexander Wagner <alexander.wagner@ulal.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Wagner <alexander.wagner@ulal.de>

The IBEX documentation [1] specifies the reset vector to be "the most
significant 3 bytes of the boot address and the reset value (0x80) as
the least significant byte".

[1] https://github.com/lowRISC/ibex/blob/master/doc/03_reference/exception_interrupts.rst

Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210420080008.119798-1-alexander.wagner@ulal.de
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 30dca1ee91..ddc36fc8eb 100644
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
2.31.1


