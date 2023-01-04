Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E7C65D495
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 14:42:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD401-0003il-Cj; Wed, 04 Jan 2023 08:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3zy-0003hj-Ig
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:40:06 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3zw-0001bk-HH
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:40:06 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so24112532wro.9
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 05:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/Y2LlHycAcX9mSOeT6G6dar2QR0XkVS2EXSvJD6ZwQ=;
 b=U1YvcaiEVIzLO++FM31iBtpHiiFt3u5zsOUbwAsW70AmXtWSbjhYhpgdTjnBReYoDO
 Fz8m6xY9x0Hz21ozXffWhUnA5yxhqnQSRObom3LBSthNXCi3En9+2Yv6q2ZKe6YY/fT0
 a/AUUzh7cPXDI//BQ5TaIXTGzSIeNv0UKa6yqoRfotR3JOw+7GTY3Qc34T7Og5l1bQN/
 AhYkBdB5R5ph2QJ8eFkGuUfXu38sFJQ99VWZLpT6efhhBeTcUqYNhX+rKK44wA1XRXl2
 TrSZwnwFW7/6mNGEQZk1rfpajtgjyV5WUuYymOn7IEWe07K0K/nGqWNA9JxMYzBNwlzW
 3HdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P/Y2LlHycAcX9mSOeT6G6dar2QR0XkVS2EXSvJD6ZwQ=;
 b=svBuxS1HxcyVTP4ADLyj7mK7qZOOd4jDZ4QjLvbtV+PTpA25aPzTOg+AyXa7sk8lun
 24myOGI3O8wdDsVaCPCc0TYgk9JDickRv559+iLyE9lHtgaNljkdU7dhFUM8vFXevq80
 qSPRvh0pHE/AsvnWB9wj/ZvUQkKHPdlWTydB3vUAF9VJ1iaybtpPMexkR2sad9YUSTwA
 87TZ6yKStFalqr8WmOw5yIls7+CMd8hv0c6DdlpNO+uWyVk8KTNWjwkmflpuo1EUysKB
 DXE6yESDgO1vA5BtEbhD9wjWHa7FqXEyH4cAxvgpAvlTHNVTb2aKukWq+9hhA4QdJitw
 T/vQ==
X-Gm-Message-State: AFqh2koS1SNpXOFY/6p0t0Nq2CHxE+7ZVCu3A6DYRvxQcDkMkJ0opSCH
 2aX/dG64VwWKSBrz2CBofokYS1CHjnKkgRYc
X-Google-Smtp-Source: AMrXdXv+y8pf1QArqc45KFf7v8lzq4pmI/W71VpbiGztr4zzdBTRalJ/JCbaWKNIGK2WjBzjelyn5A==
X-Received: by 2002:adf:f54a:0:b0:242:2e1e:23a6 with SMTP id
 j10-20020adff54a000000b002422e1e23a6mr31180610wrp.22.1672839598729; 
 Wed, 04 Jan 2023 05:39:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i23-20020adfaad7000000b002421ce6a275sm34401345wrc.114.2023.01.04.05.39.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 05:39:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/6] hw/mips/gt64xxx_pci: Accumulate address space changes
Date: Wed,  4 Jan 2023 14:39:33 +0100
Message-Id: <20230104133935.4639-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104133935.4639-1-philmd@linaro.org>
References: <20230104133935.4639-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Single registers access in ISD can produce multiple changes
in the address spaces. To reduce computational effort,
accumulate these as a single memory transaction.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/gt64xxx_pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 19d0d9889f..d84c2b7349 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -282,6 +282,8 @@ static void gt64120_isd_mapping(GT64120State *s)
     hwaddr start = ((hwaddr)s->regs[GT_ISD] << 21) & 0xFFFE00000ull;
     hwaddr length = 0x1000;
 
+    memory_region_transaction_begin();
+
     if (s->ISD_length) {
         memory_region_del_subregion(get_system_memory(), &s->ISD_mem);
     }
@@ -292,10 +294,14 @@ static void gt64120_isd_mapping(GT64120State *s)
     s->ISD_start = start;
     s->ISD_length = length;
     memory_region_add_subregion(get_system_memory(), s->ISD_start, &s->ISD_mem);
+
+    memory_region_transaction_commit();
 }
 
 static void gt64120_pci_mapping(GT64120State *s)
 {
+    memory_region_transaction_begin();
+
     /* Update PCI0IO mapping */
     if ((s->regs[GT_PCI0IOLD] & 0x7f) <= s->regs[GT_PCI0IOHD]) {
         /* Unmap old IO address */
@@ -354,6 +360,8 @@ static void gt64120_pci_mapping(GT64120State *s)
                                         &s->PCI0M1_mem);
         }
     }
+
+    memory_region_transaction_commit();
 }
 
 static int gt64120_post_load(void *opaque, int version_id)
-- 
2.38.1


