Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AD831C3E1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:00:19 +0100 (CET)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBlui-00080g-Jk
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt7-0006OO-Vy
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:58:38 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:35233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt6-0007oc-9f
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:58:37 -0500
Received: by mail-io1-xd32.google.com with SMTP id y5so4446685ioc.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 13:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VflgyIvO6lAZNAekBnYTZDN9ESJWGJH5fDx0w3xyYWw=;
 b=IT8txeXsjlha/Vlekj8Y/bDiW+uUHTIowiUh78r9/QokmD4OOHc7jnYcgCKv5tdMpX
 f1LTdDuDw7eh88z9FTLLBoLd0Y+bVySnycPgmU95Q2VuJClDvA5R/r9amCYNYmWiRM94
 1IMJnMkm/BMGKBV1B/SU6p9NXh81VPH/Lk1TtT5QdT90CCSJGd933zqWNcY3KTykOVWl
 Zzq5PfdyUMFwVcn6XINKSejpzHzL7P96zNXT4g213bRAAy6O6S3k7nKeIFMKzyVbLhqd
 dt3S8BdagSavP1F3S0xC2+CFQrGYKd9YKP88t149/68uFqQ4oU7uCJlv7fuIQ8eO22vP
 zdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VflgyIvO6lAZNAekBnYTZDN9ESJWGJH5fDx0w3xyYWw=;
 b=r7ArZuAz7vlXyUAFbOTRcX3/fr1PLxTBFQ8gJG+oiP+C+qhbQutlk/0LqAyqbYvC9E
 bk2hFgj+yPFewDCKvwtF/B0yVCP3gQ/InT9GcgbH/6+EeAZP2SjLX7BzOYzWM7EDEoyL
 bN0ba4m5m37RF+ApfgFSrpUdhOFqIajRiCqpkurAyE7Zx6/1cX4ABiKi2NouJu6WqotP
 VaOHvZWtmQz5cqxJ3pvU5eIDoVDjMC+NRw2NJYKdO78fwcnNgt4pxdRWys4hGRk4TjeF
 07eMIITN+axIb+dB/C+1s0LwOwGV0dBUzubc+QkgVnKuF6ymtuMK9GT+C8MWKJH2csMO
 degA==
X-Gm-Message-State: AOAM533ORqW1pVLq9n9p/juWRQS81nitw0ApUek1PhtW97KTMKzsxL/4
 x2SF+zZUVVy+5TCyCkE2hxyOuQ==
X-Google-Smtp-Source: ABdhPJzMLSUz7slhEycWQ9quPPJPWdrO0DV4ypVHQwYxnO054r2sT/h3AxiK9gdYEQoM7D0QdrPITg==
X-Received: by 2002:a5e:c644:: with SMTP id s4mr3258552ioo.132.1613426315277; 
 Mon, 15 Feb 2021 13:58:35 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id j12sm9812254ila.75.2021.02.15.13.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 13:58:34 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/3] target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
Date: Mon, 15 Feb 2021 14:58:18 -0700
Message-Id: <20210215215819.1142-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210215215819.1142-1-rebecca@nuviainc.com>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set ID_AA64PFR1_EL1.SSBS to 2 and ID_PFR2.SSBS to 1.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c255f1bcc393..f0a9e968c9c1 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -674,6 +674,7 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
         /*
          * Begin with full support for MTE. This will be downgraded to MTE=0
          * during realize if the board provides no tag memory, much like
@@ -723,6 +724,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_PFR0, DIT, 1);
         cpu->isar.id_pfr0 = u;
 
+        u = cpu->isar.id_pfr2;
+        u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
+        cpu->isar.id_pfr2 = u;
+
         u = cpu->isar.id_mmfr3;
         u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
         cpu->isar.id_mmfr3 = u;
-- 
2.26.2


