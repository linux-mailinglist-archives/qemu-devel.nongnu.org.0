Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013324F9872
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:44:23 +0200 (CEST)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpqY-0004r8-1E
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPb-0007PP-Oy
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPZ-0002Tz-UC
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w4so13010209wrg.12
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XnswKnW47+8+9tHo/ACX303pdkhT+++S3GFx5eRGIRU=;
 b=h2p/RXIgXv5UOyE1d6rbKEqNFYNv6xK7BgY5D5cRkUPk21TO8P2SWtXi6uunuRadD0
 GFeKnRas7QsSB1eFReob96bryoubXa2GeDg/y9YMfqDBhtcqno2f+aXr3q1aFWvBJf6N
 bl44yl4j5eBXMTZ33LNrtXyRYYfvigAwe3ucd+nPxbIBxKcxZrIOfUFB5qsGH05ddG3x
 JCIs45FSJpTxwBQS8BWopL9ZjSDxxopfwoD1bZpdl6MXKcu30uCU1PMJB98Gdi/E4hZj
 KukMvkFU4p0DX5AzfoSLttk5Xw/RNslAsf4iT41M9+OZnxo6A896JUPU5evYHg53jafg
 G55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XnswKnW47+8+9tHo/ACX303pdkhT+++S3GFx5eRGIRU=;
 b=KLuGTrPTg3eO6m21Eduf5RGe9Y2oJzlIGeZKD9RpQ2HSKktFeVXVwDhOvcbGWOGu7W
 mC/yUtEIWRXpHtlrqp/lIHCuo2Za6e6rYg6XDFUyUqWK6EpZMCmR2vveCpXS/FxQAMep
 Zwvb/aFUSJzEx3NM7k3mYD7e/HtBU3JXXoiknuOdmYsm8Tg+K4xK9kx5pZbd1FFA6W9o
 pXV746jKYH/LL+c39ubCMyqYXH4uZ+jyevPN/e3n2kXL0s0o5MGmfmE669CEsh7J5S9+
 rvbfSd/tCG7DG0xBhTG4xL4KmQtEVEziQQajvEcZvwv8GAiwhh7GNdaByYA/fbAqXTeq
 5TIg==
X-Gm-Message-State: AOAM531as3fNMqumlTcsCh7f+sRLP1lPnlov3aruH6npwNe4VMsbaNvj
 AE3IpIdrJInl1w9PvXGvivjFHw==
X-Google-Smtp-Source: ABdhPJym0ZC1+VBftsi8JSwjiv8MkzSMw+OQ8voyt/niiwd8i1L65nkb3s98Fwb1FagzFgW/Hpcp8A==
X-Received: by 2002:a5d:6c67:0:b0:204:ff0:87a8 with SMTP id
 r7-20020a5d6c67000000b002040ff087a8mr15159472wrz.627.1649427388116; 
 Fri, 08 Apr 2022 07:16:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 38/41] hw/intc/arm_gicv3: Allow 'revision' property to be set
 to 4
Date: Fri,  8 Apr 2022 15:15:47 +0100
Message-Id: <20220408141550.1271295-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
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


