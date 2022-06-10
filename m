Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0195462D6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:53:10 +0200 (CEST)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzbKG-0002nG-C5
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXs-0001sI-4c
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXp-0006Nv-0U
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YahgfHZHkDDG1UwZ41vbkmzTf6VZZfUOEbVd98dAsq8=;
 b=c6XdL8b/6BEe7+tVXWXNBgNgV4xl0nreJDCvoChgEFkZBF/0tK111kxWjB84q/hv1K8cc3
 hnXrRl6JbDkEurFGBMadfxSTm4ZCKF1Io9Hs498WZDU61frz519N2LBT8OdwxaRw1w+MAu
 g57WgZkC49SKG0aMoRoic1r9AoQlepk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-ksvPri6QPquDgm225lVDVQ-1; Fri, 10 Jun 2022 03:58:59 -0400
X-MC-Unique: ksvPri6QPquDgm225lVDVQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v4-20020adfebc4000000b002102c69be5eso5958543wrn.13
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YahgfHZHkDDG1UwZ41vbkmzTf6VZZfUOEbVd98dAsq8=;
 b=TFgM5+LSRR93ppzVwyEBNRf99nVnFhM8ccnX3qdl9TR5oHfA4muvDTjsG+uA19wwjD
 UE+Il5C25l6CjmkENuTLaq3ZlzDIIb7GmCq1DivbpMreGHoS3I4jtcw33pl2a9Da4/+W
 GZr58TY7y9u9b3I3o54YE998tN1dQBDiTreVKiQvypoi3J/t0jKaVHbEoYD21lBYq+pc
 Ij/Rpl2T4i9rTGQqVa9kgUlPm4z98VVD9rJoGvCtL41bD74A58iiysEtxOybxla7W9N4
 AJl9fA3Xer8NU2zohyYk/+kepiJtvpoaymZsAgMktEtngzP1YfOMuQ8nwfmdASWHuG08
 wydA==
X-Gm-Message-State: AOAM532P6avw1ciSTw/1l2vV0ACHL9jLtlWhonHy3zrWK26ftmn799Kk
 UI5znDkbsnYcshp7/mHVgsbaGfWqgGa17JbY6wpEfFdV8mk5INotmxO8d9f5nO5VzcjUjs/z1zn
 OLG4xVpZabuKlJVUPKLlV04A4fhfM+byG/eqlO8ziLsQUcXY70trxoSwNB+9I
X-Received: by 2002:a05:600c:1c25:b0:39c:60cc:397f with SMTP id
 j37-20020a05600c1c2500b0039c60cc397fmr7526653wms.2.1654847937801; 
 Fri, 10 Jun 2022 00:58:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyigAnB0r8+BdrlOqd+idP8ATfRDW8wLuKONzg845w6aBwxVxPWhFvuJPTrRjOCpDSg99Qrfw==
X-Received: by 2002:a05:600c:1c25:b0:39c:60cc:397f with SMTP id
 j37-20020a05600c1c2500b0039c60cc397fmr7526614wms.2.1654847937485; 
 Fri, 10 Jun 2022 00:58:57 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4c8b000000b0020e5b4ebaecsm26785215wrs.4.2022.06.10.00.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:57 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben@bwidawsk.net>, Ben Widawsky <ben.widawsky@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 38/54] hw/cxl: Push linking of CXL targets into i386/pc rather
 than in machine.c
Message-ID: <20220610075631.367501-39-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Whilst here take the oportunity to shorten the function name.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
Message-Id: <20220608145440.26106-4-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl.h      | 2 --
 include/hw/cxl/cxl_host.h | 1 +
 hw/cxl/cxl-host-stubs.c   | 2 +-
 hw/cxl/cxl-host.c         | 8 +++-----
 hw/i386/pc.c              | 5 +++++
 softmmu/vl.c              | 2 --
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 84078a484d..134b295b40 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -53,6 +53,4 @@ struct CXLHost {
 #define TYPE_PXB_CXL_HOST "pxb-cxl-host"
 OBJECT_DECLARE_SIMPLE_TYPE(CXLHost, PXB_CXL_HOST)
 
-void cxl_fixed_memory_window_link_targets(Error **errp);
-
 #endif
diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
index 87a6933de2..4d642a81fa 100644
--- a/include/hw/cxl/cxl_host.h
+++ b/include/hw/cxl/cxl_host.h
@@ -15,6 +15,7 @@
 #define CXL_HOST_H
 
 void cxl_machine_init(Object *obj, CXLState *state);
+void cxl_fmws_link_targets(CXLState *stat, Error **errp);
 
 extern const MemoryRegionOps cfmws_ops;
 
diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
index de3e8894d5..e0d5ec8ad5 100644
--- a/hw/cxl/cxl-host-stubs.c
+++ b/hw/cxl/cxl-host-stubs.c
@@ -8,7 +8,7 @@
 #include "hw/cxl/cxl.h"
 #include "hw/cxl/cxl_host.h"
 
-void cxl_fixed_memory_window_link_targets(Error **errp) {};
+void cxl_fmws_link_targets(CXLState *stat, Error **errp) {};
 void cxl_machine_init(Object *obj, CXLState *state) {};
 
 const MemoryRegionOps cfmws_ops;
diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 3a79c32b42..8e7738a65b 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -68,14 +68,12 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
     return;
 }
 
-void cxl_fixed_memory_window_link_targets(Error **errp)
+void cxl_fmws_link_targets(CXLState *cxl_state, Error **errp)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
-
-    if (ms->cxl_devices_state && ms->cxl_devices_state->fixed_windows) {
+    if (cxl_state && cxl_state->fixed_windows) {
         GList *it;
 
-        for (it = ms->cxl_devices_state->fixed_windows; it; it = it->next) {
+        for (it = cxl_state->fixed_windows; it; it = it->next) {
             CXLFixedWindow *fw = it->data;
             int i;
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 98e63347f2..6cecd74d58 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -732,6 +732,11 @@ void pc_machine_done(Notifier *notifier, void *data)
     PCMachineState *pcms = container_of(notifier,
                                         PCMachineState, machine_done);
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    MachineState *ms = MACHINE(pcms);
+
+    if (ms->cxl_devices_state) {
+        cxl_fmws_link_targets(ms->cxl_devices_state, &error_fatal);
+    }
 
     /* set the number of CPUs */
     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ff0ad9ab54..54e920ada1 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -93,7 +93,6 @@
 #include "qemu/config-file.h"
 #include "qemu/qemu-options.h"
 #include "qemu/main-loop.h"
-#include "hw/cxl/cxl.h"
 #ifdef CONFIG_VIRTFS
 #include "fsdev/qemu-fsdev.h"
 #endif
@@ -2568,7 +2567,6 @@ void qmp_x_exit_preconfig(Error **errp)
 
     qemu_init_board();
     qemu_create_cli_devices();
-    cxl_fixed_memory_window_link_targets(errp);
     qemu_machine_creation_done();
 
     if (loadvm) {
-- 
MST


