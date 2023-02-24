Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C826A1ED8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:46:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9o-000465-Lx; Fri, 24 Feb 2023 10:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9l-00042k-6a
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9h-0007Yr-Pi
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJiIMvo6sZS4evgVOH5z7IVX8Mcl5+hs+hn+1D7tSZQ=;
 b=eKRQoPnHFp465kqilzvUH3R1oASqWQvJAukrEYHU3iKodTESlvMcTTt9Ahbf/lzqLbhOeU
 iqyip3roTst9iRhbOYX7+lwBHWS7ivCebLfnPP2MobLNNTBv/KZTKSHe6we7nWknC9aecO
 UxsyiJtp7cWUsxENsddLz5TBCFoxIT0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-CqAhDq3EO7-oYdnaWrmeoA-1; Fri, 24 Feb 2023 10:38:35 -0500
X-MC-Unique: CqAhDq3EO7-oYdnaWrmeoA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 844AF800B23;
 Fri, 24 Feb 2023 15:38:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9B7F492B12;
 Fri, 24 Feb 2023 15:38:33 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 23/33] acpi: pci: describe all functions on populated slots
Date: Fri, 24 Feb 2023 16:38:02 +0100
Message-Id: <20230224153812.4176226-24-imammedo@redhat.com>
In-Reply-To: <20230224153812.4176226-1-imammedo@redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

describing all present devices on functions other than
0 was complicated when non hotplug and hotplug code
was intermixed. So QEMU has been excluding non zero
functions since they are not supported by hotplug code,
then a condition to whitelist coldplugged bridges was
added and later whitelisting of devices that advertise
presence of their own AML description.

With non hotplug and hotplug code separated, it is
possible to relax rules and allow describing all
non-hotpluggble functions and hence simplify
conditions whether PCI device should be enumerated by
generic (non-hotplug) code.

Price of that simplification is an extra few Device()
descriptors in DSDT exposing built-in chipset functions,
which has no functional effect on guest side.

Apart from that, the enumeration of non zero functions,
allows to attach more NICs with acpi-index enabled
directly on hostbridge (if hotplug is not required).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 * patch is making acpi-index feature support complete in
   the scope of host bridge (support of acpi-index on PXB
   is out of scope of this series, and probably should follow
   host-bridge clean up)
 * follow up patch will add a tests case with acpi-index
   enabled PCI device on non zero function to demonstrate
   that.
---
 hw/i386/acpi-build.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c33b43a358..7b982b6072 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -493,12 +493,6 @@ static bool is_devfn_ignored_generic(const int devfn, const PCIBus *bus)
             if (DEVICE(pdev)->hotplugged) {
                 return true;
             }
-        } else if (!get_dev_aml_func(DEVICE(pdev))) {
-            /*
-             * Ignore all other devices on !0 functions unless they
-             * have AML description (i.e have get_dev_aml_func() != 0)
-             */
-            return true;
         }
     }
     return false;
-- 
2.39.1


