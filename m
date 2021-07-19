Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE293CED81
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:29:54 +0200 (CEST)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Zth-0000pY-8h
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZP-0003NM-40; Mon, 19 Jul 2021 16:08:57 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZN-0002DY-4y; Mon, 19 Jul 2021 16:08:54 -0400
Received: by mail-pg1-x52f.google.com with SMTP id u14so20275819pga.11;
 Mon, 19 Jul 2021 13:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TrRUTkNlv6TQBWvTHUOv1v5ykVtwiJjVIPGxE+TtQHI=;
 b=K80iC/0zIH3BD0XggBwtD0AyHOLcmLIjBW2jo2QryvNQYLG/Saf7DT7VRdZXhJuqIM
 BK471I+sxvTsQQcX9Qe8VfT9pPscvST3QW84N5xWWxolXw1tbTsMAdjD0sAHnS7Q24P6
 y9fl/c/pXzZmjIFs8BKHuIl7eoPgy1SWs8zo0N3hsf99GTcNdryJ6jTHDX5ELA7Z2IyE
 DrXM9aF1fQTGhmofrHyjJQ6kSQOBaBV1GYg7NNts1xMPA9TRuVcbRpRUOVTHpmVzjdK/
 3i3vRJuZ5d7dDtIwUCCL8IMJzCYnoZGquS20XYQNG6+WxWlhoF23sCdlBQF/0AGFBlrO
 fjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TrRUTkNlv6TQBWvTHUOv1v5ykVtwiJjVIPGxE+TtQHI=;
 b=BQBjGlS9hg71A9I8KNB3rlmVea9Vp2gIP705WMLmO4f+JOEz9SLGJXhGUHRAIHKzqs
 00Igjlqo2sKCsuwXh5Z2HAZhS7EnM8mc0DXizSZB5IQNquYCdVI4+TBzmOBYGN8gbJBh
 ZqpJazw6mS0os7keh8UE87j1G0232jrbKs2G5h0/IunX54SCQivpVdtn4vYUrJhB8VGn
 reo12NUkUGdOHezP1Ec86/VvfmI0tgCWzET7hFx+325iZ4Q8/rCwHThotfl0SHGZ3s6A
 xD2ssGMcmw+GLSMfjisOdSX8m0w1wF6cxQjNxhIDqAG6cUsUKwcAFox9dZZ5qH1ChDhf
 1fsg==
X-Gm-Message-State: AOAM530LadXzlQVl2QV64rUaHYzX/49aJ2ZzvbRUUC2rGMLBGBqNSAi4
 U1G3l+RCGx7W3Wk/g0uub+h6IaWagUhNqA==
X-Google-Smtp-Source: ABdhPJwa7b2oULhcnVzLApaxV3ZG564yoedRSrgKH6+upJzZ4WFprqkTmwQxl90+ZVXsErnrpcaT1A==
X-Received: by 2002:a62:ee0f:0:b029:335:a681:34f6 with SMTP id
 e15-20020a62ee0f0000b0290335a68134f6mr20108471pfi.55.1626725331512; 
 Mon, 19 Jul 2021 13:08:51 -0700 (PDT)
Received: from rekt.ihost.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id e18sm21048805pfc.85.2021.07.19.13.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:08:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v6 7/7] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
Date: Mon, 19 Jul 2021 17:08:27 -0300
Message-Id: <20210719200827.1507276-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719200827.1507276-1-danielhb413@gmail.com>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=danielhb413@gmail.com; helo=mail-pg1-x52f.google.com
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
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MEM_UNPLUG_ERROR is deprecated since the introduction of
DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
MEM_UNPLUG_ERROR is pending.

CC: Michael S. Tsirkin <mst@redhat.com>
CC: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
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


