Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E3C701608
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 12:11:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxmC7-0008KT-0k; Sat, 13 May 2023 06:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxmBv-0008Ft-Jq; Sat, 13 May 2023 06:09:32 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxmBt-0004N1-Ae; Sat, 13 May 2023 06:09:31 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so96527770a12.1; 
 Sat, 13 May 2023 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683972566; x=1686564566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2cgCTCiy6rpTMmB83MFFmB8jWJpK9cx9olCbX5GQQU=;
 b=bDa6DQr6jTb7sMeRvv8bOj5f3WIEWu0jx6geR4SI4263zTVB/TADncDmPei7FZd9Hb
 ipHjwHT4VA+P1MIUegw2X8pmnRewcfdMCiB5EG7WrCg5EpYUGL3hDMdQEGX3s6WjeQSI
 BNa3Ll5LJ3kVSxpReAjmSubaMAbrbeP1lPwWNdc1qH4Lun79uAyQ0E8Qip7uh3KDZvlM
 bgsPdyzMwPlqep310m4uGhjSpg5Kq1WB1s5eNafic4FaxZGsE+5b2v+PfAcwSpVfOni6
 1ui5wWeYMh+zZVKpNph642yqKD+QY5Lt8TfBqo7/u3nGzyF8fc8gZ40VxGMDRjfixoYw
 bf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683972566; x=1686564566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W2cgCTCiy6rpTMmB83MFFmB8jWJpK9cx9olCbX5GQQU=;
 b=Rfqws2bG+CVd7TepOVwI1IsX8jUW7EhT3a4AfANyDoSyxzv+pTBD0ryGQGBSJSPX6y
 wM+ayEYDeq+PaYcdEmp5dgy9AsfFL7+OJJvr6MDbZkm+nK4aTxJNKajsLCMHmnUm68/n
 5f9XPS9g15fNqwmZq7YKQ63ZFyt045ZgMvJ9GGSKOI7CFz4Gh4MDQLR3kbIyYaYZeq5Y
 iV8RAho61uwdtSYI2F/CQnble8u/PcuSbOcpoe0FUHv/iWuoupWApk330lgSQ0sUZ0Kq
 mzHA6y3RAkyDBkxM+BlF2+W4wHrLIu0tq8dMpJDXLTCGyxNo4tuJ8jS7CARcGHiRKNNp
 YdDw==
X-Gm-Message-State: AC+VfDwSt8ENY3eKtS+yfxruIDiAMA+ybtzSJdKYX9mWHZV+3iDH1sDr
 PIMJAAxbzkteu6QvP3yStwDSEyML6rI=
X-Google-Smtp-Source: ACHHUZ6ssYp5KSkLZsa+z6QRI3na3At/5fASE+b++szLRJFguzqlGstH1T2cIvSwYclp0c0lZn+FPg==
X-Received: by 2002:a17:907:1c25:b0:969:9c0c:4c97 with SMTP id
 nc37-20020a1709071c2500b009699c0c4c97mr16119044ejc.1.1683972566177; 
 Sat, 13 May 2023 03:09:26 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-013-174-037.77.13.pool.telefonica.de. [77.13.174.37])
 by smtp.gmail.com with ESMTPSA id
 jr18-20020a170906515200b00965f5d778e3sm6645285ejc.120.2023.05.13.03.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 03:09:25 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/4] hw/char/parallel: Export TYPE_ISA_PARALLEL macro
Date: Sat, 13 May 2023 12:09:05 +0200
Message-Id: <20230513100906.46672-4-shentey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230513100906.46672-1-shentey@gmail.com>
References: <20230513100906.46672-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rather than using a string literal which is prone to typos let's use a macro
instead which is caught by the compiler if mistyped.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/char/parallel.h | 2 ++
 hw/char/parallel-isa.c     | 2 +-
 hw/char/parallel.c         | 1 -
 hw/isa/isa-superio.c       | 3 ++-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/hw/char/parallel.h b/include/hw/char/parallel.h
index 0a23c0f57e..29d2876d00 100644
--- a/include/hw/char/parallel.h
+++ b/include/hw/char/parallel.h
@@ -4,6 +4,8 @@
 #include "hw/isa/isa.h"
 #include "chardev/char.h"
 
+#define TYPE_ISA_PARALLEL "isa-parallel"
+
 void parallel_hds_isa_init(ISABus *bus, int n);
 
 bool parallel_mm_init(MemoryRegion *address_space,
diff --git a/hw/char/parallel-isa.c b/hw/char/parallel-isa.c
index 1ccbb96e70..547ae69304 100644
--- a/hw/char/parallel-isa.c
+++ b/hw/char/parallel-isa.c
@@ -21,7 +21,7 @@ static void parallel_init(ISABus *bus, int index, Chardev *chr)
     DeviceState *dev;
     ISADevice *isadev;
 
-    isadev = isa_new("isa-parallel");
+    isadev = isa_new(TYPE_ISA_PARALLEL);
     dev = DEVICE(isadev);
     qdev_prop_set_uint32(dev, "index", index);
     qdev_prop_set_chr(dev, "chardev", chr);
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index af551e7864..3d32589bb3 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -93,7 +93,6 @@ typedef struct ParallelState {
     PortioList portio_list;
 } ParallelState;
 
-#define TYPE_ISA_PARALLEL "isa-parallel"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAParallelState, ISA_PARALLEL)
 
 struct ISAParallelState {
diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
index c81bfe58ef..53b80de0ce 100644
--- a/hw/isa/isa-superio.c
+++ b/hw/isa/isa-superio.c
@@ -20,6 +20,7 @@
 #include "hw/isa/superio.h"
 #include "hw/qdev-properties.h"
 #include "hw/input/i8042.h"
+#include "hw/char/parallel.h"
 #include "hw/char/serial.h"
 #include "trace.h"
 
@@ -51,7 +52,7 @@ static void isa_superio_realize(DeviceState *dev, Error **errp)
             } else {
                 name = g_strdup_printf("parallel%d", i);
             }
-            isa = isa_new("isa-parallel");
+            isa = isa_new(TYPE_ISA_PARALLEL);
             d = DEVICE(isa);
             qdev_prop_set_uint32(d, "index", i);
             if (k->parallel.get_iobase) {
-- 
2.40.1


