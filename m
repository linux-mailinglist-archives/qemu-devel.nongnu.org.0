Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD6F44648C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 15:00:12 +0100 (CET)
Received: from localhost ([::1]:33782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizlK-0003LR-P0
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 10:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1mizdJ-0007E9-Ag; Fri, 05 Nov 2021 09:51:53 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1mizdH-0003BB-PE; Fri, 05 Nov 2021 09:51:52 -0400
Received: by mail-pl1-x629.google.com with SMTP id n8so11132468plf.4;
 Fri, 05 Nov 2021 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oq+ro2ZY6i9ehg1LYOi5cIN9ZV1HnWL5YK24Z8TaL6Q=;
 b=HS/5xmBraz0KqABzYt8ouzSAm9gnCNh7MjeNG6rETSK3ORfFOsZ8GgX2lbym9J5bYB
 L0iDDaM8klfsl1WrIVFKjMwqupU4/lDOu7oXPJRrXx8ZyJqnF4Uk+BGXtdSO8PiZlB0f
 iQJw6R4wZBk2MhMRoCtRvmCSiHz7z18ka6c0RUy5vdJaNNXZ4hqgDZkcqj2oph1JDKGi
 95J1eSgCVlP94f83qgx4VRyFrKdCmcf0gyBw8fdy3Zcd6W9LG624a7sx49jL77n369a6
 YS9+ihaz0BrhwS99MvgYmnNhM8Z0YHLayN8fjsj/hPSXo4ahHub/WK1VdWnHcIIaVfBd
 iBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oq+ro2ZY6i9ehg1LYOi5cIN9ZV1HnWL5YK24Z8TaL6Q=;
 b=FjIlETTwrmAWUtwc8qlxUnQgoqTPZf4IIe5joCg/+C2VC5EpTpmvRL/gtgujv+tgK9
 bLl5fWERw9hWGGJQmO5wPaZLwyezoJ5wWNVtPFnftbtwyYVYpqop/ic4ejq/FCbrlCMG
 f7mlsGHzkA7IuAqZ/GpBryHW4+UIvIq/D8VXSmCbP4XZM4/crP1nJnYxUSW6eNfW8H7p
 ruTAuN316W5dhrKcFR9S2tjsWb6DhMmSE/BXy6OJb8z6J6oOEOsqIWSyXLuZiK9Tafut
 R6fkGMkyhkXUEGSN/kDYdcL2rV57XaV/f5RnotTLHM2+1giuJKSp1PO7NdwvDeHMnABj
 z7Nw==
X-Gm-Message-State: AOAM533li8/nYwSzEzjsagRIijv6eqlz9F8OzTbSKcMIQZaotyzf4hib
 /+8DeR7K8+FQNay1mogTXdzy3sK7fdE=
X-Google-Smtp-Source: ABdhPJykRWWMw6X4Eo+bSOZaK9gHAnstYA+LMMaO9mcHLE3GlrOBFICFyIzTm5twZIGQL1ki8szQzA==
X-Received: by 2002:a17:90b:128f:: with SMTP id
 fw15mr30333190pjb.183.1636120309115; 
 Fri, 05 Nov 2021 06:51:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 d17sm7320361pfo.40.2021.11.05.06.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 06:51:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH] spapr_numa.c: FORM2 table handle nodes with no distance info
Date: Fri,  5 Nov 2021 23:51:37 +1000
Message-Id: <20211105135137.1584840-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A configuration that specifies multiple nodes without distance info
results in the non-local points in the FORM2 matrix having a distance of
0. This causes Linux to complain "Invalid distance value range" because
a node distance is smaller than the local distance.

Fix this by building a simple local / remote fallback for points where
distance information is missing.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_numa.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 5822938448..56ab2a5fb6 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -546,12 +546,24 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
              * NUMA nodes, but QEMU adds the default NUMA node without
              * adding the numa_info to retrieve distance info from.
              */
-            if (src == dst) {
-                distance_table[i++] = NUMA_DISTANCE_MIN;
-                continue;
+            distance_table[i] = numa_info[src].distance[dst];
+            if (distance_table[i] == 0) {
+                /*
+                 * In case QEMU adds a default NUMA single node when the user
+                 * did not add any, or where the user did not supply distances,
+                 * the value will be 0 here. Populate the table with a fallback
+                 * simple local / remote distance.
+                 */
+                if (src == dst) {
+                    distance_table[i] = NUMA_DISTANCE_MIN;
+                } else {
+                    distance_table[i] = numa_info[src].distance[dst];
+                    if (distance_table[i] < NUMA_DISTANCE_MIN) {
+                        distance_table[i] = NUMA_DISTANCE_DEFAULT;
+                    }
+                }
             }
-
-            distance_table[i++] = numa_info[src].distance[dst];
+            i++;
         }
     }
 
-- 
2.23.0


