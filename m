Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C15E6874BA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 05:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNRam-0004aJ-CL; Wed, 01 Feb 2023 23:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRae-0004TL-Qh
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:53 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRac-0001CM-OH
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:52 -0500
Received: by mail-pj1-x1036.google.com with SMTP id pj3so834985pjb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 20:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+y+HqzRrl7TJ/ysQrK68jIu5s7bSfbhBZtrr7+F62XE=;
 b=pqxyJ0Nry8FFf22TFbBWY9LpWZvLgCQY7otUTwMQiuhBHGA/magZ/wuoYbs8oWxe1V
 BSOMSiHbyCeVfFMATI624d6goQCpaqekvPZwBOUCZCzmnopZ1yQSRfinY8Khi66UaREI
 WcowntmIgK9LUlPTLZaWL3Jr1FCcCaYw0KZkwl+XyrvtRK3sxSLQaxZd6txFSFhmUJSU
 2HPM0oxvUaeIpxqB4pU8LPfy3kRvtuYH4zobmR4PsO+HbrcPejp1kAV6xPkpWRJWn4dW
 lwMGkrsOJrsoXjFYnk6vEbEm7u0ma/4XNeyc+PYPjjJ7px0vf8J8Oq4GzdmXhQRI8Re0
 73pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+y+HqzRrl7TJ/ysQrK68jIu5s7bSfbhBZtrr7+F62XE=;
 b=8AyCPh2DlJ2+iVoLVHZtsuo83hmC+9IqrMqSTJB+P5a1jFVN4LRZ43uHRia4MbX+er
 69CwrQR4dUKN9dbIHyOxTpmuVBzS7AhMcK1k5re5x+Y4l2C/ROflIV7jRLeaADoGUKdz
 N3bGeEatjF7fvwZ/wMuxdH2mHZrYAY18aHLwwG0n/75t0AY5lJNBC4smKBbHmUZeKrRG
 IpR9PvwaP6n92uq96dYUf5wNGde2tDHrIS+W/SXqr0LmEcTxbkTQVjUnMvBdXbNYWsDw
 Ibpmrak9kirpzOTbWHb6dwLS8n5gF/CCxeK/QwI4XlLh3AO9iLbQURGItWM7n5L2nj5C
 nsag==
X-Gm-Message-State: AO0yUKWLnCz1NimkABmVlqGK3X2Ao+e/usD3+WZr48eQmmIPUj2qUp8v
 wvIbBnzTAse7cEI4YXxCzho05Q==
X-Google-Smtp-Source: AK7set8EUJ8Ig84w77zRqm+zQfMalfcNsQ/DczaJTFR73EIIaKldiMTzhC2yGPAjtgIIMwP+3sBPdA==
X-Received: by 2002:a17:902:c702:b0:196:64bf:ed86 with SMTP id
 p2-20020a170902c70200b0019664bfed86mr4456435plp.62.1675313570139; 
 Wed, 01 Feb 2023 20:52:50 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:49 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 07/10] hw/riscv: meson.build: Build virt-acpi-build.c
Date: Thu,  2 Feb 2023 10:22:20 +0530
Message-Id: <20230202045223.2594627-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1036.google.com
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

ACPI functions are defined in new file virt-acpi-build.c. Enable
it to be built as part of virt machine if CONFIG_ACPI is set.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index ab6cae57ea..2f7ee81be3 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -9,5 +9,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
+riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 
 hw_arch += {'riscv': riscv_ss}
-- 
2.38.0


