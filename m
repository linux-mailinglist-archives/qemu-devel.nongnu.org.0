Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18E360FD85
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 18:52:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo64J-00018M-Kw; Thu, 27 Oct 2022 12:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63Q-0007Ib-7x
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:48:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oo63N-0002Qg-Ht
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:48:26 -0400
Received: by mail-pl1-x62f.google.com with SMTP id d9so2118636pll.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r25VipQj5iv3sDMX8KrTJiiJWqt3kWaLtBvAXK9jQF4=;
 b=n5Q5eE7SKQPqJey69xXVyc+//AD3n+0ZiK5rtTK9S+HAbpfxl5fs15dgYAeqmw8e0R
 SUI8wXvQomR5Bf2bD1X+2SC4/BZO4WQfUWg3PgMkUntCZK9R8N4N4yRkILE7pRF6/9K0
 o7ikikQtuehPb0he70SzzvRK5Dpn9CSrQPQslG3XC+C4UKLbj4r9MvnjXeoXaXdlqFeg
 F0flZ1a5beB0voyi0ndZVRsj8XpZRECNKQFafyOfRY7P/eV7x3GMWg+EFWFRg+oKos3Z
 1WB/cU38JEvBqDwqZzhpSoYc8jmmRailR1wOFxMqiNmRyguEK/HYlxAXH8294D6N4X9m
 nWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r25VipQj5iv3sDMX8KrTJiiJWqt3kWaLtBvAXK9jQF4=;
 b=qg9YdB8eZY+DCv7YxJxl0LFVwsc/ndSqt6DyqTVKcB3zaK5jVDQn2qqOBMo4n8X2Re
 h+jsqLtafcSMXhOIKtPyu8e3mqCHCrCLs+ATw4lsTBCMU7OdsINjmbi4kiR7TW/h+7pp
 0pfnWFz46QmvXLDZxa3oywxfVJHIqPdFXt5c1AV4VcJ986zThNOMdvK+NlPz0fn/jaun
 3JNcV7WHxQUyPAqnvjP7gy1f+7MG5nLH+V3poz9p2hRfK7RTqqqSUJkSdn5CzYUqgGLi
 uYUe5UySdUXnCzSk7uzsPv6EqL+X//z+DHIf+vb5M0i75KBkn9yT+VyleANwG9V6t5t/
 tuCA==
X-Gm-Message-State: ACrzQf11NB5RNE2KhDD9lisEvRkJOmR5xSt9a6bYprov2zTIys5ewWfw
 +O+/sehfvz2x6/9Ec03Nl3v7yQ==
X-Google-Smtp-Source: AMsMyM6avW1Z37vV1LY2XHMpf7pcpTBFao/yq25Liu1RE7Vlg6gf5+XT2p5ehF+LrcLuuAMjzvFEgw==
X-Received: by 2002:a17:90a:65c7:b0:20f:8385:cc18 with SMTP id
 i7-20020a17090a65c700b0020f8385cc18mr11253052pjs.235.1666889301232; 
 Thu, 27 Oct 2022 09:48:21 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a17090a9bc800b00212e5fe09d7sm1212543pjw.10.2022.10.27.09.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 09:48:20 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/5] target/riscv: No need to re-start QEMU timer when timecmp
 == UINT64_MAX
Date: Thu, 27 Oct 2022 22:17:42 +0530
Message-Id: <20221027164743.194265-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027164743.194265-1-apatel@ventanamicro.com>
References: <20221027164743.194265-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x62f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The time CSR will wrap-around immediately after reaching UINT64_MAX
so we don't need to re-start QEMU timer when timecmp == UINT64_MAX
in riscv_timer_write_timecmp().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/time_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 4fb2a471a9..1ee9f94813 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -72,6 +72,14 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
         riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
     }
 
+    /*
+     * Don't re-start the QEMU timer when timecmp == UINT64_MAX because
+     * time CSR will wrap-around immediately after reaching UINT64_MAX.
+     */
+    if (timecmp == UINT64_MAX) {
+        return;
+    }
+
     /* otherwise, set up the future timer interrupt */
     diff = timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
-- 
2.34.1


