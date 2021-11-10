Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFF244C14A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:31:04 +0100 (CET)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkmkp-0001H9-7b
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:31:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mkmjP-0000LM-A3
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:29:35 -0500
Received: from [2a00:1450:4864:20::531] (port=46648
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mkmjN-00007r-QJ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:29:35 -0500
Received: by mail-ed1-x531.google.com with SMTP id c8so9673111ede.13
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 04:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j/DgBRVtXg3n5HEpQplwCbP73DDyCNVr2PK8DT2sJzk=;
 b=Iy+/iie0n6/h8TLeGaohyinMbAA9CU5GdP1V9iKEhwKT3RAML1WjcIj1TC8Aov4J3o
 inJps+2ZsTG75QVaJ/mNKLVJIHvV99sPNE4KEoj0W96ZrlR+R5/TYB5Bd2IDWUge9Xur
 OcclA1S+oi33k1Pck0uFMDrOQgLl3r4K4yFVb13hYqsznq+LWwBd2mM49Fj5/inB0TpT
 pfg8Tlq0iCaIZEyqwiM3XFQP2ynk2G0EBywE7f2VPI5Gumr4TBHLb2pE+khIzmV3kPvu
 9UMENf3/ULuqhoX6g1vI7RpweCUZtt7wBOjPZDmO/hpDyj6etsEZibI3HmvnRTt630oM
 Vd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=j/DgBRVtXg3n5HEpQplwCbP73DDyCNVr2PK8DT2sJzk=;
 b=BJzN+yBiFBjqGZXom0N4kfPYLWKk0FRp2Zx1BDzdno3ZQdyObhX6zJbz5QCW0oSdui
 FlzvB98jpWuqG5sLbZ8lbYteTz7X/nTo7+LtrtYHcLbzkB75gGWJ0h8OMBn80EGD5R/r
 TAjvYqRyN4ZUg4Wkdq/3jTbxI/Z+InKiczL0gANCi7CuX+Td8FB8TcMtoJY0iL7TYroe
 EoDnbahnMCyrrv3YvWTLL2tfvcoqYlIdSa6UtCaxlWrnFNVRp8TSClA7IrlLufBUIIkR
 5XVRvZuv/ssRQMBEnhrkMEWHQ2CghqcfiJhhYvNg//FHV6d2w8OYHrF5VSTSRP7nRZAt
 f3Qg==
X-Gm-Message-State: AOAM532Qb+97TrneNYnMCnfEvS5lrmiZ0Fn4jMBOR73G6MwoyDdwVjEa
 W9qFkc7K4f3Q0rK/4CnQcnx+wCNvMFQ=
X-Google-Smtp-Source: ABdhPJwA7rN/PCvVzWsvV3Q6Mfxc0/xlBWs6UmvkNE1lU0rXYvaXp41Nc8hUohca51yuMFMDRgCq7A==
X-Received: by 2002:a05:6402:34d0:: with SMTP id
 w16mr20568627edc.360.1636547371642; 
 Wed, 10 Nov 2021 04:29:31 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id sa17sm4658797ejc.123.2021.11.10.04.29.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 04:29:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] numa: avoid crash with SGX and "info numa"
Date: Wed, 10 Nov 2021 13:29:25 +0100
Message-Id: <20211110122925.87437-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add the MEMORY_DEVICE_INFO_KIND_SGX_EPC case, so that enclave
memory is included in the output of "info numa" instead of crashing
the monitor.

Fixes: a7c565a941 ("sgx-epc: Add the fill_device_info() callback support", 2021-09-30)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/numa.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 510d096a88..e6050b2273 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -756,6 +756,7 @@ static void numa_stat_memory_devices(NumaNodeMem node_mem[])
     PCDIMMDeviceInfo     *pcdimm_info;
     VirtioPMEMDeviceInfo *vpi;
     VirtioMEMDeviceInfo *vmi;
+    SgxEPCDeviceInfo *se;
 
     for (info = info_list; info; info = info->next) {
         MemoryDeviceInfo *value = info->value;
@@ -781,6 +782,12 @@ static void numa_stat_memory_devices(NumaNodeMem node_mem[])
                 node_mem[vmi->node].node_mem += vmi->size;
                 node_mem[vmi->node].node_plugged_mem += vmi->size;
                 break;
+            case MEMORY_DEVICE_INFO_KIND_SGX_EPC:
+                se = value->u.sgx_epc.data;
+                /* TODO: once we support numa, assign to right node */
+                node_mem[0].node_mem += se->size;
+                node_mem[0].node_plugged_mem += se->size;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.33.1


