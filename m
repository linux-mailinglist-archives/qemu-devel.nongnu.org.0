Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D79961DC60
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:24:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMm2-000646-Fq; Sat, 05 Nov 2022 13:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlr-0005vr-Aa
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlo-0007GM-GU
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NBEgnvyPuSubVpepgBU5LLBjdsEmlTwEplvXdoQGW9E=;
 b=UsDgGKHQVrQcDhrVfFcA3+I7Az7vjxT7Ll45qRJ1Dxi+ySnesusIDTIovT45NgLOkNPu/6
 WC+SkoGubq4oQRHjz3c85usRDE+8C4SthC6EwoHMUC8czBJ13LbO9pNqV9MSeOAhA3Ciov
 +Y+b1ql3HG9/sva0/2Ek9/9oF4a6Ruo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-UI-IdXIQNIaMr_wb1l1qjQ-1; Sat, 05 Nov 2022 13:15:39 -0400
X-MC-Unique: UI-IdXIQNIaMr_wb1l1qjQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so5235796wmb.5
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBEgnvyPuSubVpepgBU5LLBjdsEmlTwEplvXdoQGW9E=;
 b=tPbnSMG+zI8Cphhx++xbPnsQ3cWKtvXhzorNqOcDnTbLb+YnS4MAUm01fHU3d6oYg/
 S+v1OKoEX69Dt+B0QcvLqKLrwoEobrgHD/nn2WG73PSIuca/dAUZ1AWlVhaAIW0g8KUf
 UHmR1V79KSX3W4Edz+qivbAMqfIHTP9wMP2ZWdQn3mnTjmWgPt5o6ssjyDCy+906Ct7k
 89fa2Z7ukSw1dmcWPTpVtXTJuQo54Jj3WaVvDahuY4ZOugc7Q69ZrdS+fC+XeVwl4cG7
 CRqBZuna8OPe3DPxKXCG8hF/OhNn2a8PzESiObkDqjJ1dBsxC6vrOqaCxwKqsTF5eMmR
 fJdA==
X-Gm-Message-State: ACrzQf28jlx9SqVXGCBy/1fSL7J/OKfUl+j4W0QTpUOCfNxUldiXabuL
 5I9x9T81jYn+UEZGz1d7RtPW7wX0gIXBkMoxYcE42NEQqfi9FsG24ZrAEQR/mVE2HYuq4niuC9L
 6hE6NcgBt1evTWS2G9NEejbNAs5V53Bdx+IMgpYDOJFAyaUOIXm5Wtre19/24
X-Received: by 2002:a05:600c:6885:b0:3c2:9da1:5034 with SMTP id
 fn5-20020a05600c688500b003c29da15034mr27917555wmb.38.1667668537754; 
 Sat, 05 Nov 2022 10:15:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kJxtS7uaIno9E//xASWYWpNnEVgdaaXCZdK0aN1+z7PMVPJ8zF+cOdVUdhsBJ6e+NUwK7BQ==
X-Received: by 2002:a05:600c:6885:b0:3c2:9da1:5034 with SMTP id
 fn5-20020a05600c688500b003c29da15034mr27917540wmb.38.1667668537515; 
 Sat, 05 Nov 2022 10:15:37 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003c6c3fb3cf6sm3064814wml.18.2022.11.05.10.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:15:36 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:15:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 04/81] acpi/nvdimm: define macro for NVDIMM Device _DSM
Message-ID: <20221105171116.432921-5-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

Since it will be heavily used in next patch, define macro
NVDIMM_DEVICE_DSM_UUID for "4309AC30-0D11-11E4-9191-0800200C9A66", which is
NVDIMM device specific method uuid defined in NVDIMM _DSM interface spec,
Section 3. [1]

No functional changes in this patch.

[1] https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220922122155.1326543-4-robert.hu@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/nvdimm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 201317c611..afff911c1e 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -922,6 +922,7 @@ void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
 #define NVDIMM_DSM_RFIT_STATUS  "RSTA"
 
 #define NVDIMM_QEMU_RSVD_UUID   "648B9CF2-CDA1-4312-8AD9-49C4AF32BD62"
+#define NVDIMM_DEVICE_DSM_UUID  "4309AC30-0D11-11E4-9191-0800200C9A66"
 
 static void nvdimm_build_common_dsm(Aml *dev,
                                     NVDIMMState *nvdimm_state)
@@ -1029,8 +1030,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
                /* UUID for QEMU internal use */), expected_uuid));
     aml_append(elsectx, ifctx);
     elsectx2 = aml_else();
-    aml_append(elsectx2, aml_store(
-               aml_touuid("4309AC30-0D11-11E4-9191-0800200C9A66")
+    aml_append(elsectx2, aml_store(aml_touuid(NVDIMM_DEVICE_DSM_UUID)
                /* UUID for NVDIMM Devices */, expected_uuid));
     aml_append(elsectx, elsectx2);
     aml_append(method, elsectx);
-- 
MST


