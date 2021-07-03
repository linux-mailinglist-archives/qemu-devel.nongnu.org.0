Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EC63BA8E4
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:21:48 +0200 (CEST)
Received: from localhost ([::1]:39590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzgWh-0000Sa-V3
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgV5-00079F-HE
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:20:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgV4-0000Hf-1I
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:20:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id u8so16113341wrq.8
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aq9RhqFMdHMQ/C3FaLLzkrpqAo3tTe9bTGzjaDhxHgI=;
 b=P5ZupiFxF+IHegamNDa9uuorSXlXUoZlbGKxWdLv92Ows+zztTCr4lCEbqlW/o/jVC
 ySra7+RRoHjoJs2NJEhWhrjuy1WRx/jQ84Eh5JRozv6jEpk2f64wkq3ycLEBwsC+H8Xi
 2quOKkQV2rgSBVC2kGsu2EhqWWAsW5v6plI+hI4xcbPzT1Ddri3cnk7YYOgtf5L/jyQM
 hlpgdHLLGJlm7EvCMDqfgCs3dKp6CZ+Qg/Y9n5NSb9mYruvcCtqkFeJIC3Ej+uyQA/Sv
 /8gZ6RdalgexVr0MS+4acbdU6xTMSUeQ1TQYFBeof6LdhLoargelSrdFURmw4g9v1A4+
 bG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aq9RhqFMdHMQ/C3FaLLzkrpqAo3tTe9bTGzjaDhxHgI=;
 b=COV0+/wqO++HsM4o24KAvP6SblsAGOGMYwGskatvIEWbP1sYsc4Tk9ldF2n16Gy4Wh
 1YhwxpDChj7nTISE7KZqGrg0FN622c2ShHmC/WrZi7wlany7pTqklA7SrboYmoUfs82L
 yCF9cKbnuBGdTWBI18QhVGJ/9C5EpWIbIA5cwVqjmDMVZJv880KeXhQ26xVRWRCgH31w
 DN29j6fzJHQQXocCkEieNP4fEuf+XO7iJILjeofRM3TifMv2MFAykSgKg7Ao8qcOyJUa
 d2V27Vbns8wV93Vw9kfiSRjidZMJ2xdZoN6NEW3WCy8lhdFJRqcZFBaYvpxBf+8w4h7a
 sbIg==
X-Gm-Message-State: AOAM531ZzIWiFD9qp27I2mfMYMBj/lEd5OpS9I7RFtZpMhCPlQ7twZlU
 ez1kgyrDTYVGdIsG0d8N5JzgOcMtLHhs0A==
X-Google-Smtp-Source: ABdhPJxYi1nPg0GvkF38gRbVvdP2jA0L09d9vtdxjZrIHSguTqiIrCYsTQuMM3eyZAVEGBJij4qw1w==
X-Received: by 2002:adf:cf09:: with SMTP id o9mr5732970wrj.40.1625322003716;
 Sat, 03 Jul 2021 07:20:03 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id o20sm15819840wms.3.2021.07.03.07.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 07:20:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] dp8393x: don't force 32-bit register access
Date: Sat,  3 Jul 2021 16:19:43 +0200
Message-Id: <20210703141947.352295-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210703141947.352295-1-f4bug@amsat.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that all accesses
to the registers were 32-bit but this is actually not the case. The access size is
determined by the CPU instruction used and not the number of physical address lines.

The big_endian workaround applied to the register read/writes was actually caused
by forcing the access size to 32-bit when the guest OS was using a 16-bit access.
Since the registers are 16-bit then we can simply set .impl.min_access to 2 and
then the memory API will automatically do the right thing for both 16-bit accesses
used by Linux and 32-bit accesses used by the MacOS toolbox ROM.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
Tested-by: Finn Thain <fthain@linux-m68k.org>
Message-Id: <20210625065401.30170-9-mark.cave-ayland@ilande.co.uk>
[PMD: dp8393x_ops.impl.max_access_size 4 -> 2]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 11810c9b600..d16ade2b198 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -602,15 +602,14 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
 
     trace_dp8393x_read(reg, reg_names[reg], val, size);
 
-    return s->big_endian ? val << 16 : val;
+    return val;
 }
 
-static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
+static void dp8393x_write(void *opaque, hwaddr addr, uint64_t val,
                           unsigned int size)
 {
     dp8393xState *s = opaque;
     int reg = addr >> s->it_shift;
-    uint32_t val = s->big_endian ? data >> 16 : data;
 
     trace_dp8393x_write(reg, reg_names[reg], val, size);
 
@@ -694,8 +693,8 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
 static const MemoryRegionOps dp8393x_ops = {
     .read = dp8393x_read,
     .write = dp8393x_write,
-    .impl.min_access_size = 4,
-    .impl.max_access_size = 4,
+    .impl.min_access_size = 2,
+    .impl.max_access_size = 2,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.31.1


