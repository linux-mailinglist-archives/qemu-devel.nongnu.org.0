Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA061672C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGI2-0002YD-FV; Wed, 02 Nov 2022 12:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGI1-0002Xq-1w
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGHz-00020a-9h
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NBEgnvyPuSubVpepgBU5LLBjdsEmlTwEplvXdoQGW9E=;
 b=fulHrn3kf/zMgL1EC8q3ehmnLvrH60wFpTI5TZp9staLuqrPtkrP95X8i6ThoxfhcYxvqU
 hXjYERfzXS2kjJrFGu2eDQUEB4aBdYbSQddPVbm+txTp2pCaOPPyFGEZ83EneP2G90NVb8
 lP/kFzxbhmRz+qkF2PnAUMVXndAiUm0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-07wlcLaSP5O0p3M5jhNTVg-1; Wed, 02 Nov 2022 12:08:24 -0400
X-MC-Unique: 07wlcLaSP5O0p3M5jhNTVg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so1246598wme.7
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBEgnvyPuSubVpepgBU5LLBjdsEmlTwEplvXdoQGW9E=;
 b=SV5zFWMMZlzMb2NgRrUG9/Jrgk/14/J5bucBVKX5oeHFHZqMK3p+tx2/mCCO6OrPP8
 SmGgwZztSqfAukJ0M6F4B1grS9TtKn2ouwSD5CA0ESgwLi/hibkYdTiZJMTxlnYfhpg9
 g4JwX+rhNgGodcTol4bfzBU6DYM1aXAqI76tpxbuonqulj66BvJlpRVJwm+Fa7G7Bx/y
 GDQAu46RMqmf5b1RE2GHToP74Z74s5pJUlxlOK5MFDMwPl/BCm/xBevFryFpYxtWqhXh
 Ld6YkbteTM3zWplJjatrvN8b42c2H6s/bO4troMGGp4pi1a/ZklphcgKOiudN48BPTR0
 vjog==
X-Gm-Message-State: ACrzQf1zN9qTquHn6mf2wAqhVXl5BihmNG6cQGyRGTHdhZXrUfWNfHqp
 lxQx/V9iXvF5THaWuAjxUaDq2FT9hbA8rNpOy5HfoZ4VborEOk0DCLT/OlhX9FxdNKCGkHI93cM
 g0AImykLcu4O8WfwvFgAwcATLqwTj5mzgPXccniaCCNNOIR1PO1SU/ZqsTuEf
X-Received: by 2002:a5d:5c0f:0:b0:236:c429:361a with SMTP id
 cc15-20020a5d5c0f000000b00236c429361amr12247349wrb.475.1667405303036; 
 Wed, 02 Nov 2022 09:08:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6I+uCeczOb6usdnBPMyoQYT3OHL8xQx4+gbLuZicrmNbySUurd6aaQcZxgxzXjS29XjRUGqw==
X-Received: by 2002:a5d:5c0f:0:b0:236:c429:361a with SMTP id
 cc15-20020a5d5c0f000000b00236c429361amr12247313wrb.475.1667405302664; 
 Wed, 02 Nov 2022 09:08:22 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 v2-20020a5d5902000000b0023677693532sm12765587wrd.14.2022.11.02.09.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:08:22 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 04/82] acpi/nvdimm: define macro for NVDIMM Device _DSM
Message-ID: <20221102160336.616599-5-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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


