Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F294100C6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 23:37:08 +0200 (CEST)
Received: from localhost ([::1]:44096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRLXf-0006U1-A1
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 17:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLPK-0003aM-Af; Fri, 17 Sep 2021 17:28:30 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:46760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mRLPI-0007w9-1Z; Fri, 17 Sep 2021 17:28:30 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 q26-20020a4adc5a000000b002918a69c8eeso3631204oov.13; 
 Fri, 17 Sep 2021 14:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXwiVuzQxbFRMa8BHWzYHEIQoCujnnuryEaFVH2T7Ak=;
 b=owYkajHNIfE3gvFkhx+ZYfP4UBgR9Qu23bRChAljxPno817GhTkPr8FlhzI8sLLwWf
 xLrTIkBHYyvxNu1+0Wq39RpdCIzey2tt+oSaTGq6hKQDVOyegdSTmrNIiurdagRU0T5p
 2+n+DZC4wUi4wJqrZoRHqVkaZSGTPoE+87tu01ULUj34eB5wOBWovqUchh/1BxZjkB/r
 KXVXr+SUnm7PKE9AhKhPylqYqlVqtm0KrC10vcY5CiZFVEk+HsPvMbY6zBMi8qvEMxJB
 B8rkENoWbyaW9BtEZzc9HMhfY+iWnYnlUZFBcnkVFCD+AuDhqPu2SwIqjacI0qK3QWVP
 Y8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXwiVuzQxbFRMa8BHWzYHEIQoCujnnuryEaFVH2T7Ak=;
 b=GG8s5znrZbIbWkqYHsWXo0C18/yTcgIN9+4v0ouHKjmxWS30ZKPIjnThPNk7EHElig
 3iHd5zz+I+MzSTIIa10MsdzjJZo3/G2EkzpCP/ZMbF2u04Nt8ldrUw7x3A/BArZJbz9n
 iN47QBzjHvCP7A6rPIH8PnXWyyasBrewWJ3YFTMOeQZaQzEIUihPkoUh0Llw0FHCE8Oo
 CGZ/wJo8EgQhWfKENdWNGClLVJaqVASFWXec3MuH9itZeeQje/sDXnmcvcIxak1Pclfn
 99AVv0aRL2wd1yFrN5aJG2LzNK9V6k7nBSjC75GT11jjr/1oxvowCb0cyqIPhQUIWvPr
 rCxg==
X-Gm-Message-State: AOAM5317cwdeuJI0k+djynmZpbKkyEAcJaKjkwkvkpZh1KmAhKvwlJEQ
 g4QNZKNZCmFuKF8NnnOH3XyGlrIqMfc=
X-Google-Smtp-Source: ABdhPJzhxwGHxt1ihe3vWUD5XzoV5bUEFFXiW28jfcmVjHfZq930+Airoftudj4nUuWD4bWsQhuaew==
X-Received: by 2002:a4a:ba0f:: with SMTP id b15mr10555514oop.31.1631914106415; 
 Fri, 17 Sep 2021 14:28:26 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id s16sm710560otq.78.2021.09.17.14.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 14:28:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 7/7] spapr_numa.c: handle auto NUMA node with no distance
 info
Date: Fri, 17 Sep 2021 18:28:02 -0300
Message-Id: <20210917212802.424481-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917212802.424481-1-danielhb413@gmail.com>
References: <20210917212802.424481-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2d.google.com
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
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 659513b405..0cead2e7f5 100644
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


