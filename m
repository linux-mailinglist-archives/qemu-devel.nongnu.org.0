Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3AC64DBBB
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:55:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngw-0006kZ-Vn; Thu, 15 Dec 2022 07:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngo-0006ca-04
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngm-00045j-AE
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so1734999wmb.5
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lm7NlrrFf1C1nltmeU5bGZsKO+xvFdHgekkB5rtA8G0=;
 b=luxavzBRyU3sxgg+eKETEcGHb8ay8mIgSxD2351rF18862ucCjWy3L955gbj6Vkvto
 rohf9Ifkiw+Udd4HJESdv1F8jEgTIvQUj8LEF4EfLI6VDJlqt2ppUQ92qxtOIdjJ6DaM
 5uDgsAU/T0b5CKrETIkbO+BtgHmD3WmBM33vp9Z4aEyN2AXcDqwjLjka2Q0Z2L1s9Ue8
 8F36IPH+1kF6iOlcGuKHTr55vpZ0IqvJrKxKVUWxPGaqNv4YeTMERswqYFz6KkHAvH1p
 qAp6+7HnEbGRIwpCJq5rM0EEQi18O15ZIVxBOOWRM88JRVMZ8v0jcNkwPlojg4c0rJIb
 9bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lm7NlrrFf1C1nltmeU5bGZsKO+xvFdHgekkB5rtA8G0=;
 b=HDUwshj2VXOjuWzM0BitHFI1oLhOyR+2iQEUz8osWeWzhKtBancIx1AW20sft+fJHK
 4iPjwFBNlmeVbM2kVsD6U/CQvmEe0BlMNzI1IWEF9N0axyupW+q3X/iGaTbBEE9c1aGp
 uGW8okOYHH7YD7UG2kymxF/A3O1ngIJtM/zra2vdzoRs6+pL9w+HO1FV/LP6QzzlQUfx
 WO5GPc/EqKnIfqOOBcs9abR/6mmwXFYE/GFZ27E6lCUDDeBlnddZmNfz7yWQ3kInuAQR
 vHalpjPV9pN0AhbiIYOZBOXMzmrNLAk/Uek4mcP66reePZW67fiC7CkEzty0nLu/M9af
 e8zg==
X-Gm-Message-State: ANoB5plRsg1g1oIOsA4eM7b80gGw7HfKkZqGiZnrUhRH7qMISx7l536e
 B9TyQ/Vt5krbQ/K/CHxKccUwFh/7S2RVJ1no
X-Google-Smtp-Source: AA0mqf71x/ebYz5qvYb5DYsWl+OWzMkiiCjJjDKhzj3RcQR6cG/RV7Ys+GulDHbR59KEH+vj5e8eqg==
X-Received: by 2002:a05:600c:2191:b0:3d2:267d:64bd with SMTP id
 e17-20020a05600c219100b003d2267d64bdmr17246556wme.3.1671108614116; 
 Thu, 15 Dec 2022 04:50:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/29] hw/arm/virt: Rename variable size to region_size in
 virt_set_high_memmap()
Date: Thu, 15 Dec 2022 12:49:42 +0000
Message-Id: <20221215125009.980128-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Gavin Shan <gshan@redhat.com>

This renames variable 'size' to 'region_size' in virt_set_high_memmap().
Its counterpart ('region_base') will be introduced in next patch.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
Message-id: 20221029224307.138822-3-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ca300281939..2659f4db15c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1693,15 +1693,16 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void virt_set_high_memmap(VirtMachineState *vms,
                                  hwaddr base, int pa_bits)
 {
+    hwaddr region_size;
+    bool fits;
     int i;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
-        hwaddr size = extended_memmap[i].size;
-        bool fits;
+        region_size = extended_memmap[i].size;
 
-        base = ROUND_UP(base, size);
+        base = ROUND_UP(base, region_size);
         vms->memmap[i].base = base;
-        vms->memmap[i].size = size;
+        vms->memmap[i].size = region_size;
 
         /*
          * Check each device to see if they fit in the PA space,
@@ -1709,9 +1710,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
          *
          * For each device that doesn't fit, disable it.
          */
-        fits = (base + size) <= BIT_ULL(pa_bits);
+        fits = (base + region_size) <= BIT_ULL(pa_bits);
         if (fits) {
-            vms->highest_gpa = base + size - 1;
+            vms->highest_gpa = base + region_size - 1;
         }
 
         switch (i) {
@@ -1726,7 +1727,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
             break;
         }
 
-        base += size;
+        base += region_size;
     }
 }
 
-- 
2.25.1


