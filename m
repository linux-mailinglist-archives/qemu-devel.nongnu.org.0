Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A9361DC65
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:25:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMm6-0006ES-4N; Sat, 05 Nov 2022 13:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlr-0005vq-95
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMlo-0007GD-Gj
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vr1Y5Ue2DsD1Zo1HCdv3uKEJFz1/uay4tMw6YA67Sxk=;
 b=f+vEvA5V+76vPpMCv+aaqflrdAduoQ5hj9cQHtWSry/iGyQBla6v1Qp4UNu1lNSTETGtJH
 wdliX1oyjGxM6B71NxMQNjWwFuhZAUtwywGOeI8AkmXEhUBNht/xWXuWRP2NRXP9jcUtBY
 L3HThNdOPS7d5shBsFzKn1Wq3aJ3QQM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-246-UQSAVzI5PGO4Ocjij0OcEg-1; Sat, 05 Nov 2022 13:15:36 -0400
X-MC-Unique: UQSAVzI5PGO4Ocjij0OcEg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m17-20020a05600c3b1100b003cf9cc47da5so1749042wms.9
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vr1Y5Ue2DsD1Zo1HCdv3uKEJFz1/uay4tMw6YA67Sxk=;
 b=4eom4aHTyByJEqEPvlM+sejTnBCUbReIR0sx1T4kCt6OmQFQHQgwfjtE5HLMVyQ8cB
 joHfXiUDjymy4/UbkF6LPw83Zs3UHnP3Fhr38GAqXwJ3VuZ37AioYVILheu7Z1+kTaoR
 EIOGdsIQsZcTow8XBbAuE3K8i5g2JLbOTNnmGp5hsaxLR5qiEpq7S+gWPfTRqhPDTGqA
 aUhUkoQoEwPRbLQglxDuBaw/Y5dy7yOAOnn1HomrvkvYX3eL3lKB+TZPAtYF6dVLkT4O
 oYuYOjJUyWrju4AQyQmtRHJECHxQMHirI2WIy5L/+zznWifXvdfdsn5GLn+mENDnwmLd
 6Kmg==
X-Gm-Message-State: ACrzQf28L7cYEYEMfeHD/3K8cLnG7npxxl5LhfAxaPgFfHjw0NADjmjm
 aAdAECJUms3EiPF9qwqFtbChuwa5U6K5+P7t8LanQ8PTgmaE0MosqU9MBp7hrlMLjVuUzP2FNp9
 uEGB6Eu/Bdr2LtU2vR3rSKqFdK17D1yST55nIhRM20dZuKKkZk9aGnJ2P3JCl
X-Received: by 2002:a1c:27c6:0:b0:3c2:e6df:c79b with SMTP id
 n189-20020a1c27c6000000b003c2e6dfc79bmr36756135wmn.14.1667668534761; 
 Sat, 05 Nov 2022 10:15:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7u4cG0YqsNI8LpmdOFneAuuPZ9gRPsySkntGEEd8k69BrgIgUcZ3/Inm87np8yGG6IX9a3Yw==
X-Received: by 2002:a1c:27c6:0:b0:3c2:e6df:c79b with SMTP id
 n189-20020a1c27c6000000b003c2e6dfc79bmr36756117wmn.14.1667668534469; 
 Sat, 05 Nov 2022 10:15:34 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 v128-20020a1cac86000000b003a3170a7af9sm3116271wme.4.2022.11.05.10.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:15:34 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:15:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>, Jingqi Liu <jingqi.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v3 03/81] acpi/ssdt: Fix aml_or() and aml_and() in if clause
Message-ID: <20221105171116.432921-4-mst@redhat.com>
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


