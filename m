Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277A3C6444
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:53:38 +0200 (CEST)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31zg-0000Gu-1Y
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qn-0001nj-Hm; Mon, 12 Jul 2021 15:44:21 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qj-0002oM-F8; Mon, 12 Jul 2021 15:44:19 -0400
Received: by mail-pf1-x435.google.com with SMTP id j9so11729056pfc.5;
 Mon, 12 Jul 2021 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b5RbY7ETO7O1SMcWDdHffidUKoTmEeWM7UscN17SR3A=;
 b=GCHVbYn8Mjd5oT1ZIWwam7e6gyXf898MHft3lckq0XQwn5K8GhDzJGpxQztRI+kY2y
 yswKmqeHlpX9nijg7jyF6zie3D8mnp8y6HcaEgz5P2zIWubKjJHYTmDu8MdpOv8Yxf1V
 qVA6TvzzmQXbjW57G/oADHOKGdacFCcmeCRhWExy+F4+uhalV81HGMri0eY/GGTPCRYQ
 jgkmcd3POfTZej9RwNnpKGev+/rsF1g31Yg2j2QfjGrUjc6KaiDGT92IVmg+hD23hoe9
 01e2l2REfFUKTAjkFDrMtsil34Zd8UPrp2O7mPstX5opj/qPcOQKxq5ywrrVz6Zhhzix
 mcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b5RbY7ETO7O1SMcWDdHffidUKoTmEeWM7UscN17SR3A=;
 b=GmMsL7KLEuJN9F5vbQenQMqU73OrRNJLfcbJIM5dpRWj5AeM8EsW2M7jeLuDIx+EXb
 mrVItJ4w75KbP02VdcDXiKnshK8eZOHQoCLUB00YatXhmxnFP3njd4/bsDhtUZIBUwwY
 FvatNWDySw+oSyZYljnvX29md+8SoRxaA4/196FhwVP2AhEueei+MKtrpSWXOTGC6UyC
 b8Jz/bxmKzhMtD1cJ+2wy+lTeEplf+eGNjWTlVqWhf0uMZjLs/WurLndzbZq5+0J3Vjf
 jEAmzHOrfx690XvUgzRTee06gvVud0hWiahS3VqVvq/phBS5aewJzPlDCoQiYY/HcsWK
 FD/w==
X-Gm-Message-State: AOAM533gw/Ef0h33vKiXa0VsICPRcjFubR08nr59iyE1MEnes9jsMRj3
 02FVfmVkU0sMBNqifjt0RSyCLJLbJ9s=
X-Google-Smtp-Source: ABdhPJzCrjnLY8gOmNHu3xKeDw7ARCwBOMd34docUgHHRsGOWthan5mc9FElE1NPmqckkaCDkJa26Q==
X-Received: by 2002:a05:6a00:168a:b029:2fb:6bb0:aba with SMTP id
 k10-20020a056a00168ab02902fb6bb00abamr686841pfc.32.1626119055758; 
 Mon, 12 Jul 2021 12:44:15 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a7d9:90df:d3f0:78a8:2eb9])
 by smtp.gmail.com with ESMTPSA id e21sm17075088pfc.172.2021.07.12.12.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:44:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 7/7] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
Date: Mon, 12 Jul 2021 16:43:39 -0300
Message-Id: <20210712194339.813152-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712194339.813152-1-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x435.google.com
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, armbru@redhat.com,
 groug@kaod.org, qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 eblake@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MEM_UNPLUG_ERROR is deprecated since the introduction of
DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
MEM_UNPLUG_ERROR is pending.

CC: Michael S. Tsirkin <mst@redhat.com>
CC: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/acpi/memory_hotplug.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index e37acb0367..a0772fe083 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -8,6 +8,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
 #include "qapi/qapi-events-machine.h"
+#include "qapi/qapi-events-qdev.h"
 
 #define MEMORY_SLOTS_NUMBER          "MDNR"
 #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
@@ -181,10 +182,19 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
 
                 trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
 
+                /*
+                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
+                 * while the deprecation of MEM_UNPLUG_ERROR is
+                 * pending.
+                 */
                 if (dev->id) {
                     qapi_event_send_mem_unplug_error(dev->id, error_pretty);
                 }
 
+                qapi_event_send_device_unplug_error(!!dev->id, dev->id,
+                                                    dev->canonical_path,
+                                                    true, error_pretty);
+
                 error_free(local_err);
                 break;
             }
-- 
2.31.1


