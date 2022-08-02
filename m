Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F8587D00
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:23:10 +0200 (CEST)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIrrZ-0003lg-KK
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIro6-0007ba-RY
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:19:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIro3-0001hT-Sz
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:19:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j1so9499996wrw.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=lxX1gI1WFAX3Ygvx2KQ40udJiTZybS/QbUXcPONoIso=;
 b=oL50P6k8eYmrgmIDn3g9bDWnmClsnMeZjEEnBT6BKWQgZZWOTTwXAean2uqeAtdfX+
 UTU5fECnuLgl+bGFdmUzbLr+Bbkr1EGDhHboZxd4nlvfsnUCZ3yfJWI/JUeHCZrLVvrQ
 BZWMKdGyyu26ay5uD6/ukzncj0NBwPUC+2wUXXGjLc+dyNO7/qoHS9w+yrGE605TQup8
 vHKwNrnutZua7MOB2XQ+jwvyA5wtHg8Iyv0VXZcQpTFX2fxHCzPg/XV5pR7Bxf2bJ+nO
 dnR0hCWQvMnUZ3n5qdy7NCoDJZp88YtHAwuWf+NIsuEKsyrFblzzCh8iH/MTdUDC8CEn
 g57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=lxX1gI1WFAX3Ygvx2KQ40udJiTZybS/QbUXcPONoIso=;
 b=yCEpM4/I9tBvLVOavyzDYvRKOFyzD7woVYnufgiUwaF/UVuj0nqdg9vuyQoJsyDHyn
 jkBzq5zRURNxbaWwZevn0TjRpRhHvAPk7AlqeUyGy5zDhIm3jkk0nbXsilCSy/WRoU1x
 3h5bLK3wv6JDfa5xxh9CSG8sQOGVTaT9PIf3ARLomIxMOCwDYVkBbgf7AUqvBCQVtD6X
 aloZjcBZmvwG6e68TH3fhr4On75ZclMxEXF1GvP55++a+IUI5I/R4urrbWqZ4N7PiiSt
 nZXvaVxqUDBhkySzt2gWy428KW/peABF8YCF+PCnhdTx6aMCPvsT5XsWdHnrB4zA2wEx
 7kzA==
X-Gm-Message-State: ACgBeo2SPn8osDvx920w4tgeNRO9lGyD2xn1S0aQ4glJ8XmeAyQCja26
 H7XDOJrTok7reRR5eRH6Ki6n5+BoktNdQw==
X-Google-Smtp-Source: AA6agR5IEEleEFjirdKZswfGjQEdBCqBBgUVc7tm70XhRjKgIYS9M7J4de+JbTHW1KVb9nnZjL0NPQ==
X-Received: by 2002:a5d:6512:0:b0:21e:cdab:1598 with SMTP id
 x18-20020a5d6512000000b0021ecdab1598mr12916484wru.687.1659446367944; 
 Tue, 02 Aug 2022 06:19:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c220700b003a3188bef63sm17748271wml.11.2022.08.02.06.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:19:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabien Chouteau <chouteau@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Subject: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit
 accesses
Date: Tue,  2 Aug 2022 14:19:25 +0100
Message-Id: <20220802131925.3380923-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

In real hardware, the APB and AHB PNP data tables can be accessed
with byte and halfword reads as well as word reads.  Our
implementation currently only handles word reads.  Add support for
the 8 and 16 bit accesses.  Note that we only need to handle aligned
accesses -- unaligned accesses should continue to trap, as happens on
hardware.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1132
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
It would be nice if we could just set the .valid.min_access_size in
the MemoryRegionOps to 1 and have the memory system core synthesize
the 1 and 2 byte accesses from a 4 byte read, but currently that
doesn't work (see various past mailing list threads).
---
 hw/misc/grlib_ahb_apb_pnp.c | 10 ++++++----
 hw/misc/trace-events        |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index 43e001c3c7b..5b05f158592 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -136,7 +136,8 @@ static uint64_t grlib_ahb_pnp_read(void *opaque, hwaddr offset, unsigned size)
     uint32_t val;
 
     val = ahb_pnp->regs[offset >> 2];
-    trace_grlib_ahb_pnp_read(offset, val);
+    val = extract32(val, (4 - (offset & 3) - size) * 8, size * 8);
+    trace_grlib_ahb_pnp_read(offset, size, val);
 
     return val;
 }
@@ -152,7 +153,7 @@ static const MemoryRegionOps grlib_ahb_pnp_ops = {
     .write      = grlib_ahb_pnp_write,
     .endianness = DEVICE_BIG_ENDIAN,
     .impl = {
-        .min_access_size = 4,
+        .min_access_size = 1,
         .max_access_size = 4,
     },
 };
@@ -247,7 +248,8 @@ static uint64_t grlib_apb_pnp_read(void *opaque, hwaddr offset, unsigned size)
     uint32_t val;
 
     val = apb_pnp->regs[offset >> 2];
-    trace_grlib_apb_pnp_read(offset, val);
+    val = extract32(val, (4 - (offset & 3) - size) * 8, size * 8);
+    trace_grlib_apb_pnp_read(offset, size, val);
 
     return val;
 }
@@ -263,7 +265,7 @@ static const MemoryRegionOps grlib_apb_pnp_ops = {
     .write      = grlib_apb_pnp_write,
     .endianness = DEVICE_BIG_ENDIAN,
     .impl = {
-        .min_access_size = 4,
+        .min_access_size = 1,
         .max_access_size = 4,
     },
 };
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 4d51a80de1d..c18bc0605e8 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -247,8 +247,8 @@ via1_adb_poll(uint8_t data, const char *vadbint, int status, int index, int size
 via1_auxmode(int mode) "setting auxmode to %d"
 
 # grlib_ahb_apb_pnp.c
-grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
-grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx64" data:0x%08x"
+grlib_ahb_pnp_read(uint64_t addr, unsigned size, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" size:%u data:0x%08x"
+grlib_apb_pnp_read(uint64_t addr, unsigned size, uint32_t value) "APB PnP read addr:0x%03"PRIx64" size:%u data:0x%08x"
 
 # led.c
 led_set_intensity(const char *color, const char *desc, uint8_t intensity_percent) "LED desc:'%s' color:%s intensity: %u%%"
-- 
2.25.1


