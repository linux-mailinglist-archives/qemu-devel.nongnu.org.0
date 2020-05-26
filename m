Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069AD1E2029
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 12:53:13 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdXCq-0007z4-2c
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 06:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdX7P-0006gj-Sc
 for qemu-devel@nongnu.org; Tue, 26 May 2020 06:47:35 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:38586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdX7P-00028g-8g
 for qemu-devel@nongnu.org; Tue, 26 May 2020 06:47:35 -0400
Received: by mail-ed1-x544.google.com with SMTP id c35so923821edf.5
 for <qemu-devel@nongnu.org>; Tue, 26 May 2020 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ExVlN86Dv7JggIxvLUBjz5FHxHeWDg8nuqJ3/185rZA=;
 b=VauECVWWbkfCdG9+rQWyFRwoWIO7+4FzY5Q1jdDMJaLE126xSrwheWRRvS4EtMzkjH
 MF7aJ/HPZzlbnbZLkW3oiEyFu0NdxA0QnMIDzSAmo/sBxdoKY/EN/+f81mw8CU1+Jikf
 EecBEIFlc8J59xst2Ww5GwU8lAa+s4BLcufPSwixsazA3xBBioilhjkoTR/6iTGbqTZJ
 Hr+Ek+8hV6lrLuSsxaOzsANx3bqzLrNrmYata4UJhGcRlTp0jz1zEZegZnz1azGhM6YR
 fQz51j2jGxHy/Y8qP1atLjhCBbcp116daMJzuo5JdPWBLdj/CZwvRy2UHrFiba8TxEsZ
 lAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ExVlN86Dv7JggIxvLUBjz5FHxHeWDg8nuqJ3/185rZA=;
 b=L9aqnhuAZqKyR4GaPEQq6iyuAbAtZW/6xgAhFTLqszqnOs7YTHRjLKW0v9FOJXrYF0
 /tiT1RFkxGnHye0TjUlAVNN50dk7Hiie2Y8RuZBTZK45VLXwvDdKcCkpIzg8JuqHBChx
 l6xfHGWG7r/DRCAw7nbOSKYO6sUrv3IdVySpbOWEqFaThAw2zk/knq/9M4X/kucRmXcT
 uJKwOmpeAX5QoR6jpul4MEhVo+n2E2E6290i7cmPw44pHyMybE+LEUHpur85Zx43OVMw
 S7pkWYNTkVKxUAXmrw40xWtm/PB7H9LFGJNLZmjCfbRx1/W/dxCjxTIpHT6tK+GogAV1
 HAJA==
X-Gm-Message-State: AOAM5310OB4N96o3TGMPOd8l03TCZ9DCOf0KQEQZteeEzfPjr78pedh7
 yJJqiXroQ4vh9y8bGUW0xQ4U0k2S61o=
X-Google-Smtp-Source: ABdhPJzHu36DajOmP5Yy+ZDR/NQuP7WVnBAlHlsYi1iESqNhjAYoDuAuPU3hfKvuG4eDjyRO6ncuEQ==
X-Received: by 2002:a50:ed06:: with SMTP id j6mr18875441eds.209.1590490053806; 
 Tue, 26 May 2020 03:47:33 -0700 (PDT)
Received: from x1w.redhat.com (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id c27sm3342597ejd.19.2020.05.26.03.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 03:47:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/14] hw/pci-host/bonito: Map peripheral using physical
 address
Date: Tue, 26 May 2020 12:47:16 +0200
Message-Id: <20200526104726.11273-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200526104726.11273-1-f4bug@amsat.org>
References: <20200526104726.11273-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, libvir-list@redhat.com,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peripherals are mapped at physical address on busses.
Only CPU/IOMMU can use virtual addresses.

Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Message-id: <20200510210128.18343-8-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index b874468ea6..b90e5a636d 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -647,12 +647,12 @@ static void bonito_realize(PCIDevice *dev, Error **errp)
     memory_region_init_io(&s->iomem_ldma, OBJECT(s), &bonito_ldma_ops, s,
                           "ldma", 0x100);
     sysbus_init_mmio(sysbus, &s->iomem_ldma);
-    sysbus_mmio_map(sysbus, 3, 0xbfe00200);
+    sysbus_mmio_map(sysbus, 3, 0x1fe00200);
 
     memory_region_init_io(&s->iomem_cop, OBJECT(s), &bonito_cop_ops, s,
                           "cop", 0x100);
     sysbus_init_mmio(sysbus, &s->iomem_cop);
-    sysbus_mmio_map(sysbus, 4, 0xbfe00300);
+    sysbus_mmio_map(sysbus, 4, 0x1fe00300);
 
     /* Map PCI IO Space  0x1fd0 0000 - 0x1fd1 0000 */
     memory_region_init_alias(&s->bonito_pciio, OBJECT(s), "isa_mmio",
-- 
2.21.3


