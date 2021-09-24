Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48555417200
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:38:25 +0200 (CEST)
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkTA-0005cr-B3
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkJl-0004zQ-Gy
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkJg-0001Bb-LL
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zV/+gbkm4d7BwV7yMLMO09N1cp1rByLMV/FjLGpXdo=;
 b=cleMoc3wV75crHgrNNzDPd0MzkydjvVCWofywiwrpnDgN4kEhue0d1DOXMUPO1NPFmgifv
 64lqy+uo4/Vx7JMC3lRUavUoKU/OzG6CVWY7aPlT7WR2pFCm4zl8Gjkyc8h+4E4e2CtCbt
 aaIo9e25qsPpNHVhGwKSQHJS3ybWRqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-p1E1X5FxPQSs1zH-oUoFHQ-1; Fri, 24 Sep 2021 08:28:34 -0400
X-MC-Unique: p1E1X5FxPQSs1zH-oUoFHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 031C01922965;
 Fri, 24 Sep 2021 12:28:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B90662465;
 Fri, 24 Sep 2021 12:28:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/35] acpi: build_hmat: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Fri, 24 Sep 2021 08:27:36 -0400
Message-Id: <20210924122802.1455362-10-imammedo@redhat.com>
In-Reply-To: <20210924122802.1455362-1-imammedo@redhat.com>
References: <20210924122802.1455362-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ani@anisinha.ca, Eric Auger <eric.auger@redhat.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Also since acpi_table_begin() reserves space only for standard header
while previous acpi_data_push() reserved the header + 4 bytes field,
add 4 bytes 'Reserved' field into hmat_build_table_structs()
which didn have it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
---
 hw/acpi/hmat.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index edb3fd91b2..6913ebf730 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -200,6 +200,8 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
     HMAT_LB_Info *hmat_lb;
     NumaHmatCacheOptions *hmat_cache;
 
+    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+
     for (i = 0; i < numa_state->num_nodes; i++) {
         flags = 0;
 
@@ -256,14 +258,10 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
                 const char *oem_id, const char *oem_table_id)
 {
-    int hmat_start = table_data->len;
-
-    /* reserve space for HMAT header  */
-    acpi_data_push(table_data, 40);
+    AcpiTable table = { .sig = "HMAT", .rev = 2,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
+    acpi_table_begin(&table, table_data);
     hmat_build_table_structs(table_data, numa_state);
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + hmat_start),
-                 "HMAT", table_data->len - hmat_start, 2, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
-- 
2.27.0


