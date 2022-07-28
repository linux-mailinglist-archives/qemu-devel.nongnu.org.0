Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5EC584487
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 18:59:03 +0200 (CEST)
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH6qk-0005Ve-8C
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 12:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH6nL-00016C-6S; Thu, 28 Jul 2022 12:55:31 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:37388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH6nJ-0006fX-Kc; Thu, 28 Jul 2022 12:55:30 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10e4449327aso3027206fac.4; 
 Thu, 28 Jul 2022 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/5JQT5jxD7I297fzW/WckYBdB5KijLg8y+oQa3QVdA=;
 b=q6RyD4tgkVDDkxVARv1ZhGdw749zYNgWDHtkTVmXzTKAExBRtwIXWbwwBDQFArKO3Z
 X0eLRHu0FEiOfDF9tvOdaRTYSOQ2KvsoBm/iQaWvGHgVDcGUrajkikjlFXIcsRAwYcmy
 fQiHKBEttVCHpfDuU4UTOBscvdX9kEHjPN99HjpNcNHcZ7IRm+2CTFPoWdgFEHBNj5xg
 TuISPOurG1ChrO04EzqwQFMJsoFqQUsZRmftiP0TLhVyZjpYM0b7hxI0BfJ+ytnTKIsK
 uLSV7xFfl4xk04HOeK46L4FD74pKWLhv08cLV7qh3nrpNPuyOEvN2TlPsthZ4gnC2f/y
 bE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/5JQT5jxD7I297fzW/WckYBdB5KijLg8y+oQa3QVdA=;
 b=mhtKP0VUyvI6UFq4tvcm5vzR4NzGlrUzMT3AvG3zhqNHfo2xBuiyGKbnDIyIn28TuI
 bh3gx7x4pWE8Ym5/x9AX5EHrOeTqkzbU8cpqG50Sbfttr4WP1xXp9jf/bLOc6JvVJozM
 o+tqU/uvlZhfh0zCsvxDi12kohMagQBZoXJ1Y2GlHSMRazf2EbMZEfhdFkANgAhpbiQO
 B70OcKj1D95pJQm9IRti0oE6L1y4KqtsD7DUZL5gnVBHsAfUIuQl4Z5XSKvzmuT7daal
 nGfqBoRKZa6sjBW5luiQsLAUuIKUpr+htPaUl2hGfaCQi+iqPBiV9w6KGpj+vis8o7dO
 3ofQ==
X-Gm-Message-State: AJIora8HYz/F8sou+Exrj5ffxLKynsD9RBsaq7vmO/kIwifD76QNfJPN
 wLMTLStSjj0KteGPenmmACgWB/csHWY=
X-Google-Smtp-Source: AGRyM1uKT1RxAKElzEYiqkXg0MA2B/KJcVEBk0FTGlGpC2VDq1+iFe7ysQZ5QNDg6ULpuo/34gcvxQ==
X-Received: by 2002:a05:6870:a112:b0:10d:c6b4:6396 with SMTP id
 m18-20020a056870a11200b0010dc6b46396mr187385oae.128.1659027327743; 
 Thu, 28 Jul 2022 09:55:27 -0700 (PDT)
Received: from balboa.COMFAST ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a056870170f00b0010e5a5dfcb4sm616290oae.0.2022.07.28.09.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 09:55:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Greg Kurz <groug@kaod.org>
Subject: [PULL 1/3] hw/ppc: check if spapr_drc_index() returns NULL in
 spapr_nvdimm.c
Date: Thu, 28 Jul 2022 13:55:17 -0300
Message-Id: <20220728165519.2101401-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220728165519.2101401-1-danielhb413@gmail.com>
References: <20220728165519.2101401-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_nvdimm_flush_completion_cb() and flush_worker_cb() are using the
DRC object returned by spapr_drc_index() without checking it for NULL.
In this case we would be dereferencing a NULL pointer when doing
SPAPR_NVDIMM(drc->dev) and PC_DIMM(drc->dev).

This can happen if, during a scm_flush(), the DRC object is wrongly
freed/released (e.g. a bug in another part of the code).
spapr_drc_index() would then return NULL in the callbacks.

Fixes: Coverity CID 1487108, 1487178
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20220409200856.283076-2-danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_nvdimm.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index c4c97da5de..04a64cada3 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -447,9 +447,15 @@ static int flush_worker_cb(void *opaque)
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
+    g_assert(drc != NULL);
+
+    dimm = PC_DIMM(drc->dev);
+    backend = MEMORY_BACKEND(dimm->hostmem);
+    backend_fd = memory_region_get_fd(&backend->mr);
 
     if (object_property_get_bool(OBJECT(backend), "pmem", NULL)) {
         MemoryRegion *mr = host_memory_backend_get_memory(dimm->hostmem);
@@ -475,7 +481,11 @@ static void spapr_nvdimm_flush_completion_cb(void *opaque, int hcall_ret)
 {
     SpaprNVDIMMDeviceFlushState *state = opaque;
     SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
-    SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(drc->dev);
+    SpaprNVDIMMDevice *s_nvdimm;
+
+    g_assert(drc != NULL);
+
+    s_nvdimm = SPAPR_NVDIMM(drc->dev);
 
     state->hcall_ret = hcall_ret;
     QLIST_REMOVE(state, node);
-- 
2.36.1


