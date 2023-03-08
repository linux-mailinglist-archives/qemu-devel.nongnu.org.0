Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FB66AFC1C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:20:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNI-0001VQ-9q; Tue, 07 Mar 2023 20:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiN1-0000hT-72
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMx-0001rh-Tx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uqi1rrzUPnYKXVFI3/Tctah8op09lI3yLaNvKTATt4k=;
 b=PYwx1/p0fh5/l+Owlwj0ievJmUg+AxQkbFzTwGZsGfeMw+XZWhq35DdFywyFwvxhAEpboW
 E4f6Vr8goB55/srIB9ZB+eCz8eL/uh0mDABFoXivy4W9y+2q/AxxDuwJQAN43rIgVpGf0h
 i5Tk2cXVfB70RB79abEpDaI4l5mHTog=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-gA9-lDCxPtWudyaTRR7lxg-1; Tue, 07 Mar 2023 20:13:24 -0500
X-MC-Unique: gA9-lDCxPtWudyaTRR7lxg-1
Received: by mail-ed1-f71.google.com with SMTP id
 ec11-20020a0564020d4b00b004e2cb85c8bcso12390434edb.16
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238003;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uqi1rrzUPnYKXVFI3/Tctah8op09lI3yLaNvKTATt4k=;
 b=FriiopwlpA2k4yss1EETWL8UXBaRmGOONDnn8kQ8B0v+ww1O9FrMR89F6Yj0AyLp+A
 5XIlHfVNURH1017axvcewoZvdwCijaMZ2tDfHGRoM5yFJK4tW8oPbfkvAqy6T1jFROw4
 2t0BRWZ+ACl2iPPGC8YvVdPZ+9Wvsi33PJydhBu54wVLgwuxmv91bxAqaXIiad1z3333
 ii6XkQZrJiQzjgQqvcGkYbXdwIm0nOJA9oO0ZySqPP4zgYJRNOXLVXXIpJqgueAlHdZ0
 aB/mUwjofKc9oMjC00WTLLs9diNiElqbbBaPAPpSK+0Wns9gmNxEMO/NXcb19GUkMv4c
 unlQ==
X-Gm-Message-State: AO0yUKXDVOgqfKPN1b3HAmdKduU0/a/GsqwiiTT2JANB9YEvKJEximv9
 ZevDLlIY6JOS3rUA4224NXcVR9O5QywFnyfYJiBJiFIPhP85WY+Y6voAva3rKmxYtbw7zApzwMB
 Wu5nZAkSYQnulQKbgjq4bM2W9KBozvYVTUSZPoo8JV1VuGbv1mSIYmnn5+P5+wHdxP1/t
X-Received: by 2002:a17:907:9b03:b0:8f0:9566:c1ff with SMTP id
 kn3-20020a1709079b0300b008f09566c1ffmr17493610ejc.69.1678238003236; 
 Tue, 07 Mar 2023 17:13:23 -0800 (PST)
X-Google-Smtp-Source: AK7set/gD0CvcNpgs38R5f24AQLz8rdDdHsjJ5O+GsldOxrw+WlfhechauuTc7bnnHsl05DXAczksw==
X-Received: by 2002:a17:907:9b03:b0:8f0:9566:c1ff with SMTP id
 kn3-20020a1709079b0300b008f09566c1ffmr17493593ejc.69.1678238002937; 
 Tue, 07 Mar 2023 17:13:22 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 o18-20020a170906769200b008dedf1359a0sm6784280ejm.104.2023.03.07.17.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:22 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 50/73] acpi: pci: describe all functions on populated slots
Message-ID: <05a49b9c2fbe79661ac185aa4389ab250e2d689a.1678237635.git.mst@redhat.com>
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

describing all present devices on functions other than
0 was complicated when non hotplug and hotplug code
was intermixed. So QEMU has been excluding non zero
functions since they are not supported by hotplug code,
then a condition to whitelist coldplugged bridges was
added and later whitelisting of devices that advertise
presence of their own AML description.

With non hotplug and hotplug code separated, it is
possible to relax rules and allow describing all
non-hotpluggble functions and hence simplify
conditions whether PCI device should be enumerated by
generic (non-hotplug) code.

Price of that simplification is an extra few Device()
descriptors in DSDT exposing built-in chipset functions,
which has no functional effect on guest side.

Apart from that, the enumeration of non zero functions,
allows to attach more NICs with acpi-index enabled
directly on hostbridge (if hotplug is not required).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-25-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 46f78e9338..8e2481fe5e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -494,12 +494,6 @@ static bool is_devfn_ignored_generic(const int devfn, const PCIBus *bus)
             if (DEVICE(pdev)->hotplugged) {
                 return true;
             }
-        } else if (!get_dev_aml_func(DEVICE(pdev))) {
-            /*
-             * Ignore all other devices on !0 functions unless they
-             * have AML description (i.e have get_dev_aml_func() != 0)
-             */
-            return true;
         }
     }
     return false;
-- 
MST


