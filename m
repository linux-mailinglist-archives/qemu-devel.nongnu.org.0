Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3444B6EDD1E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:49:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDPc-0004GE-Ml; Tue, 25 Apr 2023 03:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNi-0001UF-Ao
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNg-0006sN-IZ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NMtY4B3CUEsIScWMVfi1qUKQMVTCD7QWE7ao8AyIg/g=;
 b=MtabJynQeZcp7aBEeW1vwUTQC2QVANm+drdNb5PNG6U/fr0qcyBqznWXUxCfA3gG9lCVEi
 +vO0pTtyGSv4o687HXKeva6XFsiMK9HqND3pPLqR/zSMvf4ZkxTq/r50TdgSJ9449bg0Hn
 h/7+Luqqb7LDhm0rTQZ2yEO6RgZnPC8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-akDCFo1INkC9DXCl9U8zfQ-1; Tue, 25 Apr 2023 03:46:29 -0400
X-MC-Unique: akDCFo1INkC9DXCl9U8zfQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f16fa91923so29673805e9.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408787; x=1685000787;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMtY4B3CUEsIScWMVfi1qUKQMVTCD7QWE7ao8AyIg/g=;
 b=cGfUCiSbilTQ2m9ZNbIDAjk8FpC53oUaG1zWM+2oN1QzDy2end0SNBKC1XNTgqGeEi
 OszMPljZ/jiQD2dmsfrXn9vk5kY3CITHb6RAA876Hrf08FRfvijPgoIRUKR2kV/MzWEw
 8KPu6XLQCSJHlwHlHJ85BanoeZF5A8So0i/BeCwKJdrgpurz0Q032Le58Ophj/VpHh2x
 9/3P7OTH/QbLr8MAtJvdoG9I1tCSch0KI/yulph3XMswl8Mu57pRo/ZnXPAOZuYZHcJM
 ZY992KReaDIWhdDH+/H03CITL1JgGn2kZBD4W2/94VStjkFXR9GDFxQsgMpqjhpaWe3A
 zzAw==
X-Gm-Message-State: AAQBX9fHsDHI5upz84HLIISgCMr4QTfFTNjjsy94XxGy/SXq9449622G
 sniCaKWbGj4CToPCD5J3iQRw5y+CowT6ctq4xCR0KTJAyazY44MdA1kmaYbMt9yglMKYN04RH/X
 osRh2ac/P8Z8ZHlJJ5QhkKxuxRvmsrT3rBZsfQ+rzYjdCmw/3unOrZ+W0Qbm6/d6vIKYF
X-Received: by 2002:a7b:cd02:0:b0:3ef:d8c6:4bc0 with SMTP id
 f2-20020a7bcd02000000b003efd8c64bc0mr8958821wmj.40.1682408787649; 
 Tue, 25 Apr 2023 00:46:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350bcSWukGm9Uxkg8qn6h5+di1XidClB4gYFQPKftFtL8mLEwZ7iHa9AnensvD2YeRNPbZnRAag==
X-Received: by 2002:a7b:cd02:0:b0:3ef:d8c6:4bc0 with SMTP id
 f2-20020a7bcd02000000b003efd8c64bc0mr8958801wmj.40.1682408787271; 
 Tue, 25 Apr 2023 00:46:27 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 m9-20020a7bce09000000b003f049a42689sm14143446wmc.25.2023.04.25.00.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:46:26 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:46:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, mst@redhat.com,
 anisinha@redhat.com, jusual@redhat.com
Subject: [PULL 26/31] acpi: pcihp: allow repeating hot-unplug requests
Message-ID: <0f689cf5ada4d5df5ab95c7f7aa9fc221afa855d.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

with Q35 using ACPI PCI hotplug by default, user's request to unplug
device is ignored when it's issued before guest OS has been booted.
And any additional attempt to request device hot-unplug afterwards
results in following error:

  "Device XYZ is already in the process of unplug"

arguably it can be considered as a regression introduced by [2],
before which it was possible to issue unplug request multiple
times.

Accept new uplug requests after timeout (1ms). This brings ACPI PCI
hotplug on par with native PCIe unplug behavior [1] and allows user
to repeat unplug requests at propper times.
Set expire timeout to arbitrary 1msec so user won't be able to
flood guest with SCI interrupts by calling device_del in tight loop.

PS:
ACPI spec doesn't mandate what OSPM can do with GPEx.status
bits set before it's booted => it's impl. depended.
Status bits may be retained (I tested with one Windows version)
or cleared (Linux since 2.6 kernel times) during guest's ACPI
subsystem initialization.
Clearing status bits (though not wrong per se) hides the unplug
event from guest, and it's upto user to repeat device_del later
when guest is able to handle unplug requests.

1) 18416c62e3 ("pcie: expire pending delete")
2)
Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
CC: mst@redhat.com
CC: anisinha@redhat.com
CC: jusual@redhat.com
CC: kraxel@redhat.com
Message-Id: <20230418090449.2155757-1-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
---
 hw/acpi/pcihp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index dcfb779a7a..cdd6f775a1 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -357,6 +357,16 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
      * acpi_pcihp_eject_slot() when the operation is completed.
      */
     pdev->qdev.pending_deleted_event = true;
+    /* if unplug was requested before OSPM is initialized,
+     * linux kernel will clear GPE0.sts[] bits during boot, which effectively
+     * hides unplug event. And than followup qmp_device_del() calls remain
+     * blocked by above flag permanently.
+     * Unblock qmp_device_del() by setting expire limit, so user can
+     * repeat unplug request later when OSPM has been booted.
+     */
+    pdev->qdev.pending_deleted_expires_ms =
+        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL); /* 1 msec */
+
     s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
 }
-- 
MST


