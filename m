Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBC133327B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 01:32:36 +0100 (CET)
Received: from localhost ([::1]:58032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmmB-0002nT-CQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 19:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmjC-0000VC-Az
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 19:29:31 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:34906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmj9-0001Is-Hn
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 19:29:30 -0500
Received: by mail-il1-x12f.google.com with SMTP id h18so13938282ils.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 16:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MtrYd2+kxak4VR0FTDOw2marOmVpM5v4db/Bahi46Lk=;
 b=TxsM5xMYm4zV/19duA2bA2Ow9hoMsbDBuZdcnbhlAd3cs0X7IwXTlnNW34Rw9aXafs
 omeeNRN40pV+wNVfdJO7aSbjjBrdS+jnCtBQCaaBYyAA7PTXtwsh+cIqSL8WCnMJ2eki
 3xzsYbBLUb5kPaj9ntyyr6mIc/2L++mrkHkXfYt3s1sQai8JuIKcvP5RlYeWO0SIH/gy
 lDdEJWd+6izdTjIuGxWNG61FyoMQA+baXph9s+Yii/PLfjGaimYH1R7hbt+YTmpWFJmA
 jg65ifQcf4Hhw33gWLIogvSlj61Ruj8gv8EuBJc7I9MhgQw1Dhn3iCdXQvYT4PqB6Ca2
 yC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MtrYd2+kxak4VR0FTDOw2marOmVpM5v4db/Bahi46Lk=;
 b=q5HQxlzd73iYoO+YJBgrbDNVuKNADZnbupuHnTcav/Eb6DGRh+nn2YZP/xeXiaxvE0
 jNwulOTB2jnOOoA+fBc4nJfjwueqpw9Nxv1PI8K3WRQZ8ho62ytgkwsac/Gire4fF3/Y
 RavQ2BDnNNlC1Sq222+HgKNjJi+wjtn9b78Yi5iZzVvUgoiFF+kf4HFk2qu4jOpEkr3n
 xe93GiVXK9Pq9fYuetTCUkIxZLSWJYneGI3yIPQqtBEMVXOFw3mfyvhuuGRTUcBTgkBa
 4TCN1D/lkrYNoBQ38H9jPlPtauw8zJ7cXXF0D58Ncp9CVvWfFqkMtiZullSdXY6h74Gy
 +A3w==
X-Gm-Message-State: AOAM5330Bc4xRA+gZgLd/FJbZQoz0l92Weom9YhTOfalbFFz0rC/z1JJ
 5RqwQdRhFgi4WvConXvZC/bJCg==
X-Google-Smtp-Source: ABdhPJwmeaAuf6O551PO3TFxIpk/8i447GzdJf6NjoADAcL2vVG8KB7qcr9d9bv6IPQLPSdwQph/hg==
X-Received: by 2002:a05:6e02:12e3:: with SMTP id
 l3mr714513iln.24.1615336165181; 
 Tue, 09 Mar 2021 16:29:25 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id h23sm8048808ila.15.2021.03.09.16.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 16:29:24 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v3 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Tue,  9 Mar 2021 17:29:17 -0700
Message-Id: <20210310002917.8876-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310002917.8876-1-rebecca@nuviainc.com>
References: <20210310002917.8876-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x12f.google.com
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

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..e34a6a6174fe 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2


