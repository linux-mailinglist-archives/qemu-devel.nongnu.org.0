Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A4487787
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:18:10 +0100 (CET)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5oC9-0006xd-H0
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n41-0001Vr-Pc
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3y-0002Rm-UQ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LvT4ppWsVTNHwP1QDeBfIbJrLtF0WPUv8XlijE9OykM=;
 b=Uf/J6LovQATLzg2TkC2h9XuvDs6aqt0GcVrvZ8WHDb1EunMukTXRAVpD1QcLorBrd1jaJR
 jKaZLuBAbQB9yDFsHKmRS+AhyuIBXMCSp97MCo2XBC12kD84S7lXhfBJCm2ivgCrcbMNME
 o73W7VSzPin/BBYvyHS76LNs/QLvdSM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-EL5IghIOOXSmilT8qmp1ww-1; Fri, 07 Jan 2022 06:05:33 -0500
X-MC-Unique: EL5IghIOOXSmilT8qmp1ww-1
Received: by mail-wr1-f69.google.com with SMTP id
 i23-20020adfaad7000000b001a6320b66b9so264240wrc.15
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LvT4ppWsVTNHwP1QDeBfIbJrLtF0WPUv8XlijE9OykM=;
 b=Mexl0tBbDPjSj+B42Puf/e9A5J4d05CoOVVdQT26tNQKISiMLL0N/8e0KYQsH6K35B
 nmw9FuPMb+asUUDICJ77XsuCw5Lu4X1Uxuxug0CWRy2RQYrZ4kwpjvNS3CCR/DybD8iM
 kflSAkTRpT61u9j3LxpeRVJ+sHPcpc9r1nMTGQWoa1ZwuOdiLhBPXjgKHECsldQe7mt2
 Psj7EZyE5fpwow4O6n3tZ6++Vqq0PRgo9vGKIW/w0sMrtkYYa4AvUt7EVzlYMrY5qDhB
 HoSmPVKNVyDZaiBqK1Lg/zzrlwUpW3aBD9EedGeI3K6dzCXrHuXDwXem08CmMcAFkUJV
 aBlw==
X-Gm-Message-State: AOAM532mg4FCMF+JbkSwpE2uR7GPhb3WqGPD18nxgqdwdSh8HkBZNsmq
 spaBobc/WA9wffG7lUyYZ09q95h6wEjM6kYRC61QB+yYmevLjyrrHJxFCUA/FBSYJdYwP2YPnr9
 bNyO1W+W6h07rUTpU7/wsWDJ6lSRJ1K8SEnRZREeycpwSMKP+dcHBVlovv6ya
X-Received: by 2002:a7b:c146:: with SMTP id z6mr9707487wmi.6.1641553531846;
 Fri, 07 Jan 2022 03:05:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIGb0NbmAN5pv2UIRQEUSjh2upfz60t0DyslZTFh9KQmyh8PaKUegQBBZDCkEBqusZy8P/HA==
X-Received: by 2002:a7b:c146:: with SMTP id z6mr9707463wmi.6.1641553531604;
 Fri, 07 Jan 2022 03:05:31 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id 1sm5087327wry.33.2022.01.07.03.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:31 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 48/55] hw/i386/pc: Add missing property descriptions
Message-ID: <20220107102526.39238-49-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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


