Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC7556239E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:56:42 +0200 (CEST)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o70HJ-0003J2-Ne
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704V-0004UQ-RP; Thu, 30 Jun 2022 15:43:28 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704T-0006Gh-Ss; Thu, 30 Jun 2022 15:43:27 -0400
Received: by mail-oi1-x235.google.com with SMTP id s188so411321oib.6;
 Thu, 30 Jun 2022 12:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k5qm34eoWz0uY1NGBKiBL2oltiMoH9qqJ8BBHvhBiY8=;
 b=DmduCEw+vJ79p01jO4Xp9UJXCK6M77Z52xA15JkNWbR4DdzVUHhmb+UvbUEKNHxnUf
 Kks6CWVneTJo2nYJ+/poisGn/lFRpGXwhqExV6o5Vfq1ljChbpHnhjqrnGcnR/DEwYek
 TXjGsGSV1NCQQALgFFDlTxv8B93eCqa/7cyOcg2ynI9LwPqbhLfS9V2AgwhLL02F2OZH
 +Dg7SGz5So8bKDPRwfk2G81VZ/9RuhuyZaLCHPdYLdOyyXFE3mpxXOurix76PpZuJWHQ
 YQ0tbUN03v9IstYhnIJ2VYzRcUlQ0aP+SQbzgb4ehfyWcnxusAYdAurLQzlp7r55mUdv
 Ns8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k5qm34eoWz0uY1NGBKiBL2oltiMoH9qqJ8BBHvhBiY8=;
 b=eeTt3osRDzjwJESCuG0/CsHSja3ar9Vu2sQNIehmAVLBxINNAcpZqhzgVn+D9jVfUJ
 pTOowoLjycCu9GeBwm30MUk6GnQvGBrxPS+owbjTWfn14OkuTpuvWAO/do/INFJwmxGQ
 RF2ITYpA9X0KGTzAWbuI7bsiS+/ct2xNlwkw5VQ6k9oQj8EKBsQUfhj0wTRhvRh12o+x
 js77gfv70rba5ybAPwqj5YxtuEc2OnRP5HMNy3P+PLnXFAfYem1ykxfLT2FhAcfzTTGi
 NJDQLqJ9WuHy2JnYSszuhEeKOls4uOA3XnAdAGAyV1dSw/i8cCMFUNov735Flnr6bNA+
 YUoQ==
X-Gm-Message-State: AJIora8ge2YAkqwueGksB3I3JtRZdnGQR4AgXefkYdggqJSqHum1C5hd
 MkN2s46VmaXAGkUlrRD3Yo1VHR7jNY8=
X-Google-Smtp-Source: AGRyM1uQ0izi9eR916OJU/JDL0l5XIIaZQwozleU4jCApHP0QiOif/fnhxEaRB/nD6NRp5DcXH2MsQ==
X-Received: by 2002:a05:6808:120f:b0:325:cef0:3f7 with SMTP id
 a15-20020a056808120f00b00325cef003f7mr6403703oil.38.1656618203500; 
 Thu, 30 Jun 2022 12:43:23 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a4aa3c5000000b0035ef3da8387sm11250519ool.4.2022.06.30.12.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:43:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 7/9] sam460ex.c: use CPU_FREQ if unable to read DT clock
Date: Thu, 30 Jun 2022 16:42:47 -0300
Message-Id: <20220630194249.886747-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630194249.886747-1-danielhb413@gmail.com>
References: <20220630194249.886747-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Fallback 'clock_freq' to CPU_FREQ if kvmppc_get_clockfreq() fails to
read the clock from the DT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/sam460ex.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4d25cb2c2e..0b3ce0cb17 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -178,8 +178,14 @@ static int sam460ex_load_device_tree(hwaddr addr,
      * directly access the timebase without host involvement, we must expose
      * the correct frequencies. */
     if (kvm_enabled()) {
+        Error *local_err = NULL;
+
         tb_freq = kvmppc_get_tbfreq();
-        clock_freq = kvmppc_get_clockfreq(NULL);
+        clock_freq = kvmppc_get_clockfreq(&local_err);
+
+        if (local_err) {
+            clock_freq = CPU_FREQ;
+        }
     }
 
     qemu_fdt_setprop_cell(fdt, "/cpus/cpu@0", "clock-frequency",
-- 
2.36.1


