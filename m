Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698864BD898
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:38:44 +0100 (CET)
Received: from localhost ([::1]:51654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM59X-0008I4-FY
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:38:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zO-00085H-Aj
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:14 -0500
Received: from [2a00:1450:4864:20::433] (port=43540
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zM-000112-S9
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:14 -0500
Received: by mail-wr1-x433.google.com with SMTP id i14so25874413wrc.10
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=u4Q+Hke1BccBlcaqJg+5JH0IMmPFZMSy7PZO5x6wtSc=;
 b=NFfBpe6CFa1e6lvwaau30cagWbybPB72TYcBmgAyLJYb5ZYHC5wzghws3aKRp+4HDU
 AmaHQTrOUjy/ZojGbaYc8JtgMDaPkyvwihK70OQPYeDZPeP2pMeCl9NRUeMaTq1CfU9C
 msNNUMJsU8PSMRiM6kxsKzNNd15oUXirQ1XoYbcf4UJaOpcy8pbhGv4Ik6iLV2psYuLc
 7Fv+xm+4DnR/0zbDDvXDDlda3qRMfLoNatAuQwXIPEqfKVWQlaP3p3FA6zvbznal0mY/
 Yg8uZ19BZ/jG98T0QWYiB3EtYF4YorruT8Fw9pGPy/WPJlKzUDOWWQbnDXjJzNeULF4N
 Wo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u4Q+Hke1BccBlcaqJg+5JH0IMmPFZMSy7PZO5x6wtSc=;
 b=MKedZOoE14WRLfj2tifKnOK1p5dawgNJ+pbzma6QBALIQlPf3rc98+CjZ6xJXxZ/He
 INlxk81tejMnfoN4wapkBlEYak/vdQw2KBk8QkZxv+Ojk51UsC7c92SGckGPjzl3/um3
 PS18jPBYiR092OIfqwJoxBj/UZy/RZ5bOtGsSHHhiXQReFoAo34vsZqn/uMsZd5wTmU1
 hWZyv4U4OTn4b8WlrI1NvH4nMmzR7Fv94lxsGItN+yQoP1e93L/77H7MukLXK96g4Fmf
 jKG4z/54fg7etx1bzJWqSuN9HQpiTBjEM0f/7PbnN71fSWiuaAbeJ23N/F0+ww4vX/bU
 8+FQ==
X-Gm-Message-State: AOAM5319gFa0R96ifGb3Lk2Xk5o2Gc0uFK5DDqfNTa887HcjAS6qSTU9
 Q8DMODutugIo/IWp73PEKMHdNUTnTFwjIQ==
X-Google-Smtp-Source: ABdhPJye6x0MeDPLA6iof08E4vUOv4NT9+26wJqhr9p9vCtDPxTBAbmg9XnF8OXRiNrhDC3JexLGkQ==
X-Received: by 2002:adf:f5c3:0:b0:1e3:3f71:7974 with SMTP id
 k3-20020adff5c3000000b001e33f717974mr14705649wrp.587.1645435691555; 
 Mon, 21 Feb 2022 01:28:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/26] target/arm: Fix '-cpu max' for HVF
Date: Mon, 21 Feb 2022 09:27:45 +0000
Message-Id: <20220221092800.404870-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently when using hvf we mishandle '-cpu max': we fall through to
the TCG version of its initfn, which then sets a lot of feature bits
that the real host CPU doesn't have. The hvf accelerator code then
exposes these bogus ID register values to the guest because it
doesn't check that the host really has the features.

Make '-cpu host' be like '-cpu max' for hvf, as we do with kvm.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220204165506.2846058-6-peter.maydell@linaro.org
---
 target/arm/cpu64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2280e476fd7..19330d9ee94 100644
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


