Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEF03F0C02
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:43:33 +0200 (CEST)
Received: from localhost ([::1]:53856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRTI-0000cz-5o
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9q-0007ES-ON
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:26 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9o-0002jk-76
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:26 -0400
Received: by mail-pf1-x42d.google.com with SMTP id w68so3185619pfd.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z5NU1fcvT1VcJNTGdQrWFuzzfwQZbKI6KfWv5UH91F0=;
 b=H8NV6YBGamK10dTBnfdr/B4cH8HJBaG7JzOY2Hvsy6dWE4e9Lr5tG7K/EUboBs205h
 zfJNYgQ5DvAdpbE6+Bv2PZZeAuUZBTwz64mC4wYNBlOwRXo5wmX5H7ExPBb0fDCpczBO
 dDJdzE8/HerdEb3tOIIGQNO0aaQOwwPkeE9M7bhpBApFcE9sAHyGMzX7Eq+xx5Zv/QrL
 KWHF10fS0rGLshStsNZwxI6NoElS5qn5zWMH+ohzrYsP7aebgm7Z4W4dkrXLls6H0IFA
 38pc6Hdapcwn2iJJH6LTrNa0Q3P3JNi3hSaaTt8ingC8fQWsvQW2bkz+khWNVuqbduHT
 Oyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z5NU1fcvT1VcJNTGdQrWFuzzfwQZbKI6KfWv5UH91F0=;
 b=JrqLSq7eHOBAaRdlTEg4flHHU9KydaVwNadk0p2mQwXuhuNLm+xVcJocmZuYTlbtt7
 5GXM7yyFVJs+vm0VqASuQsRJBNMMQo7t62GtaN4kMH54/TB9yvV8mZSIicUoMdt4nqHC
 aFPdjIc9vpIPAwKAPJ4v0qsMa3KkBbw0aAGJumNtYPl3rRUW8eGOYYYBvL+xU4zpje67
 zJeGZDlwNPuKmUdttYvYzN8UlPjTILjR2FCxP4ZdUoMDnKI/mOXJ0amXOdeOS38a/zP/
 jHcj9MGMlLQaxANJCZLHpfwpIq2L0Rm+fy8uaYuDmF0xIVM50+LE4BWILqhQK5Kxi154
 ESdw==
X-Gm-Message-State: AOAM531AR2O6QWJgT/vOQYT58u9UbRTJdYNheqmLSx94PmLIvjACHHHb
 Vn3Fk+Ke6ccyuU2e7LpQwQZpOjxyzzEZWQ==
X-Google-Smtp-Source: ABdhPJynCAiucPcktulqyAkgq3TAqGN5E1dIbJ1ayREqLX4kVlSsG1BZX4/Va0c73XUmyPcmh0RonA==
X-Received: by 2002:aa7:83d0:0:b029:3c6:7261:ecb with SMTP id
 j16-20020aa783d00000b02903c672610ecbmr11024363pfn.61.1629314602916; 
 Wed, 18 Aug 2021 12:23:22 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 48/66] hw/core/cpu: Re-sort the non-pointers to the end of
 CPUClass
Date: Wed, 18 Aug 2021 09:19:02 -1000
Message-Id: <20210818191920.390759-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Despite the comment, the members were not kept at the end.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bc864564ce..b7d5bc1200 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -131,7 +131,6 @@ struct CPUClass {
     ObjectClass *(*class_by_name)(const char *cpu_model);
     void (*parse_features)(const char *typename, char *str, Error **errp);
 
-    int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
@@ -149,9 +148,6 @@ struct CPUClass {
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
 
     const char *deprecation_note;
-    /* Keep non-pointer data at the end to minimize holes.  */
-    int gdb_num_core_regs;
-    bool gdb_stop_before_watchpoint;
     struct AccelCPUClass *accel_cpu;
 
     /* when system emulation is not available, this pointer is NULL */
@@ -165,6 +161,13 @@ struct CPUClass {
      * class data that depends on the accelerator, see accel/accel-common.c.
      */
     void (*init_accel_cpu)(struct AccelCPUClass *accel_cpu, CPUClass *cc);
+
+    /*
+     * Keep non-pointer data at the end to minimize holes.
+     */
+    int reset_dump_flags;
+    int gdb_num_core_regs;
+    bool gdb_stop_before_watchpoint;
 };
 
 /*
-- 
2.25.1


