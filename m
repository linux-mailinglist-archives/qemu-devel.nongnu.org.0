Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC4F6A8B1C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:23:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNk-0000pf-2R; Thu, 02 Mar 2023 16:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNi-0000pD-8v
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:30 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNg-0002PR-Ne
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:30 -0500
Received: by mail-ed1-x530.google.com with SMTP id cy23so2336429edb.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5OrUE/U70BJ7maQb3sQsawvs53yVkt6J0fA/3K8eiXs=;
 b=ATddspeJpiRORXo/jBvzk0gZ3OMuIKpWlBWy+AppTO/U7I75KhTtW0Wf9Dux+JrBJv
 9ShQ7Ljb9uh0+ZlmbwMS8bms4HlCAt06p4pm2SjbzZ80JZPDQ9MGcleVKMvXeCpYgGU2
 c4U9gBozEht6FDJWueGcLGEH6Rpdc5C7fbriPVrXdBdUDWu68flvaAhoSRg8fYjiVTzm
 nMjgkqBptyCqhNo+Wq9l9aiC6h0XI5Bjonrgc+x1AFSIkHlsuigVT0GJTxustamt9lc0
 C31j2YHlbkcisYWSuUqhyTDzmnjU0Bn6NpXD+Jv+wuponcpPSP9VRtkeIyQdcjQNoVZt
 F14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OrUE/U70BJ7maQb3sQsawvs53yVkt6J0fA/3K8eiXs=;
 b=6ZaluBDQBJn1IWWH3CSWSv728Ndsj1ghpQPKGVDEBHNzBVdiSd4K2zDAmcIwceO9jQ
 Qe+qBVuJ230gsUP+IE4nibdwgU/KJceXei3+uzriB82uPpMiFH1NPxiLfVlfe0ss1KIw
 biO7hNjT5ZTvgtrv7TQNy7i0X1Nz2aZF1/147DEWEsJa/WVFX/Fcgbb0GvK37dKdV5Jl
 l6uL/Fo6Mas+nnTmzJE28ISOUw/Peb22H+w99skd+Wah1sNznXse2CpPkJi50OlUDDkj
 fohpRerJXWutlyV+iiKf3yxXw/pVIS90ufx/kuka/FKMX/5DX9bajGppavwwupTe00UP
 vOmg==
X-Gm-Message-State: AO0yUKXo2pxN/V1GybtGozokL+986vM149WJdSQBosy15va2cuQuMqEK
 vbxa77DUmKX+vIASW5ckYUszgwwO97w=
X-Google-Smtp-Source: AK7set8RHbFe2YRDqyEFBbTat9Zlm35JDysVRC5RwJFhEVYsdNG43XLVaM5C0HZOi/0cQf7hXZQlhQ==
X-Received: by 2002:a17:907:3e1a:b0:8b1:7f87:8174 with SMTP id
 hp26-20020a1709073e1a00b008b17f878174mr15450779ejc.65.1677792147889; 
 Thu, 02 Mar 2023 13:22:27 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:27 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 17/23] hw/isa/piix4: Rename reset control operations to
 match PIIX3
Date: Thu,  2 Mar 2023 22:21:55 +0100
Message-Id: <20230302212201.224360-18-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

Both implementations are the same and will be shared upon merging.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-35-shentey@gmail.com>
---
 hw/isa/piix4.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index d70c74dcf9..9388767d74 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -133,8 +133,8 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
-static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
-                            unsigned int len)
+static void rcr_write(void *opaque, hwaddr addr, uint64_t val,
+                      unsigned int len)
 {
     PIIXState *s = opaque;
 
@@ -146,16 +146,16 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
     s->rcr = val & 2; /* keep System Reset type only */
 }
 
-static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len)
+static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned int len)
 {
     PIIXState *s = opaque;
 
     return s->rcr;
 }
 
-static const MemoryRegionOps piix4_rcr_ops = {
-    .read = piix4_rcr_read,
-    .write = piix4_rcr_write,
+static const MemoryRegionOps rcr_ops = {
+    .read = rcr_read,
+    .write = rcr_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 1,
@@ -176,7 +176,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
+    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-- 
2.39.2


