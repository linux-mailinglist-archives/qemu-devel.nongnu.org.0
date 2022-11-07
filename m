Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED462028C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:48:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAuF-0006F0-9w; Mon, 07 Nov 2022 17:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAuC-0006Ep-H3
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAuB-0001Ud-3z
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vr1Y5Ue2DsD1Zo1HCdv3uKEJFz1/uay4tMw6YA67Sxk=;
 b=iOY1DHbwjcr36fMs+U3sCP2Q+yISTo4wvwxcunkoU3gCoRy0s6sgxRASgnEDxl66NsIVHS
 JNnmcwdbLcoAhynqHINAlsabcg4HmZZve8IRbZy/uH8EsHeksyg+6aeNH2Yg/eA1MTvqND
 QeISXgiSrdltrHErmy09kwOqZh+fPFc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-5yn8rBLQN_KmBva5UC0t2A-1; Mon, 07 Nov 2022 17:47:45 -0500
X-MC-Unique: 5yn8rBLQN_KmBva5UC0t2A-1
Received: by mail-qk1-f198.google.com with SMTP id
 w4-20020a05620a444400b006fa24b2f394so11372046qkp.15
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vr1Y5Ue2DsD1Zo1HCdv3uKEJFz1/uay4tMw6YA67Sxk=;
 b=JAvAQqpd49yq53s9nHwE1QJWukChvn6LmS3xztQXZ/glkEbzW7scwJGv3SUmq7VK25
 WvbG9C1a+C07i+xUP9fMcia1+9RWKnprnQpbkp+gMpnmELX8A3CiGst5F/8+67QJs/5r
 dKf93L5LyEj9QvEKj7lOTR6c1QKESX+jfqGxYmXKdp6OtO1dK5F0xv0sH5dYGK4E+yjo
 u/pzFKsCkTSeJ7HxVAT/bgI8Gf5dJ4KF6tbnuy8okS6kvj4RQMEwQwFOVEvp1O3YDEZu
 9QNUUu/PVYgxzoxuAlJhWZi9HTE5IOF/kPUFUEfhB2tAqyjxzZBMp6UxFlPqGG1kbkop
 sOmQ==
X-Gm-Message-State: ACrzQf1lLEUDaUm3wFnWicJhmLkyEApw93sF6IViF3na+UL7ZCxX+5ir
 HWHBR7mUbMD0cXqMTKFzpE5BkxEWbPfA/7eYIS+Koi3P51LBYHy1Wc+Xybg9DQhtOe3B2e3V/HD
 sdLNHLAP0JXORdve8IB8GyS6oIS9puNFtLm2H6KUu/6D72N7ITkep2kxxGs2B
X-Received: by 2002:a05:622a:1dc9:b0:3a5:2980:d5bf with SMTP id
 bn9-20020a05622a1dc900b003a52980d5bfmr32548204qtb.28.1667861264857; 
 Mon, 07 Nov 2022 14:47:44 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7cryIpdWtcAByInByck4lHjnXFRhksiz+4DBWfWGTZTX+jI5aIUNB9qJHy0fyyhSdj1vlRsw==
X-Received: by 2002:a05:622a:1dc9:b0:3a5:2980:d5bf with SMTP id
 bn9-20020a05622a1dc900b003a52980d5bfmr32548186qtb.28.1667861264561; 
 Mon, 07 Nov 2022 14:47:44 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 l17-20020a05620a28d100b006b615cd8c13sm7949774qkp.106.2022.11.07.14.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:47:44 -0800 (PST)
Date: Mon, 7 Nov 2022 17:47:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>, Jingqi Liu <jingqi.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 03/83] acpi/ssdt: Fix aml_or() and aml_and() in if clause
Message-ID: <20221107224600.934080-4-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Robert Hoo <robert.hu@linux.intel.com>

In If condition, using bitwise and/or, rather than logical and/or.

The result change in AML code:

If (((Local6 == Zero) | (Arg0 != Local0)))
==>
If (((Local6 == Zero) || (Arg0 != Local0)))

If (((ObjectType (Arg3) == 0x04) & (SizeOf (Arg3) == One)))
==>
If (((ObjectType (Arg3) == 0x04) && (SizeOf (Arg3) == One)))

Fixes: 90623ebf603 ("nvdimm acpi: check UUID")
Fixes: 4568c948066 ("nvdimm acpi: save arg3 of _DSM method")
Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220922122155.1326543-3-robert.hu@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/nvdimm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 31e46df0bd..201317c611 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -1037,7 +1037,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
 
     uuid_invalid = aml_lnot(aml_equal(uuid, expected_uuid));
 
-    unsupport = aml_if(aml_or(unpatched, uuid_invalid, NULL));
+    unsupport = aml_if(aml_lor(unpatched, uuid_invalid));
 
     /*
      * function 0 is called to inquire what functions are supported by
@@ -1069,10 +1069,9 @@ static void nvdimm_build_common_dsm(Aml *dev,
      * in the DSM Spec.
      */
     pckg = aml_arg(3);
-    ifctx = aml_if(aml_and(aml_equal(aml_object_type(pckg),
+    ifctx = aml_if(aml_land(aml_equal(aml_object_type(pckg),
                    aml_int(4 /* Package */)) /* It is a Package? */,
-                   aml_equal(aml_sizeof(pckg), aml_int(1)) /* 1 element? */,
-                   NULL));
+                   aml_equal(aml_sizeof(pckg), aml_int(1)) /* 1 element? */));
 
     pckg_index = aml_local(2);
     pckg_buf = aml_local(3);
-- 
MST


