Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DB73C641C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:49:19 +0200 (CEST)
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31va-0008Ex-FO
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qZ-0001Zj-4D; Mon, 12 Jul 2021 15:44:07 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qV-0002fu-UA; Mon, 12 Jul 2021 15:44:06 -0400
Received: by mail-pl1-x631.google.com with SMTP id u3so4678584plf.5;
 Mon, 12 Jul 2021 12:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+zrqjzPcvj6sVobiWzNXQ6kmh4zy9EjYGvkxkUwwDM=;
 b=XU4NN63CfYeuLLQ2kNYNuFznSLbaMRZ1rSPMhpuSTVd+5sbZM5ApiBKh5q7TgDko91
 iyMt6z95XAYDNDhyyVJdI45Zx9r7F9NEueWpGSmuJfZ2Bx+heht774M6y6lHO6MQSqpr
 4VPbJQoFL0WbCqF9rFTLowKwWSxjtrb0rtMI4f4TsjQqChcFvw3wiPv3pAuw59cURGMt
 2tGLJ1oL1LCrwDz/sbjyPVV6wuJXd1cQmE9ZCx6lixcxUTBE1jZdMj1UnNQrompP/LcO
 rQDdO6dblpQ5Zv6nFFM9f3foTUMfYHAafooVbCKThrvI7rnGNvOO68S/EdISP9rOkkJx
 Speg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+zrqjzPcvj6sVobiWzNXQ6kmh4zy9EjYGvkxkUwwDM=;
 b=Ub8/wl6JYt4g/YKtmbElD+fSxQI9lnYj6kf3BlLhTcBW5vuu/rzSVBOc+O9MHvByIC
 uex7yn/0vhTNdMZ5HSAn8ZQg7boaXYkOdbUGb7by+C16ddC3jJazTuCSgiFG9I2K0+a9
 mbjSZBgQKatWKtionfCh0ZBs2JN2ypAqm/IacbcadxTwSM6FDu4ZHiB3+8QZi+QWWNtp
 Qxtz573FAJ2pUfNv2JaUX5PHPM5pmd/IzDY8y9DefsHa61TADOFtuJp9wSPrS+qD0Tyb
 GaiZUz7FxNdlSYaWVuquiuHPj3VWpToVxgMXgPhcMs/GE+uwdo1+9uZxoRvkJMNzzhrT
 Ni2g==
X-Gm-Message-State: AOAM533zMYt38cdU/miJSlzR0NwwBPxULqZR+87PTlS5LZaxJCBYc32j
 3Uw1eXrIgAoBgFAy2HlAw0TER3EzU8g=
X-Google-Smtp-Source: ABdhPJyaaLe9D6OMfME9JSlN9YNGAck0Y2XSmKUF+BAUJC48ubvUbmdZ3qBpyxI+8oYGXMqJRSrC2w==
X-Received: by 2002:a17:90a:a898:: with SMTP id
 h24mr2729111pjq.208.1626119039506; 
 Mon, 12 Jul 2021 12:43:59 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a7d9:90df:d3f0:78a8:2eb9])
 by smtp.gmail.com with ESMTPSA id e21sm17075088pfc.172.2021.07.12.12.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:43:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/7] spapr.c: avoid sending MEM_UNPLUG_ERROR if dev->id is
 NULL
Date: Mon, 12 Jul 2021 16:43:34 -0300
Message-Id: <20210712194339.813152-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712194339.813152-1-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=danielhb413@gmail.com; helo=mail-pl1-x631.google.com
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

As done in hw/acpi/memory_hotplug.c, avoid sending
qapi_event_send_mem_unplug_error() if dev->id is NULL.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 81699d4f8b..1611d7ab05 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3688,9 +3688,11 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
      * Tell QAPI that something happened and the memory
      * hotunplug wasn't successful.
      */
-    qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
-                                 "for device %s", dev->id);
-    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
+    if (dev->id) {
+        qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
+                                     "for device %s", dev->id);
+        qapi_event_send_mem_unplug_error(dev->id, qapi_error);
+    }
 }
 
 /* Callback to be called during DRC release. */
-- 
2.31.1


