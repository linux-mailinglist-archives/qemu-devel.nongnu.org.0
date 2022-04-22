Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D59550B5AA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:55:06 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqwL-0004RL-7v
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA4-00050s-UM
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:13 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA3-0002ru-7Y
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso7631626wml.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JusjhwmCYsYrAoBkrOFAzh+RoRO01/bInTb0P5AYwvE=;
 b=Z0KuIr0eLj+gAGyOmHaDaqJWTv4aAbxESISDcj83njDvBGh6uK1E0vY68ae2lPjFlg
 VPvp5lJsGQngVguRBLq7PbVh6h2lyP7Fdiy1HXvMnVw5IRo1qFxTqqHJ+N+uWNCQFOYE
 4AQ9ggBA6hIyM/JZeKG2Ot1OEwg4qL1t3aJV7d1d0YWJF74AGa68QYOcGHehtdsnWesC
 cTNtSW4Q01l6Bq7Pj/BFfxhfGR5hXmxPaJb5DAvPsvKXXkGtPS0Hub+PH1gghe+Q85nF
 AQhd3+GKVV7PwTEZr8WsBidzgKjNmza8K70+0XHBvvlhaWonYMuXu/2iWDo9mlTLBR1v
 htlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JusjhwmCYsYrAoBkrOFAzh+RoRO01/bInTb0P5AYwvE=;
 b=JZESNXMiGyvVY5vIP1yVB97S5YwzKVW/A54Vb3sUjfTZ/qVf+9z9kK8icXQIoPDCAS
 EpHR/wqOkXs8qJiPF76tHpKNQlsp9bdNqzmrvnBcBnAI8sV0SMzbZ//we0UarOy2eosZ
 /TgvEXlqa+oC0svhyzsmStZs1PWRS/M5SRUzhAh7nUe/hHbaSJGz9d4HrkOppUSUcqtv
 7b2nHa8lCSzhYQiSVlHfI5swgHCgvvKexhN26df1WME5F8Fk6f+ee5DMwshNuv+3zDZA
 UNCegNkxzt/JJkzDSxSV6uoLaVTX3FYpWCJyqKUaBiQF4W9yQ4FShb5Gq/Bqdk5qwqyr
 9wLw==
X-Gm-Message-State: AOAM532+WcBA7Db4yXWITeW4/L/Oajc3q441pgtGw/k3u+MnNl2f/xkG
 oSSpFIYx5Nf2qUo3sQ2fT7tZgudHuGD/tg==
X-Google-Smtp-Source: ABdhPJyg7N7qu7GX9SjutN2Hiox7rR4VTZrOGU6Vn7IYvxWeGHzCScnFa5UpPaHLIhq1zL2EMewx+w==
X-Received: by 2002:a05:600c:3785:b0:38e:bca8:f0c1 with SMTP id
 o5-20020a05600c378500b0038ebca8f0c1mr12346874wmr.56.1650621909744; 
 Fri, 22 Apr 2022 03:05:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/61] hw/intc/arm_gicv3: Allow 'revision' property to be set
 to 4
Date: Fri, 22 Apr 2022 11:04:09 +0100
Message-Id: <20220422100432.2288247-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Now that we have implemented all the GICv4 requirements, relax the
error-checking on the GIC object's 'revision' property to allow a TCG
GIC to be a GICv4, whilst still constraining the KVM GIC to GICv3.

Our 'revision' property doesn't consider the possibility of wanting
to specify the minor version of the GIC -- for instance there is a
GICv3.1 which adds support for extended SPI and PPI ranges, among
other things, and also GICv4.1.  But since the QOM property is
internal to QEMU, not user-facing, we can cross that bridge when we
come to it. Within the GIC implementation itself code generally
checks against the appropriate ID register feature bits, and the
only use of s->revision is for setting those ID register bits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-39-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_common.c | 12 +++++++-----
 hw/intc/arm_gicv3_kvm.c    |  5 +++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 181f342f32c..5634c6fc788 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -326,12 +326,14 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     GICv3State *s = ARM_GICV3_COMMON(dev);
     int i, rdist_capacity, cpuidx;
 
-    /* revision property is actually reserved and currently used only in order
-     * to keep the interface compatible with GICv2 code, avoiding extra
-     * conditions. However, in future it could be used, for example, if we
-     * implement GICv4.
+    /*
+     * This GIC device supports only revisions 3 and 4. The GICv1/v2
+     * is a separate device.
+     * Note that subclasses of this device may impose further restrictions
+     * on the GIC revision: notably, the in-kernel KVM GIC doesn't
+     * support GICv4.
      */
-    if (s->revision != 3) {
+    if (s->revision != 3 && s->revision != 4) {
         error_setg(errp, "unsupported GIC revision %d", s->revision);
         return;
     }
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 5ec5ff9ef6e..06f5aceee52 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -781,6 +781,11 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->revision != 3) {
+        error_setg(errp, "unsupported GIC revision %d for in-kernel GIC",
+                   s->revision);
+    }
+
     if (s->security_extn) {
         error_setg(errp, "the in-kernel VGICv3 does not implement the "
                    "security extensions");
-- 
2.25.1


