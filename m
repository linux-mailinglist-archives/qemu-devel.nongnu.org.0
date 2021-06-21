Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B7E3AF732
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 23:08:21 +0200 (CEST)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvR9Y-0005oL-5D
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 17:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lvR42-0007xu-Fb; Mon, 21 Jun 2021 17:02:38 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:33410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lvR3z-000324-MO; Mon, 21 Jun 2021 17:02:38 -0400
Received: by mail-qk1-x72f.google.com with SMTP id bm25so19166449qkb.0;
 Mon, 21 Jun 2021 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VMQa3bPt0UPhXZWmJep4Px1PeDs5GArG+5QytvVwlb0=;
 b=mWZLKb5JTSY8yJiKPSoRBfhw/U7AGVsW8h7Rzl350gknJE7sPaB5EGMmFdoBWAoYMw
 7nY0MXKr+peXHJNjjRe76RmD+ze1F2Vn/1j+Ctn7rUw9BbQlYaxWp6TM7fuh5nyaM7gJ
 fYN13IT143WEqPz7dPQ/hkJP7tWtjUJfToaidOF38kmL/UitBXOKU1DEpbG9MMf26C/D
 1MPauVrN45Pe91ah5bNIF78ICYwBpTN+LX/p4XXfm0hHmF9dIdK2AylKa5+UggHIkmup
 kxsn668ID3x2fqzlwVdcX84cQ1X7iqf8+QixaqRXtDch+ccT+knPQYS4uqfIaktkZeGb
 n/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VMQa3bPt0UPhXZWmJep4Px1PeDs5GArG+5QytvVwlb0=;
 b=YTqkH6IQY7nLPolsv1Qo/zj5k7fTvrYyPS/FJeQ5jsLXJJzpOPJA2eqm5WrBlpJp+6
 dA4AqH+xjxKgjMcpF/laqX0KxfftkjKit640KK//yZlU7C0jD3rlz6/0u4Zo3coGTNIa
 nGUamGVJnGJFfN0hq8gkvZBbV0BXzBiKnNQq5VKICV2KLiTdDidZq9Gokr8YWvwVmx5X
 Vk3/2Au2mXao75LA1qYb9QI9dMs5uwpcC701hiCAlnC4/4tt6hYphl4CpW1W/dN9/cFi
 0dQK5Vg8IR1/k8Tkhy7OA0AOOzXGSgL/8m2eaXOuFwY0/N73APe+xjNGwggSWrX/gd32
 t6dA==
X-Gm-Message-State: AOAM531V+Ty0fGg7UD7zX/yhOslr+CfaHjqzuxL5ZqZxkGhyDh6AVNIP
 t40Z1J5MaGQVnCPXoJlwd4OUBjbrve0=
X-Google-Smtp-Source: ABdhPJym1ChVLieUVdqs627L4KlFXkZOPdGz9JXNxA2q5fUyZ+o/yjx+94VtRLknakauhCbFtX1/Ww==
X-Received: by 2002:a05:620a:5f3:: with SMTP id
 z19mr598538qkg.301.1624309354422; 
 Mon, 21 Jun 2021 14:02:34 -0700 (PDT)
Received: from localhost.localdomain ([191.19.29.157])
 by smtp.gmail.com with ESMTPSA id b8sm187035qtr.77.2021.06.21.14.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 14:02:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
Date: Mon, 21 Jun 2021 17:59:07 -0300
Message-Id: <20210621205907.244841-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621205907.244841-1-danielhb413@gmail.com>
References: <20210621205907.244841-1-danielhb413@gmail.com>
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


