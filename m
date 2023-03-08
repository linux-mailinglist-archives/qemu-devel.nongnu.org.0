Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC93F6AFC18
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:19:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNN-00025V-C7; Tue, 07 Mar 2023 20:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNG-0001Qx-7z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNE-0001xI-6S
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NiVZH2cd8MhbH6SXMN81UWaoK1zb3nOIQh2BBsQUr/E=;
 b=eu/INKHihbx/o74JN8P2OvxJCEuWL2gI61hO6sF9XtKqI+5+WJao9UrITPNrO/qcAYOJ5B
 uPXOq8/Lof4p8Wdfm9d3Zbl2+v4hn4QpzkjtlPTKB8abF4jhnD9KDfMzXycYyR3vZNKcUY
 31reFvXhqvW7jnHK604iqq6601qR8Ow=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-_x6cS_LHPZmQ1E_XN7vzRg-1; Tue, 07 Mar 2023 20:13:42 -0500
X-MC-Unique: _x6cS_LHPZmQ1E_XN7vzRg-1
Received: by mail-ed1-f71.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so21656075edb.21
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238020;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NiVZH2cd8MhbH6SXMN81UWaoK1zb3nOIQh2BBsQUr/E=;
 b=XQnCQQgs6v1lktLyHTimHUhhAJ9LNEy4MTrYQ+noFiFeyEzCA4NWdzf/wsjEwVkWZb
 DE3e+g6fPmr3sIsZkT6ruJ/6XuYNS8jJKVL29HAlKbTFxdkAnj47m+ZN5AgAAfVNA/ss
 y3rve81/aEm8SSfQg4r6LBGz1P+PG2leGnujbikpEFP4aarG7RLwtxRnYyK6MfYhlSsI
 1XTrk5kxGRG0e4N8yu77Nial/cbVG5RnD6mwzkt8wus3SovzVL13V+mmEK0urmePZmVP
 Sk59cNCd7f+0pelMCh455HRok/1g7uidSNjTyyNkbnVRmKJmw3tabrCifMI3ax5JXliv
 d/NQ==
X-Gm-Message-State: AO0yUKXrkourt/tG9GAqiUClR+Kx2f/6U0MUL49d0A/iUm5v2a08qes9
 dTNpRDWYfKNH4cgkBh4is/qMKB0Jtz9QQDJE0M1U3dI6txewvGzrjIx1Me8ug+Gl7nGgS0+l0DY
 gXjnEjsK0jnEUoTpOyyF89hz6QJRIsukEcpb4m5BqBmEHKcQhleKm58PHsjYXKyMyBzsG
X-Received: by 2002:a17:906:b050:b0:8b1:e791:faef with SMTP id
 bj16-20020a170906b05000b008b1e791faefmr16070718ejb.67.1678238020462; 
 Tue, 07 Mar 2023 17:13:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9wjztgnezAeIFAUh1i+Q0neiLpjXNQqE68dPjLfoMLeJfUdZIEH8HLlXy0LSTA8TzDtQVCug==
X-Received: by 2002:a17:906:b050:b0:8b1:e791:faef with SMTP id
 bj16-20020a170906b05000b008b1e791faefmr16070703ejb.67.1678238020277; 
 Tue, 07 Mar 2023 17:13:40 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 1-20020a170906308100b008de345f4f9asm6770149ejv.49.2023.03.07.17.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:39 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 56/73] acpi: pci: drop BSEL usage when deciding that device
 isn't hotpluggable
Message-ID: <419233b2b417eec65211b4a5160d94978546467b.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

previous commit ("pci: fix 'hotplugglable' property behavior") fixed
pcie root port's 'hotpluggable' property to behave consistently.

So we don't need a BSEL crutch anymore to see of device is not
hotpluggable, drop it from 'generic' PCI slots description handling.

BSEL is still used to decide if hotplug part should be called
but that will be moved out of generic code to hotplug one by
followup patches.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-31-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8e2481fe5e..ce14866eda 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -591,7 +591,7 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
 
         call_dev_aml_func(DEVICE(bus->devices[devfn]), dev);
         /* add _DSM if device has acpi-index set */
-        if (pdev->acpi_index && !bsel &&
+        if (pdev->acpi_index &&
             !object_property_get_bool(OBJECT(pdev), "hotpluggable",
                                       &error_abort)) {
             aml_append(dev, aml_pci_static_endpoint_dsm(pdev));
-- 
MST


