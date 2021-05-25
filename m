Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7B93904C8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:12:58 +0200 (CEST)
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYjo-00060s-19
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYar-0001nY-S7
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:41 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYao-00044a-EH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:41 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so3673360wmk.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mGoq1knhajbvoQtW0wYQu9k1cw9mF9ALceFxNQItG2E=;
 b=OojLX6zJeUcwVQIkSyteAVCg6M+ynLXugYx7bVKiBJNwc/JDX8sXKqLtwYIMxngcnT
 TTLMtH0hGvjq24oZKEEam9x+9veQelrFM7pUGWf0zz5f1z3kjQfGk9HUDUolZi+VJPRH
 XwzuDDCPA5ac64Xmqx7IdojINH4Lay7G8rcM5qoAIolMH9TU3SUHV35JLVVeNyrjlOm9
 w8LW18GCI8gGTa0/0P8JmxOwT/a9QPFPU0XbdDzPIAx4HoTvgEuVC8FhwtC0teu4cdmO
 Q57fAdR8msth7pMm//4S2D98ugdHyxZqv3SqNnDx+HdtFlCJpx2QNYgT4a3UIcNgcr/C
 js4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mGoq1knhajbvoQtW0wYQu9k1cw9mF9ALceFxNQItG2E=;
 b=MGH9Q25jt7CWDZCYqsmNxVxnfJ8IRusXRaW4XmMX/8mB71NINap8+YPpaSORrmDNIV
 uWc2TFRdAUP7/gA04IfnJ6d0VLvEfcIy3eCnPlMlbQNsR5M7hHsn4yV9yf/3qQEUqJE7
 YDXx0YGwieKP/VMdNyqZLxyBsYPjPWhoAFrSJRt5r4BFz6pR6JtQctJ7+GFiML1XEQxQ
 35b/wXHjxGobDOwo0+/CstJ7xVcvO+LWe3VM2O7a9eHvDojvGnJNh5E5MoU6/CbsObol
 wP9wGUTlNNn2ojwg018bQJB9yAQHMoDsBbJT6/8slqaRx7/VJDV6oW8MyY4zteI2WKA0
 Cy7Q==
X-Gm-Message-State: AOAM530+a1HMZAwTqhaPDLiKtiiJArZD57gIbRIMNGHlG5uTal6Srifq
 RUS9s/LiAyAOyrRpatE5pVR/igpnZg3meri/
X-Google-Smtp-Source: ABdhPJwPnphACukDjZ4TQYft7HkI9xCqhhXNaV0sMUQXfo1YyiK4IuUcwkKr25MJL/Ryqf4gTRP2lw==
X-Received: by 2002:a1c:9dc6:: with SMTP id g189mr4335849wme.59.1621955016347; 
 Tue, 25 May 2021 08:03:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 007/114] hw/arm/mps2-tz: Allow board to specify a boot RAM size
Date: Tue, 25 May 2021 16:01:37 +0100
Message-Id: <20210525150324.32370-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we model the ITCM in the AN547's RAMInfo list. This is incorrect
because this RAM is really a part of the SSE-300. We can't just delete
it from the RAMInfo list, though, because this would make boot_ram_size()
assert because it wouldn't be able to find an entry in the list covering
guest address 0.

Allow a board to specify a boot RAM size manually if it doesn't have
any RAM itself at address 0 and is relying on the SSE for that, and
set the correct value for the AN547. The other boards can continue
to use the "look it up from the RAMInfo list" logic.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210510190844.17799-6-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f2595b1c7f7..8d921afec14 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -126,6 +126,7 @@ struct MPS2TZMachineClass {
     uint32_t sram_addr_width; /* SRAM_ADDR_WIDTH setting for SSE */
     const RAMInfo *raminfo;
     const char *armsse_type;
+    uint32_t boot_ram_size; /* size of ram at address 0; 0 == find in raminfo */
 };
 
 struct MPS2TZMachineState {
@@ -761,6 +762,14 @@ static uint32_t boot_ram_size(MPS2TZMachineState *mms)
     const RAMInfo *p;
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
+    /*
+     * Use a per-board specification (for when the boot RAM is in
+     * the SSE and so doesn't have a RAMInfo list entry)
+     */
+    if (mmc->boot_ram_size) {
+        return mmc->boot_ram_size;
+    }
+
     for (p = mmc->raminfo; p->name; p++) {
         if (p->base == boot_mem_base(mms)) {
             return p->size;
@@ -1268,6 +1277,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->sram_addr_width = 15;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
+    mmc->boot_ram_size = 0;
     mps2tz_set_default_ram_info(mmc);
 }
 
@@ -1296,6 +1306,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->sram_addr_width = 15;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
+    mmc->boot_ram_size = 0;
     mps2tz_set_default_ram_info(mmc);
 }
 
@@ -1324,6 +1335,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->sram_addr_width = 15;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
+    mmc->boot_ram_size = 0;
     mps2tz_set_default_ram_info(mmc);
 
     object_class_property_add_str(oc, "remap", mps2_get_remap, mps2_set_remap);
@@ -1357,6 +1369,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
     mmc->sram_addr_width = 21;
     mmc->raminfo = an547_raminfo;
     mmc->armsse_type = TYPE_SSE300;
+    mmc->boot_ram_size = 512 * KiB;
     mps2tz_set_default_ram_info(mmc);
 }
 
-- 
2.20.1


