Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBF52EE8AA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:29:17 +0100 (CET)
Received: from localhost ([::1]:36024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdmO-0006YC-Tq
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdh0-0007AX-Tr
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:42 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgy-0004q1-5R
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id c5so7104331wrp.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dEWbpDdPMdXRy3J2F2mLkOfTaazaI9EIz5mLCDLiyI=;
 b=p2wlxoD+bjz1+F87HnT7tDhsQOxdcVzIyFkuIE3U4oPHj40yxiscOCY+dXYiL3ICrg
 mqPBZpgZBMQRkCMgK1R+TPfHPoD8T+d48Fv7Pkncg5T27cjabl0+N+O+KXX/irjfqDbi
 2f/9Ez1jUY8CTttxB+bRS10U5cALJfSX/X344oS24ziGYkLG+RRF1evG5B/M+6GbeiYN
 wjY4kIcRsSjbB8UBCMLDCh7M+G7LvWUEp2hxjyQINOsdjaxxq/5Dwi9txEx4vOmbN4EU
 P/LQfWGsfCs/bTvxxM6puvA+GLFIJefEYZW3ifeQ70JxhCw/hUhNPzhdLN1Xc1EEfJKH
 V0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3dEWbpDdPMdXRy3J2F2mLkOfTaazaI9EIz5mLCDLiyI=;
 b=qOxhicfOFLqgrM1L1PZzf1h91/YuqSada4d2ELbyYopksE+iLoEp26G+n/K8jJYY+e
 OR8FEtp+tu9qK8mYSl6AaOBNvWT7YL5UfS2NoGRfyLlwH/CA1RjUYqQBoMsP02s3/vry
 P/AqvnhlhB5n5K8APY4FBc1erwK6NQbOiAU7GGBPwpq3B7CvoqYuHbVID7pr4WAvCbwb
 bF5d5H5bY2PXbdJKhhdnbnae1vAadJkXzjEcCP27D8/CsfbnIB5GPpW1oTZUSms4HJW/
 LQBh+ZtR9r1u0hi+qQuCYvuYamOB1Ca1cVvRzibwzVtvaERApS5kj/Zpn71D+w5ieoqK
 J3dA==
X-Gm-Message-State: AOAM530hnXFOfT+d/PsphO5VJkYOkT/kJ610zxMxyWxx6dl27SDCG3rf
 d9VBHoS1on4w3XMpWY63Wr+z+3Njn/U=
X-Google-Smtp-Source: ABdhPJxWBSZI/e+jPEoF1RloYNcT970YP2LcN6V5aQKKkXis7I1KbpzS65Ja/lqCJkM2rDokmSLgMg==
X-Received: by 2002:adf:dd90:: with SMTP id x16mr645299wrl.85.1610058218031;
 Thu, 07 Jan 2021 14:23:38 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id o13sm11872381wrh.88.2021.01.07.14.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/66] hw/mips/boston: Check 64-bit support with
 cpu_type_is_64bit()
Date: Thu,  7 Jan 2021 23:21:55 +0100
Message-Id: <20210107222253.20382-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Directly check if the CPU supports 64-bit with the recently
added cpu_type_is_64bit() helper (inlined).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210104221154.3127610-6-f4bug@amsat.org>
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


