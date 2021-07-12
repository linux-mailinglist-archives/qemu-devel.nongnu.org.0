Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2C23C640F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:47:24 +0200 (CEST)
Received: from localhost ([::1]:46754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31tj-0004DG-6a
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qX-0001Xt-TY; Mon, 12 Jul 2021 15:44:05 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qO-0002cg-N6; Mon, 12 Jul 2021 15:44:05 -0400
Received: by mail-pg1-x534.google.com with SMTP id s18so19393089pgg.8;
 Mon, 12 Jul 2021 12:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2A7kQXUoJ+TWj8DIjTzUnw/pm573Pm8vxZ6A+s+3A/g=;
 b=Vrk/JjQ6ViaDM/Tn0je63vU0OQw1mgdiwV6ser0PB385YQSpYA00iAZ4mHeansEqNo
 EwB0fEcTqqcflHpiWOJlY8T0VyiCqCX2dZR6hTLLeELee1KNnx7LauYatyoFSYGAFtyo
 /1v2TIcu5Ue3Sulm2X+fFeAhlBLrXy0UxE9sknI0/73b2KeCPwoU0QGfW+176M0zcIIR
 MxxlmpvBsYKHTGEBlzlZ/4lZcKCni/0YtkeIUiu/BCYNlXlk0zj7/kxhF1zzxj994mxL
 dQwdJ3tRB+V74WUyBM/hPdBMzXwv6rkIhiheLUcFN2ual/Gvx0mZxrpB4QWMD6U0gI8o
 Va+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2A7kQXUoJ+TWj8DIjTzUnw/pm573Pm8vxZ6A+s+3A/g=;
 b=Q2D+5TNRT3CCiO22eHiQUbqN3LABqUA2xMm/w+H59KTj3oqu6mAsazDZ42VWraOLmN
 q8dGUPNSWbsBLz3pyNvbrWL4kI4k29dU5BmxbXw0cZQoJpdPv8V/X0wZVdTqEZ2i7bhn
 1vfXjJEh2z53RlJKCUh078OSuKGsRAWKY9DG9Dd6YG9tvHE8I1a44OUBK3VVjEEdTFMX
 XWqZ6+U01WkfoRmNuSAM9R7QRSZOhe1VoZDC38aEOHqFjANJMx12lkAJOunhUnHAwXxu
 RM/MK0T0SoxbgA982S/82uSiMFFVADRqZKKsLshynaPZR+GzFF3NtYnHQy4gqy3bfTHj
 EO6A==
X-Gm-Message-State: AOAM531sHmtaH+4xEk7/mr6DuHTiBHB0YnLIsgm0NipQ6iDROT36lI4N
 4b/UwL2unPlOo/BqQL2f8hG1J/zWLxw=
X-Google-Smtp-Source: ABdhPJy/0YAanSfod187FgthtUbs1ddznKVUvIILw8Rh+75aot6bHbK+eF1eXKC1+O2RNRBlXfNEpg==
X-Received: by 2002:a65:6088:: with SMTP id t8mr655796pgu.371.1626119035062;
 Mon, 12 Jul 2021 12:43:55 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a7d9:90df:d3f0:78a8:2eb9])
 by smtp.gmail.com with ESMTPSA id e21sm17075088pfc.172.2021.07.12.12.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:43:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/7] hw/acpi/memory_hotplug.c: avoid sending
 MEM_UNPLUG_ERROR if dev->id is NULL
Date: Mon, 12 Jul 2021 16:43:33 -0300
Message-Id: <20210712194339.813152-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712194339.813152-1-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=danielhb413@gmail.com; helo=mail-pg1-x534.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, armbru@redhat.com,
 groug@kaod.org, qemu-ppc@nongnu.org, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qapi_event_send_device_unplug_error() deals with @device being NULL
by replacing it with an empty string ("") when emitting the event. Aside
from the fact that this is a side effect that can be patched someday,
there's also the lack of utility that the event brings to listeners, e.g.
"a memory unplug error happened somewhere".

We're better of not emitting the event if dev->id is NULL. Next patches
will introduce a new device unplug error event that is better suited to
deal with dev->id NULL scenarios. MEM_UNPLUG_ERROR will continue to be
emitted to avoid breaking existing APIs, but it'll be deprecated and
removed in the future.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/acpi/memory_hotplug.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index af37889423..e37acb0367 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -177,9 +177,14 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
             /* call pc-dimm unplug cb */
             hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
             if (local_err) {
+                const char *error_pretty = error_get_pretty(local_err);
+
                 trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
-                qapi_event_send_mem_unplug_error(dev->id,
-                                                 error_get_pretty(local_err));
+
+                if (dev->id) {
+                    qapi_event_send_mem_unplug_error(dev->id, error_pretty);
+                }
+
                 error_free(local_err);
                 break;
             }
-- 
2.31.1


