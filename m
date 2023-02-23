Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E96A02DE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 07:41:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV5GQ-0002SC-Cc; Thu, 23 Feb 2023 01:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhoff749@gmail.com>)
 id 1pV5GN-0002Rx-Ih
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:39:31 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dhoff749@gmail.com>)
 id 1pV5GL-0000u2-AN
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:39:30 -0500
Received: by mail-pj1-x1034.google.com with SMTP id y2so7427269pjg.3
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 22:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PhpGuNAiSEGx5bI9hJmn5jD3R2AVSV/In4S9uEdr3ks=;
 b=LrC1IURIL0vpfT2asd+xOEs/P9cNddEp719N0BSdOCEEGoQ2cz5iNTZJgSWRo9Hd6i
 e90sHOW0tdENsFDnym8bZPUmxREymN1reIe1aQbw3mv4ojgwgjgAtmai8FzRFL+mIEkX
 wHiieDRX1qqW66FlcZrrfc6HZEo9lcY1IPAglxZNcVMEuAMCtSIdoR+btDzb28UgPpOr
 1KHJpNgyNopwxI+M5Cr+S4ep5vkywmKtagSPQ4+Abu53ziW9Jt8LbW/oqEdwuvUhKT01
 IUpsAggtDKDTqOCVTwCYGnbwyZRhzaOGUhmqL+YnI/vYcopUJIgE6xAEeJLEqos+0dRp
 l++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PhpGuNAiSEGx5bI9hJmn5jD3R2AVSV/In4S9uEdr3ks=;
 b=NUbGACwRP2Y5zqGsZihDZgMCOUGUhzgvGZIr2iTGFPti5rHuR6nsmH+C3EWcZ9rBKf
 xZvhp1bQt3ps/UEW/QaCyjQe4ZNwKUBAzIISkLYcgBkpl7FC//Bxebf+qa04U/C6/ozj
 hJ9bNJJJIBoBLgSu7frdVw2KZxDw3Qxa9y/BHclJgANSbuWURjBAvAS6c4Lde5vQZa4p
 8ulafr6LQkHS0bZFzQxxiVduFDl6NNCGaUbDpDpT1YASVxYR0BZ3nrBRzwGQVyNhjiMm
 CurkygnnveH7dDJWUjSt/fiSHx5GBJ/4vqQbOIvXmnKhjqk7gdSK2HhX+/GYfmnLoJJ/
 gCjg==
X-Gm-Message-State: AO0yUKWcoLl8I2G1bdxRNpjFl5Vq3JnMERtTBSZTr3GKRjM6q4gQW9Dy
 jwPhSXyrrMxx8IGvEenOQsfoqoxw5XM=
X-Google-Smtp-Source: AK7set9kF4i1iKbe7d1648tc5OxuaqvY5bFe+8fRp+b+vZLUUDOyid8F60ujLvJIwsrBaHNB1uOU4w==
X-Received: by 2002:a17:903:2888:b0:194:a6e0:3ba with SMTP id
 ku8-20020a170903288800b00194a6e003bamr9129888plb.54.1677134367079; 
 Wed, 22 Feb 2023 22:39:27 -0800 (PST)
Received: from dhoffman-NUC13RNGi9.. (c-73-25-30-39.hsd1.or.comcast.net.
 [73.25.30.39]) by smtp.gmail.com with ESMTPSA id
 o19-20020a170902779300b0019a7c890c61sm570035pll.252.2023.02.22.22.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 22:39:26 -0800 (PST)
From: Daniel Hoffman <dhoff749@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Hoffman <dhoff749@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH] hw/i386: fix microvm segfault with virtio cmdline
Date: Wed, 22 Feb 2023 22:39:10 -0800
Message-Id: <20230223063910.69081-1-dhoff749@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=dhoff749@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The 'microvm' machine type allows for disabling ACPI, in which case
the VirtIO device configuration is passed via appending it to the
kernel cmdline.

If no cmdline parameter was passed, then a null pointer is dereferenced when
the new cmdline is copied back. A solution is to always define the cmdline
in the fw_cfg so the read to append happens before the first write in the
multiboot case, and to explcitly re-write the value to update the length.

Fixes: eac7a7791b

Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>
---
 hw/i386/microvm.c | 3 ++-
 hw/i386/x86.c     | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 29f30dd6d3..be64280530 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -417,7 +417,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
     if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline)) {
         fprintf(stderr, "qemu: virtio mmio cmdline too large, skipping\n");
     } else {
-        memcpy(existing_cmdline, cmdline, len + 1);
+	fw_cfg_modify_i32(x86ms->fw_cfg, FW_CFG_CMDLINE_SIZE, len + 1);
+	fw_cfg_modify_string(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA, cmdline);
     }
     g_free(cmdline);
 }
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index eaff4227bd..7dd02b7409 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -827,6 +827,10 @@ void x86_load_linux(X86MachineState *x86ms,
     /* Make a copy, since we might append arbitrary bytes to it later. */
     kernel_cmdline = g_strndup(machine->kernel_cmdline, cmdline_size);
 
+    /* If the cmdline is undefined, set it as an empty allocated value */
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, cmdline_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline, cmdline_size);
+
     /* load the kernel header */
     f = fopen(kernel_filename, "rb");
     if (!f) {
-- 
2.37.2


