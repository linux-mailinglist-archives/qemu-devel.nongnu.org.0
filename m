Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A698450A2B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:52:31 +0100 (CET)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfDa-0002n6-K8
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:52:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0k-000447-Dl
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:39:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0i-0005JS-Ua
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wpVmE++va9UHElfTtz5HyYu3V0KXTon88DKjQZxTj9s=;
 b=Xj/JTXbOjfHPJuWmIdA5zUyzVBn6rwpOcGD+RbYhAvhD4WkNEcIsvjv+gVlu2D10P2/c7C
 KeAEdaOwKYdK8RXkQoWdH3/Kf/hWQlwCzRxlnYcVSiZ9+B9+bSg+5JZfWL9YvaL1Jjvh5T
 ms10TwCURSljmc96WAEIKwsSvTA2s7Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-WCbxP5wKOEKpfYdT9SuKzA-1; Mon, 15 Nov 2021 11:39:10 -0500
X-MC-Unique: WCbxP5wKOEKpfYdT9SuKzA-1
Received: by mail-ed1-f70.google.com with SMTP id
 m17-20020aa7d351000000b003e7c0bc8523so2842881edr.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wpVmE++va9UHElfTtz5HyYu3V0KXTon88DKjQZxTj9s=;
 b=Z0kTdXowIuCDR+GvYXznaHQLms8BR0D8KvT81obXCXhd3wsluPPOQI9TvNHwoOUMhB
 h4kt9sTIprMkBIhu9q1w+wr273cNNBSk/93Vm05Nq+SyOqQYt0K74K204djOtwu610/A
 XDVefv9yAcJRCwskp62gi7sSzjV2/r/H5I9OkKGSPZMgHcesLaV7KBAswOGlhGAdVZpy
 TUaAyc/TZQ5A/avElrYA1sxDUig+wupr0XakBey1w6DTgjFO4RjRYx6sSvCJ2szDiiyT
 Jg5NBKKesOgMyJkGN71g2nsZNEFsUjH5iPlGKa6MhFK/iMe06GrIG2jRAhsuAIY3zCde
 eoYg==
X-Gm-Message-State: AOAM533X1qTCXsfUR2uz43UmiQlD32V4/6Yv0ZjksUxafSRRRtk0tHte
 3jZQFV+5QXtLhpIXyJAsqbSzXzd4iQWbN6o7Or/pHDHI/q+RQyxBusagIcL7zl1gglg762B+vRT
 0DXsSLs3w9GIzGsks708QDZuYEksr4C82BMO0M8svAuH5RfxaZdYZnrnJqYKn
X-Received: by 2002:a17:907:3e11:: with SMTP id
 hp17mr345774ejc.243.1636994348895; 
 Mon, 15 Nov 2021 08:39:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIqJZRXmuISsY8go2PIcXD+D8BjfhOponPND40vW08zHcDI9PkJ5N15pUDLm+/sSZqn7aYNg==
X-Received: by 2002:a17:907:3e11:: with SMTP id
 hp17mr345733ejc.243.1636994348662; 
 Mon, 15 Nov 2021 08:39:08 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id cy26sm6749916edb.7.2021.11.15.08.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:39:08 -0800 (PST)
Date: Mon, 15 Nov 2021 11:39:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] pcie: fast unplug when slot power is off
Message-ID: <20211115163607.177432-20-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

In case the slot is powered off (and the power indicator turned off too)
we can unplug right away, without round-trip to the guest.

Also clear pending attention button press, there is nothing to care
about any more.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20211111130859.1171890-6-kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pcie.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 959bf074b2..a930ac738a 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -560,6 +560,16 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
         return;
     }
 
+    if (((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF) &&
+        ((sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF)) {
+        /* slot is powered off -> unplug without round-trip to the guest */
+        pcie_cap_slot_do_unplug(hotplug_pdev);
+        hotplug_event_notify(hotplug_pdev);
+        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
+                                     PCI_EXP_SLTSTA_ABP);
+        return;
+    }
+
     pcie_cap_slot_push_attention_button(hotplug_pdev);
 }
 
-- 
MST


