Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5611769CF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 02:04:56 +0100 (CET)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8vzT-00071a-D9
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 20:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl4-0002xj-V4
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:50:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vl3-0004d4-0R
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:50:02 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43789)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vl2-0004cV-En
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:50:00 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x17so497780plm.10
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 16:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Kl0RWvUMkBe+VYlgiEkGt81O6Pkp3L6zJLT5spvKIuw=;
 b=bJBQgFqt97ZdGncAuZKbAnzA5hvv9AdnbySlcwxoPGz0a69LG+ay8auZTf5d1S4fPs
 PJ4Yox0PKIGLMi2CZrz4AyAcwlZRjFsSjYOuyiib7vhyV4a106iXuAdFPNWfT343jAc/
 W94EAAuj0rALw/W58dKtI0GwdSku9RRBeMmQszauIh2llw1FFlz9F611OQZZuHWYNs29
 myj9l8SG5UGACvn/77HkGqGYI2VWE+SBa5IY3OvM4UbHyEpMN/jE/MTEv7kG79lzcwa0
 D+6vR/MWQVDnXC546CrechIz9Hq+v873jbjupswTUUUGdwoePU/sp8VqgOuc7RulhIU7
 4lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Kl0RWvUMkBe+VYlgiEkGt81O6Pkp3L6zJLT5spvKIuw=;
 b=opOjPJMAvGw339ZWJ/gWu9foAhNfCPylc5m4oHnpJVg6bVzbRc+d4SBW2DV6tfQYxt
 E484LJ4iXjcNE5sOs5x1W5Iy39ZkD0tRn01CnwzZ7uj0wLh5Xfc6mOaS113RtMenfDrE
 uEtSgnwxp9G6GSGVYcCXd/8fw0UwqzqZveJ0kRCdyAhrekpgwYNMX06fbcXMbWOhZAiQ
 zTchYBhau3nkezc/+WVnr+qFs+1x5nRE0/PouEHXakYgxy8vxBGQGovmHDAOomGfgoHS
 UN69RffFqmDGOUwWeav2V7K06Q319M9MXvmqa2UaVGwobCA1/pADHhdAxW+y0mp6h1yl
 Ylvg==
X-Gm-Message-State: ANhLgQ3SMvYBT/q8AsSoCS1L18FO2akK5mo7ozgNRL2c+OUDjJLZn3s8
 6Vd17Yf3GIHrIp7dcOisDHWazw==
X-Google-Smtp-Source: ADFU+vs+SvkmuHzZji7iX/7IJ5QRxrDm4mdgx6LWA9fJZy7izOUga5jqqGlLZ8Pxe2mOTv+mGILBCg==
X-Received: by 2002:a17:902:ac8b:: with SMTP id
 h11mr1682096plr.131.1583196598902; 
 Mon, 02 Mar 2020 16:49:58 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id p24sm22823478pff.69.2020.03.02.16.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:58 -0800 (PST)
Subject: [PULL 35/38] target/riscv: Allow enabling the Hypervisor extension
Date: Mon,  2 Mar 2020 16:48:45 -0800
Message-Id: <20200303004848.136788-36-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62d
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b27066f6a7..c47d10b739 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -453,6 +453,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_u) {
             target_misa |= RVU;
         }
+        if (cpu->cfg.ext_h) {
+            target_misa |= RVH;
+        }
 
         set_misa(env, RVXLEN | target_misa);
     }
@@ -488,6 +491,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6f9c29322a..d52f209361 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -258,6 +258,7 @@ typedef struct RISCVCPU {
         bool ext_c;
         bool ext_s;
         bool ext_u;
+        bool ext_h;
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
-- 
2.25.0.265.gbab2e86ba0-goog


