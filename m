Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB6F4148FA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:34:01 +0200 (CEST)
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1Ro-0006GN-28
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mT1N7-0003X4-6d; Wed, 22 Sep 2021 08:29:09 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:45871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mT1N5-0006DB-JR; Wed, 22 Sep 2021 08:29:08 -0400
Received: by mail-qt1-x832.google.com with SMTP id r1so2375545qta.12;
 Wed, 22 Sep 2021 05:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWLppC0iflpYDFuKgFW+L1AVCM+gTGVt9aLRE3Xcljs=;
 b=CwlxadknjLaAiRtbVgtGzA4a7suZ3MqhEquQ4H+IV1N8wl2mG9vmzmSgOHKPX759VF
 2nvIlYsmO3saFi6WgRTDKp2a9t2VIjQYtHsIyqlbkwNIE7YK8R/QptQz+XJk6jBaTTL/
 q6dOgQvbfPXh/xvYbtyJcmRfaBR0o1InV6Cvp95DwwVKi0LInP4ajYW4nXZ5xQXKH59u
 ZSGflODRl2wX5f1jrnPvhXVxo4+2+GivlkputXPxbRQ9Ht+ijXkH8Wbk1mCvLDlUV6Ng
 hW3SMX378IRv4TWobH5qD+qDJbPWathUehRuZoreQ1GNeFaCvqLOc7vjlUJLNLC/W/mH
 uZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qWLppC0iflpYDFuKgFW+L1AVCM+gTGVt9aLRE3Xcljs=;
 b=XojrEL7u3CQ148ncsEOm6hC3uqAj6NhY8QhMWv9swOsYLMg6EFcmK4M76q8kGGeSwF
 cOXCC2ZvGKHgNlAK21jaG+UBEX/+WkI8zYYZDPeyZk07Xng99QSmM0gCto0PQgzxvNtV
 bBBgq0gVBnO4dSG9rCvzUk5JmdktpDr2ih+D7doxh57vj7X8DYsGvcioLsRpkhDxJCA+
 o15dYmGMXkLR87g81Vv8Dhy2Ykvwm6UnzPziZ1kxDaMP4CvrD0UmCBCYTt5b8T9T1AAU
 Xk9EleOD5HWvpPigxgX0kEbCQ837hx/uYGnzeEYcv3Wj6UY8+wVfiCLwxOzEGK11G0/5
 6qPw==
X-Gm-Message-State: AOAM530ihgEderjtdYgia4OBAq/2fUu21JefQVw+ONC5V1Bv37P5SqHH
 ZXaN9oDz0ZTFN8dkMWzohrCD81zl8ns=
X-Google-Smtp-Source: ABdhPJwj32YDmUCDeJGCd/qRcSlC2f39Tzm8J4A2adZ+ACgQe3rloQJAt76KzlcCHVcHBlH09lo4IQ==
X-Received: by 2002:a05:622a:48d:: with SMTP id
 p13mr33757474qtx.282.1632313746136; 
 Wed, 22 Sep 2021 05:29:06 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id bm27sm1631186qkb.6.2021.09.22.05.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 05:29:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] spapr_numa.c: fixes in
 spapr_numa_FORM2_write_rtas_tables()
Date: Wed, 22 Sep 2021 09:28:52 -0300
Message-Id: <20210922122852.130054-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922122852.130054-1-danielhb413@gmail.com>
References: <20210922122852.130054-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch has a handful of modifications for the recent added
FORM2 support:

- to not allocate more than the necessary size in 'distance_table'.
At this moment the array is oversized due to allocating uint32_t for
all elements, when most of them fits in an uint8_t. Fix it by
changing the array to uint8_t and allocating the exact size;

- use stl_be_p() to store the uint32_t at the start of 'distance_table';

- use sizeof(uint32_t) to skip the uint32_t length when populating the
distances;

- use the NUMA_DISTANCE_MIN macro from sysemu/numa.h to avoid hardcoding
the local distance value.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 58d5dc7084..5822938448 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -502,9 +502,8 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
     int nb_numa_nodes = ms->numa_state->num_nodes;
     int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
     g_autofree uint32_t *lookup_index_table = NULL;
-    g_autofree uint32_t *distance_table = NULL;
+    g_autofree uint8_t *distance_table = NULL;
     int src, dst, i, distance_table_size;
-    uint8_t *node_distances;
 
     /*
      * ibm,numa-lookup-index-table: array with length and a
@@ -531,11 +530,13 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
      * array because NUMA ids can be sparse (node 0 is the first,
      * node 8 is the second ...).
      */
-    distance_table = g_new0(uint32_t, distance_table_entries + 1);
-    distance_table[0] = cpu_to_be32(distance_table_entries);
+    distance_table_size = distance_table_entries * sizeof(uint8_t) +
+                          sizeof(uint32_t);
+    distance_table = g_new0(uint8_t, distance_table_size);
+    stl_be_p(distance_table, distance_table_entries);
 
-    node_distances = (uint8_t *)&distance_table[1];
-    i = 0;
+    /* Skip the uint32_t array length at the start */
+    i = sizeof(uint32_t);
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = 0; dst < nb_numa_nodes; dst++) {
@@ -546,16 +547,14 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
              * adding the numa_info to retrieve distance info from.
              */
             if (src == dst) {
-                node_distances[i++] = 10;
+                distance_table[i++] = NUMA_DISTANCE_MIN;
                 continue;
             }
 
-            node_distances[i++] = numa_info[src].distance[dst];
+            distance_table[i++] = numa_info[src].distance[dst];
         }
     }
 
-    distance_table_size = distance_table_entries * sizeof(uint8_t) +
-                          sizeof(uint32_t);
     _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
                      distance_table, distance_table_size));
 }
-- 
2.31.1


