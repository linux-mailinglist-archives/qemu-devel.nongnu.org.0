Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57D4A9D60
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:06:56 +0100 (CET)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG22x-00047X-Sj
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:06:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1sH-0002xR-FS
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:53 -0500
Received: from [2a00:1450:4864:20::32d] (port=50887
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rt-0003D9-Gy
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:40 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m26so4997078wms.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GEq+WVisRup7DDWYvHMkPo67hjMY0sbprx528SyyNTQ=;
 b=PQW6Y+Khj/Qrk/sc1YwfoCROKa8j6BW6/7xmrhbN8wqRmSbSkVsTSnrD5ufGRVtcfa
 ZfVORtiCLtcxI1/yTmDSQ/ZKSOZoyPkXHnI/9+TqSj2vSqMyzNGpeIWa9K5huorHG0PZ
 rt8ET0hlnowomjeeY545wWe4f/1QtW0axvsSio2RdayhkzLMEYxp+CQjv/zbQqq2Xcpo
 kixIi1HEQyEiRp3bVI3INtT7pnmBICcReryzz+X0FmVO86appphrGR2lqvRHD5iY9KCg
 BELIJg/GUM0Kyz1V1xOFkWLvs2yVcK9lerlDcx1EOWi/tQ66iREdivNdbDQgUHMQbq7Z
 VNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GEq+WVisRup7DDWYvHMkPo67hjMY0sbprx528SyyNTQ=;
 b=OT8sxgAoClCenuLEsxBGfOO48lzf90PIlKbwhzj2ulZ9PC7ebDE+Ryybarcjcw2sCI
 qP9yX/MYWHqOJgq9kXvwsMc6AFXkk4X/N1ZsIDrXOUSAzLKXSHTSQp5mpimrNlMk9CS7
 xC0dlqbTDpSaHNMqIjv+hBP7xGvzmtNP/8XWPY83yEcRr5Y6E58eCveyaNbW2Ma/jNKa
 whdndQ7SNcfmVjOCAqpVJ4H7fa8tWLYgsnGGCdoq4HhvpNr5L8i+9dXeD6V0COvLCf0s
 j0cEzTVQwxnPfQ5QdzY6V9zoxnB2opreqzBLtI1Khq46qyUXLlz8flRMXmeNwNeR1F5i
 lBDw==
X-Gm-Message-State: AOAM533W47jJ4PBMqPX6F8iJsAFKYzbxrpXmQ5aR+W+ZHBX2KOCYpWxS
 UruYruYR28irFEW4BgzvipBlaQ==
X-Google-Smtp-Source: ABdhPJwpkb3wvZs40lgkIxZZlTznWlbfSjhuU1IRbP55uzE0LHu3C6zM9/TwW7jaHdDGmuyTA9nqoQ==
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr2997821wms.101.1643993712352; 
 Fri, 04 Feb 2022 08:55:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/arm: Fix '-cpu max' for HVF
Date: Fri,  4 Feb 2022 16:55:05 +0000
Message-Id: <20220204165506.2846058-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently when using hvf we mishandle '-cpu max': we fall through to
the TCG version of its initfn, which then sets a lot of feature bits
that the real host CPU doesn't have. The hvf accelerator code then
exposes these bogus ID register values to the guest because it
doesn't check that the host really has the features.

Make '-cpu host' be like '-cpu max' for hvf, as we do with kvm.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index bc25a2567bf..fd611c97116 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -29,6 +29,7 @@
 #include "hw/loader.h"
 #endif
 #include "sysemu/kvm.h"
+#include "sysemu/hvf.h"
 #include "kvm_arm.h"
 #include "hvf_arm.h"
 #include "qapi/visitor.h"
@@ -710,8 +711,8 @@ static void aarch64_max_initfn(Object *obj)
     uint64_t t;
     uint32_t u;
 
-    if (kvm_enabled()) {
-        /* With KVM, '-cpu max' is identical to '-cpu host' */
+    if (kvm_enabled() || hvf_enabled()) {
+        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
         aarch64_host_initfn(obj);
         return;
     }
-- 
2.25.1


