Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7F84612B5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 11:42:18 +0100 (CET)
Received: from localhost ([::1]:33180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mre6z-0005CD-Es
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 05:42:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre49-0002Nu-Gr
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:21 -0500
Received: from [2a00:1450:4864:20::32f] (port=45844
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre48-0004mV-30
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:21 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so12042469wme.4
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 02:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l7d78ATa07OlF5TV8mrAqS1LhRjfotGyqwUydTrZV04=;
 b=MsgRM629o+ICVqkUNxnz7E8hIrTiWm8pIfPQNWvleXOP/bXtOYq25WjkNPlFKzMwFj
 qjZau19jE2qTbnCYMMJMO+ZK8ws7UWsX8SrTQevVp3S5JfTEjp0wg4L83lPNHwMHotc2
 ES9ZSWo8gfQl17DIrNc45aIN4qWVwe/InNii6u3MurrhX/UONSpSKKTZMPcvOS6yT18z
 KVt3yg9VLCZfpv5wN0peUVIMu1E7zczn3+MSvWgSDQVZp7ZhRAu2zSUS/Z5yqKxNyv9l
 sUtlCJRsWeu9IJCs4KzQ7Az50UDXFUMnebANGEmivZPRn9/jNVx+I1CsW6ABwifkra+l
 apLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l7d78ATa07OlF5TV8mrAqS1LhRjfotGyqwUydTrZV04=;
 b=fIC/VeM4jyAOkjTELPTgWDsyCBD6sZWpLS130ItAwCJmv2R6M7MqQL9D4WTDbdzkuD
 WNtw66DpKLjv3Wn1cVQAj1gcNZ8hIoceXBEIQSwMe8WKu6QCJlsNyoiyDC0l3x7aRq8o
 anItqOd49vZI1sBJQgrcH/BBUiSgaLATMJt/foIJ5j3B2V6zUkunO+lrXmDqDu1da5RK
 wG7sATYuhlpqV6JQs2O5cpBcksuDoxsdJzggUzvEMWK7JmxKzqMtu0Y7Z01rkTcKiDh0
 PopyF6qC7iK58OgC5ixC0DXW4zWTkgbNGNHpJkHs2AMVPfwX/H85bXhc0XaaAFlJ1P1d
 sqtQ==
X-Gm-Message-State: AOAM5326SmvuGOCc+4v67DzxB1w93EmLHX7DfRwpXyW5Z2ueJS3lTLcx
 KxR8PND4pYLrmU9J6EI8xu+r08Vw0AEETg==
X-Google-Smtp-Source: ABdhPJysgIPRKYhg9vadY0uNxvQ0Xl+D0152JWC5VH2DH7DIhESVium3x+Fg7rKHY9s8X31baicv5A==
X-Received: by 2002:a05:600c:1d0e:: with SMTP id
 l14mr34841861wms.64.1638182358118; 
 Mon, 29 Nov 2021 02:39:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t17sm18810912wmq.15.2021.11.29.02.39.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 02:39:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] hw/arm/virt: Extend nested and mte checks to hvf
Date: Mon, 29 Nov 2021 10:39:11 +0000
Message-Id: <20211129103915.1162989-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129103915.1162989-1-peter.maydell@linaro.org>
References: <20211129103915.1162989-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Alexander Graf <agraf@csgraf.de>

The virt machine has properties to enable MTE and Nested Virtualization
support. However, its check to ensure the backing accel implementation
supports it today only looks for KVM and bails out if it finds it.

Extend the checks to HVF as well as it does not support either today.
This will cause QEMU to print a useful error message rather than
silently ignoring the attempt by the user to enable either MTE or
the Virtualization extensions.

Reported-by: saar amar <saaramar5@gmail.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Message-id: 20211123122859.22452-1-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 369552ad45a..30da05dfe04 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -49,6 +49,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/tpm.h"
 #include "sysemu/kvm.h"
+#include "sysemu/hvf.h"
 #include "hw/loader.h"
 #include "qapi/error.h"
 #include "qemu/bitops.h"
@@ -1969,15 +1970,17 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "Virtualization extensions to the guest CPU");
+    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+        error_report("mach-virt: %s does not support providing "
+                     "Virtualization extensions to the guest CPU",
+                     kvm_enabled() ? "KVM" : "HVF");
         exit(1);
     }
 
-    if (vms->mte && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "MTE to the guest CPU");
+    if (vms->mte && (kvm_enabled() || hvf_enabled())) {
+        error_report("mach-virt: %s does not support providing "
+                     "MTE to the guest CPU",
+                     kvm_enabled() ? "KVM" : "HVF");
         exit(1);
     }
 
-- 
2.25.1


