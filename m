Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD816689C5B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxU1-00021l-8I; Fri, 03 Feb 2023 09:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTz-0001zW-7Y
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:07 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTx-0005v2-Gd
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:06 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so2571313wms.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDUR7TYjLSIvLofe5Yaai1+QKInBgxE2ASTflQgOO30=;
 b=co6U3GbsDJJFY4pVZU4kiCaVdgc5JoqCG/yoosYneWzeGuAXKp52S85umVEABW6VC/
 vG5zZI++4sVTwNag+e7zvu/jX/Z9H1HuEXOIHUk7P+LOmkUAxpXCp/MzN/PuY/xYL8AS
 UId+mN9Np3xWCJbdz01CchkAaBWuNy36A2+Ptadp8y/A7BY7ydDKdArSqODvsaxYDR17
 DfOHxEdc6zLChVvg3POqKO0xxojy3T0FvQY7ECXspXMLFdkPATsO5vL+FFHk9vS4NvBF
 2+d2Q6Lp4joe+MOeQBJQkgME4A8r9jX7IP6jeqJWH281VzLu8X1RFPnGbOFbTirxpfqf
 ADpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WDUR7TYjLSIvLofe5Yaai1+QKInBgxE2ASTflQgOO30=;
 b=jQk4Xei8jTTah31LcILdAkYSDhm/U8IANq7l/kv6fUZZ+fTgcn93/ClYXc8vysrhhV
 sKF+olNQm2jHd6uRW/gSdfOpKtpfwI12THfhE270ID81vb7NxwQRsZ5vIUrf3TDYYdXR
 QiFSHo2Uquxs2PNg1g/epexppk8B6+huJjQPTL6kfDy1LI7UoNmYa6D2ES4Es7i+6tw/
 LXB+5ElULo2KpVwEJEx//L2dUCVAoou90b+zuOquyEWOA/OMi32xmQZpZOQsdKBxKn7M
 JlN1+CEnxCQiW49dkDypNhZQNJrkmFaDGHywRfkwiyqLdLPN/V1mAKXw7gCjfY70bTGk
 ivwA==
X-Gm-Message-State: AO0yUKV2UQZIwH4heE2Roaa/8qLPzyy8amFSxC3Rs9BKcUGDNp6PPwtF
 tzEFFBmwttoIYb4W9Glm7UNL7qQG3GgVtO20
X-Google-Smtp-Source: AK7set8UtkLrFxuNkRCr1JP7oWXiyRusxQYVDdzQhbZnhISmHMNyK2878BM7eQNPaC/1Yh0CiW1q1g==
X-Received: by 2002:a05:600c:54c5:b0:3dc:9ecc:22a with SMTP id
 iw5-20020a05600c54c500b003dc9ecc022amr10169316wmb.8.1675436163969; 
 Fri, 03 Feb 2023 06:56:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c0b5800b003cfa622a18asm8009272wmr.3.2023.02.03.06.56.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 05/15] hw/i386/sgx: Do not open-code
 qdev_realize_and_unref()
Date: Fri,  3 Feb 2023 15:55:26 +0100
Message-Id: <20230203145536.17585-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/sgx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index db004d17a6..6a729bff94 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -285,7 +285,6 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     SGXEPCState *sgx_epc = &pcms->sgx_epc;
     X86MachineState *x86ms = X86_MACHINE(pcms);
     SgxEPCList *list = NULL;
-    Object *obj;
 
     memset(sgx_epc, 0, sizeof(SGXEPCState));
     if (!x86ms->sgx_epc_list) {
@@ -299,16 +298,15 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
                                 &sgx_epc->mr);
 
     for (list = x86ms->sgx_epc_list; list; list = list->next) {
-        obj = object_new("sgx-epc");
+        DeviceState *dev = qdev_new(TYPE_SGX_EPC);
 
         /* set the memdev link with memory backend */
-        object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
-                              &error_fatal);
+        object_property_parse(OBJECT(dev), SGX_EPC_MEMDEV_PROP,
+                              list->value->memdev, &error_fatal);
         /* set the numa node property for sgx epc object */
-        object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
-                             &error_fatal);
-        object_property_set_bool(obj, "realized", true, &error_fatal);
-        object_unref(obj);
+        object_property_set_uint(OBJECT(dev), SGX_EPC_NUMA_NODE_PROP,
+                                 list->value->node, &error_fatal);
+        qdev_realize_and_unref(dev, NULL, &error_fatal);
     }
 
     if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
-- 
2.38.1


