Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E23764EBDC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:07:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AOq-0004no-5u; Fri, 16 Dec 2022 08:05:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOM-0004gx-P5; Fri, 16 Dec 2022 08:04:57 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6AOK-00087y-Np; Fri, 16 Dec 2022 08:04:46 -0500
Received: by mail-ed1-x52b.google.com with SMTP id r26so3495967edc.10;
 Fri, 16 Dec 2022 05:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ZEyqEMBEtqlHQnJS2z60kGnt73/BnxbYpNYss1OKsw=;
 b=DwYwqa0NBdSQqrsOROBbqfQ6bX9Le82HJ80Lo/ZN2ab4dXt7QVvZbzHiIfAdK5vxzd
 pqEH/y9RLHw52Kqf0g0PJBHaKRwo+svkITawUWZ8vbb8xAIjeUc56o+5vSVRI5nr26ui
 QM6q5lZXOzFTTKXU/sngpJMyMvZHP1+b4DDEBzAzScaOjC/3EihyXbB0W0lDK0/FQpks
 n0h4XcY6o/HF++WgtjA5YwhfEXDSSfTMcxbq0oP61eu4mGmGFLdlK/spCin6sfH5uAZT
 lkw1dJ0HfyLiiDi/3YgKkCveNp/ZYYzM8nWCr52Go03WVN4IISnkHnmOGjRB7DbkZRfi
 MxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ZEyqEMBEtqlHQnJS2z60kGnt73/BnxbYpNYss1OKsw=;
 b=Ge+GlKqu3wsBQZeL3sgU3ngsK+VF0plpvlUwlqnZAfJmqbe84PMDI6Hg1s0hjUGazB
 d1zXjoHmZNREW3S2AEztpn7EUsN4QACbIE84d9mRuKbdoz+xQU46/7WnRT2oK871PiMo
 AJu+IqxoE2bpLLt11CHje2DH0dwdrinLLfYxVDnf+08AJEGyet3T9snZOBvHoo9SoX3D
 X2uyGPamygp+oBCLJelWBFsyIiB7pl5ZsJg2mQdEzHmtMvyk7RkaZPuiNxgO14xLeipk
 ZCLJS7nBU0jv5na/DNtdMMj+z15PFQsHpVMrPrbgmfXtLhavv7JcNXAd+yNKf+WcDlWl
 AlSQ==
X-Gm-Message-State: ANoB5pntccRHxEpx3Wk2tMOZ/OwjpxSRRLh0uiZrLzS6aSr+Z1JnJS+v
 sbg0VSMdbJBqHiYqy9O1dkzgPtBGD4g=
X-Google-Smtp-Source: AA0mqf6dI/1HdPf3mXOvGQ5f9oo/83YiuWAZyk+cozO3gvVYfwCC4xMtUOymv9ZcJ1DyVxGFCASkIA==
X-Received: by 2002:a05:6402:f29:b0:46f:a2c2:405b with SMTP id
 i41-20020a0564020f2900b0046fa2c2405bmr14928319eda.37.1671195882632; 
 Fri, 16 Dec 2022 05:04:42 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g11-20020aa7c58b000000b0046b1d63cfc1sm828444edq.88.2022.12.16.05.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 05:04:42 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 5/7] hw/isa/Kconfig: Add missing dependency to VT82C686
Date: Fri, 16 Dec 2022 14:03:53 +0100
Message-Id: <20221216130355.41667-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216130355.41667-1-shentey@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The ACPIREGS are provided by TYPE_VIA_PM, so needs to select ACPI.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 0a6a04947c..0156a66889 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -52,6 +52,7 @@ config PIIX4
 config VT82C686
     bool
     select ISA_SUPERIO
+    select ACPI
     select ACPI_SMBUS
     select SERIAL_ISA
     select FDC_ISA
-- 
2.39.0


