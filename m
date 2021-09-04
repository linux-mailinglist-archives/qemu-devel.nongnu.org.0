Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78681400D2D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:46:36 +0200 (CEST)
Received: from localhost ([::1]:40468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdUh-0004DC-IC
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLP-0005l3-EC
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLM-0001Fs-W7
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6hzXvSZcmKkCiwpFrjVYwk3ML2ZhCV+5LcXx5Zj5FA=;
 b=gHruwHixl0Gm2LmmP9zaz+BYH5Giuq4g4ysFo9wTYX8vEKfDISsQob34fak+vtIO/08kx+
 bHYnq3Y/+t4l4LMTaEAzQiAfb0Y8np9BPUyX/YGjFiHPliH9iX2+hEL69Ie+LyVqE1f+et
 tYd2ChRwPdLCcF9W6uzg7ktaxDOaWOE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-hro8X2MYOaaQRUg4THX_Iw-1; Sat, 04 Sep 2021 17:36:54 -0400
X-MC-Unique: hro8X2MYOaaQRUg4THX_Iw-1
Received: by mail-ed1-f70.google.com with SMTP id
 s25-20020a50d499000000b003c1a8573042so1491528edi.11
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=I6hzXvSZcmKkCiwpFrjVYwk3ML2ZhCV+5LcXx5Zj5FA=;
 b=sizvdFAhuqcp7dFOAg0ff2xSYkhigAztWop1NMEVVl9kRer3N9ijnq4jL4t5Ay5TmI
 f/W0lN009K8JXnNeDX1wU0IZg8BkddZNjismSOnVv+YUihL/w2/p1jArV2XMPLHQ4LXs
 4mVHqIoOoLVm1DzqPZ5pJOkqKIShNa7h1IdgayhL8LCvPYy7U2qGgduCyDhbSoCLcDB7
 D6AZz+lcAtCecQZXlxGA640Xu1QNfgZy11MEomdevFySqeAsYurzpi0+CQCLugyLk4Qt
 U9gbb2Fcd3PYriveSOgwQs3iH4bVJ9VBuyhet6/zm7dB3Ik0m/CivpX9vo6R2ZVTC9oZ
 SyVA==
X-Gm-Message-State: AOAM533d21cIi0pUHWsboh461+bwpgPOaMXiUMz2dTRgFxSE4CmJMUe9
 XVKonRNpXJhunmad2AmT35hTk6sDUdUmOMdRq5dxbsZ5jSc6QedDyp4Cxwzb2hO2UxKcZ8/zF+u
 uCyoyoWYkbrg+hg7dWvdeyId6WxzrdGD1lBZcRmy6kkLjQbJZr99xtoILFmkn
X-Received: by 2002:a17:906:3fd7:: with SMTP id
 k23mr5852978ejj.176.1630791413432; 
 Sat, 04 Sep 2021 14:36:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAyygnQ4Efnaro8v8OKthQ/z7GBUDh8tca08RnJeSPWY85GWWg35kt9b+AprTbE9wDMsmzCg==
X-Received: by 2002:a17:906:3fd7:: with SMTP id
 k23mr5852955ejj.176.1630791413245; 
 Sat, 04 Sep 2021 14:36:53 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id x9sm1886607edj.95.2021.09.04.14.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:52 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/35] hw/acpi: use existing references to pci device struct
 within functions
Message-ID: <20210904213506.486886-19-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

There is no need to use fresh typecasts to get references to pci device structs
when there is an existing reference to pci device struct. Use existing reference.
Minor cleanup.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210825031949.919376-3-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pcihp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index f4d706e47d..f610a25d2e 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -283,7 +283,7 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
 
     /* Only hotplugged devices need the hotplug capability. */
     if (dev->hotplugged &&
-        acpi_pcihp_get_bsel(pci_get_bus(PCI_DEVICE(dev))) < 0) {
+        acpi_pcihp_get_bsel(pci_get_bus(pdev)) < 0) {
         error_setg(errp, "Unsupported bus. Bus doesn't have property '"
                    ACPI_PCIHP_PROP_BSEL "' set");
         return;
@@ -363,8 +363,8 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
 {
     PCIDevice *pdev = PCI_DEVICE(dev);
 
-    trace_acpi_pci_unplug(PCI_SLOT(PCI_DEVICE(dev)->devfn),
-                          acpi_pcihp_get_bsel(pci_get_bus(PCI_DEVICE(dev))));
+    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
+                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
 
     /*
      * clean up acpi-index so it could reused by another device
-- 
MST


