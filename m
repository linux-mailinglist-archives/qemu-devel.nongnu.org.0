Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD714EC14F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 11:37:34 +0100 (CET)
Received: from localhost ([::1]:37460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQUJB-0002r3-NU
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 06:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45563)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1iQUEl-0001DU-O7
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:33:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luc.michel@greensocs.com>) id 1iQUEk-0007nT-LI
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:32:59 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:58506)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <luc.michel@greensocs.com>)
 id 1iQUEf-0007bh-2M; Fri, 01 Nov 2019 06:32:53 -0400
Received: from michell-laptop.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id 731C296EF0;
 Fri,  1 Nov 2019 10:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1572604370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TWIoQbCMNr59K0TvAGIYJ3dpVbpC7CHYlShLKKuNPZs=;
 b=oEbRZSg1ZRLuJviItjq8A7+wbbDuqDEvORTGYIiJGxfHrZ7ifTzP7sxHMOiH60j+pYHI+8
 Xo70hFTNfyonk0ETs9gQGKldEDoX6UQuEcLGYKKIVuNwL9F3IPzaLI5cSNl7ptNKvHL2s2
 MktBeE+yUHf9jBZbHuNk6hNikrs+bJw=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>
Subject: [PATCH] hw/arm/pxa2xx: rebuild hflags cache when modifying CPU state
Date: Fri,  1 Nov 2019 11:32:32 +0100
Message-Id: <20191101103232.3692818-1-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1572604370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TWIoQbCMNr59K0TvAGIYJ3dpVbpC7CHYlShLKKuNPZs=;
 b=ch8pjICrYsTi/1X36dJg3vJ4gnhdmsRav/9mP3g2L3zW0TL4ne3jgFhsTJhQ8c5bnOMYzR
 lNHfEwWwV5KTSssR9/wM2nPGUngR4kZ2/Z+FEilzSRSEkba1e+WwsL9RprFJnj0u2Xu25o
 RXRZVWgVzOun0Cgb0TpZ+7MNhQknuxQ=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1572604370; a=rsa-sha256; cv=none;
 b=jsoyk9T35zu9YoQ9qpp7O0UaxzUNesHZ+X3PfFXEyViVa3euSPhrappgXaaDTO7iGo5gKE
 4yjaM4jank9UDKUAW13F2aU74AES8R315JpC78dGeYBWSnnKlQa+p3WXjRsW6Y8cOl7DG0
 w9eZ7nJKE5ETVREFwTa5/YHlraX1Mh4=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This machine modifies the CPU state when simulating suspend mode. This
commit adds a missing call to arm_rebuild_hflags after those
modifications.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
I came over this missing hflags rebuild while reviewing Edgar's similar
fix in hw/arm/boot.c. I could not find any other place where it would be
missing but I may be wrong.
---
 hw/arm/pxa2xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index cdafde2f76..7982ffbfbe 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -306,6 +306,8 @@ static void pxa2xx_pwrmode_write(CPUARMState *env, co=
nst ARMCPRegInfo *ri,
         cpu_physical_memory_write(8, &buffer, 4);
 #endif
=20
+        arm_rebuild_hflags(s->cpu->env);
+
         /* Suspend */
         cpu_interrupt(current_cpu, CPU_INTERRUPT_HALT);
=20
--=20
2.23.0


