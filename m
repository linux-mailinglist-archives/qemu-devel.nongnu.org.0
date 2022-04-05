Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2B4F3DF4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 22:37:04 +0200 (CEST)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbpvD-0004xz-Dh
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 16:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbpsr-000221-AU; Tue, 05 Apr 2022 16:34:37 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:45450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nbpsp-0006ql-Gd; Tue, 05 Apr 2022 16:34:37 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-d6ca46da48so637905fac.12; 
 Tue, 05 Apr 2022 13:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/FcFKOwr/wGXAfZgfm6JA9WshlyobXQaMI1g1FCcIFs=;
 b=SyKKEbPf9OkCUN8PD0z9vkanKqFFSoysZ56Iv9b95IWmVD8mpCZX3s8rdNP+87918V
 wmHLFhOAM7R5UX46pcpT6i5RKhKldVAFMwlkzyHhAp19WJMip6Kr3G6HoK7rnyLTF4el
 6RaIPXapRcghwIqIlKr6kFzs9O3in3kpoFm5bSjuvdFP0dkuDW4U3rQF9CQbJELG4ABz
 w9X7k04O19400kooQMOGRdpJZNL5f/YiFLKvyon9Zf+vWBlUSN7icJFzW5srJolkpug5
 TVl6REjuICazDGNG336289lQ68gtT6eT/qnqIc+dx8CC2vKP2WTdSP5R8eMqTOLL+jp2
 6sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/FcFKOwr/wGXAfZgfm6JA9WshlyobXQaMI1g1FCcIFs=;
 b=LAx4FZfjxaKT8OznM7FZ5ZvUwTP3+4rzX4hQUtMyZFTHpoHYGO/V/3F2F8LGevO3dS
 z8JAiHo38P0/Xg2gwbSLC/+ptfUSqvvOAacPFOxiEpNcWnUC1c7KB605ljM6COJbw8P4
 0UStpGdYnD/hjYfMCaBlC5h9GEHqAWxE/6XkZzevrAmVGyKOsq5VPJkPXFOzi5WkUZ6r
 BZH+vcpbP6ZDhletosKkrTtlYTsv9dFBFeJ+7ZZeATgqozktRFgKHJyDB+YgqNmLuJr+
 bXJPFiY6QI1nMTOpMGELUgVfOwS6ysRzA81lPKkGt/cPbya2Ilgvs+ChvydkRk0bXEJb
 V8ug==
X-Gm-Message-State: AOAM530R90kmF/4y6RXq3C/sJhSy7dQI6GH4OJCjfrH9GdVFQ9Qth5X3
 8bf5IGvJ/g5/QKR9exjzDKQsKZv9jYk=
X-Google-Smtp-Source: ABdhPJw16F7HhSw3r+llFSwXOkI9uqCXcmIHfHWjC9FJ/gqthv9wbQ1po5bor9WYaQgaZNTrAY9JIA==
X-Received: by 2002:a05:6870:8317:b0:e1:c070:4caf with SMTP id
 p23-20020a056870831700b000e1c0704cafmr2474302oae.109.1649190873682; 
 Tue, 05 Apr 2022 13:34:33 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 v33-20020a056870b52100b000e1efaa5fecsm3319553oap.19.2022.04.05.13.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 13:34:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 1/1] hw/ppc: check if spapr_drc_index() returns NULL
 in spapr_nvdimm.c
Date: Tue,  5 Apr 2022 17:34:16 -0300
Message-Id: <20220405203416.75952-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405203416.75952-1-danielhb413@gmail.com>
References: <20220405203416.75952-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_nvdimm_flush_completion_cb() and flush_worker_cb() are using the
DRC object returned by spapr_drc_index() without checking it for NULL.
In this case we would be dereferencing a NULL pointer when doing
SPAPR_NVDIMM(drc->dev) and PC_DIMM(drc->dev).

This can happen if, during a scm_flush(), the DRC object is wrongly
freed/released by another part of the code (i.e. hotunplug the device).
spapr_drc_index() would then return NULL in the callbacks.

Fixes: Coverity CID 1487108, 1487178
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_nvdimm.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index c4c97da5de..e92d92fdae 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -447,9 +447,19 @@ static int flush_worker_cb(void *opaque)
 {
     SpaprNVDIMMDeviceFlushState *state = opaque;
     SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
-    PCDIMMDevice *dimm = PC_DIMM(drc->dev);
-    HostMemoryBackend *backend = MEMORY_BACKEND(dimm->hostmem);
-    int backend_fd = memory_region_get_fd(&backend->mr);
+    PCDIMMDevice *dimm;
+    HostMemoryBackend *backend;
+    int backend_fd;
+
+    if (!drc) {
+        error_report("papr_scm: Could not find nvdimm device with DRC 0x%u",
+                     state->drcidx);
+        return H_HARDWARE;
+    }
+
+    dimm = PC_DIMM(drc->dev);
+    backend = MEMORY_BACKEND(dimm->hostmem);
+    backend_fd = memory_region_get_fd(&backend->mr);
 
     if (object_property_get_bool(OBJECT(backend), "pmem", NULL)) {
         MemoryRegion *mr = host_memory_backend_get_memory(dimm->hostmem);
@@ -475,7 +485,15 @@ static void spapr_nvdimm_flush_completion_cb(void *opaque, int hcall_ret)
 {
     SpaprNVDIMMDeviceFlushState *state = opaque;
     SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
-    SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(drc->dev);
+    SpaprNVDIMMDevice *s_nvdimm;
+
+    if (!drc) {
+        error_report("papr_scm: Could not find nvdimm device with DRC 0x%u",
+                     state->drcidx);
+        return;
+    }
+
+    s_nvdimm = SPAPR_NVDIMM(drc->dev);
 
     state->hcall_ret = hcall_ret;
     QLIST_REMOVE(state, node);
-- 
2.35.1


