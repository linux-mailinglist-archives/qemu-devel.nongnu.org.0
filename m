Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F34961DC52
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:16:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMm4-00068m-1n; Sat, 05 Nov 2022 13:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlr-0005vs-JQ
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlo-0007GS-Gy
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHcLFrjd1DfA6XFg8BR0z1pq4IUlwt9atAyip6cgC1A=;
 b=fKzI+pC7zpx82FGnFDgDig9fOw6qr95lqmfoxSyszMzw4kQejCTK3VxzmwZZz7fr8Yi5W8
 2nvctG3xVXfDcyeCy9QlEy3u5V/OiJseV6w/6qbfBicDk7bOoYDCCmCYyisysZ3hekXlqg
 jGS+VOPxFV33tQXLLnBNyMA/XeaCduU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-j_fJZuRbOsy1BKyROKPOmw-1; Sat, 05 Nov 2022 13:15:42 -0400
X-MC-Unique: j_fJZuRbOsy1BKyROKPOmw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r206-20020a1c44d7000000b003cf9bd60855so424544wma.6
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHcLFrjd1DfA6XFg8BR0z1pq4IUlwt9atAyip6cgC1A=;
 b=hIq6/0pAtZKBUbXOa9XqnXs4veYC4VMiFtUWGjtAObxDcpJgLzaVmEQldZBIT22VAX
 IpO16oV3pIWN/2eOkybnFiFKc4Qo7JttjMGkBQUIl+idEUEvwzJvPvS9U1GThQJRFJY3
 Z7WCCSXfT92+n7alqAkPikZ1lFf0UuOYvcJNyYWFGmJqC8KlMqU/7AMj3CWe4o8TKS+I
 P6FdoO5tmIGfOsGuv0m7xlZ6OjUmuW6he7gWNsZZ8uWrSwtQnHx00pBMS4bv2S6d4AX5
 pt/Lfko7znMT+YViuXb9mnkDZmE85NosHAR4gOrI13eITi4ySCwfeIuSp4YTu1E5hFU2
 95iw==
X-Gm-Message-State: ACrzQf3VWlBvbiBI8gEnlO6mnTR9QdK5velgQaoZte7QgbdPxlAo2/0y
 ir1Vz1YkGIQBJB7e4gpgNWq0PmYwMZBiQAl46Zk7sypyi+gBr76tAHNpCMAGdYjJS5obw+/X98u
 Q+hak64Bjv4aHtH/Vy3qebfPlDJUxxUZfafq91OPcfUCffum1eaVYQuDExw+b
X-Received: by 2002:adf:de8e:0:b0:236:ea40:47ef with SMTP id
 w14-20020adfde8e000000b00236ea4047efmr15474258wrl.519.1667668540772; 
 Sat, 05 Nov 2022 10:15:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7skedmaNRXDMcE9NZqeZ9NnPNHFuQqZgsagniV7fX5XIrmbi1NxgNz1ld0K+mvgyYWvs8/0A==
X-Received: by 2002:adf:de8e:0:b0:236:ea40:47ef with SMTP id
 w14-20020adfde8e000000b00236ea4047efmr15474243wrl.519.1667668540456; 
 Sat, 05 Nov 2022 10:15:40 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 bq21-20020a5d5a15000000b00231ed902a4esm2681728wrb.5.2022.11.05.10.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:15:39 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:15:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 05/81] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
Message-ID: <20221105171116.432921-6-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Robert Hoo <robert.hu@linux.intel.com>

Recent ACPI spec [1] has defined NVDIMM Label Methods _LS{I,R,W}, which
deprecates corresponding _DSM Functions defined by PMEM _DSM Interface spec
[2].

Since the semantics of the new Label Methods are almost same as old _DSM
methods, the implementations here simply wrapper old ones.

ASL form diff can be found in next patch of updating golden master
binaries.

[1] ACPI Spec v6.4, 6.5.10 NVDIMM Label Methods
https://uefi.org/sites/default/files/resources/ACPI_Spec_6_4_Jan22.pdf
[2] Intel PMEM _DSM Interface Spec v2.0, 3.10 Deprecated Functions
https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Message-Id: <20220922122155.1326543-5-robert.hu@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/nvdimm.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index afff911c1e..a3b25a92f3 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -1243,6 +1243,7 @@ static void nvdimm_build_fit(Aml *dev)
 static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
 {
     uint32_t slot;
+    Aml *method, *pkg, *field, *com_call;
 
     for (slot = 0; slot < ram_slots; slot++) {
         uint32_t handle = nvdimm_slot_to_handle(slot);
@@ -1260,6 +1261,100 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
          */
         aml_append(nvdimm_dev, aml_name_decl("_ADR", aml_int(handle)));
 
+        /*
+         * ACPI v6.4: Section 6.5.10 NVDIMM Label Methods
+         */
+        /* _LSI */
+        method = aml_method("_LSI", 0, AML_SERIALIZED);
+        com_call = aml_call5(NVDIMM_COMMON_DSM,
+                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
+                            aml_int(1), aml_int(4), aml_int(0),
+                            aml_int(handle));
+        aml_append(method, aml_store(com_call, aml_local(0)));
+
+        aml_append(method, aml_create_dword_field(aml_local(0),
+                                                  aml_int(0), "STTS"));
+        aml_append(method, aml_create_dword_field(aml_local(0), aml_int(4),
+                                                  "SLSA"));
+        aml_append(method, aml_create_dword_field(aml_local(0), aml_int(8),
+                                                  "MAXT"));
+
+        pkg = aml_package(3);
+        aml_append(pkg, aml_name("STTS"));
+        aml_append(pkg, aml_name("SLSA"));
+        aml_append(pkg, aml_name("MAXT"));
+        aml_append(method, aml_store(pkg, aml_local(1)));
+        aml_append(method, aml_return(aml_local(1)));
+
+        aml_append(nvdimm_dev, method);
+
+        /* _LSR */
+        method = aml_method("_LSR", 2, AML_SERIALIZED);
+        aml_append(method, aml_name_decl("INPT", aml_buffer(8, NULL)));
+
+        aml_append(method, aml_create_dword_field(aml_name("INPT"),
+                                                  aml_int(0), "OFST"));
+        aml_append(method, aml_create_dword_field(aml_name("INPT"),
+                                                  aml_int(4), "LEN"));
+        aml_append(method, aml_store(aml_arg(0), aml_name("OFST")));
+        aml_append(method, aml_store(aml_arg(1), aml_name("LEN")));
+
+        pkg = aml_package(1);
+        aml_append(pkg, aml_name("INPT"));
+        aml_append(method, aml_store(pkg, aml_local(0)));
+
+        com_call = aml_call5(NVDIMM_COMMON_DSM,
+                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
+                            aml_int(1), aml_int(5), aml_local(0),
+                            aml_int(handle));
+        aml_append(method, aml_store(com_call, aml_local(3)));
+        field = aml_create_dword_field(aml_local(3), aml_int(0), "STTS");
+        aml_append(method, field);
+        field = aml_create_field(aml_local(3), aml_int(32),
+                                 aml_shiftleft(aml_name("LEN"), aml_int(3)),
+                                 "LDAT");
+        aml_append(method, field);
+        aml_append(method, aml_name_decl("LSA", aml_buffer(0, NULL)));
+        aml_append(method, aml_to_buffer(aml_name("LDAT"), aml_name("LSA")));
+
+        pkg = aml_package(2);
+        aml_append(pkg, aml_name("STTS"));
+        aml_append(pkg, aml_name("LSA"));
+
+        aml_append(method, aml_store(pkg, aml_local(1)));
+        aml_append(method, aml_return(aml_local(1)));
+
+        aml_append(nvdimm_dev, method);
+
+        /* _LSW */
+        method = aml_method("_LSW", 3, AML_SERIALIZED);
+        aml_append(method, aml_store(aml_arg(2), aml_local(2)));
+        aml_append(method, aml_name_decl("INPT", aml_buffer(8, NULL)));
+        field = aml_create_dword_field(aml_name("INPT"),
+                                                  aml_int(0), "OFST");
+        aml_append(method, field);
+        field = aml_create_dword_field(aml_name("INPT"),
+                                                  aml_int(4), "TLEN");
+        aml_append(method, field);
+        aml_append(method, aml_store(aml_arg(0), aml_name("OFST")));
+        aml_append(method, aml_store(aml_arg(1), aml_name("TLEN")));
+
+        aml_append(method, aml_concatenate(aml_name("INPT"), aml_local(2),
+                                            aml_name("INPT")));
+        pkg = aml_package(1);
+        aml_append(pkg, aml_name("INPT"));
+        aml_append(method, aml_store(pkg, aml_local(0)));
+        com_call = aml_call5(NVDIMM_COMMON_DSM,
+                            aml_touuid(NVDIMM_DEVICE_DSM_UUID),
+                            aml_int(1), aml_int(6), aml_local(0),
+                            aml_int(handle));
+        aml_append(method, aml_store(com_call, aml_local(3)));
+        field = aml_create_dword_field(aml_local(3), aml_int(0), "STTS");
+        aml_append(method, field);
+        aml_append(method, aml_return(aml_name("STTS")));
+
+        aml_append(nvdimm_dev, method);
+
         nvdimm_build_device_dsm(nvdimm_dev, handle);
         aml_append(root_dev, nvdimm_dev);
     }
-- 
MST


