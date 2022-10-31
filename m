Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5AF613705
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUFt-0000ZU-Gp; Mon, 31 Oct 2022 08:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFn-0000Jn-N5
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFm-0002DL-7x
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vr1Y5Ue2DsD1Zo1HCdv3uKEJFz1/uay4tMw6YA67Sxk=;
 b=CeqUbJkxJ8Ge2eKCmwbrDRNcfrW6ZICBXLMSFKN8Sqkk6Gsk0ZzsWOCNgf5j69Cc+ubXtc
 35jmEz0MQmqakXlpZLHUS1Ihd4pysBDncoDNgaY/yCt20SjgUX0r6OV+ifH2hntEEJA8q/
 49glwuDU+7lhNLYS2zLf3y/ptGh1p2g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-gzFyTC37NFKQL9afNRsXcQ-1; Mon, 31 Oct 2022 08:50:56 -0400
X-MC-Unique: gzFyTC37NFKQL9afNRsXcQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u13-20020adfa18d000000b00236566b5b40so3017041wru.9
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vr1Y5Ue2DsD1Zo1HCdv3uKEJFz1/uay4tMw6YA67Sxk=;
 b=f+Q8IeMPFbW9wtZHuuLyTHU/Kl0TfGk0ZGRt8Eoy7AtMJmeHmlf3RAsBIj+6mbIYo+
 twqU6CKZszR352liptS7B7fN8J7HQIhyEv0vkBsEJwL7KitxwsW8aGNMaHJfHoj37CiV
 oSUNPr8S/MyDo6eQMXQ7AmXvl+RUI/TC+q2kVOwZWR96Kb4PUhn28fAdQxTp93bwB+fv
 pnVXIt+0w4cPQGwMjF59GRqv42lXn0tDdYAHRgiYM+6987742QakMyYcITfmoMWXYnW+
 kqc6oXyL95zIuxAwGlFrbrepGY/jiU4p6qS8M56UAJJOoHLDoxM05lg8zzfWL1RO1HZo
 OH/Q==
X-Gm-Message-State: ACrzQf0u5GnC7+VMuk24xl3IQd+n3OoR1fcxrTY4oIZ7lVmJA0fqryjr
 cBZgPN0SdVA2k6sMM2OM5zJub66Q6FgMaYLJeG2jNRW5bwHVC1vtRZJRA6oAyHPjyKTOSYDaukY
 L8KvmailDSwhXJjk0RknL3kTwZbOeKmcZmripM/A6YHCy6/8jughps8BeGG7Y
X-Received: by 2002:a05:600c:4f4d:b0:3c8:32c7:db11 with SMTP id
 m13-20020a05600c4f4d00b003c832c7db11mr7812224wmq.143.1667220655170; 
 Mon, 31 Oct 2022 05:50:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Bfmqy2LfPVK1b/iz8RqyGXVaLGzy9WcWKzoJc9dyGMzwWqwdFjas6C070vtjThZFjFVqcAw==
X-Received: by 2002:a05:600c:4f4d:b0:3c8:32c7:db11 with SMTP id
 m13-20020a05600c4f4d00b003c832c7db11mr7812198wmq.143.1667220654824; 
 Mon, 31 Oct 2022 05:50:54 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bd26-20020a05600c1f1a00b003c6b70a4d69sm7174209wmb.42.2022.10.31.05.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:50:54 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:50:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>, Jingqi Liu <jingqi.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 04/86] acpi/ssdt: Fix aml_or() and aml_and() in if clause
Message-ID: <20221031124928.128475-5-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


