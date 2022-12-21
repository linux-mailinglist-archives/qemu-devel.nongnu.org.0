Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483356534AA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:11:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82UF-0003yM-W7; Wed, 21 Dec 2022 12:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82T2-0002wP-Sf; Wed, 21 Dec 2022 12:01:23 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sy-0008Ei-Qk; Wed, 21 Dec 2022 12:01:19 -0500
Received: by mail-ed1-x52e.google.com with SMTP id m19so22838123edj.8;
 Wed, 21 Dec 2022 09:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0MLzXa3gctAje8Vz0unV/p03dZHf84nEEzGMO1flLo=;
 b=jRER2hSP5h0zlrB/PsNMvEwH48JyqN1Oig1SCvXT8/73gL/dFpaIu/dN0T2C/rQ7At
 /nvWb2xkkGvPlwZ0+SBuO85eDvV75JOTdGz+GUoOELtYHs3PhXl9pk0v0VTdayW9xJIo
 oCHjaUWfwglKX/jJyNVule+JgOux2fvp2UQe3CSCoowkYmmI6/ydiXddbIeDBnxy/jpY
 8AdCoXj4TwhQbxg7zmTJWfZxG+lr2otO0eZl2bzxVhucktQZgLAbxgqwNuoL4HkNluii
 E4VCjUWUUc+GntdoDbROKmj2mOUa8DdQVQlrwlNuRDuVu13s/XCqXHmXFq/vNDAqAWB5
 Gu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S0MLzXa3gctAje8Vz0unV/p03dZHf84nEEzGMO1flLo=;
 b=HUXhsEhGfC6Vrs+Sv3Nr7gyOApeRUgFSOSPfxUOmWmWtDFnPQQSHprreWk0Nej9b3e
 bUjfqa0QKtTP8JnVhMsNUXRH0/pMaledLm4OmxqtWrjmL0TbXodHCmfjz9oKd+ndivoq
 KqHPBw3AGhoNeMUrX0z4LcEuKC6NPHiwxZjVdGMoPZMdQyaKQPbc277iJsh3NoKkTQJC
 MTrhm2uR0JDLDesmZOHwhyuXcMXrCECmnbxkpf21UPRYtoMaEeVi8go1My/UqIxq6ILu
 HVmXCie4kw8FYLqhvb5hw3uk30ubuSe2+Tvel9uAGHFDoB2QLihO6EFEGXJctgNivM5Z
 IKDA==
X-Gm-Message-State: AFqh2kqxaObuR9sNh1YUijG+f/xfuinf4gsqFFqNC2PRqnmb/7wqg216
 ev++6Yb1U2HZ+BEha28Fv6mS7DvwJlk=
X-Google-Smtp-Source: AMrXdXtArJhGCpQFyIzgn8tj1vfzsE2WYjuF0EXlRx6Jbzwb+9PuSq7v3cOLn4HF2XcySCnR5eSq0A==
X-Received: by 2002:a05:6402:ea0:b0:46f:68d0:76 with SMTP id
 h32-20020a0564020ea000b0046f68d00076mr1844594eda.34.1671642075535; 
 Wed, 21 Dec 2022 09:01:15 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:01:15 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 24/30] hw/isa/piix4: Rename reset control operations to
 match PIIX3
Date: Wed, 21 Dec 2022 17:59:57 +0100
Message-Id: <20221221170003.2929-25-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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
 hw/isa/piix4.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 6f1580ae66..dbc6a16ac7 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -127,7 +127,7 @@ static const VMStateDescription vmstate_piix4 = {
     }
 };
 
-static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
+static void rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
     PIIXState *s = opaque;
@@ -140,16 +140,16 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
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
@@ -169,7 +169,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
+    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-- 
2.39.0


