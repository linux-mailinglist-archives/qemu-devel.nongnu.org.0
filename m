Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD30342416E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:37:11 +0200 (CEST)
Received: from localhost ([::1]:37408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8yk-0004jk-JW
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8in-0002S5-Gm
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:41 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ia-0007lr-4V
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:36 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso4210397pjb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFI9O749S6iuVbVHcmA9BdPx1VYpGLK4wh+jg40kyhQ=;
 b=QQ5CtOLBADwD9J7CXlzGSNognGBiESIVKB1ltRNVGkSfCAZhzP3KTZjq/T9p46Zbto
 VkI+NemnJLbBWLJEx2gIHqBJwCqezh6ocTSELwui4m0tiExAPhgLZHAVAsyPx+f39ZVq
 7XGgtPS+s1oXNqIdYotkWwOI4MZSEbEMkn38tG7opDHnCqA2E12VKU53LBLxDpS1S9lp
 Dzk9AHXBehwtKeCre9RwWCJJ3VyW4A9u7+BZHWQrRJOVU6G8lLNTMXU2/AP2Lj+w8ILw
 XEVWBov3yFDLREJy4D2ambZIu9oanu+205l+3qS8AqLYOAQ+jBrHyVwCALipdJt1hW9n
 IySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TFI9O749S6iuVbVHcmA9BdPx1VYpGLK4wh+jg40kyhQ=;
 b=TfPwt3S1yeJJ1KwbMVFJ7EQII/YfmxhwkfixTFU5Wh5TwE8vYY7sgg5FnUxWu4qvqH
 rAhV6JM/Z/nZEvA7WmDzcFA2JzbF6fa9ZwM3SXWTvp7LojzlOHGO7fJbNfSFzEOaEw7E
 5V6e1VmyjdISl3kGaO2wKpNgNWoGvCE8UXyw3XEII12PDpwO5XLXZU8VJKy/kjPAFj7Y
 vgb0uwQZ1rX4n0pMyhDAIx+fRdW/QJing5kD/zIWxl4UK1AGE/X1MUUMyxQl1Mv5MNXw
 4m4Xz4DLrCBrM0uWkvAccLwf6piiCWHxeGaRXVugBDhxfH63tsEJjvA8+DAvHz4KsEsL
 FlsA==
X-Gm-Message-State: AOAM5305mo6LZbmaULLVfad9PJoAMK4ltlVDQuSO9SAZOaxd6qxPO6mi
 Ay+gwlPpV4Pd0z+BaHHEPwiphu2WNmRofg==
X-Google-Smtp-Source: ABdhPJxGQuwcAKuFoI9xUHGmt3FOE1j+ScjcprtTdjh38q33v8TYsyCT3CZsRAp9qrweDzQQoTJyAg==
X-Received: by 2002:a17:90a:ba14:: with SMTP id
 s20mr11791077pjr.20.1633533626186; 
 Wed, 06 Oct 2021 08:20:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/28] hw/core/cpu: Re-sort the non-pointers to the end of
 CPUClass
Date: Wed,  6 Oct 2021 08:19:58 -0700
Message-Id: <20211006152014.741026-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Despite the comment, the members were not kept at the end.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


