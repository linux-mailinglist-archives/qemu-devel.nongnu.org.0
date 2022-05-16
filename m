Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8672352830D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:21:02 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYmb-0003h8-6G
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6T-0006wi-Ju
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6S-0005O1-1q
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffHa/fT6FD5ALi+KFZhbi+0qweg5bNEW0JFNey8KOhE=;
 b=iiurwRm5DiXkuIQ6jhxryLT/w8kihoTBCLYruG1aSERGXnwUDLwavyAMZxwtRcj1Cof7GM
 psiMi2MjI+BunJrE0pCA1TbXWFg4TyhfilZarS9hx9/tYOa2SHZLTHP5WzytPLN2aqNW+z
 bovSsF8x3HEH20VHxTqci+Lzk0EJb/4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-S0rygvHhNraSRBYhbWPIXQ-1; Mon, 16 May 2022 06:37:26 -0400
X-MC-Unique: S0rygvHhNraSRBYhbWPIXQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso10154314wms.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ffHa/fT6FD5ALi+KFZhbi+0qweg5bNEW0JFNey8KOhE=;
 b=k432J1Zj+bmJhGbBCHdQacZOyK1y7bAdbOxxMpfLKeP9/yPAG8NoxRqi1/YeGT4Esh
 oISQ7mwLuPr4rC3XQAUihKhpIdx8tcI10TzVT/Gn/8yxX4jbVbwdgu3NRlDYNL0d2XbE
 D51pMHr76SkEOqgbfrb1mnn6UTNgMm7J8IRpui+i+ZyL0c20ZeJEEOlOslxH61Yb4d+4
 NdsZExGQ3gX884djf3twB9aLnopVecHyK4AZ50jVeX/H8Rr75axLXm6nurH7mW27EeFC
 Vb0bb0vHywJk149w9Jp66iVWwRxZ3+9KqCu0EM9tT/ifzXkvDVR1o9FZfm9HArm4jLOD
 Ul0A==
X-Gm-Message-State: AOAM532Yd+g85+9Xi/QwALe9UafsDn2rUAdjoXte1pmywJgbgm8EGZjo
 bzYApAikngRIzsVH77hOudViiS3wqtHOWxqB+GH0in6wWxSkhYw7PoD8yFqHPQJdBosGupub+Nq
 rjvjSY0h+Fng7IdYLPh5sHc2hKKxEDltCitDZ8rR2hpgDRT+FSPWtUKy9wMP/
X-Received: by 2002:a05:6000:1f1a:b0:20c:d84b:5863 with SMTP id
 bv26-20020a0560001f1a00b0020cd84b5863mr13693095wrb.277.1652697444993; 
 Mon, 16 May 2022 03:37:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy97HOLB+FNcexGsbnHfGsWt++77SO2qv77daEjxo8hN3ay93hd2kmUE2B5qmMTc7TQtPvqwQ==
X-Received: by 2002:a05:6000:1f1a:b0:20c:d84b:5863 with SMTP id
 bv26-20020a0560001f1a00b0020cd84b5863mr13693069wrb.277.1652697444708; 
 Mon, 16 May 2022 03:37:24 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b0039456c00ba7sm15464724wmq.1.2022.05.16.03.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:24 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 30/91] acpi/cxl: Introduce CFMWS structures in CEDT
Message-ID: <20220516095448.507876-31-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ben Widawsky <ben.widawsky@intel.com>

The CEDT CXL Fixed Window Memory Window Structures (CFMWs)
define regions of the host phyiscal address map which
(via an impdef means) are configured such that they have
a particular interleave setup across one or more CXL Host Bridges.

Reported-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-29-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/cxl.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index aa4af86a4c..31d5235136 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -60,6 +60,64 @@ static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
     build_append_int_noprefix(table_data, memory_region_size(mr), 8);
 }
 
+/*
+ * CFMWS entries in CXL 2.0 ECN: CEDT CFMWS & QTG _DSM.
+ * Interleave ways encoding in CXL 2.0 ECN: 3, 6, 12 and 16-way memory
+ * interleaving.
+ */
+static void cedt_build_cfmws(GArray *table_data, MachineState *ms)
+{
+    CXLState *cxls = ms->cxl_devices_state;
+    GList *it;
+
+    for (it = cxls->fixed_windows; it; it = it->next) {
+        CXLFixedWindow *fw = it->data;
+        int i;
+
+        /* Type */
+        build_append_int_noprefix(table_data, 1, 1);
+
+        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 1);
+
+        /* Record Length */
+        build_append_int_noprefix(table_data, 36 + 4 * fw->num_targets, 2);
+
+        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 4);
+
+        /* Base HPA */
+        build_append_int_noprefix(table_data, fw->mr.addr, 8);
+
+        /* Window Size */
+        build_append_int_noprefix(table_data, fw->size, 8);
+
+        /* Host Bridge Interleave Ways */
+        build_append_int_noprefix(table_data, fw->enc_int_ways, 1);
+
+        /* Host Bridge Interleave Arithmetic */
+        build_append_int_noprefix(table_data, 0, 1);
+
+        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 2);
+
+        /* Host Bridge Interleave Granularity */
+        build_append_int_noprefix(table_data, fw->enc_int_gran, 4);
+
+        /* Window Restrictions */
+        build_append_int_noprefix(table_data, 0x0f, 2); /* No restrictions */
+
+        /* QTG ID */
+        build_append_int_noprefix(table_data, 0, 2);
+
+        /* Host Bridge List (list of UIDs - currently bus_nr) */
+        for (i = 0; i < fw->num_targets; i++) {
+            g_assert(fw->target_hbs[i]);
+            build_append_int_noprefix(table_data, fw->target_hbs[i]->bus_nr, 4);
+        }
+    }
+}
+
 static int cxl_foreach_pxb_hb(Object *obj, void *opaque)
 {
     Aml *cedt = opaque;
@@ -86,6 +144,7 @@ void cxl_build_cedt(MachineState *ms, GArray *table_offsets, GArray *table_data,
     /* reserve space for CEDT header */
 
     object_child_foreach_recursive(object_get_root(), cxl_foreach_pxb_hb, cedt);
+    cedt_build_cfmws(cedt->buf, ms);
 
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, cedt->buf->data, cedt->buf->len);
-- 
MST


