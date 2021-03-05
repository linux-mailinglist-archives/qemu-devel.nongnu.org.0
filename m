Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD64C32F29F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:33:07 +0100 (CET)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFG6-0003ta-Ph
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3y-0007Pl-C3
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3M-0007jB-Eo
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:28 -0500
Received: by mail-wm1-x329.google.com with SMTP id o2so2099108wme.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IM0evp81Tpfg78UhLeSOv0MQOAQ09htasgtTC7lU0Cg=;
 b=tDbnx0ulR87df0LZ1Skkto0me1m4JkMZtfzKAxvDk2wOB8AsDz+pXgeCn6ATPkuC5g
 5YxDVbAjr3Le2yczKwKLxM7awVTb64zy8BCBdY5ppCvvTqq5IBhqCdHyJ3BIAvcyZNOR
 FPbVTwnrMuIYrQXCd3lUW/vD5wibp7eCMtVhX5F9uZs4Sly9F166UY8c+CloCmhqoDhE
 Q8LO22dx5IvjQnjVymgi/crIh07IOS8GkXPM9GhGt7kzARsGZ+wRbWh7LzvS9EuyRGWK
 fpiI9WLe/mYYLZE+xQOtu2EhyIk4SjmJIzBwXoloFHe7ycTcee9RHk9fBMp7I+gD9BaX
 c2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IM0evp81Tpfg78UhLeSOv0MQOAQ09htasgtTC7lU0Cg=;
 b=sGFkXyGn+I2/iDAQuhsouCrGbn9SQonp+81D6pL7X91cOQT35obQ3qSEfHvGP9srcc
 Eq6GACzvBOMIgC3iDEEq6V8EHf4PATWzpTzdkxbA9IHgaBJprKGr0agKzXHqqV4G6ipE
 sD0P7xXs9Vw+rUVN3Sw2rr0EJ32llBQNgZgxS6pccD14/FbEh499HyZeX7KwErHn2IqC
 Ai6lIpgjSSrjoOvWQqRO2nWi+pekgErXvbDXTEwfOLJt/r2X03cSgZdNQZEDyhy9YLPi
 fGIN48ha2XEy7JfObrr0M7daUW7AWzOd2hyLMmwGNfWC1MfZbDOueAQE17m/i/rz4dNK
 VvWw==
X-Gm-Message-State: AOAM530twwM5QxhG71Omz8TK2i+6yuOtASMr54FAViEhhxHCbfUQzBSO
 bGn35VJGpWC+OLlpUyJozpe+ivsSS40lMg==
X-Google-Smtp-Source: ABdhPJykmQc15cZ8goG901abPenpJ7wwhbpylAyO1DptFiD2UYPalWaJZ82IrTeiSnAJXe404b5pkA==
X-Received: by 2002:a05:600c:284:: with SMTP id
 4mr10125503wmk.24.1614964547161; 
 Fri, 05 Mar 2021 09:15:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/49] hw/arm/mps2-tz: Support ROMs as well as RAMs
Date: Fri,  5 Mar 2021 17:15:09 +0000
Message-Id: <20210305171515.1038-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The AN505 and AN521 don't have any read-only memory, but the AN524
does; add a flag to ROMInfo to mark a region as ROM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-19-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index eaa430e9537..333795b029c 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -92,8 +92,10 @@ typedef struct RAMInfo {
  * Flag values:
  *  IS_ALIAS: this RAM area is an alias to the upstream end of the
  *    MPC specified by its .mpc value
+ *  IS_ROM: this RAM area is read-only
  */
 #define IS_ALIAS 1
+#define IS_ROM 2
 
 struct MPS2TZMachineClass {
     MachineClass parent;
@@ -209,6 +211,7 @@ static MemoryRegion *mr_for_raminfo(MPS2TZMachineState *mms,
     if (raminfo->mrindex < 0) {
         /* Means this RAMInfo is for QEMU's "system memory" */
         MachineState *machine = MACHINE(mms);
+        assert(!(raminfo->flags & IS_ROM));
         return machine->ram;
     }
 
@@ -217,6 +220,9 @@ static MemoryRegion *mr_for_raminfo(MPS2TZMachineState *mms,
 
     memory_region_init_ram(ram, NULL, raminfo->name,
                            raminfo->size, &error_fatal);
+    if (raminfo->flags & IS_ROM) {
+        memory_region_set_readonly(ram, true);
+    }
     return ram;
 }
 
-- 
2.20.1


