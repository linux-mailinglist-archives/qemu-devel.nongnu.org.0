Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADC46A7C91
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeG2-0003gE-HT; Thu, 02 Mar 2023 03:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFw-0003V9-GY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFv-0002MG-4G
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hCkjYV3Gpv1lSpJ9Xhk2qDaDQoVELHpoQmx9VQwG720=;
 b=hFCxrnGS7zY8K/DstzrkMUGvWaztyIyKrooyrUw7Agiji6KPfekP7jtzkbpUH0y+iodlKc
 hJ7Xz6EzYtCMNC1z11mAdctNfv02ooN1rcgid6VD1Dy1elCLNnv63i+RrpabvW1Hhk6yIX
 1+eOfVoQbE1GErEaXyc/q0SvFMy4BPc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-PzJ5ZvQkPCWMbDvmc0sN3g-1; Thu, 02 Mar 2023 03:25:37 -0500
X-MC-Unique: PzJ5ZvQkPCWMbDvmc0sN3g-1
Received: by mail-wr1-f70.google.com with SMTP id
 d14-20020adfa34e000000b002bfc062eaa8so3053800wrb.20
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745535;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCkjYV3Gpv1lSpJ9Xhk2qDaDQoVELHpoQmx9VQwG720=;
 b=u0xr0/hv5KLrgUnvddDxNObo3twDWAjc/1T01Cw1T4dIOBnmXOK3WWSM/Y1E1mMujs
 CM4L0kqHJAHqpoEbwMP2UoriH5mHyiCvIhaX7Oh3fY9TwJ2+J9j7hDLAF33qZTrK/62+
 ZMSdsRzGYv5/MR9Jv92xy50Opv/nXNEsXh2zZh92uFOyX9G31LxY0UlVXC5k1aokKyBa
 TyK61WmSmoudK/R/GpKFiWyh+OvDgiByj1o87aqMKLJ0qO5kodsxhf/5AVxSFkM3azXO
 zpI4TaefSYdFFdhRQm7pXyTpW+siJRhr/3gTl4hXBJyRHFVVWVpe5QKWsDD4hnEsprsH
 k+zQ==
X-Gm-Message-State: AO0yUKVVKwkWWZaL8W+aGQwA1QVqOOokVBndW188l8z/+rX2I97WIZ/q
 1WPhoGwjdRe28Yu+wE3fw0jjoMEcKX8EPj4gVGCwtRfdjGhtAW4qU0On0wdS59kBPHlhX3++U0x
 GARHY2TB38j9w5GvO/liFTm3vLiyq7rkAe6Uwm89ZCMcfbTihP1BLlAX0MS9hS+Y4yQ==
X-Received: by 2002:a5d:6084:0:b0:2ca:e856:5a4 with SMTP id
 w4-20020a5d6084000000b002cae85605a4mr813636wrt.26.1677745535640; 
 Thu, 02 Mar 2023 00:25:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/8TPU9PdUUVbOkP+KDSIVYyNLvIbWX2z4p3Ev9c7jB6VxF8Wi8rrcKhv/mnbuOTFbKhvfz4g==
X-Received: by 2002:a5d:6084:0:b0:2ca:e856:5a4 with SMTP id
 w4-20020a5d6084000000b002cae85605a4mr813623wrt.26.1677745535395; 
 Thu, 02 Mar 2023 00:25:35 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05600c00cc00b003e1202744f2sm2041336wmm.31.2023.03.02.00.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:34 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 20/53] pci/shpc: set attention led to OFF on reset
Message-ID: <20230302082343.560446-21-mst@redhat.com>
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

0 is not a valid state for the led. Let's start with OFF.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-2-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/shpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index fca7f6691a..1b3f619dc9 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -223,6 +223,7 @@ void shpc_reset(PCIDevice *d)
                             SHPC_SLOT_STATUS_PRSNT_MASK);
             shpc_set_status(shpc, i, SHPC_LED_OFF, SHPC_SLOT_PWR_LED_MASK);
         }
+        shpc_set_status(shpc, i, SHPC_LED_OFF, SHPC_SLOT_ATTN_LED_MASK);
         shpc_set_status(shpc, i, 0, SHPC_SLOT_STATUS_66);
     }
     shpc_set_sec_bus_speed(shpc, SHPC_SEC_BUS_33);
-- 
MST


