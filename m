Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3D465E78E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:20:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKu-0001TZ-FB; Thu, 05 Jan 2023 04:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKn-0001TA-Kr
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKm-0006nJ-8A
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rxn3sdtuOgGivwWWqmONun4vbY1V0V2nvJUpVR/FeeM=;
 b=QZ6bGXpS7RNMFUelPO2ySIjsY6IbLO0HpX6UbQCbNjCVpVKwGAZsBAoR5/u/EqJ9iVicNG
 37GQ6uz3xPRWJ5wt1YxvzNrh9zkR0EW5y6dOU036aoNwpa5lvFsWcSyUoPbVbcfhJrtjfZ
 QK8umBx2Hv1AULWFp6a2/bkfaq8LxFk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-aEpVX3A4M8iswgXjObzffg-1; Thu, 05 Jan 2023 04:14:45 -0500
X-MC-Unique: aEpVX3A4M8iswgXjObzffg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so734192wmq.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rxn3sdtuOgGivwWWqmONun4vbY1V0V2nvJUpVR/FeeM=;
 b=7Zcl7+Vr5eJIT6VAVcfpXpyp60r/RrhhRdcO6ufzdgD1ETuIUzZJRhUE8e5ug/RwpM
 ojuG+3LYHDII6aHxpdPsncSAU68mOpB6+S2Tzc3N4jcaLwHWAJNAqg4YXSCNAU3/deVC
 z0OrtczBDVPZ/UBLAzFd0RhZwUKVzchxs2YtpOFLaqh2QOyBYfymSP3H77TazQmrCskP
 oxLOtlBhbtYs7HZLcg3Ks/+2M3j2iYv89wzuy0aU+06x5fZuJ3ZOApEEKu6Rq46VCoVw
 sx2G2WiGq0bZqEHgM8Fj3M34HBcP/9C24l6XnvRcB10AIiHmO7EQRWGJRdpCKEXw72F2
 Jp2w==
X-Gm-Message-State: AFqh2kroV9UX0SkV8tlmGgN9KcERerRnnt3U/fGMs9Zq09nT8Xmh2XXK
 +0Ij0NRqWQs39YCBYiGHXE2khwH69gINXlDYJfqftsCuiwm1cNGjP9gD7oFOLpocRR0DUO5RsgH
 G9/3fdJMAVnqS0+eaz//BvKotPkVKfsbIuvihn/wEDtgQVYr7zlxKlEU16gc6
X-Received: by 2002:a05:600c:34d0:b0:3d6:b691:b80d with SMTP id
 d16-20020a05600c34d000b003d6b691b80dmr35378809wmq.21.1672910081734; 
 Thu, 05 Jan 2023 01:14:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuT7G0HHejAoa1d/VRwnsGw1sXv8znIT8Poed4rrW/14nZdB7igu8zVSFb7HgwQhgEmzpIcRQ==
X-Received: by 2002:a05:600c:34d0:b0:3d6:b691:b80d with SMTP id
 d16-20020a05600c34d000b003d6b691b80dmr35378786wmq.21.1672910081411; 
 Thu, 05 Jan 2023 01:14:41 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003d9aa76dc6asm2050196wmc.0.2023.01.05.01.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:40 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 07/51] hw/acpi/Kconfig: Do not needlessly build TYPE_PIIX4_PM
 in non-PC/Malta machines
Message-ID: <20230105091310.263867-8-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Bernhard Beschow <shentey@gmail.com>

TYPE_PIIX4_PM is only used in machines where PIIX chipsets are used
which is currently PC and Malta. There is no point building it for the
other ACPI_X86 machines.

Note that this also removes unneeded ACPI_PIIX4 from PEGASOS2.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221216130355.41667-4-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/acpi/Kconfig | 1 -
 hw/i386/Kconfig | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 704cbc6236..b7006e18c8 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -9,7 +9,6 @@ config ACPI_X86
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
     select ACPI_HMAT
-    select ACPI_PIIX4
     select ACPI_PCIHP
     select ACPI_ERST
 
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d22ac4a4b9..3a92566701 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -69,6 +69,7 @@ config I440FX
     imply E1000_PCI
     imply VMPORT
     imply VMMOUSE
+    select ACPI_PIIX4
     select PC_PCI
     select PC_ACPI
     select ACPI_SMBUS
-- 
MST


