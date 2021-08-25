Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0632A3F6CC6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 02:53:26 +0200 (CEST)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIhAT-0001Qs-44
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 20:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6T-0001tm-Gw; Tue, 24 Aug 2021 20:49:18 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:33686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6S-00078H-4I; Tue, 24 Aug 2021 20:49:17 -0400
Received: by mail-qv1-xf36.google.com with SMTP id a5so4711094qvq.0;
 Tue, 24 Aug 2021 17:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g1UotLzQ0L5Awu7slK0NhDO1uCxic9JxflV/2rPVbk4=;
 b=bpkqJXAqKzO+WkF9dKxVUfAPF0Uprf54enT3zb1Re4BQTZZU3UEeYPWplMqZyb0T9D
 JI6C6tJd3AJeI/CV8gf5P+pL9ibbzxKAdQWDAW3Ao81GOi971+lfO0uavvnQPzkGn5CH
 MwzOwfLrkQErZAMmMZ2FT7tIFrm+ZSkhhC1JghVENeD5wcqZKQFJeG2h5047i3vS/Xmq
 oqo18YldFOAT7/4Im7hCKl4Lq7AORk5SkHPCaw4qqKvCGmH0wxqQVVkoWLd4KaULPeyR
 EzcHzDSaE9pNV2yKq3C3lQVMry/WRyAJYUpZo870LDnV6CW1nLqu0b6ACBdx2LwXN6Qy
 03jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g1UotLzQ0L5Awu7slK0NhDO1uCxic9JxflV/2rPVbk4=;
 b=LHnMB507VrDZqGJJs22JdmfPIwnJ5Yg7TesmFmTcoWpcH3FoI/hH/tCTzEcDhFEpVr
 hX6u5WvZ/bhy2VsDvblbJw7zrq6NaPbxGc2KST1/xQlcM+teriLIEzfQPQe4ZVlI0GwA
 mjiGWjEmxE9Dg3V9YKXZBDguX46FY2SgZlTMrj+dzVFc58teW970c5JXVTHIAQCAFx8u
 h9Zqv6FbLqT6uFbWVF4UTMQDpSZlaDvB8sqCEWdz46Zq80fKj0IY/qlIrP05AKWTrAu8
 T/1rTCQQbi1KqD9nkyLg+x+krlPc2rYRCZt5USZuGmpa4iv5zpVY7vqRiCKn/VmnkTzO
 i6MQ==
X-Gm-Message-State: AOAM53249AXjPVp4IvLNfDcdh1SK1q5ePv1i+N/3uVj+McupY+beOgyH
 NrHrDPNFXeAUt0ySi43Bw+Z6HuwBD/4=
X-Google-Smtp-Source: ABdhPJwdSwCHRikbPaz8VmxxXShRf+erUozmz84G0OyvzOR6tzW9GY3GZ+OYi2qqb8S5gNez24Gcow==
X-Received: by 2002:ad4:4ab2:: with SMTP id i18mr946176qvx.44.1629852554671;
 Tue, 24 Aug 2021 17:49:14 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id x10sm1515266qto.41.2021.08.24.17.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 17:49:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 7/7] memory_hotplug.c: send DEVICE_UNPLUG_GUEST_ERROR in
 acpi_memory_hotplug_write()
Date: Tue, 24 Aug 2021 21:48:35 -0300
Message-Id: <20210825004835.472919-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825004835.472919-1-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf36.google.com
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
DEVICE_UNPLUG_GUEST_ERROR. Keep emitting both while the deprecation of
MEM_UNPLUG_ERROR is pending.

CC: Michael S. Tsirkin <mst@redhat.com>
CC: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/acpi/memory_hotplug.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 6a71de408b..d0fffcf787 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -8,6 +8,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-acpi.h"
 #include "qapi/qapi-events-machine.h"
+#include "qapi/qapi-events-qdev.h"
 
 #define MEMORY_SLOTS_NUMBER          "MDNR"
 #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
@@ -178,8 +179,16 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
             hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
             if (local_err) {
                 trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
+
+                /*
+                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_GUEST_ERROR
+                 * while the deprecation of MEM_UNPLUG_ERROR is
+                 * pending.
+                 */
                 qapi_event_send_mem_unplug_error(dev->id ? : "",
                                                  error_get_pretty(local_err));
+                qapi_event_send_device_unplug_guest_error(!!dev->id, dev->id,
+                                                          dev->canonical_path);
                 error_free(local_err);
                 break;
             }
-- 
2.31.1


