Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B22A2E9FEE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:22:38 +0100 (CET)
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwYFJ-00071r-L6
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5T-0006cH-Vt
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:28 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5R-0007tX-GR
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id r4so633681wmh.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DwLakVX9UEsAH+MmXq72YbVgXyrXxgRV9mVJnolEV3k=;
 b=Gmi94JhBkJXrVi0c/wi1jjurTWq1ybMc3PfRGPvjqZGeA88mzEBZ8Bp+ZvYFjAkmjV
 pm84gSTq4o6pG/1lTesmqZnUDekfh5VhAkY4TlPDIwTGC5WeTYucoEfwjVo3NwB6FBpO
 c3Hm9LLPkvWasM0mL2D+4x7yj3iV7vb914ZAlJ1DXYthZbzrfpeqCJUBSepkjc2EVqtd
 sBDXBPDgy3qRnOD1jaT0OXcnGISrTsw7jTiQ2H3yyngmtf7ZqRbQZHIAbh+nLxoKcV7p
 GgVZooE2mfQHNVpyV8m80QEJmZgXnGGPT253na5zu0MbhS/O0ty+G8FkLCNndfMwQe6Z
 NPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DwLakVX9UEsAH+MmXq72YbVgXyrXxgRV9mVJnolEV3k=;
 b=rqu29qfCELYMpaqHxLvcaBhucGhNnAjqdLRa6+8HKyJSRhQX9Mc/5NyYfanaULpgV3
 HotLogAnOTbjeNJbJ+lrLgzkwpDCTjft0MeptpimOfkg8Hqss9lfk9uA5Qkbvaj1VEO+
 4ZlCcS5RRIHTYevaVGLhN6VlhdHSS/4RrG3rjuxjGXew6NE7nXCMEjpRfIIuDvio/q1v
 D9epzVchX8ExQ9qch8haLplQseCdULCRsa/J2zMrD5khUTZbmRIMwfBMond2rx09hb9O
 mqcw5zqdSY7p4eX5aYlQLbmuNQKRz0ZpKzhLxjutJYpmcjBbSeI8ftoc23I4dFVHFSHE
 Jpsg==
X-Gm-Message-State: AOAM531Yiecfxn3ioYfOwh5BXvSMakIh6XFK3vOZZh8wp/2Q39NE9F1I
 kczih/tEVph1veAjyqG1dxvxt4T9jzQ=
X-Google-Smtp-Source: ABdhPJwIK4BbFoJSoDNkYMQ+vRP1jUMVACf3J2HYogGdJlUZV83i0q2BZQ96oYsRigUS2VsRcWoAZA==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr809192wmi.45.1609798344054;
 Mon, 04 Jan 2021 14:12:24 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id 189sm1164064wma.22.2021.01.04.14.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:12:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/15] hw/mips/boston: Check 64-bit support with
 cpu_type_is_64bit()
Date: Mon,  4 Jan 2021 23:11:44 +0100
Message-Id: <20210104221154.3127610-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Directly check if the CPU supports 64-bit with the recently
added cpu_type_is_64bit() helper (inlined).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/boston.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index c3b94c68e1b..467fbc1c8be 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -444,7 +444,6 @@ static void boston_mach_init(MachineState *machine)
     DriveInfo *hd[6];
     Chardev *chr;
     int fw_size, fit_err;
-    bool is_64b;
 
     if ((machine->ram_size % GiB) ||
         (machine->ram_size > (2 * GiB))) {
@@ -463,8 +462,6 @@ static void boston_mach_init(MachineState *machine)
         exit(1);
     }
 
-    is_64b = cpu_type_supports_isa(machine->cpu_type, ISA_MIPS64);
-
     object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
     object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
                             &error_fatal);
@@ -545,7 +542,8 @@ static void boston_mach_init(MachineState *machine)
         }
 
         gen_firmware(memory_region_get_ram_ptr(flash) + 0x7c00000,
-                     s->kernel_entry, s->fdt_base, is_64b);
+                     s->kernel_entry, s->fdt_base,
+                     cpu_type_is_64bit(machine->cpu_type));
     } else if (!qtest_enabled()) {
         error_report("Please provide either a -kernel or -bios argument");
         exit(1);
-- 
2.26.2


