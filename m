Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F158A6AFBE5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:14:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMV-0007Ih-N7; Tue, 07 Mar 2023 20:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMT-0007A6-PW
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMR-0001hJ-Ut
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mXazmb8yGfIFutAyjxdmizsN731JFjREXW9aEnmsoIQ=;
 b=HRGxqGkKAhWKCAg0DIak0t5JRMUXIG6+rSqNT1jToLQwlQqSaJFRqrSGP4t3oTislB1+3Y
 e0UFuABBc4wCXuWrsyDn9LjREwYPAxaGbThI7erWX/M8F9YLNn2LeJHtoJeqgTlZIkfn7y
 njc+X6+A1VqD9J6nA1mJzhxeo4oBIkc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-YB-1JxJ7O7G87s9jhQoAxg-1; Tue, 07 Mar 2023 20:12:54 -0500
X-MC-Unique: YB-1JxJ7O7G87s9jhQoAxg-1
Received: by mail-ed1-f72.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso21183715edu.17
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237972;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXazmb8yGfIFutAyjxdmizsN731JFjREXW9aEnmsoIQ=;
 b=scXyQdWRAmn3apWzxZMlif2KI5ubgny7Y8jxpj2gEnWtUUJdagh6UoYHP0UNQhu4gP
 UUhcPWN0Jy/OYxtCcFmp6whVGkYwiM/uwVOCgrASNrG7rrwdlxSj6ppmE3Bdz53p9l8+
 HZLsSn2Khklzjtl1569/RPvLBUvRPBYbNV+jbDDBPvfd1pdCvZrnQLTOEuj9tVYOhqFh
 eFceko4sJV/UwUNrMvKMbK9lPd3Gs94JJIzFBhE+mZe2FN5MqkIdGF9+9P+JYlHIS5Iz
 lVmGmOXbY8pTsMpkUP1XAg6UT6dVXnHX03mdlm3MWIjyxMapvsbkh10XPmc3LhkrJlNS
 YQtQ==
X-Gm-Message-State: AO0yUKVZy8tshOMDHoRcj730eUBWTA89I9Y8XD9IweYRoot9U23tlEXT
 Z8hngAMpQ4nalw1lvHA4GxdnJuyDHJ2tdUP4RnfCMitBbuOcYHA5L7IMcuHHqMiE7eTNWOELAdh
 +8uGHRi1G/N53Y2BxOa2RZ7dUeWs1sfPN28CFBNTgJ4QBlfHNekeNoFdGRlDtSDbs7qRl
X-Received: by 2002:a17:907:c24c:b0:8b1:293a:ef21 with SMTP id
 tj12-20020a170907c24c00b008b1293aef21mr16356265ejc.64.1678237972633; 
 Tue, 07 Mar 2023 17:12:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9jlAueE+OQvY9zVleU1xkFxoX+b7++UekU3pQ+1ZyN7jlut7UGsFw3kd4LYVfzEiDBwnYKpg==
X-Received: by 2002:a17:907:c24c:b0:8b1:293a:ef21 with SMTP id
 tj12-20020a170907c24c00b008b1293aef21mr16356244ejc.64.1678237972375; 
 Tue, 07 Mar 2023 17:12:52 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 d25-20020a1709064c5900b008b17de96f00sm6778740ejw.151.2023.03.07.17.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:51 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 40/73] pcihp: move PCI _DSM function 0 prolog into separate
 function
Message-ID: <0a4584fca3b255fb75437d8b95491533512ed515.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

it will be reused by follow up patches that will implement
static _DSM for non-hotpluggable devices.

no functional AML change, only context one, where 'cap' (Local1)
initialization is moved after UUID/revision checks.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-15-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 54 ++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c691104d47..d8ec91b8e3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -373,6 +373,33 @@ Aml *aml_pci_device_dsm(void)
     return method;
 }
 
+static void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar)
+{
+    Aml *UUID, *ifctx1;
+    uint8_t byte_list[1] = { 0 }; /* nothing supported yet */
+
+    aml_append(ctx, aml_store(aml_buffer(1, byte_list), retvar));
+    /*
+     * PCI Firmware Specification 3.1
+     * 4.6.  _DSM Definitions for PCI
+     */
+    UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
+    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(0), UUID)));
+    {
+        /* call is for unsupported UUID, bail out */
+        aml_append(ifctx1, aml_return(retvar));
+    }
+    aml_append(ctx, ifctx1);
+
+    ifctx1 = aml_if(aml_lless(aml_arg(1), aml_int(2)));
+    {
+        /* call is for unsupported REV, bail out */
+        aml_append(ifctx1, aml_return(retvar));
+    }
+    aml_append(ctx, ifctx1);
+}
+
+
 static void build_append_pcihp_notify_entry(Aml *method, int slot)
 {
     Aml *if_ctx;
@@ -570,14 +597,13 @@ static bool build_append_notfication_callback(Aml *parent_scope,
 
 static Aml *aml_pci_pdsm(void)
 {
-    Aml *method, *UUID, *ifctx, *ifctx1;
+    Aml *method, *ifctx, *ifctx1;
     Aml *ret = aml_local(0);
     Aml *caps = aml_local(1);
     Aml *acpi_index = aml_local(2);
     Aml *zero = aml_int(0);
     Aml *one = aml_int(1);
     Aml *func = aml_arg(2);
-    Aml *rev = aml_arg(1);
     Aml *params = aml_arg(4);
     Aml *bnum = aml_derefof(aml_index(params, aml_int(0)));
     Aml *sunum = aml_derefof(aml_index(params, aml_int(1)));
@@ -587,29 +613,9 @@ static Aml *aml_pci_pdsm(void)
     /* get supported functions */
     ifctx = aml_if(aml_equal(func, zero));
     {
-        uint8_t byte_list[1] = { 0 }; /* nothing supported yet */
-        aml_append(ifctx, aml_store(aml_buffer(1, byte_list), ret));
+        build_append_pci_dsm_func0_common(ifctx, ret);
+
         aml_append(ifctx, aml_store(zero, caps));
-
-       /*
-        * PCI Firmware Specification 3.1
-        * 4.6.  _DSM Definitions for PCI
-        */
-        UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
-        ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(0), UUID)));
-        {
-            /* call is for unsupported UUID, bail out */
-            aml_append(ifctx1, aml_return(ret));
-        }
-        aml_append(ifctx, ifctx1);
-
-        ifctx1 = aml_if(aml_lless(rev, aml_int(2)));
-        {
-            /* call is for unsupported REV, bail out */
-            aml_append(ifctx1, aml_return(ret));
-        }
-        aml_append(ifctx, ifctx1);
-
         aml_append(ifctx,
             aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
         /*
-- 
MST


