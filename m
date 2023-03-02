Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B9C6A7C8D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:26:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGB-0003jx-1Q; Thu, 02 Mar 2023 03:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFz-0003er-CM
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFx-0002MY-Tp
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HFLZ/xNMkI2p47i7B4IDIpHTYBBjdkW8CGI5BT/BqdM=;
 b=ahOo7sbcrfHLAd6kwY8mmIrpPWUmPmY6+A/v+z0e5Sqrf328A+rZQ/pjOYtwe030RpwWH7
 26jBF3LE9eOsp7At5e8RtR9qMaAVvBQSrK40DGEKe8Vzc+BnxomqDYjZEgpCLsfaWenyRX
 kv52rf7A1NfOvSd1YjnAImXrHmZkGW0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-GVdm4VrpMo2l4pJyFmGvJQ-1; Thu, 02 Mar 2023 03:25:40 -0500
X-MC-Unique: GVdm4VrpMo2l4pJyFmGvJQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so749552wmr.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745538;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFLZ/xNMkI2p47i7B4IDIpHTYBBjdkW8CGI5BT/BqdM=;
 b=D1PNhzgqeipvaUyUEj3yLpeYSoTFrxpcaSS236M6wbfMr2/FTvYYzZ71t3P7lRIv3/
 ndijDeOJIEFIJukj8D+U/ORdyQmXwGHcUT93nUAyQZDFWGWu39J591bisvAbYgsRD3Z9
 dlS/G0MU7DrNfZ4uHTYS8S/ZUx9S7pz//fTK77fNVpFIOAe/p9EUA70/GA0Rw0Upf5UQ
 cbpLRJS7XLrmzm6ufPS5Rv8P5GIGdMehBqGSyKT1GvcbeMk9f8UuMu9LuiGy5zCQDlS2
 0FOs1f8yypAb9jCoDXijKdE3Texc6WDSfPeSEJ1cL66KFPy5UmJ5ZPucRh6x47j2DYiI
 gTXQ==
X-Gm-Message-State: AO0yUKWwTa1mQDBkxaIXh2J7ji4hoeahEVbDwPUItX6aAnwYMZJntApG
 wMTRKao3sqKYrUlThK74UVlqzBm2/l4U4/9WpyhBpDPT3JTiftHNzHSRPsnZsg5poxvPYY/i7OS
 mgMga0LsGB521iJZZAP3MhC2jMTHo6neXbxZQm/gJ6Jzhkksj35mQMG1Hkt//3QV0Hw==
X-Received: by 2002:a05:600c:181c:b0:3eb:2e1e:beae with SMTP id
 n28-20020a05600c181c00b003eb2e1ebeaemr6781366wmp.25.1677745538479; 
 Thu, 02 Mar 2023 00:25:38 -0800 (PST)
X-Google-Smtp-Source: AK7set8uhy+giFetzVuDJ/QZa9zc+VasV+58H+1EoNO3sqOJ0YHVI3fVKYygC3lMQvSBBI/zKvxXWw==
X-Received: by 2002:a05:600c:181c:b0:3eb:2e1e:beae with SMTP id
 n28-20020a05600c181c00b003eb2e1ebeaemr6781351wmp.25.1677745538132; 
 Thu, 02 Mar 2023 00:25:38 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c359500b003e0238d9101sm2207506wmq.31.2023.03.02.00.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:37 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 21/53] pci/shpc: change shpc_get_status() return type to uint8_t
Message-ID: <20230302082343.560446-22-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

The result of the function is always one byte. The result is always
assigned to uint8_t variable. Also, shpc_get_status() should be
symmetric to shpc_set_status() which has uint8_t value argument.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-3-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/shpc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 1b3f619dc9..5d71569b13 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -123,10 +123,13 @@
 #define SHPC_PCI_TO_IDX(pci_slot) ((pci_slot) - 1)
 #define SHPC_IDX_TO_PHYSICAL(slot) ((slot) + 1)
 
-static uint16_t shpc_get_status(SHPCDevice *shpc, int slot, uint16_t msk)
+static uint8_t shpc_get_status(SHPCDevice *shpc, int slot, uint16_t msk)
 {
     uint8_t *status = shpc->config + SHPC_SLOT_STATUS(slot);
-    return (pci_get_word(status) & msk) >> ctz32(msk);
+    uint16_t result = (pci_get_word(status) & msk) >> ctz32(msk);
+
+    assert(result <= UINT8_MAX);
+    return result;
 }
 
 static void shpc_set_status(SHPCDevice *shpc,
-- 
MST


