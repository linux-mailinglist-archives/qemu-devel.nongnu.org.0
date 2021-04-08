Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888B35790D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 02:27:44 +0200 (CEST)
Received: from localhost ([::1]:59468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUIWN-0002Tx-IJ
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 20:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIQ0-0005Hb-36
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 20:21:08 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:35607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIPp-0002eQ-RT
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 20:21:07 -0400
Received: by mail-il1-x141.google.com with SMTP id c3so297700ils.2
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 17:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=T8F2BdCg9Xwz9klXJ1oZB/EAyOBoP6h8WFUg2AK40+MoKYlYCSNpYPvPzsJTVNUJRX
 G6Uc/DT0T9L+iH+bA0FHmsHYop8NnqOqVIfjPq5qU1TaJz1ztndoPBjrDIoSPA4hlYkq
 1E8csSufo+DGxISqXyxJXbC0wZ94bXO9wPHf+SYCYhI3pJ7Jpf6m3bMgUay02X4DP15z
 IvkpnQgcu1ix629Jzazh9xSpypiA7mtgHqjBtHjQrItjs8qkNRrI50kqMaOjpWG4X8+a
 T83DvSscClF9es8Ikuw0rVglOC+c6wjac7Sghttubs6LkCuk05w/b35gWv8L/er+7svM
 /zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=Jl3UWkNr48wcMGA1tmCLK8njllXLNyumLsXN7dllriMUArW8UfN6A77VMn/gLmd0kb
 9aNIc2KKFCQtI5+6US1nSSrHPs07wzYjH+vIwQDzUeB+3VdtW46sxZJPmdcbRPM4xy71
 Ea8QVxPdjF7FYno89yV2omlmbOaC+ASFcS/8DXXR5Vvg0zPeV42kpM3ypt3PCwg0yAax
 p4bwHcdaW7VClazbQ/LNEcm3i2kzIMhfadoE/sb+HzGHjdlECTjTKUvLTwmv5I1pNWja
 8+DaLYXiwF+11Nqr56xEMisO2l1qLMHx2BMdut6Z82V4s4rdrcCHrQQBp4nYnCZkIwlz
 pbUg==
X-Gm-Message-State: AOAM533sc+fSNszdZmPDRq+I5IxLkOf4Xg88SZdDJrWEgDYICaKDczsw
 WGmNPAcfcnFG4irGeuhWmyN+7ZCsnzUUgg==
X-Google-Smtp-Source: ABdhPJz9TdC/iTWtMMGsXcmSkTEERYbvTs+tAQf2WVvplICrDDnTdK6Abr9myX5GTaSwKjXjep12LQ==
X-Received: by 2002:a05:6e02:6cf:: with SMTP id
 p15mr4855650ils.237.1617841256915; 
 Wed, 07 Apr 2021 17:20:56 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id 11sm1818393ilg.53.2021.04.07.17.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 17:20:56 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v6 4/4] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Wed,  7 Apr 2021 18:20:39 -0600
Message-Id: <20210408002039.18027-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210408002039.18027-1-rebecca@nuviainc.com>
References: <20210408002039.18027-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x141.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..f42803ecaf1d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2


