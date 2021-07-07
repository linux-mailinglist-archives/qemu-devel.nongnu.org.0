Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0F3BE055
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:39:49 +0200 (CEST)
Received: from localhost ([::1]:40528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vbQ-0003I0-3I
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m0vVZ-0004rr-PN; Tue, 06 Jul 2021 20:33:49 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m0vVX-0001QZ-Ds; Tue, 06 Jul 2021 20:33:45 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso2516179pjx.1; 
 Tue, 06 Jul 2021 17:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1QTX+UnLiIoOH0MxdsoyMTOCoon+Kk8iQXgj5XX0WP8=;
 b=NpoK06rJrNpaj04ghKrb9gAmDiGdoCFm73jiGaQ+jyho8TGOsITaM44mHh0B4HW3CV
 qY4uIHUcdG2cOHriC5ZtzaoXE+9U58Z731NnnMdRpejQcDgxcn5ddpvNksfdOFF8b8Wy
 UhZWEBbtadhb1mB31iLfr3tu21mTWyvGwjYKCewNUrNIF4A3GVX9R4Fq6qJWqYo+SUt0
 kef/bzBiCFPOnv9wTF49v06JIxCBc9ctS07pTd/a/cflMdCJcAfcXjtobkuLkUNaiJfC
 pT1adzHJDi2hyOz4C5WzUgr2uYmIF95ZBQ2naEdtpbuFZ7DD+ff/70s4IIDzUeXwgwhI
 pZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1QTX+UnLiIoOH0MxdsoyMTOCoon+Kk8iQXgj5XX0WP8=;
 b=PBGh1p+LGfBN8cPIl5mCaNQA3ux/hjYe3z7IQMrd8qdocGjefZWw0bFmnZI5edYOe5
 C8sjuK0YcGlVGVuo54d2KJjz/bTUJ9MezkbUrM/Uez5j03jdEUCuHI371sVSwRTo2XVZ
 3qbO9WGIjtJo4HqN27VVhO6AdECsb8IZRPP8yBSWX5jjIcyjyu6z1DgL7IdAqT4aytmP
 ogrQmxk/COpfvIq0hHjqwkmFeSSTqzVtNZfL3Nvic+xJ3OjX+QBkumcqeSfcJHmJwBtK
 BZYZGW1sYrOYK6mzSa1MopLK/pYk0uKIk/mak7GGVnZKBEyxc+KJ+KsQdAf/151dpKqb
 ZsrA==
X-Gm-Message-State: AOAM530cQEH+Sl1H7Qz94RviWEh7ccLadJHdcmoSvUXV40xpHt4YFy3d
 qqemQL+UTvPXxGlG7ELKIcydA6hwbTn2vg==
X-Google-Smtp-Source: ABdhPJz8o1LLY14dN/caHAP+wI8/rWnH+eAso8H7xWWdwypbE8j09jVXP47L2ZQvJXxl2RRdU5Ov0Q==
X-Received: by 2002:a17:90a:e649:: with SMTP id
 ep9mr3019612pjb.9.1625618021644; 
 Tue, 06 Jul 2021 17:33:41 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:7611:b123:7cbc:3065:30b1])
 by smtp.gmail.com with ESMTPSA id co12sm4004871pjb.33.2021.07.06.17.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 17:33:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
Date: Tue,  6 Jul 2021 21:33:14 -0300
Message-Id: <20210707003314.37110-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707003314.37110-1-danielhb413@gmail.com>
References: <20210707003314.37110-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x102c.google.com
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/acpi/memory_hotplug.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index af37889423..fb9f4d2de7 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -8,6 +8,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
 #include "qapi/qapi-events-machine.h"
+#include "qapi/qapi-events-qdev.h"
 
 #define MEMORY_SLOTS_NUMBER          "MDNR"
 #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
@@ -177,9 +178,17 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
             /* call pc-dimm unplug cb */
             hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
             if (local_err) {
+                const char *error_pretty = error_get_pretty(local_err);
+
                 trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
-                qapi_event_send_mem_unplug_error(dev->id,
-                                                 error_get_pretty(local_err));
+
+                /*
+                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
+                 * while the deprecation of MEM_UNPLUG_ERROR is
+                 * pending.
+                 */
+                qapi_event_send_mem_unplug_error(dev->id, error_pretty);
+                qapi_event_send_device_unplug_error(dev->id, error_pretty);
                 error_free(local_err);
                 break;
             }
-- 
2.31.1


