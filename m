Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63B9316904
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:22:51 +0100 (CET)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qOJ-0004dy-0r
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9qMQ-0003MO-H0; Wed, 10 Feb 2021 09:20:54 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9qMO-00062l-Vf; Wed, 10 Feb 2021 09:20:54 -0500
Received: by mail-lf1-x12a.google.com with SMTP id b2so3180556lfq.0;
 Wed, 10 Feb 2021 06:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7C/hYG2Rk4mY2vY/Ar9H3SW4klvYcMKioCdiMbjqCPY=;
 b=T/PMVb1LIHgUkonT3jn7EUiJCbhSAnjKnqv1uifFNF7fPLTFx+l5naHGnn4mraP/13
 cLbzoFIT8eLpam3amobcOeUOL/CbWDE7iw0P0zVsyaAZncQtUW1B807l8/ln1W3rGU51
 TPcGysLsTFvrOuqjkt0QGMW3AS8U5R9EnpssA1Epgs4MV6/4YBlXRUc+VM5DrW6VPoNn
 c55YSfXlsYxBo537DmaJrERPMMl9CWEDm3uhHJF4d3Cf4bGLXpqmcAkrSn4/s2Og1ggO
 N4PV5RlSRaa15ObntuC8S3WNUphM5t0S59J8++1L6tIFETYj5V/A8B9VaSREJG8ojcBB
 Wpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7C/hYG2Rk4mY2vY/Ar9H3SW4klvYcMKioCdiMbjqCPY=;
 b=AYHIvvDbiUo7qix5FXCAjs9gkDQcZRczVEVDyc7ohfPT5+EzGEPl5uvCNZ4Ho77yWe
 wRCZfMhmO3kg1PQ2KJKJvVh9qR+lDNHA9APT2zwPI0rjYAG+ca/SioAlZ7EVukoWweFW
 J+HfVD2vfQAMbZbzysgsy6W/bjgzo7HwZTnALW7+RLVaAjis/AfTyjXqrT4vbPdgcN7u
 w57eTQfeRYhbdx1RqWYavkxp6C/sZJpXicouibyuPZzkpSsI1o0wS8obOHhdXVQ/uxQX
 hfU+P8Q8GBwnNK7ml6cRrSBQLvODNoQ5fNjkYlB4GhX4bJ0mS4lycyF+da0ikgTTB6a6
 kxTA==
X-Gm-Message-State: AOAM530wUWI3ENXqLE1O+P5xi63mREfCTT4eXQuW+y4lbmWu7GCh5rs+
 kAa5XhxFwZDrD31PqDxVD87TSSZslaUSaw==
X-Google-Smtp-Source: ABdhPJw/MMKTJQKSloGAUH0h+RULz6fr0XNENJ8VkR7sE1uoCzxb5CDqhg2Dra0m3NbaNwnvKPBvBg==
X-Received: by 2002:a19:ac49:: with SMTP id r9mr1954470lfc.602.1612966850820; 
 Wed, 10 Feb 2021 06:20:50 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id p5sm357267lfc.300.2021.02.10.06.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 06:20:50 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] hw/arm: versal: Use nr_apu_cpus in favor of hard
 coding 2
Date: Wed, 10 Feb 2021 15:20:48 +0100
Message-Id: <20210210142048.3125878-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210142048.3125878-1-edgar.iglesias@gmail.com>
References: <20210210142048.3125878-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12a.google.com
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 komlodi@xilinx.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use nr_apu_cpus in favor of hard coding 2.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index b0777166e8..628e77ef66 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -67,10 +67,10 @@ static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
     gicbusdev = SYS_BUS_DEVICE(&s->fpd.apu.gic);
     gicdev = DEVICE(&s->fpd.apu.gic);
     qdev_prop_set_uint32(gicdev, "revision", 3);
-    qdev_prop_set_uint32(gicdev, "num-cpu", 2);
+    qdev_prop_set_uint32(gicdev, "num-cpu", nr_apu_cpus);
     qdev_prop_set_uint32(gicdev, "num-irq", XLNX_VERSAL_NR_IRQS + 32);
     qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
-    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", 2);
+    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", nr_apu_cpus);
     qdev_prop_set_bit(gicdev, "has-security-extensions", true);
 
     sysbus_realize(SYS_BUS_DEVICE(&s->fpd.apu.gic), &error_fatal);
-- 
2.25.1


