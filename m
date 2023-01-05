Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3589F65E771
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKv-0001V3-PT; Thu, 05 Jan 2023 04:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKr-0001Tx-7R
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKp-0006ox-S2
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3TFYG5jtPJxj2AAF57n0Xvz2wJnns/YSUt6EOuT54c=;
 b=ImUCspHhOGfbO6FnQYGRqil2wEgccLNamZ170tZsgfxegLXHCUAs08bylSGdtwEy06wFUu
 12hdtGJ2suYFoqbpWWGLXQEatHOu+jbPfIwgfG+9X4l5OwEFlEpiE2kR1Q2i3RnFnLWOaQ
 Uuxwed97K5YVApEfUYcq8C9kExb4N60=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-bEYMC0wMP1qdfPs_hFgqmQ-1; Thu, 05 Jan 2023 04:14:50 -0500
X-MC-Unique: bEYMC0wMP1qdfPs_hFgqmQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 d28-20020adfa35c000000b00293b14c3868so2067766wrb.10
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3TFYG5jtPJxj2AAF57n0Xvz2wJnns/YSUt6EOuT54c=;
 b=tfxU5eB2berrWNhGoi7YmwCF1CBPyJLeeFWL2QDs+mz5MwflsC2dSgEIL0fmW/8tQg
 9sBTF8075zlPPGMabxv1pviWvsyn8ww8e85Q379hkYogYKYPv9WrktgyaxWbr72LoovH
 jrwRR+HLYFLApEBGbwSLIqJieKQp9KikZjk+YQ6G/74YWJJqczlNluqHN2r/8nQaszlW
 YMljhTCH+M+JNkvnFyRqA6jmy31Rsd1ne8xysLPLt0RMmhe7tiuA6gpTwtj0seie7Khj
 N/fUa/ZKm6+m2jt3LLm1c+wxZnUAIGtmnRbMlzv567AlrdnldQ0m5o6jIwCdR+1PJeUk
 CWaQ==
X-Gm-Message-State: AFqh2kp+L4iHI14A1BHv9/bzGTEqpFrjvNnjqo/AGbBu0bLy3xAk8MZi
 9tgtTQxsRKSR2u3l7XTRNK0Vnx2PiJLpRR4EcNEsjnp73REbBiSzUkZYk15h+suyKt/wuP6fY64
 sMQ7etApPdsRd1ExJtmad3AWHg8u3QXyw/K1osxcvpWPeci8qcQftnL+MxgKq
X-Received: by 2002:adf:eecf:0:b0:242:14f5:7a96 with SMTP id
 a15-20020adfeecf000000b0024214f57a96mr32587140wrp.47.1672910088832; 
 Thu, 05 Jan 2023 01:14:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvefxch3bc5FFDMITaRo4gIulnMM58JUW2SKduJhvmVgHTt8yIxsU30cCTs5NCIXJgA6lGBRQ==
X-Received: by 2002:adf:eecf:0:b0:242:14f5:7a96 with SMTP id
 a15-20020adfeecf000000b0024214f57a96mr32587126wrp.47.1672910088573; 
 Thu, 05 Jan 2023 01:14:48 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 l15-20020a5d410f000000b002683695bf97sm36186611wrp.58.2023.01.05.01.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:48 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 09/51] hw/isa/Kconfig: Add missing dependency to VT82C686
Message-ID: <20230105091310.263867-10-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

The ACPIREGS are provided by TYPE_VIA_PM, so needs to select ACPI.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221216130355.41667-6-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 0a6a04947c..0156a66889 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -52,6 +52,7 @@ config PIIX4
 config VT82C686
     bool
     select ISA_SUPERIO
+    select ACPI
     select ACPI_SMBUS
     select SERIAL_ISA
     select FDC_ISA
-- 
MST


