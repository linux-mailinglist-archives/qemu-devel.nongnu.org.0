Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACEE2D33FE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:33:11 +0100 (CET)
Received: from localhost ([::1]:33192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjfa-0007Lm-Od
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminy-000860-VB
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminx-0005z2-9R
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ao4RDAEOM2YLTiIdrHeiCtTgsP0kjiPBhD8XurXHvys=;
 b=ZPoVxl8gfySZSjIuKW6xk0RGo8H58lIhe/9lQWpsBmKW9IEpHA9HcdYtvaYek4YhF10mhU
 iO0P24wWk0yqj8B1HuKC0AnoyqU39mFjwxFM+B2nXeM67B9ecre5eR5UrXJyBh89NdDJla
 W+BnWiunRpGizNgLhIPZ1yImyAdEMU0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-4uwNj7AYODOIDPX4ya9EVg-1; Tue, 08 Dec 2020 14:37:38 -0500
X-MC-Unique: 4uwNj7AYODOIDPX4ya9EVg-1
Received: by mail-wr1-f71.google.com with SMTP id p18so6549494wro.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ao4RDAEOM2YLTiIdrHeiCtTgsP0kjiPBhD8XurXHvys=;
 b=lkZKacRXnPoBx7V7bPsT2pZeyU2lwfZhMQ2kkqMMbj9Z3O+VQqXTQaNox9IZsQlx4X
 8AVB7yfah0NDud9u+lH4no+rCp6FIFVBKwg32HgEa3QcVKcPZYdYKSsD1eGZshmhRhxG
 rHyIuejBUWyZ3V3eUursmpmXHatnJodUAfWkdP/gJOvThjlw3DXG8rbWdun3Bkmoq77w
 AWdKPvn+3CMbZQgEIdxQ3ldeIk6pPwz8oaD0669fdiJ9EnkftVGBAO3rVC4I+HBXS6QW
 es0W4aHpe5ZQ2na0J03Fl8r8tKkK9KLHDzzHatafcbYe1FYR+iyjoxfr1kXbsKdT7d3/
 kCqw==
X-Gm-Message-State: AOAM531h2VVbV7ppd/N4xSnFJMqsLCZ1vsrRdYc3NG9DKxgqw/ExLdzy
 gDUzBPlqtLTzDbwioRG3ZhanMLQMfqwWiw3qF87ta90vROV32r/n8Bm7rFqWkRwPHphbFdvDerK
 rUe2SSCguI6BURa89sCQb+1nzk9whyHydcC77sDGGx/Q7uJNrAO9qepEiGVDe
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr5277348wmj.130.1607456257358; 
 Tue, 08 Dec 2020 11:37:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3fQLfBO2ETf9BJVmFBVT+1erqI7Hq9XmBQRuLLczIxXhYdVZ41qPNgn3IBNduKEueM3GE1Q==
X-Received: by 2002:a1c:23d5:: with SMTP id j204mr5277325wmj.130.1607456257113; 
 Tue, 08 Dec 2020 11:37:37 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id 35sm21637947wro.71.2020.12.08.11.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:36 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 63/66] x86: ich9: let firmware negotiate 'CPU hot-unplug with
 SMI' feature
Message-ID: <20201208193307.646726-64-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Keep CPU hotunplug with SMI disabled on 5.2 and older and enable
it by default on newer machine types.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201207140739.3829993-9-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c      | 4 +++-
 hw/isa/lpc_ich9.c | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 675e15c0aa..9e29f3792b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -97,7 +97,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
-GlobalProperty pc_compat_5_2[] = {};
+GlobalProperty pc_compat_5_2[] = {
+    { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
+};
 const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
 
 GlobalProperty pc_compat_5_1[] = {
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index da80430144..d3145bf014 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -392,6 +392,12 @@ static void smi_features_ok_callback(void *opaque)
         return;
     }
 
+    if (guest_cpu_hotplug_features ==
+        BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) {
+        /* cpu hot-unplug is unsupported without cpu-hotplug */
+        return;
+    }
+
     /* valid feature subset requested, lock it down, report success */
     lpc->smi_negotiated_features = guest_features;
     lpc->smi_features_ok = 1;
@@ -774,7 +780,7 @@ static Property ich9_lpc_properties[] = {
     DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
                       ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT, true),
     DEFINE_PROP_BIT64("x-smi-cpu-hotunplug", ICH9LPCState, smi_host_features,
-                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, false),
+                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


