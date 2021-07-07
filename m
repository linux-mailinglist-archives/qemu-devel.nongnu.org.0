Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E567B3BEA62
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:08:37 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19AC-0004Da-US
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195V-0001a6-BH
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195T-0006k1-MP
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ExGsrL38bjUmSaoa46g8sxCNtwJtiJBNsT4OQX6wU7s=;
 b=Ru/+JqRuk3XdaAm+pxfPi71pt435E7xlKxvJ5Fk0aHrSiUB4lEI2ki58jd/C+SD8gZzDBs
 Qb25pRRtI02pUipjKmEQGlgovg2w/OaAaRnSG8CXBIjN0220uqYOf4x/wyzT2lXFSWJUfJ
 5TxrrmpvgaXes5Ov7DzMsYj6SCLTYdo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-F156PYsnNmqC5eyi-YSP1Q-1; Wed, 07 Jul 2021 11:03:41 -0400
X-MC-Unique: F156PYsnNmqC5eyi-YSP1Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 a13-20020a7bc1cd0000b02902104c012aa3so2284653wmj.9
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ExGsrL38bjUmSaoa46g8sxCNtwJtiJBNsT4OQX6wU7s=;
 b=n+PyLP7J38Eqk86r7cUYFEfJeDTpVzt5/epGZNdlZvKqkyahfIpQyza7dPT5gIcuxq
 +31XNk65HN7gtKeBRkWsuqOg3iXrj4cm1zlw8sihd2ubKZBvYlLgj5cx4zNvvJgUMRqr
 oGvHDw8A1Nv0FbPW9zmz03n6G3Ecp6QJEcFFhZevmkov4iCpcNv6ukK+SEMh8zzrnl0L
 13YSsKvNzXdI73zcUcnnAw3Gd/uY9274XlN92qKx8Awvmh1qXGim4ajautpNCCesp9Tn
 dvmO4LvPfdaBgJNoudJrcTE5Pxd9KowTA46dCTAvgEbuklAc6EcTPexog9ENt9dASTFI
 iOSQ==
X-Gm-Message-State: AOAM532+k6Nwb/QuSwH0OFFE+RCwkuqx3M6zWMrEbb88K1gaDEs4QrKX
 b4x0rF7XQzX3LYcA1fFiwrPlvumymHF6BOIwx1/2id4Wg85Tx0GyO1q5fUGnEDHR8CxnuyqKuaQ
 hN5lsSF52jl3VvKnCDOMr4faN7habyBOlBEiVrY5b68gfol8zlUjmBCCrUDT7
X-Received: by 2002:adf:ce84:: with SMTP id r4mr15802457wrn.397.1625670220276; 
 Wed, 07 Jul 2021 08:03:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsDk2D7rkSPifYjmxH65ZogYfI5r8XuqBLpuZQ+VOetLkKvaqEiFaKMG5CsQ+ZjkBYLsrd3g==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr15802427wrn.397.1625670220074; 
 Wed, 07 Jul 2021 08:03:40 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id n5sm11915816wri.31.2021.07.07.08.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:39 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] acpi/ged: fix reset cause
Message-ID: <20210707150157.52328-12-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
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
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Reset requests should use SHUTDOWN_CAUSE_GUEST_RESET not
SHUTDOWN_CAUSE_GUEST_SHUTDOWN.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210624110057.2398779-1-kraxel@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/generic_event_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 39c825763a..e28457a7d1 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -207,7 +207,7 @@ static void ged_regs_write(void *opaque, hwaddr addr, uint64_t data,
         return;
     case ACPI_GED_REG_RESET:
         if (data == ACPI_GED_RESET_VALUE) {
-            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
         }
         return;
     }
-- 
MST


