Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B3529330
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:53:01 +0200 (CEST)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqieC-0004PN-5a
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjP-0000zs-Iy
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjO-0006k7-2I
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCZfFEZiDEm4ScBYpz8PskytD5Sf+SXWO7kU1IanCUs=;
 b=EZnXFy+3a5Vv/VvT3zpiuTXWFhOLdckHPd8In9LS6vo6TjYQrfAyryqleBT/mmoh5V+vCR
 MvrjzrPE1NJW2SjioTp5Sbt9VKWat7zpOfL08t2S4aX9gcRp+JNHeyqzbMMcPh7VLf3Bhv
 clv2SSqj73+NaG+7XlNGZh2mpeiFPgk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662--CsYMjHwN0i0OKlSxtGIdQ-1; Mon, 16 May 2022 16:54:10 -0400
X-MC-Unique: -CsYMjHwN0i0OKlSxtGIdQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 p7-20020a170906614700b006f87f866117so6330715ejl.21
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UCZfFEZiDEm4ScBYpz8PskytD5Sf+SXWO7kU1IanCUs=;
 b=e3DhYo8AROWByMWZ9op9UrMeslkj2PDH5OrpGmp+Jo3D+EdvhCCtdqlJmNEvAVntlb
 SrDUUMJ/uZZz/vtQol5ZlzPxBxIzfPYZ+oD5r/VJd4K+pDPmAIHeZBR4cES56yrMeIsb
 JBDW7yUX8Nuf7H8xWh/DsW8iNvF+7HlWgcJ6g56HpIasv9bsUjdVj0X7mkTD4WDdh3tb
 keYCrSjpkOlZDmhN0vmvS6Ec+18PEhL0d6HmsMmoZPByVJNn6cfVhExhmLiAThPsLD5S
 Qta49UW0wsiOlnAi2/CyyNoZoluMWAbEBDfX0uNH5Ilobyv9/jvhUyalTWoKILattvnk
 N4Yg==
X-Gm-Message-State: AOAM533zkAb/n89eBfsF+Hx1inLEycNSj6lZ+Izm6+0OMURxdhP5xrEF
 FjYbuhEcWDrsOpFx671jS08ALZuUq5YxiEz51q55482n47CKAHCIyyDW+GEIFiHUXpl3l6cPG+T
 PCcbFI5DNYT0AViYLzZxKKEfNfylL4E30UeHgF1CHMqNK/3AssVXZ80CfZHS6
X-Received: by 2002:a05:6402:1450:b0:425:e43f:7ccd with SMTP id
 d16-20020a056402145000b00425e43f7ccdmr15181563edx.299.1652734449076; 
 Mon, 16 May 2022 13:54:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSL566ekn/+bkOS9La4oAR4n8sEz2YNYQnYR7BvpgT3tW8W3vssadaONDrxzx53L2Qz72QdQ==
X-Received: by 2002:a05:6402:1450:b0:425:e43f:7ccd with SMTP id
 d16-20020a056402145000b00425e43f7ccdmr15181537edx.299.1652734448757; 
 Mon, 16 May 2022 13:54:08 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 e9-20020a056402104900b0042ac0e79bb6sm578408edu.45.2022.05.16.13.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:08 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Maximets <i.maximets@ovn.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 57/86] vhost_net: Print feature masks in hex
Message-ID: <20220516204913.542894-58-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Maximets <i.maximets@ovn.org>

"0x200000000" is much more readable than "8589934592".
The change saves one step (conversion) while debugging.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
Message-Id: <20220318140440.596019-1-i.maximets@ovn.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/vhost_net.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2ca4..df0f050548 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -201,7 +201,7 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
             net->dev.features &= ~(1ULL << VIRTIO_NET_F_MRG_RXBUF);
         }
         if (~net->dev.features & net->dev.backend_features) {
-            fprintf(stderr, "vhost lacks feature mask %" PRIu64
+            fprintf(stderr, "vhost lacks feature mask 0x%" PRIx64
                    " for backend\n",
                    (uint64_t)(~net->dev.features & net->dev.backend_features));
             goto fail;
@@ -213,7 +213,7 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
     if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
         features = vhost_user_get_acked_features(net->nc);
         if (~net->dev.features & features) {
-            fprintf(stderr, "vhost lacks feature mask %" PRIu64
+            fprintf(stderr, "vhost lacks feature mask 0x%" PRIx64
                     " for backend\n",
                     (uint64_t)(~net->dev.features & features));
             goto fail;
-- 
MST


