Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0CD47C1EF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:54:07 +0100 (CET)
Received: from localhost ([::1]:46736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgWk-0000Yc-MY
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:54:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mzgRu-0001o1-LR
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:49:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mzgRp-0004SA-NQ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640098141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=rwUflEIkdrtBW9gN6vAvUmklzOlP8P84Kn3du2hxPdQ=;
 b=Gs/u5MouKkOk9w+/TaHmnziF2r943T+t9PjslpblnJkMje5RhZiR5Aro4B+mrOxVHprDUS
 2muKFRAP/l2mL+GnEetllE6KS4yBUhfJeS/krjFNLdahmsHVCcP0PLzgBoKfSLQUxONwO2
 TrYa2ng6pvdlZ/7sk+ta6MJwMI0Hdcg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-7fDhAvq_MsiQMzL1oTXFHQ-1; Tue, 21 Dec 2021 09:49:00 -0500
X-MC-Unique: 7fDhAvq_MsiQMzL1oTXFHQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 d7-20020aa7ce07000000b003f84e9b9c2fso5681145edv.3
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 06:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=rwUflEIkdrtBW9gN6vAvUmklzOlP8P84Kn3du2hxPdQ=;
 b=1JLurGJ9xd75qVL3J7ucLbRUrfJqBKujhCYsycqz1RO/DCwFe8YbZRvfW7ojEaxsaN
 1pNUayONMCNZ1pb2lZyehJ7o6ExjWrC2WZWw2m17BPCHfketWGDxIGApzXZCLkxpwN4w
 t0BK2xrpXzq4ZBh3w3oeJkIj7YOFJmymw8n0bTgswC8cEiLL03CiTz8ZxgTfHtS3Fl/V
 Hpa+rJHImFNDAI/b575R71yImNoWtuZnazggHE1yRyrcsjvC2C135I1PO9zA+5MBLBdV
 TfVN0kKjGhthjIlepFUJykO6ZbUX2wTJuxEWgAg5lJf66YNZUbCD7cGS0hMkpTYgQwB3
 5ysQ==
X-Gm-Message-State: AOAM530sUctSv4XzKlaYgP8Bhg8tTWIbO3MLc5iGLTw4zeS0GTovPRwV
 hprfGjMu5OIgDfMm4BHLmwESnR+Rh/wVX0UqW7i+wrislXryCG/Ozyt4ekt0gfA0Se2v1Z6Nl6q
 Ij30fK8JTCrXeBDlIk0b4/rJV0KVOm3jlzv7wcgWUw34IFAEVwNKkfMtJD2zW
X-Received: by 2002:a17:906:4407:: with SMTP id
 x7mr2894596ejo.51.1640098138465; 
 Tue, 21 Dec 2021 06:48:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkYo7mzoldbVpdbh9m9rE8EOYcMoaOUmIGZid7jIAdylYgxq/fI6ew+rmGdQdHv02jQUl70A==
X-Received: by 2002:a17:906:4407:: with SMTP id
 x7mr2894580ejo.51.1640098138217; 
 Tue, 21 Dec 2021 06:48:58 -0800 (PST)
Received: from redhat.com ([2a0e:1c80:7::36])
 by smtp.gmail.com with ESMTPSA id lv19sm2467692ejb.102.2021.12.21.06.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 06:48:57 -0800 (PST)
Date: Tue, 21 Dec 2021 09:48:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] acpi: validate hotplug selector on access
Message-ID: <20211221144852.589983-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When bus is looked up on a pci write, we didn't
validate that the lookup succeeded.
Fuzzers thus can trigger QEMU crash by dereferencing the NULL
bus pointer.

Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
Cc: "Igor Mammedov" <imammedo@redhat.com>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pcihp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 30405b5113..a5e182dd3a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -491,6 +491,9 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
         }
 
         bus = acpi_pcihp_find_hotplug_bus(s, s->hotplug_select);
+        if (!bus) {
+            break;
+        }
         QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
             Object *o = OBJECT(kid->child);
             PCIDevice *dev = PCI_DEVICE(o);
-- 
MST


