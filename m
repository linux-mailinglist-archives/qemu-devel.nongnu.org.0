Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC683F96D5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 11:26:46 +0200 (CEST)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJY8K-0006mF-M4
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 05:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mJY6s-0004Kz-7H; Fri, 27 Aug 2021 05:25:14 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:40495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mJY6n-00024M-JW; Fri, 27 Aug 2021 05:25:13 -0400
Received: by mail-ua1-x930.google.com with SMTP id y36so3072575uad.7;
 Fri, 27 Aug 2021 02:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g5Jdp9p1FcFlTUliocLqD9QgBTG6ccV0iJdgZ6gBA0U=;
 b=BUpD8MlSME/k3APv0k6d9tBBGmST6DJost375iMjW835IhPx6cl8o8OWSwa59j/5pF
 mtimwfNGcFYOaxIzT2haO1E4dV/5Xof2oF8TZ0SKLiOK53NQF76MING2EIeP05lvkq4t
 1vkqi3Is3w5z+9yHD7AwvLJdGAWWy8K0AC1I9Mwv5zK0CZa4cNSVkLEFkapJDkIuuHdE
 ncafTzCJemg0VPls3pC9U4gqBmGQov6fJfTiZR5PJVAqbd7U0hDOv9udh9DnpPtf9ymR
 WP+uaFY5nHXcgE0q7WKl/Kn9eb2z9fQ07TuhSKluZITeAdSU0NxDXbLR3NwBLzTYzorp
 /QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5Jdp9p1FcFlTUliocLqD9QgBTG6ccV0iJdgZ6gBA0U=;
 b=iBk5mJG1bmEqajCqlBhjKm5FzmLv6hGUiPUtO0La1LF3/g1LWlYdSyQsIlHJvh0iUK
 oeue1KetXPSAAPUQu9tagw3nkKpXumj4rlZoetTIywwJ4JC8yM/o43SppwPJTHD2sC+N
 81B5CCw6V2h3gOCbhEG0R6o//QNJMixooKtBzuOnyDiKkD2ydmQX/LtsyGkU9wXuH4QJ
 n25FGcCmqk7MoNOOuE5LU00EKIqFtoUYVCbqNBoWPk3iQnX2AMhZPKi7VAWuhknmmUap
 kOwICgJyT6fwe2Lq3Eh0K1K1fZfCfoMNiZ5bKxJ+gwPSpbASopasG7peG/x8jU5S852J
 c4lA==
X-Gm-Message-State: AOAM5305V/rX0rMAPoM3Fiw86c49Pq99jwOu08g5wA9EOtZgmXvvnlgn
 R48TrnYyuYFnvYylq1Cupjejk0b9dhs=
X-Google-Smtp-Source: ABdhPJzAf1BizHcXJQNiqAZmB2zIoHcuaIPHDvhVyVF1kC4WtJcxUTDzdKQPfl+C7Bz0FRcNimxDmA==
X-Received: by 2002:ab0:6652:: with SMTP id b18mr5715328uaq.53.1630056308085; 
 Fri, 27 Aug 2021 02:25:08 -0700 (PDT)
Received: from rekt.COMFAST ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id d17sm629180vsj.9.2021.08.27.02.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 02:25:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] hw, spapr: add 6.2 compat pseries machine
Date: Fri, 27 Aug 2021 06:24:51 -0300
Message-Id: <20210827092455.125411-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827092455.125411-1-danielhb413@gmail.com>
References: <20210827092455.125411-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/core/machine.c   |  3 +++
 hw/ppc/spapr.c      | 15 +++++++++++++--
 include/hw/boards.h |  3 +++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54e040587d..067f42b528 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,6 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_6_1[] = {};
+const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
+
 GlobalProperty hw_compat_6_0[] = {
     { "gpex-pcihost", "allow-unmapped-accesses", "false" },
     { "i8042", "extended-state", "false"},
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 81699d4f8b..d39fd4e644 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4685,15 +4685,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-6.2
+ */
+static void spapr_machine_6_2_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
+
 /*
  * pseries-6.1
  */
 static void spapr_machine_6_1_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_6_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
 }
 
-DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
+DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
 
 /*
  * pseries-6.0
diff --git a/include/hw/boards.h b/include/hw/boards.h
index accd6eff35..463a5514f9 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -353,6 +353,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_6_1[];
+extern const size_t hw_compat_6_1_len;
+
 extern GlobalProperty hw_compat_6_0[];
 extern const size_t hw_compat_6_0_len;
 
-- 
2.31.1


