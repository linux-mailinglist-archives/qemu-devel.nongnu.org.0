Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02916897D7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuNL-0007wP-1m; Fri, 03 Feb 2023 06:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNJ-0007vk-HH
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:01 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNH-0001BV-2j
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:01 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bk16so4359543wrb.11
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LPgOBQNVShoBt1EXepGeYQrXhiL1fUSuZyDvfJk1E40=;
 b=VmDCIyNwV7GEJxSl0nfE7kn8ujAuESRt4FNhb33yC/ytBz0sQ853H4qmkB32E31akS
 a9Iuum1DyG2LCwVRyRSazsAlCmMVzpQtxLAoA8qI6j+z7try0S7JNVw2pE+NzgzirKNx
 k29KWNYM3zLwCnrUXhGGXSsVzj73GE9WrJq+/kFf/gr4/yFnOSC6g5NGwpfEpxx547b0
 A4y4TwtDp2eHluTTiaHlQ2gn7r9ZDX6WwwWL30EGVdrsJ1GXcfGwiDwj1sfcttcq9BMp
 jzaWbAr4uWF57tb3kfB+LjiX9akW2EKRWfLmp2ZVMtq2UkLrM8XGVxcb4UHT+yZUPlCZ
 Z4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LPgOBQNVShoBt1EXepGeYQrXhiL1fUSuZyDvfJk1E40=;
 b=FUQhxe2h73dJEoUoYRwKVs2Gc6YnJhNJvJnZQy1fb1/CdJXySWGsAQDbZMmBvos3t0
 LZgwHXzr2mbsBonyI1jElbgtQa1ax1VbhiRGPM4UIAIfeohkayDA4I9Rw8WiH3P3w7dj
 GH38HuMQPq7TpoaBXH3gA3xuTNUFwi76ccfVWvf6+GAwrBJccOy33KOJknTMnKKuhUzs
 B35GfAj+tLDZz+dKfRFZIwwkVLpm2GztKCvtvYgTKgAHPm1CIO7NeH0DdyUBxvHC1Qe9
 U0MszrLgcvEMzrpkKTJXgs8xpn30EPmRG0g7T+wJPK5XKwSbyqvjNbQjmwZX5RExSeMu
 SH8g==
X-Gm-Message-State: AO0yUKUsFI7fjC4fOIY4ueD806WPHkuSOT3JEvy18LnKlG2L9hOOIv0j
 +H9c7F10R/FQaV8IWTNikffiRy7U2J06B8+W
X-Google-Smtp-Source: AK7set/Pf3E/Vm6R6fejVfLxnRiMINZjt3iqKu09jt2lz8437cyovLGjtnlsb68xbIcxpqNhY2+Pew==
X-Received: by 2002:adf:e192:0:b0:2b2:1db6:a6bb with SMTP id
 az18-20020adfe192000000b002b21db6a6bbmr9046597wrb.20.1675424217510; 
 Fri, 03 Feb 2023 03:36:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a5d6a87000000b00287da7ee033sm1763541wru.46.2023.02.03.03.36.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:36:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/9] hw/i386/sgx: Do not open-code qdev_realize_and_unref()
Date: Fri,  3 Feb 2023 12:36:42 +0100
Message-Id: <20230203113650.78146-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/sgx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index db004d17a6..5ddc5d7ea2 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -299,7 +299,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
                                 &sgx_epc->mr);
 
     for (list = x86ms->sgx_epc_list; list; list = list->next) {
-        obj = object_new("sgx-epc");
+        obj = object_new(TYPE_SGX_EPC);
 
         /* set the memdev link with memory backend */
         object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
@@ -307,8 +307,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
         /* set the numa node property for sgx epc object */
         object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
                              &error_fatal);
-        object_property_set_bool(obj, "realized", true, &error_fatal);
-        object_unref(obj);
+        qdev_realize_and_unref(DEVICE(obj), NULL, &error_fatal);
     }
 
     if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
-- 
2.38.1


