Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1363DE57B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:39:02 +0200 (CEST)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmCj-0001Qu-IU
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt7-0005ib-Jt
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt5-0005Hc-UL
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:45 -0400
Received: by mail-pl1-x630.google.com with SMTP id u16so13619589ple.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z5NU1fcvT1VcJNTGdQrWFuzzfwQZbKI6KfWv5UH91F0=;
 b=MDr3HedM3mjGJu5iqbx0Zl/lfjgQVn2rYU0IuvfzD2hXhsFoV1e1inFaaKbqcEdDRQ
 hdNMl5Ur3i0S1V+Gi8SigCnfn/h4sa2TWRBPP3YI5DYKPI91CDzszqk8X4MsYXWHo0ga
 8bkVHcMFIZkFqTxg7ua3r+8Q4Wm5R3SgTtal1Ak4kFxoMmuWKVlV2mljBM0RIr7vuq4b
 aQqLDMvebkBpFsHfUE/KG4rBmHbO+x3s5Ol1cpCfc1iR63B3qPQFK5mocUp8QF2IYr7c
 xamJ3HkqVqL+ZIjk/1WV6FnNvJzmms6kFa3pr/DTthnlP7J1wCfYPkARGb4DTJYP3aPb
 yR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z5NU1fcvT1VcJNTGdQrWFuzzfwQZbKI6KfWv5UH91F0=;
 b=EI5ZT8KJu/L1MtnKwn05Hr51yD43QB5HNy7htzuIMosw3VVde7cmZW7BgybtcPPaqb
 5iGtIgqaEz0ulJAzN01bnQC3l7r46x/faiAXVDjFukg4JKof+aAQxToeGw84z075i1/J
 34RqexU5u4Xvmvq5lGkdePWRH0QD8vPxiX22jd2UHOQn/aj44iLqLWVAT9Aq8DXpRM9u
 PoyIK8rcN7OjbMRD9Cr6U+ETd9VlC5KC+4PSEwpSsAUvn5lRhJYubQl1hmD2ufvbVWD9
 orKhQ3vKULfyMmjPZfkw/jLQ7fgt3oQDEEm43wtRqJndXPmqyCrKi0TGGmdmFRjBGPkA
 BUSg==
X-Gm-Message-State: AOAM531RLXkQkNvxYwf5Ml5v1o3rJNZ8wcqdUT6wwB3DPL4a2utOrebk
 t2h4V06ppmMm7Ajhp3EcJjZUWi98G7vh9A==
X-Google-Smtp-Source: ABdhPJxffWrCesVSqmvtgdX2WNi/ol4OhIjZD4O5MFT85MUm9yCVg4jMAoAkll3rs0N+VEl9ZXl/xQ==
X-Received: by 2002:a17:90b:4a06:: with SMTP id
 kk6mr2407919pjb.178.1627964322635; 
 Mon, 02 Aug 2021 21:18:42 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 47/55] hw/core/cpu: Re-sort the non-pointers to the end of
 CPUClass
Date: Mon,  2 Aug 2021 18:14:35 -1000
Message-Id: <20210803041443.55452-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


