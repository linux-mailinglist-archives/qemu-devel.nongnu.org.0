Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D52F78B3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:22:41 +0100 (CET)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0O7k-0002zt-Mc
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0O4q-0000yR-FJ; Fri, 15 Jan 2021 07:19:40 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0O4o-0000uj-2l; Fri, 15 Jan 2021 07:19:40 -0500
Received: by mail-pg1-x535.google.com with SMTP id g15so5883626pgu.9;
 Fri, 15 Jan 2021 04:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=kGF7H7FFFcNd6N9OaY7OvE8fL32uRDb/bcgWARGuxFQ=;
 b=lZlJbQx/f8HS68uGpoQJ1RdwPxZ9dqtVQlANTdXh6GGw5Et/TVmGHdZXYCgXOxJrzB
 YimtMQbu19C7+aJvKhMkpRsOQz/TjZiZOXz1ym2zca+ZdL7w2MardkpllflgxZQIizZe
 xuSWEWyJQJzCPLhxnhwxMlRNslJEGeNrvrMfmG1QBERHnEzVwjyvUWnvgjb5g1P3sYRy
 uGh+rxvOYBenw9oY0ZwsrhzSdSAJtuApbZwL/9vq8Rh8y0eG15Gu+fPrQ/ho8gXsKnRh
 eT2LIoE1F30dnnARFD8IiJuTZaNrdpwNIG4V698X18imZttRymm7IMLVIU7a/DShp1Jz
 wR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kGF7H7FFFcNd6N9OaY7OvE8fL32uRDb/bcgWARGuxFQ=;
 b=AJQbw3zxnLUL5szzSNEflpLZTzk/oMM1fa2Bl/1DVqTUveaEa61n1tPSj204acBTa5
 dmitUpHU6/FTslqVcYuenfS2QN2OHFosG+Z/jxoSQ5yfp7qR6af12wK7u8bpicqUbCty
 l6yGT58sUQijsMLr+sLX4w+mTC2lVaPaEiZbncszO1wz5S4clra3uPZ7Hi3NSTdhIKF+
 tNl/JepptAb1JU5ofOuzV4ckSbMS/CbVCkevYoJTB2me4uBWIBe8zV+jlb+JB8f0TKsF
 ORQ56sqkTDBvrqaJpzmzpcWXRAk0zMAclJJsdc2J07UrEXA+Sc/Z0O7MsgeJceVErMf2
 Q42Q==
X-Gm-Message-State: AOAM531tgE/EfYO9MV223ZRzBArBgeUwF26RnZu4D05QdTqFly7/Dw4P
 sy0NT1l8iyWEttgWpYHP6sxyRP36sWZvhQ==
X-Google-Smtp-Source: ABdhPJztQqekVMrQL/BpGd6FFu/roDvJd52EVHvD4y8iyAulQIAeACoj4ckPM4gkzij6ptkoXDiF4Q==
X-Received: by 2002:a63:700c:: with SMTP id l12mr12474469pgc.137.1610713176180; 
 Fri, 15 Jan 2021 04:19:36 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id q4sm8423013pgr.39.2021.01.15.04.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 04:19:35 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH] hw/block/nvme: error if drive less than a zone size
Date: Fri, 15 Jan 2021 21:19:20 +0900
Message-Id: <20210115121920.10386-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x535.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a user gives backing device file less than a single zone size, the
namespace capacity will be reported to 0 and the kerenl will fail to
allocate namespace silently.

This patch errors in case that num_zones are 0 which is backing device
is less than a single zone size.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 274eaf61b721..98690d030379 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -137,6 +137,13 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
     ns->num_zones = ns->size / lbasz / ns->zone_size;
 
     /* Do a few more sanity checks of ZNS properties */
+    if (!ns->num_zones) {
+        error_setg(errp,
+                   "num_zone is 0, drive must be larger than a zone %luB",
+                   zone_size);
+        return -1;
+    }
+
     if (ns->params.max_open_zones > ns->num_zones) {
         error_setg(errp,
                    "max_open_zones value %u exceeds the number of zones %u",
-- 
2.17.1


