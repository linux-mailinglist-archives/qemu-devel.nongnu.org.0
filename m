Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5865E787
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:18:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKu-0001Tb-Ni; Thu, 05 Jan 2023 04:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKo-0001TL-Nf
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKn-0006nN-1K
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pur9/YaviOiAK2NOYFsJiuuRu4TcG+CvN2Bn3YgLiWc=;
 b=NZx3NmetbsbEWfbmlqXuOW6jEzxj7PXqnHPTPW3RIKHTDivowXXAnnQ43E2cQU2GosIRXq
 5Mq1bj5dm1JZjviOrmOMbp/1sAqxUUv9aiDLi3vqP3+echSOVL4SwLNk60Gu9fhsyFvKMG
 BhUQZA96Wk7VdaHsab/tn8gD7y0GNnw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-aSm_b1dsPvazAGnVbFg6zg-1; Thu, 05 Jan 2023 04:14:47 -0500
X-MC-Unique: aSm_b1dsPvazAGnVbFg6zg-1
Received: by mail-wr1-f70.google.com with SMTP id
 o14-20020adfa10e000000b002631c56fe26so4629847wro.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pur9/YaviOiAK2NOYFsJiuuRu4TcG+CvN2Bn3YgLiWc=;
 b=nNd7MgGINHUKNA0Ithl3hOMDM6rjTMMY23lttcsareEi3Qw4jHRVJYrajd3uHtqAgj
 ThCpcs4AUhXg70BZf8TSU9J3xzB4X4SN9rPArIPSGWkIaR4QhGhedbAG8QXMWPNgenh5
 LSWiQC20Uy3IC70vX7HRXHsfgcPVVp8+g+NEsuudc3hjB8tCaSkjHhnXxBmJkrdUSQwp
 Uv9yslv+iKaohgNCTNdhCD/260ISfRvTgfrL6d4h/EJ2MSUAqiKtgWe5BzEMdOtW7T4y
 Y1oAHjawaevsFBmYHRgPyHgl/yVryd4bvkbn7KhStxcErv7hXpgSOA8VCIvOqbEiwXKg
 Z34g==
X-Gm-Message-State: AFqh2kqL+5CUunNpziWDs5FqdK9d3ZhyGA5zqr4I8oKbE5PvZ9Gc1euy
 OKKnL+akCGpBHejYu8udvjvgxIRLHEwJJpe34FOlPCdbXTiAf1SXVFDCM8TzZ2roLHWAzbFXqFC
 RYHw2jq97q1mnabp8kXH1bhX7jZz0h1fSC940J8IPDOH9JMFWLuisM3wmCQ64
X-Received: by 2002:a05:6000:181:b0:276:c52a:e3a0 with SMTP id
 p1-20020a056000018100b00276c52ae3a0mr23292804wrx.65.1672910085673; 
 Thu, 05 Jan 2023 01:14:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXshoCntFj9TOQTrofKRal0Juq7qj3a7R1f9inNj8SguvXMGOJPSNDzIN9NGqbBIPgBFSOa61w==
X-Received: by 2002:a05:6000:181:b0:276:c52a:e3a0 with SMTP id
 p1-20020a056000018100b00276c52ae3a0mr23292788wrx.65.1672910085438; 
 Thu, 05 Jan 2023 01:14:45 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 i18-20020a5d5232000000b0028e55b44a99sm17914364wra.17.2023.01.05.01.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:44 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 08/51] hw/acpi/Kconfig: Add missing dependencies to ACPI_PIIX4
Message-ID: <20230105091310.263867-9-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

piix4_pm_realize() uses apm_init() and pm_smbus_init(), so both APM and
ACPI_SMBUS are provided by the device model managed by ACPI_PIIX4.

The ACPIREGS are also provided by ACPI_PIIX4, so needs to select ACPI.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221216130355.41667-5-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index b7006e18c8..1f7803fdab 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -31,7 +31,9 @@ config ACPI_NVDIMM
 
 config ACPI_PIIX4
     bool
-    depends on ACPI
+    select ACPI
+    select ACPI_SMBUS
+    select APM
 
 config ACPI_PCIHP
     bool
-- 
MST


