Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C050E6A7CB1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:31:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGR-0004pT-7w; Thu, 02 Mar 2023 03:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGE-00049o-9n
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGC-0002Op-Hn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/JYwSKf5nVRGaZw7BDSvU/17EvsC7CjAFuUr02BOcA=;
 b=ME6u3Bc/TA+uWHN54wDWVbiXecjI6ZQDmnYqsXM15vI5YQbgC+Xp2F3BAjNPD7IIgiypQg
 8qolpZy4ytvwFh0TdMZ4Byy/sDZ+NENVkHU7XOcLmfPQ+JTeN5TQxxAzGG7Bx3aTh/tdTq
 8pM7GABZnERjdL91EgBdOAErKYR8mn8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-jKjJ9BiNPvy_lWVIGweMjw-1; Thu, 02 Mar 2023 03:25:54 -0500
X-MC-Unique: jKjJ9BiNPvy_lWVIGweMjw-1
Received: by mail-wm1-f72.google.com with SMTP id
 az39-20020a05600c602700b003e97eb80524so926405wmb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745553;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O/JYwSKf5nVRGaZw7BDSvU/17EvsC7CjAFuUr02BOcA=;
 b=ONfcXJii4I+1SSLOYCdSTkhfM0w7QBLbHnnAzXtW3h0KjqFe0HYSD9QKoqgXg0QxDH
 +Rp346knGi6YgTpXoQIV+KodV5F/GHv/7v4ogQFnXYXCSQE6XrTnEinUM7SGFkX/S+Cx
 mnzT5UQlx8NCLwVar0NI/HGPv7/YEC/gNJqmEP6Rj0Kw3VKHpy7LHgYv1aqWatqpP6IX
 rZc/WgyuuDOVF+8oaZgL2e1fLhc3tqFheg9cAHvbtfaB8jQisCa9vWtOO+FWvlnAy/G+
 FQGIYnN5xT1v414JbQiZGgYrkTNFD6YjJS+d+eHb5nGXpNSXTATyg2s35mAR1EK4fEqM
 NB+g==
X-Gm-Message-State: AO0yUKVIrEn48sIMnAfXAN6TQ6BqwNGfEFWbxQ/MEW7pXgZ6h+/+UBaM
 jaO5cEu3uBVFcxH+ptLmpymzKdqLK/TVKSue1rrH1RX9Jk7yDv0BXv521++q3U5hyG2WaLcQNJv
 ylLon0r3FYeV9qQ8TPwpjJ/nHXmRYFGf3ZYrUifyAgRyP0VqVgv7VhexGN7u7UxUHXw==
X-Received: by 2002:a5d:5189:0:b0:2c3:be89:7c2b with SMTP id
 k9-20020a5d5189000000b002c3be897c2bmr844436wrv.14.1677745553164; 
 Thu, 02 Mar 2023 00:25:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/Szraoep2QlLcCqbPf5nqM1CWTwlbDQXYE8QrVACaeFK4kJXWDZZTi1iePHYEoGAypmyCkDw==
X-Received: by 2002:a5d:5189:0:b0:2c3:be89:7c2b with SMTP id
 k9-20020a5d5189000000b002c3be897c2bmr844420wrv.14.1677745552901; 
 Thu, 02 Mar 2023 00:25:52 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b003b47b80cec3sm2446250wmq.42.2023.03.02.00.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:52 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 26/53] pcie: pcie_cap_slot_write_config(): use correct macro
Message-ID: <20230302082343.560446-27-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

PCI_EXP_SLTCTL_PIC_OFF is a value, and PCI_EXP_SLTCTL_PIC is a mask.
Happily PCI_EXP_SLTCTL_PIC_OFF is a maximum value for this mask and is
equal to the mask itself. Still the code looks like a bug. Let's make
it more reader-friendly.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-8-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 924fdabd15..82ef723983 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -770,9 +770,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
      * control of powered off slots before powering them on.
      */
     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
-        (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
+        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PIC_OFF &&
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
-        (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
+        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PIC_OFF)) {
         pcie_cap_slot_do_unplug(dev);
     }
     pcie_cap_update_power(dev);
-- 
MST


