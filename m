Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C2487630
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:07:07 +0100 (CET)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5n5N-0000Zo-Tu
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:07:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n1i-00065D-Ue
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n1h-0001hF-5q
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpoC0+6a4IT38j+kX8wAPq8AuzqmXiw7PFqYGYauyfQ=;
 b=SE/swSDjKqr6uL3nGTH8d1uhgr8Xkva8+QoycUk0oCrYDVcQDEXtt7d+2KRqVExFfYvC+8
 wXb+HgIIKPrpGFQQOMbilCoiOxVlcI7MhLtd4Rxe59zb05rEbXXLx8htEFN+H8yCY9HIlK
 FVQRNAvCk/G5rb6Kz5cb8eLcKCcEGPE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-mfBLoZkzMX-I78owkm1B-g-1; Fri, 07 Jan 2022 06:03:15 -0500
X-MC-Unique: mfBLoZkzMX-I78owkm1B-g-1
Received: by mail-wr1-f70.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so2087116wrh.23
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vpoC0+6a4IT38j+kX8wAPq8AuzqmXiw7PFqYGYauyfQ=;
 b=2mebqXq1/+9ZunxoXB4pa1Cpyi3u0v8xRLmHW4bE2iyRqAoAqFAB4Pw1swggkNqiv1
 0YXwseo124BnKC9CX+5yL568dBXXcoEY8Ef4EOg6Ng8+tGJMVTEQSLXQXo8JXts3OiAD
 JlstAn2JKjknQrnYxU3oMoBRUm2I/UopOecm52zpKOuLLj11JzAPWykT7YD7LBMKIynE
 47ynJTK+DCiagZ3gTWgCSykwWihpD4ibZmivEDGYXuSqmQxkGVKxNkFoPYClj9MDDnuB
 76ivi1thdA+D2oQTuir8c2AzEMU4QvWSiyrfM2gTGpd28+tOV9fKRvtSrWAqJthvJJg6
 Ot6g==
X-Gm-Message-State: AOAM5328OItTsjV1np0ViH6/IGc5NE91tpbrSJkCv+2/thpKc3kQ1m+8
 dXsnQRHxI0wmzNHeeUZa55ny/eOeECxsQ7Ltq8EFuDwQ67cNQFjOoywlOMgIi0mbg3DQQb0MqrP
 TTcGs0R8BfYyTDHHHSqhchsFFVTGOuQX28D87h7PDY43CUv4UjsREQHf3+P5r
X-Received: by 2002:a5d:5984:: with SMTP id n4mr48177001wri.562.1641553394203; 
 Fri, 07 Jan 2022 03:03:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybpI/nPg1+rg56pgpdbl0Gnrzd9F7EQ+9//9nU6pv9ZJV7NUwewhiPoPtVMS8dspyn7r7pYA==
X-Received: by 2002:a5d:5984:: with SMTP id n4mr48176976wri.562.1641553393962; 
 Fri, 07 Jan 2022 03:03:13 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id n4sm4400383wrc.1.2022.01.07.03.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:13 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/55] acpi: validate hotplug selector on access
Message-ID: <20220107102526.39238-3-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When bus is looked up on a pci write, we didn't
validate that the lookup succeeded.
Fuzzers thus can trigger QEMU crash by dereferencing the NULL
bus pointer.

Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
Fixes: CVE-2021-4158
Cc: "Igor Mammedov" <imammedo@redhat.com>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
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


