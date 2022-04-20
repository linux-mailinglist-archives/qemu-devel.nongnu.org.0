Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4723C5092D6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:30:50 +0200 (CEST)
Received: from localhost ([::1]:34734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIqX-0002Qg-CS
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIeF-000178-9H; Wed, 20 Apr 2022 18:18:07 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIeD-0006DS-LR; Wed, 20 Apr 2022 18:18:06 -0400
Received: by mail-oi1-x22d.google.com with SMTP id 12so3642766oix.12;
 Wed, 20 Apr 2022 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K8WVNO+DvSzRR2gkDUOwX7KhXIIabHDIYMO1TIC8QPE=;
 b=k+p/O++CbULin/NvaccHey20/1yhrsGkD2EMpJuQUZhrhR85/bXCRkWl0fLEpLyyC/
 0frQ3BRk3pHAIURnsacRMYkr5SPhEL4aI56DyByp1f5MDfJu1Fqz8wzandnyt4ngpUu+
 eB18VMVAFG85RsUzLcou5skwM9nB5zpsfbMMth00XX79tEdEhnFxOtKswKqkSJPatQV0
 TeXHIBM4f28pCxsma7pajOjBVj9rV4J9AD4lS0AKmQdqxizF/pb1zjgzHhc28dv9lXfT
 EjgX/053C+7YtgpmXql+Tto3VGqslVBX9qm0MnaklBTcg+dSq1QluG+Ru1KbREwNLOeH
 L8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K8WVNO+DvSzRR2gkDUOwX7KhXIIabHDIYMO1TIC8QPE=;
 b=yOjoflKeeTNY7tfQnmXv+5lz1ffvrLLJnBFzUMnQLyBRhKO3hV1AWwG+cCeEZoNuJ3
 CNWTMkMiTikFRKkBcyaegfrC0LTQZqQst22um7PkF+mBFFx8RokrK6Ef9KspiWkI8LBY
 jHyqDvvHm5xNx9LGm4g3e8SUbUcGhRnj1n0Jxz+Dt9ZAiPUb+vqquxRCK6A7ll1jfhUB
 0mYLigC4qfYUuXfP1JFsZSQpJ5PMrE6iu9F1zkUSSfO5JalibrrsW6ZQfXPuwBr28uKy
 s4lm06YC5r9HfcWUBwaH5pDc6kmjjRH9Iw/Y9wVVROtdz00pC0anfifhftzc+j7bY1GS
 +hYA==
X-Gm-Message-State: AOAM531uatPHkRbg9zVd/IU/0lFq+ToN/Oe+h4KAFFu9jV/fiw0uZE8J
 Kq/EPn8NznttwyFlUCUMZiP7bfotcfc=
X-Google-Smtp-Source: ABdhPJyVrPuc5j6s5pefdeVlkK9AL6QRSTZV1DD9V6sH26MnVAs9hhmf/68k14fmKX00xJ0RSi12lg==
X-Received: by 2002:a05:6808:1508:b0:323:bf3:e59e with SMTP id
 u8-20020a056808150800b003230bf3e59emr64419oiw.115.1650493084153; 
 Wed, 20 Apr 2022 15:18:04 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:18:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] ppc/pnv: Remove LSI on the PCIE host bridge
Date: Wed, 20 Apr 2022 19:13:27 -0300
Message-Id: <20220420221329.169755-22-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, peter.maydell@linaro.org,
 richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frederic Barrat <fbarrat@linux.ibm.com>

The phb3/phb4/phb5 root ports inherit from the default PCIE root port
implementation, which requests a LSI interrupt (#INTA). On real
hardware (POWER8/POWER9/POWER10), there is no such LSI. This patch
corrects it so that it matches the hardware.

As a consequence, the device tree previously generated was bogus, as
the root bridge LSI was not properly mapped. On some
implementation (powernv9), it was leading to inconsistent interrupt
controller (xive) data. With this patch, it is now clean.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220408131303.147840-3-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 1 +
 hw/pci-host/pnv_phb4.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 4e68ad4f03..3f03467dde 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1161,6 +1161,7 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
+    pci_config_set_interrupt_pin(pci->config, 0);
 }
 
 static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 3c4c2dace0..13ba9e45d8 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1771,6 +1771,7 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
     pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
     pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
     pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
+    pci_config_set_interrupt_pin(conf, 0);
 }
 
 static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
-- 
2.35.1


