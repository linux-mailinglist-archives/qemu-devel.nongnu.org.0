Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829315AC33B
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:30:17 +0200 (CEST)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUk5A-0004ik-Bp
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1K-0007jA-2z
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1I-00030K-6F
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id k17so3721985wmr.2
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uGKTuEEdNSahZZj2+c3bTExRFoC76JbBn9lXSOaT3d0=;
 b=jME8MX0/IBOU0FxbilgP+sBk4TUi6JpM/AZh5EAPWRTngwLhcFWtxY/rnbDBWqdfO+
 9pesfzLCsz0HLW/5fdKuauN/zM10IxXxMODMy2G03/e+1zWWNocpsX/jGpN9qQAEAUTU
 s0ESGhE9U5wnLzM7ue/3ymujS6W24QrSDD965JfHNKyk4iZ9gEEhHuVGVmoN5oTWeUPN
 UcpWHliFuEESCe6fO9+HpgkBqoXcgQrDBQXRcy9/84A8x1pl2csz9la0TD/ZSsw3GxJD
 uY84ykl6iQ/FcZc0emDyUGyc6VCeoaj6CTdNQzAsLhepFCmP4p4uXmxKt2/xS8+vFwg8
 LlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uGKTuEEdNSahZZj2+c3bTExRFoC76JbBn9lXSOaT3d0=;
 b=ZZC0Jf1tVHXeRYozUBd7m7OENViYj7PqxfoywpqYwqUMniz3qeCiWmLevapePf3PR1
 abBSc8TcfEFlVeOp0/itjoPXC0wYkO1FOof7EmU9Pvq7wsso4wy6gPyE7TL83ye/X2Jh
 BHd/aLxEFUqCTo6fA1AEtqDQpdR2MDkTMP0uUvQ6JJY/6qagjfjmWBQVqxvWvrNCUtOP
 zcoojLvr/0YzbK3Fvx0/mLvo+EagQM1rmXC9A/OwXA0gNoCVwSpBFRY9yhhQj6KjAqOo
 ZNBDgKU3jwyXCFH5LxMTTTcMBR5pvfdYIANLHw6yk4ZMlxbleddpifjrzy3rJozmX09A
 /tKA==
X-Gm-Message-State: ACgBeo1zzabDPMk1fp6yDZSOFz7798g5TuwwhpbsqLSpVxOJsPa+hedg
 ZpSiScEqqUjvXP9S2jbDfa7zg0SrTos=
X-Google-Smtp-Source: AA6agR75SalOEdot1Wr9S0J2OvxHLNpyVPQ8rlbgDO8N/nzZllhDP3iph0pBxJIpOmqpkoYJMCmwGg==
X-Received: by 2002:a1c:3b55:0:b0:3a6:7b62:3901 with SMTP id
 i82-20020a1c3b55000000b003a67b623901mr7612818wma.113.1662276374522; 
 Sun, 04 Sep 2022 00:26:14 -0700 (PDT)
Received: from localhost ([88.83.123.243]) by smtp.gmail.com with ESMTPSA id
 h4-20020a5d4304000000b002238ea5750csm6657713wrq.72.2022.09.04.00.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 00:26:14 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: openrisc@lists.librecores.org, Stafford Horne <shorne@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Anup Patel <anup@brainfault.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 03/11] goldfish_rtc: Add big-endian property
Date: Sun,  4 Sep 2022 08:25:59 +0100
Message-Id: <20220904072607.44275-4-shorne@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
References: <20220904072607.44275-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new property "big-endian" to allow configuring the RTC as either
little or big endian, the default is little endian.

Currently overriding the default to big endian is only used by the m68k
virt platform.  New platforms should prefer to use little endian and not
set this.

Cc: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/m68k/virt.c                |  1 +
 hw/rtc/goldfish_rtc.c         | 37 ++++++++++++++++++++++++++---------
 include/hw/rtc/goldfish_rtc.h |  2 ++
 3 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 3122c8ef2c..2f3ffc0de6 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -173,6 +173,7 @@ static void virt_init(MachineState *machine)
     io_base = VIRT_GF_RTC_MMIO_BASE;
     for (i = 0; i < VIRT_GF_RTC_NB; i++) {
         dev = qdev_new(TYPE_GOLDFISH_RTC);
+        qdev_prop_set_bit(dev, "big-endian", true);
         sysbus = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(sysbus, &error_fatal);
         sysbus_mmio_map(sysbus, 0, io_base);
diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
index 35e493be31..19a56402a0 100644
--- a/hw/rtc/goldfish_rtc.c
+++ b/hw/rtc/goldfish_rtc.c
@@ -216,14 +216,25 @@ static int goldfish_rtc_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static const MemoryRegionOps goldfish_rtc_ops = {
-    .read = goldfish_rtc_read,
-    .write = goldfish_rtc_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4
-    }
+static const MemoryRegionOps goldfish_rtc_ops[2] = {
+    [false] = {
+        .read = goldfish_rtc_read,
+        .write = goldfish_rtc_write,
+        .endianness = DEVICE_LITTLE_ENDIAN,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4
+        }
+    },
+    [true] = {
+        .read = goldfish_rtc_read,
+        .write = goldfish_rtc_write,
+        .endianness = DEVICE_BIG_ENDIAN,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4
+        }
+    },
 };
 
 static const VMStateDescription goldfish_rtc_vmstate = {
@@ -265,7 +276,8 @@ static void goldfish_rtc_realize(DeviceState *d, Error **errp)
     SysBusDevice *dev = SYS_BUS_DEVICE(d);
     GoldfishRTCState *s = GOLDFISH_RTC(d);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &goldfish_rtc_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s),
+                          &goldfish_rtc_ops[s->big_endian], s,
                           "goldfish_rtc", 0x24);
     sysbus_init_mmio(dev, &s->iomem);
 
@@ -274,10 +286,17 @@ static void goldfish_rtc_realize(DeviceState *d, Error **errp)
     s->timer = timer_new_ns(rtc_clock, goldfish_rtc_interrupt, s);
 }
 
+static Property goldfish_rtc_properties[] = {
+    DEFINE_PROP_BOOL("big-endian", GoldfishRTCState, big_endian,
+                      false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void goldfish_rtc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    device_class_set_props(dc, goldfish_rtc_properties);
     dc->realize = goldfish_rtc_realize;
     dc->reset = goldfish_rtc_reset;
     dc->vmsd = &goldfish_rtc_vmstate;
diff --git a/include/hw/rtc/goldfish_rtc.h b/include/hw/rtc/goldfish_rtc.h
index 79ca7daf5d..162be33863 100644
--- a/include/hw/rtc/goldfish_rtc.h
+++ b/include/hw/rtc/goldfish_rtc.h
@@ -42,6 +42,8 @@ struct GoldfishRTCState {
     uint32_t irq_pending;
     uint32_t irq_enabled;
     uint32_t time_high;
+
+    bool big_endian;
 };
 
 #endif
-- 
2.37.2


