Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9166039A599
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:17:53 +0200 (CEST)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq2a-00050R-F0
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl2-0001aA-7T
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:44 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkz-0007EZ-5o
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:43 -0400
Received: by mail-wr1-x434.google.com with SMTP id l2so6391646wrw.6
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TysIKDrUi/AEFUKTDKtgxqlH2Ug1XczQwdL8ralDjLo=;
 b=RKNokuZ5Zku/gdK4hPmziUp6vqi+glwRx2f3pvAImtgVh2Ht9ykOb3NzrNTkXGUc5P
 kiDqI/NieVpGGisaBK36BzvZxgNgcL/X9eBuJo7A/KY6TZ+cRvahXNDt0m5ftDbZoNB8
 0MUVrT1u3HycAQmY5c1IveUutwAdTm1dvbQHgOazUUqfrBO0IFCx5rq1LSBvDOIwnCHh
 K5dBaNxxMcGHLBR3gnBPJ/B8nL9jjxfegrnV93WbHghL4jUa/EYlC5bJV9CO8TAlEcU8
 HqQCCKJNreXLtsbTVHtKJzpwmmBmbd/F1yKKMBAQyQNkFZ2TbN1WTUzKbL9rixQ1Xq15
 3rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TysIKDrUi/AEFUKTDKtgxqlH2Ug1XczQwdL8ralDjLo=;
 b=J3/H/lmFPYDhB8DxRyhF9BqCcPyJ+VikYVyE3uaVi1WtLI+TeWc35r1PNk6zmGms8W
 lZ1d3qYXQX/6K0r8zMekOGXwpVf0+J8cHg6WygNURfdi06YZhgQ3fbhkUKTFQVC5eaSi
 jLh56vjYZ4UDZlWcpyINYEduGd9Z+eAXYrc1t652z7AvKN7Zxo7YpJ1fPcx/5PzW2wRE
 gLiR+o3h8+IfDI8GrDyXJEJiirnIj/W4pWUlk1m7zI2tOgNshjRIhYKd+gxPp4LjS+Gd
 p5Xgfdju9BYkFXs2P3NgvOYklA3KnRL5WdzNdAeZiswVR27ukyJ5CPA2b+9JwjQumwf+
 DL6A==
X-Gm-Message-State: AOAM5306LBAut+Bq7YgpsIatJoTePbmP5l5l8+Heuw02bTWLD5Lp87KX
 nHwcg0jpcqF4E4xtaIi6qC+9Kad8D6pWkxaC
X-Google-Smtp-Source: ABdhPJyCRfb3xNuoez14ikCFHjafJ5iPl0neWtJTn41hnNtCa3klpl8mNwdgj/90/A8bJs126dKeaA==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr684252wrv.100.1622735979832;
 Thu, 03 Jun 2021 08:59:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/45] hvf: Make hvf_set_phys_mem() static
Date: Thu,  3 Jun 2021 16:58:51 +0100
Message-Id: <20210603155904.26021-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Alexander Graf <agraf@csgraf.de>

The hvf_set_phys_mem() function is only called within the same file.
Make it static.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210519202253.76782-6-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/hvf_int.h  | 1 -
 accel/hvf/hvf-accel-ops.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index ef84a24dd96..d15fa3302a9 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -43,7 +43,6 @@ struct HVFState {
 };
 extern HVFState *hvf_state;
 
-void hvf_set_phys_mem(MemoryRegionSection *, bool);
 void assert_hvf_ok(hv_return_t ret);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 int hvf_put_registers(CPUState *);
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index c2136dfbb8c..5bec7b4d6dc 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -114,7 +114,7 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
     return 0;
 }
 
-void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
+static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
     hvf_slot *mem;
     MemoryRegion *area = section->mr;
-- 
2.20.1


