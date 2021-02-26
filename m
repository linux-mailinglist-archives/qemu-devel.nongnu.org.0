Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D090C3265BF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:43:23 +0100 (CET)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFgD4-00046z-RF
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3X-0004pZ-1z; Fri, 26 Feb 2021 11:33:31 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:41979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3P-0007ip-D3; Fri, 26 Feb 2021 11:33:30 -0500
Received: by mail-qk1-x72f.google.com with SMTP id q85so9610809qke.8;
 Fri, 26 Feb 2021 08:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0wSN41gsfP0wx8cWcfsCenYCryYImxZlyeOVat/UOe0=;
 b=lZ8/oFlIJVO70mkNRYwvxKmfKytO34wkI++jgHyI3RAISWsQbJmuWUtrevS4a8fODD
 ZaDRudXN09JB2ZUNeBueI4CoB+DmqWAMJbNb+azFqgFE77C2WxZnAP36Mspz3pvM6Cdc
 aqRSSK55J1cI+xIM+f57YhZ9w5nYG820qIlh8fE1T6exz/6fid2T6Bv0Wuenpo3zCygG
 wgePc9JGCGBj9KE0te5nhL9WKv68WV4n/dcMb2EOFW5o37GMqhQtI/xdsoXYUYJC8fJ7
 MRNNB+z+vkfPUtyI4GA4Hfde0mTLL1IxffNhG68+21IA/GV+/684uHY2V2iBiWH6VDkv
 3dFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0wSN41gsfP0wx8cWcfsCenYCryYImxZlyeOVat/UOe0=;
 b=J3CKZ0CW5kaXqPZFALgnF+CUg35UU6OC6Mcuq7Z4UwBH56BlyEnvLP8hCHe1Hg9NXX
 MPjsn4tIyv7hIBSRosnnQ02qaapFgArV1LwsuKQp0nLWw+5TxoXu8Nnc9gWQO+/XideZ
 lt7M5SObCCB5qq+dgnAEbdrYGsu6iMedB49Z/hveXCUKKSTpm+xLqIm59DwMOiLXkRvS
 8vIg1BBvJJhPxUpQoaya4DeCDJAcWervmw8rSIBkn+RiXeDX1mcHsr7DUfavY1nCGQru
 L2M4XmfVo4CvwnQ/XUuNj9WI5A9Cjin/baJZMtSysz+6x/+v15xsv55jYK9+ywxR8fvr
 C2Fg==
X-Gm-Message-State: AOAM533ZPRLawjADrvPgrqeA7EtWXShfHDgFW7N3zvxkXmyeJmyK4r+7
 FQtYLo+ANd8yfy00A6RqbI2STtF02UfsaQ==
X-Google-Smtp-Source: ABdhPJzJeCRjN5kltpwQUJEunei/3Vh6yWTudPfC9U0oLtGiJkSYxIza1eMllujP/rOPa46QEXcQpQ==
X-Received: by 2002:a37:a913:: with SMTP id s19mr2038506qke.158.1614357198301; 
 Fri, 26 Feb 2021 08:33:18 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id t33sm731116qtd.13.2021.02.26.08.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:17 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] spapr.c: assert first DRC LMB earlier in
 spapr_memory_unplug_request()
Date: Fri, 26 Feb 2021 13:32:57 -0300
Message-Id: <20210226163301.419727-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226163301.419727-1-danielhb413@gmail.com>
References: <20210226163301.419727-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
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

We are asserting the existence of the first DRC LMB after sending unplug
requests to all LMBs of the DIMM, where every DRC is being asserted
inside the loop. This means that the first DRC is being asserted twice.

We will use the first DRC to simplify the code a bit in the next patch,
so instead of removing the duplicated assert, let's do it earlier.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6eaddb12cb..74e046b522 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3664,7 +3664,7 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
     uint32_t nr_lmbs;
     uint64_t size, addr_start, addr;
     int i;
-    SpaprDrc *drc;
+    SpaprDrc *drc, *drc_start;
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
         error_setg(errp, "nvdimm device hot unplug is not supported yet.");
@@ -3677,6 +3677,10 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
     addr_start = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
                                           &error_abort);
 
+    drc_start = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
+                                addr_start / SPAPR_MEMORY_BLOCK_SIZE);
+    g_assert(drc_start);
+
     /*
      * An existing pending dimm state for this DIMM means that there is an
      * unplug operation in progress, waiting for the spapr_lmb_release
@@ -3701,11 +3705,9 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
         addr += SPAPR_MEMORY_BLOCK_SIZE;
     }
 
-    drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
-                          addr_start / SPAPR_MEMORY_BLOCK_SIZE);
-    g_assert(drc);
     spapr_hotplug_req_remove_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LMB,
-                                              nr_lmbs, spapr_drc_index(drc));
+                                              nr_lmbs,
+                                              spapr_drc_index(drc_start));
 }
 
 /* Callback to be called during DRC release. */
-- 
2.29.2


