Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17464616732
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:10:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGI4-0002YE-6V; Wed, 02 Nov 2022 12:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGI0-0002Xk-Nx
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGHz-00020Y-9A
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vr1Y5Ue2DsD1Zo1HCdv3uKEJFz1/uay4tMw6YA67Sxk=;
 b=jKe24pZkWp7bVvj9OpoGU9g1rRDd44aqN+PW0dfnO/fbRcV5uAhNmMt8DkUjpn6Cl0XJfJ
 vJFwE1hTvVwbg6t4gZBfUxAKiU8CnhJi0oO9NncMetTmVUn7reImsfHcLrgHYusY/YYydI
 vud3P3YaiSsz1jGJbIqgK4LytR02qP0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-Ep1VrVRcNKe3kImjDxUCkQ-1; Wed, 02 Nov 2022 12:08:21 -0400
X-MC-Unique: Ep1VrVRcNKe3kImjDxUCkQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so5053796wra.23
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vr1Y5Ue2DsD1Zo1HCdv3uKEJFz1/uay4tMw6YA67Sxk=;
 b=WQyAxT6gG7DVC/CpLIQAHUiZmw8C/EY/1PafE17Qhc7iSJTSulbDWtR9E+yy44UAPQ
 yveLl61H3b/dNy8MuRiVFl+BB7q84w1DH3Yx6MRsTlhHy3B/5huGrL3rJxURQLkRlDya
 WSVMCJhU1vwntmCl/zi7QVdOjdUsGf36QZzhQAZsppG/jnGj62liRvWyTILSQSkEfXsZ
 ZOeV7tgyGh+mLPOHAURi5czvcOiQigKvGUgJL3ug3no1HeeWkeCZ2x/K14C2svl4RN1z
 k0pnp8m19vS+2STreXMone95wsbcT26kpd73hfQwDOD6bE7fJjui+z/RUhyK/XQiZUT3
 hX1w==
X-Gm-Message-State: ACrzQf3/jssNVgIrKj+n3884Cci1Ia+XhVdIi+r/J/5S9AMlqw6H0kvz
 o97+oJToZQuaHoq8gmMSatVC6jHJPuliYuA7Hq+1KBtFhTbZPT9m+OlmOmrvWX/JAecapI/+jvZ
 z5Q1BH21MZkqh/M0zoOXrIN0EdMWcc8sHm9fPbE2rGXbsgt4N6+T9/A1QngsU
X-Received: by 2002:a05:600c:1614:b0:3cf:816e:4a69 with SMTP id
 m20-20020a05600c161400b003cf816e4a69mr5782969wmn.33.1667405300033; 
 Wed, 02 Nov 2022 09:08:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SkRRWmsRpsGt7M6wmNImm9p6nTPgfTyggQu289LQ7Kezli4B3MpXYA4aYkDpy3mKQg0+vuA==
X-Received: by 2002:a05:600c:1614:b0:3cf:816e:4a69 with SMTP id
 m20-20020a05600c161400b003cf816e4a69mr5782933wmn.33.1667405299661; 
 Wed, 02 Nov 2022 09:08:19 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 l15-20020a5d480f000000b002366eb01e07sm13160701wrq.114.2022.11.02.09.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:08:19 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>, Jingqi Liu <jingqi.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 03/82] acpi/ssdt: Fix aml_or() and aml_and() in if clause
Message-ID: <20221102160336.616599-4-mst@redhat.com>
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


