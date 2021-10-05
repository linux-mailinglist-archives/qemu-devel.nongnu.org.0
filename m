Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F09422EB2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:04:57 +0200 (CEST)
Received: from localhost ([::1]:43302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXns8-0003bP-1L
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvx-0002RC-5c
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvv-0007ca-Dx
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OBdD4BTsDqZ+kiWNNePrFOaPe7shpwKkuU8DhGPxYvA=;
 b=iyaPr66FdhtxKOp8+nILsk8KOG0jjpnwTmxs74HJJ2p0JVm0Js+yLSAzwKOSmKwqT+tBXF
 NayUXB5VJzn6/yL1tnxJwe43f4TFqiLCgK1WHHm+Hush7VThafPOFIsukXlOtt2nf00gDW
 bbp2+E3Uzou5z81bl/qkwfH5deSjvZk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-5obmGbNHMiaTRc44bAtShA-1; Tue, 05 Oct 2021 12:04:45 -0400
X-MC-Unique: 5obmGbNHMiaTRc44bAtShA-1
Received: by mail-wr1-f69.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so5925863wrh.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OBdD4BTsDqZ+kiWNNePrFOaPe7shpwKkuU8DhGPxYvA=;
 b=Kjg9F1TtFcDDMJiWMa42Hqi9fYx6xuS1iAV8YqCrrVCJuVccardKNzE1Yuv7lAuV1x
 W+6CZ0TdKhf7FMOf55qbeDY/PoDfXgEIVfPVTn9hJ50gfFkyEMJCxnerjXSw2tG4ZLiQ
 mM5RmC4zIcQ/inx9iVci7PqRiNXP32JZTx29nh4okbLNdRZjLQ1XCQ0wnyUVbt0xTyFF
 LvYl2EWweLWS52htHT5rTUNYYnyGLXddkXL/1lO2YOOB2JJVPoROigWeASbh4u6TrSS9
 OMCm11g7Yp36d7qWKumbnfezJYGkWowaVHw5nSuMe/Bh9xJMPFi6GHAjEIMy6O0OreRX
 Z00g==
X-Gm-Message-State: AOAM533yKgK+y5/iJJnQSKTfzm1kfaDcUt3rRJVaJ2eJYrwhuoOX185R
 6LB2RlYapXBFFgC5GiA+asS1v0PGo53PFK+Xv4iW+galQnii+zEe9Rc8Pivp+EJRI1ty7yzjxPh
 yniW7ExRWHDikwDb5T/d8UX2o4J5BC8KcohkBlL1I1oIXdCna/uozxY3ur7cd
X-Received: by 2002:adf:b19c:: with SMTP id q28mr22689949wra.348.1633449884001; 
 Tue, 05 Oct 2021 09:04:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+58O7IBu5nWgU/3KFkuRVy+jRco78nGALhIQdDb03zLkrwFJdF61w7+07Ia8Ot+z1O6TkGw==
X-Received: by 2002:adf:b19c:: with SMTP id q28mr22689892wra.348.1633449883571; 
 Tue, 05 Oct 2021 09:04:43 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id m14sm2289062wmi.47.2021.10.05.09.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:42 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 54/57] nvdimm: release the correct device list
Message-ID: <20211005155946.513818-55-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Message-Id: <20210624110415.187164-1-lizhijian@cn.fujitsu.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/nvdimm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 5f9b552d6a..0d43da19ea 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -339,10 +339,10 @@ nvdimm_build_structure_caps(GArray *structures, uint32_t capabilities)
 
 static GArray *nvdimm_build_device_structure(NVDIMMState *state)
 {
-    GSList *device_list = nvdimm_get_device_list();
+    GSList *device_list, *list = nvdimm_get_device_list();
     GArray *structures = g_array_new(false, true /* clear */, 1);
 
-    for (; device_list; device_list = device_list->next) {
+    for (device_list = list; device_list; device_list = device_list->next) {
         DeviceState *dev = device_list->data;
 
         /* build System Physical Address Range Structure. */
@@ -357,7 +357,7 @@ static GArray *nvdimm_build_device_structure(NVDIMMState *state)
         /* build NVDIMM Control Region Structure. */
         nvdimm_build_structure_dcr(structures, dev);
     }
-    g_slist_free(device_list);
+    g_slist_free(list);
 
     if (state->persistence) {
         nvdimm_build_structure_caps(structures, state->persistence);
@@ -1333,9 +1333,9 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
 
 void nvdimm_build_srat(GArray *table_data)
 {
-    GSList *device_list = nvdimm_get_device_list();
+    GSList *device_list, *list = nvdimm_get_device_list();
 
-    for (; device_list; device_list = device_list->next) {
+    for (device_list = list; device_list; device_list = device_list->next) {
         DeviceState *dev = device_list->data;
         Object *obj = OBJECT(dev);
         uint64_t addr, size;
@@ -1348,7 +1348,7 @@ void nvdimm_build_srat(GArray *table_data)
         build_srat_memory(table_data, addr, size, node,
                           MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
     }
-    g_slist_free(device_list);
+    g_slist_free(list);
 }
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-- 
MST


