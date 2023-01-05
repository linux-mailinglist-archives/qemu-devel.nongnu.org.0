Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4159A65E7F6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKz-0001Wa-Mv; Thu, 05 Jan 2023 04:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKy-0001Vp-9Y
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKw-0006pe-VE
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0/Q4t5SUp0QHFh8qqqSqfRchZLYMl7Pm+UebNin4VI=;
 b=L02M3m2l0huiMGaKuGPkP0m9blfeuOFw47RQOssFcWPk7pe1khkDNOhPFi1/iOhRAgGik5
 tRbwq1VrkyMwAqhBrQaBCIByYOXUnorYd8tVAwLEsQRgaSS3k77aNIPlCcULH+a88h2uJk
 HXsbUJXEIYAk9xhqP2fYbAzag1RjtSQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-505-RnvW-fpyOqSNnnPjqm66Qw-1; Thu, 05 Jan 2023 04:14:57 -0500
X-MC-Unique: RnvW-fpyOqSNnnPjqm66Qw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c23-20020a7bc857000000b003d97c8d4935so15189502wml.8
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K0/Q4t5SUp0QHFh8qqqSqfRchZLYMl7Pm+UebNin4VI=;
 b=PxmE2yo/viMgWXCaB4UFAcIu4EY4TynsXgV+9rtbPBEnI3WNMH8iWBAT+eb5/i7Is6
 tDr440hNWFD8dffuhBq2w9UEbcfmWxJNfiUCneJXcIKhA45L+qRcStjWepBvGDQPTEji
 MFj0eu9dcKa7LXq2IMF4rToxGPUPE9zK6cIUFoWGQznhMVkzMe/vBZwYLjFEX5/T2Crg
 irInnOjoizfi3AqmyzOad7qYYpPy5533CVu3N+OuURNKIl9McLtSzqf4RJAyrm6zcfVJ
 +gJ+u0DvN80kRP20mZUJbzja2adGTQryd4cQHPt1D6OPYt5p0FsBj9pBDMBv0YxpB1cV
 7BJg==
X-Gm-Message-State: AFqh2kqp1xujIj9JvscmmcCZSDTnL+b5pyjDuCEy24IXUMsWqtTZwNgO
 8EIt5nyeze9/BH6JuADed9ZOrkf+j5vTYTPYeGjKYWnu7d8fHavcNcho5neCEZ+vxDRoO6roIaH
 IR25EYeEKol29V6QovNqJp1Zvvsql5g9X3ySccGmiyota9MRRWkL6+zJ69wKY
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr39012044wmq.32.1672910095676; 
 Thu, 05 Jan 2023 01:14:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXul1Hs2LUd3yPHMp7cIleHkBXXTOT1tbgmV3PDCBXuwhUNCK/vLOaFCYrjfMO2FgDGNsrPfew==
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id
 r10-20020a05600c35ca00b003d1f2de195amr39012027wmq.32.1672910095412; 
 Thu, 05 Jan 2023 01:14:55 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003d99fad7511sm1906391wmq.22.2023.01.05.01.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:54 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 11/51] hw/ppc/Kconfig: Remove unused dependencies from PEGASOS2
Message-ID: <20230105091310.263867-12-mst@redhat.com>
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

Removes the following dependencies from ppc-softmmu:
- CONFIG_ACPI_CPU_HOTPLUG
- CONFIG_ACPI_CXL
- CONFIG_ACPI_HMAT
- CONFIG_ACPI_MEMORY_HOTPLUG
- CONFIG_ACPI_NVDIMM
- CONFIG_ACPI_PCIHP
- CONFIG_ACPI_X86
- CONFIG_MEM_DEVICE

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221216130355.41667-8-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 72a311edcb..c898021b5f 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -76,8 +76,6 @@ config PEGASOS2
     select VT82C686
     select SMBUS_EEPROM
     select VOF
-# This should come with VT82C686
-    select ACPI_X86
 
 config PREP
     bool
-- 
MST


