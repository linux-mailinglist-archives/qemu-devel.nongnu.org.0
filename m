Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3693F1EE0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:18:08 +0200 (CEST)
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGlg7-0004Ou-De
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGle7-0002PX-9i
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGle5-0000nE-PE
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629393361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6WDtcVKwaCmehlRPs0xBuymaPwY7iBBUHHcebJt3Eg=;
 b=GhC+2URGtJF0dHKgYsSst38b9coXxvitg7h0z6vXxG9m9NfrtM8Bbqf5bJ1eeokNnolVfy
 9Nx5zQ7YC+aW0gkd7CaIjnEzcOjT9TwAtz8JBX+iXFEsTY/slKbSB0qjRjlMOffeWpZ9KE
 t1SG/GJX1Ae/EdJ9NnVf3JrxOsaMZq0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-qGPY8wpWMTiYolnvSAhHoQ-1; Thu, 19 Aug 2021 13:15:59 -0400
X-MC-Unique: qGPY8wpWMTiYolnvSAhHoQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so1925319wrr.2
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6WDtcVKwaCmehlRPs0xBuymaPwY7iBBUHHcebJt3Eg=;
 b=NnpJVD2irnWfuz359w6XuBAwDE+jNCM88nHO8digMLfYIe4rKlnPm7n7RANP9/eoYp
 4POPshmk7ernM+54yAhgyRE7hsqvWpNTNTyI74qP1McOJ4zznvYiv35cLyPTagrNA1XL
 HQvCGBjH5LBtnFl8kAuv69NlPLm7mMFkDJPM+gbi6RpcrvFFR0QLz8xdZQm12vnpjjiF
 zlkyA+qd6Iml4O9+Qf9t7zAL3+9QX2VeKPWNqG0JTDtV5knV7CabMndt3hmExc/JT5Q5
 6XBxhLKrMIylnXba3DbdJdjdcaz6afaKn2AtrGBMPh//09PI3Usd2HaU1X4F6jmynK3C
 mf9A==
X-Gm-Message-State: AOAM533eAGY61CjVHfYslufDjg5bYTYJ2EOs3R0L0Ot3sKGdOqis14wO
 gJHt9qxtfx1sxI8VRw6GvF2n8xNpOOMsgZaVpcvUNSPGbry/KbrasrR7IwPLV41GGZ5jGjkHhwk
 l6ApEs3oEAfedx79J44mUd7hXf8TD1xiPiE7G6QeCPtqTC/3TtGQJBpj2Qc9cx5Ip
X-Received: by 2002:a5d:4f02:: with SMTP id c2mr5278812wru.311.1629393358502; 
 Thu, 19 Aug 2021 10:15:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxded6nMUf7hNj0FFFW0qd7hzTLA8bC8AjE/GmWslOJ9G2PNdk43+1ru/N+jLLXIHBY5sPV8g==
X-Received: by 2002:a5d:4f02:: with SMTP id c2mr5278781wru.311.1629393358299; 
 Thu, 19 Aug 2021 10:15:58 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 e3sm3521373wrv.65.2021.08.19.10.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:15:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link property
 failed
Date: Thu, 19 Aug 2021 19:15:46 +0200
Message-Id: <20210819171547.2879725-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819171547.2879725-1-philmd@redhat.com>
References: <20210819171547.2879725-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not ignore eventual error if we failed at setting the 'host'
property of the TYPE_XHCI model.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/usb/hcd-xhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index e934b1a5b1f..71f6629ccde 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -115,7 +115,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
     dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
     dev->config[0x60] = 0x30; /* release number */
 
-    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
+    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), &error_fatal);
     s->xhci.intr_update = xhci_pci_intr_update;
     s->xhci.intr_raise = xhci_pci_intr_raise;
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
-- 
2.31.1


