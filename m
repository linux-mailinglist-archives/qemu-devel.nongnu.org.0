Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B1A4120A0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:55:11 +0200 (CEST)
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNVV-0001jh-Vn
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQl-000278-Uz; Mon, 20 Sep 2021 13:50:16 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:33557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mSNQk-00008i-08; Mon, 20 Sep 2021 13:50:15 -0400
Received: by mail-qt1-x830.google.com with SMTP id x9so3831755qtv.0;
 Mon, 20 Sep 2021 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OQCaSIe99OwmQ8bsnK8UlD0RA8Ggd1iynfCZR2kCKy0=;
 b=YS06vzd/Yn7PzXQU3lkrcwS99dxEURLJPgyTEE8ZC+faZAvJ2Jq+YqbjTvx9gWREA3
 O17kr+x620NyGTLy7wQ8C8J8QacikafU55REOoBDhyla6RgzJ7sC9Uipc3uoE4U/nPuk
 bZKTx3l+vtc2Gj3Ke0E9Pgzc5v2SaYvrE4wcBxIyQ9dr2dbsPtTZw2t4JOOXth6+IdUw
 kljis6C55SEzoSFEGcdSGhrBbj5ZZGqbH2a1EDKKSjcYCjo2bQr5a/O27mawvH1iR3wG
 VL5+6Eav11UiBhCM5bGDC5c6qDJyI13B38sfGuL4j5593YwQrN/ylzsoF5tpt2JDUu8d
 vrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OQCaSIe99OwmQ8bsnK8UlD0RA8Ggd1iynfCZR2kCKy0=;
 b=bHMnhgQxtm5Pd6diaBgInizreTQ7pPsWdqM2A3V7lwPuBHIE3Gw69ZvXKsgs57P8dq
 WwVUSL51D32Qkbz7zkLsCLbQOAWq9RAJBpzM7RskR1p/KNul5hoQsYvRa3ClHwjz63j3
 BwZY70OWfVVUNMy0Z7gAo60kI9gbRckoS4SRWweVMGJw0VVsz718bPZaDSAmbhZVKhSE
 RqWboYcCmQHSct9iWo7lNti++kll8FwT8EPI0+BlSINOs6YXCP+dJi28SfBesVJFD9NL
 H3CkTrkw8Jm0rPb+P87R52w4pSPWBAt+HIPaGSn7HX+ri/b9OCV46IGUwpLgQ+5YkNRY
 njJg==
X-Gm-Message-State: AOAM5334VQOD5Cz16/C9BJ2hRA8m0cYNhwwF/+xLb20zBw/D03y0GXR/
 l9Z6YuR19pYia7DC/z6N5RNyzBzAt9E=
X-Google-Smtp-Source: ABdhPJwm13O8SxpTSi2+kZJ7dcK+6S1xSWF+KUlA3zS1e3goPVFID9F3GWccnmIPzL01mhKFqUhrpQ==
X-Received: by 2002:ac8:3d99:: with SMTP id v25mr24446105qtf.396.1632160211752; 
 Mon, 20 Sep 2021 10:50:11 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id l28sm6073614qkl.127.2021.09.20.10.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 10:50:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 7/7] spapr_numa.c: handle auto NUMA node with no distance
 info
Date: Mon, 20 Sep 2021 14:49:47 -0300
Message-Id: <20210920174947.556324-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920174947.556324-1-danielhb413@gmail.com>
References: <20210920174947.556324-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x830.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

numa_complete_configuration() in hw/core/numa.c always adds a NUMA node
for the pSeries machine if none was specified, but without node distance
information for the single node created.

NUMA FORM1 affinity code didn't rely on numa_state information to do its
job, but FORM2 does. As is now, this is the result of a pSeries guest
with NUMA FORM2 affinity when no NUMA nodes is specified:

$ numactl -H
available: 1 nodes (0)
node 0 cpus: 0
node 0 size: 16222 MB
node 0 free: 15681 MB
No distance information available.

This can be amended in spapr_numa_FORM2_write_rtas_tables(). We're
enforcing that the local distance (the distance to the node to itself) is
always 10. This allows for the proper creation of the NUMA distance tables,
fixing the output of 'numactl -H' in the guest:

$ numactl -H
available: 1 nodes (0)
node 0 cpus: 0
node 0 size: 16222 MB
node 0 free: 15685 MB
node distances:
node   0
  0:  10

CC: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 13db321997..58d5dc7084 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -539,6 +539,17 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = 0; dst < nb_numa_nodes; dst++) {
+            /*
+             * We need to be explicit with the local distance
+             * value to cover the case where the user didn't added any
+             * NUMA nodes, but QEMU adds the default NUMA node without
+             * adding the numa_info to retrieve distance info from.
+             */
+            if (src == dst) {
+                node_distances[i++] = 10;
+                continue;
+            }
+
             node_distances[i++] = numa_info[src].distance[dst];
         }
     }
-- 
2.31.1


