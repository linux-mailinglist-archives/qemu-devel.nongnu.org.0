Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3584880CC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 03:05:05 +0100 (CET)
Received: from localhost ([::1]:44668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n616O-0002dZ-Va
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 21:05:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BX-0006D6-Hs
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BV-0002ol-UQ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LvT4ppWsVTNHwP1QDeBfIbJrLtF0WPUv8XlijE9OykM=;
 b=Jqm77Fk4kVS0k/XbgNEaT/SZ3wGtU+2kMIwiI+iBMILdndRZsVkmlVgZj5tWcPNhBnBnLH
 wYwLCjtkjLw7voWo/O7aNQgGAsN3NAXUXYOx8cq6boPQcqqi7GsftdEe1ktlVSZ59zD4IL
 GqrQDPIQxmyBN67ggm4cWiE2gBy3CIU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-9eFcm3F5N8SHoRLhH1IEfw-1; Fri, 07 Jan 2022 20:06:16 -0500
X-MC-Unique: 9eFcm3F5N8SHoRLhH1IEfw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j8-20020a05600c1c0800b00346504f5743so5606093wms.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LvT4ppWsVTNHwP1QDeBfIbJrLtF0WPUv8XlijE9OykM=;
 b=MomaCCkbMSugvuJ/gkczxkBXl4BgxXyoh3+ayyQq8HNfLCg9wS2n4VKPM19K75JR3N
 DO/2v4qshIeAurt4twN/sPEjS9N6Sse1BrPHt8ypDxLei+HJ/Kjte/0v5HwxQRR75RT0
 BUWJ3DikN4SRMobrBLKoVWZfcMeLm0JPKOfjxwr/89c+x68kOc+BbTowuxEAfabpLa0v
 5RXk8wIey0X5GImHpuqV7r4cMyBR0EZoHZGV2Rcd8AhBrfRvI9eg7HJaGNLDea5o2AJ9
 3/IweY8DDdmrnXsLuXVzRFv9y+oHqJAk7camn3Ck0N0a+c3BaP09boKo8VFWunQ1QVdz
 k0og==
X-Gm-Message-State: AOAM531dKIx5WzikPkvcBNcrNOM+brYVCjezAFL4YNvTQ3oAqFFZCOPu
 V2pWIwOIf1hErz/IU/TcLZ2C9oj5chC/Vj1+cH6tz6VmIGXUFd90rBGWc+TyKHjmwSw58lu9xnj
 sL7LHp4kctWrLN839ArMfQDbRCdtfCL4L/5YZ+v/mdIpBYJvYn2iP7KZvc1VV
X-Received: by 2002:adf:e88d:: with SMTP id d13mr56797721wrm.204.1641603975035; 
 Fri, 07 Jan 2022 17:06:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3JmhoFCsheImB69OJ4IvFONvTc86Rf90xiLyZtVri9NfrBSVxBhpAn4YvmLf2SmNhcwKjTQ==
X-Received: by 2002:adf:e88d:: with SMTP id d13mr56797707wrm.204.1641603974875; 
 Fri, 07 Jan 2022 17:06:14 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id h14sm221350wrz.31.2022.01.07.17.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:14 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 48/55] hw/i386/pc: Add missing property descriptions
Message-ID: <20220108003423.15830-49-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

When running "qemu-system-x86_64 -M pc,help" I noticed that some
properties were still missing their description. Add them now so
that users get at least a slightly better idea what they are all
about.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211206134255.94784-1-thuth@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 718ab81ba8..c8696ac01e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1759,15 +1759,23 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
         pc_machine_get_smbus, pc_machine_set_smbus);
+    object_class_property_set_description(oc, PC_MACHINE_SMBUS,
+        "Enable/disable system management bus");
 
     object_class_property_add_bool(oc, PC_MACHINE_SATA,
         pc_machine_get_sata, pc_machine_set_sata);
+    object_class_property_set_description(oc, PC_MACHINE_SATA,
+        "Enable/disable Serial ATA bus");
 
     object_class_property_add_bool(oc, PC_MACHINE_PIT,
         pc_machine_get_pit, pc_machine_set_pit);
+    object_class_property_set_description(oc, PC_MACHINE_PIT,
+        "Enable/disable Intel 8254 programmable interval timer emulation");
 
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
+    object_class_property_set_description(oc, "hpet",
+        "Enable/disable high precision event timer emulation");
 
     object_class_property_add_bool(oc, "default-bus-bypass-iommu",
         pc_machine_get_default_bus_bypass_iommu,
-- 
MST


