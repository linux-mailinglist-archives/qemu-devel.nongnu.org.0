Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253BA37AB45
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:02:29 +0200 (CEST)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUq4-0006Uf-2l
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUiP-0005WI-EM
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUiN-0001eQ-Ab
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620748470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgoWeNxKv95vCclOPAESGXfEBGSLHsM2hTUdSUtL32M=;
 b=LetWh+QgWWJQDsoaZQmMr5isjq/rjE2x8OrsN//A3Zcb09pakHXfwyfcpU6kL5kCrY8Xwf
 AqUIvYJq0PrdTEx+add8FjOAfprbtBGMWPf8oM1AQMVtPrTKbFuAoFSm00YkADvKkpviHz
 8OJpylsWvubfpLjA+oAeD3DyWcJ1Hh0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-iShw3WdMODar1oX8EFjMxw-1; Tue, 11 May 2021 11:54:28 -0400
X-MC-Unique: iShw3WdMODar1oX8EFjMxw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so8889374wre.22
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rgoWeNxKv95vCclOPAESGXfEBGSLHsM2hTUdSUtL32M=;
 b=cjY22kdWqpEC3VpBNVW9qNEch2MpiAgKucTjJP1TmqoZA/7VZCRxp9DdDV5lXGVg1v
 tNcoGcuo6R6ZV7xDlrz95+/tg7KnCLXm5aORFzVBW8Rom/IiMdmoiqFVYV2dq0uHrHad
 NeB+ZQqUuIeAX+VrOONfLs5Z/Ajz64MV6H64ruJ2utvEiXWIYsdsi6aFU+6HWS0MxRd6
 hGjYzno1FXA/8okFOUWcNw1ln2gCotBRO+29tWcNJWJHqIPq1W+Vsi5IApX668FoSylp
 yvy8PBo7qAke64CILgkxpu92Z/uz/3EUk6MZu2VEJC64UfIIDw6lscrduurj9S2HquhO
 JxBA==
X-Gm-Message-State: AOAM5327BRrXtSaQK+mJqBr2uV6CoiOCHg77FfP+pOlGfk9HVjdcFn2U
 JGUmKsfnz2VY6AcEvAq1p/nusGk1PzoCcy7en6JV8XB7B1W58+OyWPa9ZrSM/B9HfDG4o43lSqF
 wBQa7/uEPrS1t/hNJLhWxxCrptbwchUE2jH7rEvzfnN9WkIPWeP87mQtQr/3LqFHT
X-Received: by 2002:a05:600c:4a22:: with SMTP id
 c34mr33396590wmp.160.1620748467347; 
 Tue, 11 May 2021 08:54:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxudMo62FEpBMdFRFsSjsTXbxJB/OwDsqLJIaTItZP36kJ8kmDxX/KWXe8IJdhgQwf9nW8jAw==
X-Received: by 2002:a05:600c:4a22:: with SMTP id
 c34mr33396571wmp.160.1620748467188; 
 Tue, 11 May 2021 08:54:27 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l12sm31998968wrq.36.2021.05.11.08.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:54:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/5] hw/ppc: Have pSeries depends on libfdt (via host
 Kconfig FDT symbol)
Date: Tue, 11 May 2021 17:53:52 +0200
Message-Id: <20210511155354.3069141-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511155354.3069141-1-philmd@redhat.com>
References: <20210511155354.3069141-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit fea35ca4b8e ("ppc/spapr: Receive and store device
tree blob from SLOF") the pSeries machine depends on the libfdt
fdt_check_full() call, which is available in libfdt v1.4.7.

Add the corresponding Kconfig dependency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/Kconfig     | 1 +
 hw/ppc/meson.build | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 66e0b15d9ef..3935b73456f 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -1,5 +1,6 @@
 config PSERIES
     bool
+    depends on FDT
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VIRTIO_VGA
diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index 86d6f379d1c..e82a6b4105b 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -9,7 +9,7 @@
 ppc_ss.add(when: 'CONFIG_FW_CFG_PPC', if_true: files('fw_cfg.c'))
 
 # IBM pSeries (sPAPR)
-ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
+ppc_ss.add(when: 'CONFIG_PSERIES', if_true: [files(
   'spapr.c',
   'spapr_caps.c',
   'spapr_vio.c',
@@ -28,7 +28,7 @@
   'spapr_rtas_ddw.c',
   'spapr_numa.c',
   'pef.c',
-))
+), fdt])
 ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
 ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
   'spapr_pci_vfio.c',
-- 
2.26.3


