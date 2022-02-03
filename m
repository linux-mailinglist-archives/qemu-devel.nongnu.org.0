Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58A14A8CCE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:58:12 +0100 (CET)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiF0-0002ht-BT
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:58:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdn-0002mh-0H
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:39 -0500
Received: from [2607:f8b0:4864:20::42a] (port=35758
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdh-0002JB-Rd
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:31 -0500
Received: by mail-pf1-x42a.google.com with SMTP id u130so3045990pfc.2
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mgPtfvqDsNTLRxTRPmFW79qViytxlXTk2nJLw5OxqU0=;
 b=jQQ5Vq9nDwNLDsgsH07rc2BoJlXkByXv9HRkqAgoCfrSYjym9VCWm9Bhn7GKdmEuwi
 tCWKheUJUwSk8vpLhD4ZBWw/Es0KbuyG/d1aAx0XR1i4WAxAdtYFSxZ2tkqEP/xs02Ic
 TpuG4oezTVxAxxhdEA0i5qMm12tk/ATBKMU2Fz/bmHLyApwHuko5yPrWEQXc8683m3pc
 7IQIi6l+H3UGGtWWPlwgxZGOFeDQGdpKs3yEx08tzOTPbVjmAPiiRgzNiI7jI+9tm5ye
 4kErVIPBqAtXCqt+51SLkYlkc8qdeDOv6iFiJC4NrmrHh+4E4ylwJfWrwZSWvGq+agMb
 XRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mgPtfvqDsNTLRxTRPmFW79qViytxlXTk2nJLw5OxqU0=;
 b=0r4OM6EFBrg1oqaBfSuwfcmSHnnvOIrHmHvIuObrZO3rfUPy6q/l4YiS/f9CRtmHYy
 nIzguT/OAElPINwL0o67rJNAlcu30u1ZqDMoJnniMFHhzeUmkSlKwQNZa12lFCd4H6JV
 xnu/qurR64PUqmuKfuD2CIEJsv0auVXSm7NlGt79wS/xs2LsJ8Ef1p/WP5UM/7DD2XuK
 ytfPMTVwzW6s999rydmRzfSNUhTZLSJA5Xd2rGk2PVRv0V43OP+w3QceyjH6iertNgk3
 zX4ow2fRLBn8Rvydo2WjsrugXGEdlFhG+Ka37ctVGL5fcHywAujsT6Q/XpWPJCt0qla9
 +JzQ==
X-Gm-Message-State: AOAM530Dy4N27AezCOnfEXD2CZzlDVrV60r63E4SzjHS3eQokFzitT5z
 Mq7hj/pTHKSk9VBOH4jBmobM3/8ORjs=
X-Google-Smtp-Source: ABdhPJy2hVJahscY9apD9PgC5tnrBUn03MKSIyCe8Epno2ZfiMY0lwtrBD1UxeQOBe7VeZkOUoDq9g==
X-Received: by 2002:aa7:9838:: with SMTP id q24mr35863865pfl.76.1643915956866; 
 Thu, 03 Feb 2022 11:19:16 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id my18sm8106103pjb.0.2022.02.03.11.19.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:19:16 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 07/21] accel/kvm: Simplify user-mode #ifdef'ry
Date: Thu,  3 Feb 2022 20:18:00 +0100
Message-Id: <20220203191814.45023-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Now than we only build this stub with system emulation,
remove the user-mode #ifdef'ry.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/stubs/kvm-stub.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 5319573e00..7e0fb884b9 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -12,10 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/kvm.h"
-
-#ifndef CONFIG_USER_ONLY
 #include "hw/pci/msi.h"
-#endif
 
 KVMState *kvm_state;
 bool kvm_kernel_irqchip;
@@ -80,7 +77,6 @@ int kvm_on_sigbus(int code, void *addr)
     return 1;
 }
 
-#ifndef CONFIG_USER_ONLY
 int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
 {
     return -ENOSYS;
@@ -152,4 +148,3 @@ bool kvm_dirty_ring_enabled(void)
 {
     return false;
 }
-#endif
-- 
2.34.1


