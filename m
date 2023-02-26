Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273116A2CD2
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 01:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pW4vy-0007Ok-7P; Sat, 25 Feb 2023 19:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhoff749@gmail.com>)
 id 1pW4vv-0007OO-Ki
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 19:30:31 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dhoff749@gmail.com>)
 id 1pW4vs-0007li-Ti
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 19:30:31 -0500
Received: by mail-pj1-x102a.google.com with SMTP id l1so2725652pjt.2
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 16:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677371419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hM8Nin59vUJ3YX5RzyxQrEqWR+rnihlAoly82owcguc=;
 b=kckPUgKjuJZlVsSVp+v5irh2OzKR63mMzY4e07pNBJ4sKX1YN/zhrJiE7wPrq3h//U
 vYqCmT4gHs22eJ6hkZqScbIr1DQ5qQ78BMVfqA62m6VQKglLcGID5Pg9Fui6aozPAlj3
 eHBdwVZBfiNV09wk2kAjzfuPl3jGWxi0Ijz48gVyDVDV/HhaH2GeNk3D/uV48k0zd/fv
 eyDJTZ2YSlt4hDfL57vQCQq7eTuganOm1YAvzkGiOWT4hkqjwK0kqyJRHrasxOIH4HDL
 p4bowSrdFGw349c1Bcl+bjEMg4QpeiOxDeQZkQnYnZ/siOTMUjJ7ve+LL5/cpnhtY78v
 6jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677371419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hM8Nin59vUJ3YX5RzyxQrEqWR+rnihlAoly82owcguc=;
 b=ZciYJAMYdbZOayFbBnra0khA7GSGgTWnjBcXqPMY/8DSfeoqiZQWsZnu7/WxvIarWy
 RnWys22lwsLbVDMtFRf25TrmVIvTgn7PCqsAbofw/Mpgu6DtI760Trvmx4/x6Yw29gZB
 R6pbs/c9yXV9j9VGsm44l+1fgx067/s+xCcezRpoYnskmY+r+pzeljVG+R5TVzWssvyg
 ROTzRLXPcx9uJgzAuPElpkM6J+N21mpc2Vmk+hgxlwbtjFM+FfAZjj9FQFcm9olimgXy
 RS2dCisqjoVhEJhjSXJqeX+tAH7V4ORj8FPh9f/pwI0m+oL14ij+xR7ty73MHVQGUyg0
 Cs+Q==
X-Gm-Message-State: AO0yUKWOmCW/q/T8ph6rdP8hpgIzS6uMZT7AtuF1OJV9k8yrpWYoZDgf
 faxJVljJQIJQ8tfuWvswEj7RyCgU/60CiA==
X-Google-Smtp-Source: AK7set8YjYtnwX4oUvkQJ6sQSjVJIXCPKoHpoD1M8SoWYN9AFyi9u+qr1NdgK4bSsUQiECJuO5HgBg==
X-Received: by 2002:a17:903:6ce:b0:19c:bcae:b44f with SMTP id
 kj14-20020a17090306ce00b0019cbcaeb44fmr8750179plb.68.1677371418799; 
 Sat, 25 Feb 2023 16:30:18 -0800 (PST)
Received: from dhoffman-NUC13RNGi9.. (c-73-25-30-39.hsd1.or.comcast.net.
 [73.25.30.39]) by smtp.gmail.com with ESMTPSA id
 u13-20020a170902714d00b00194ac38bc86sm1782403plm.131.2023.02.25.16.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 16:30:18 -0800 (PST)
From: Daniel Hoffman <dhoff749@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Hoffman <dhoff749@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2] hw/i386: fix microvm segfault with virtio cmdline
Date: Sat, 25 Feb 2023 16:27:57 -0800
Message-Id: <20230226002757.1162730-1-dhoff749@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=dhoff749@gmail.com; helo=mail-pj1-x102a.google.com
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
multiboot case and to explcitly re-write the value to update the length.

Fixes: eac7a7791b ("x86: don't let decompressed kernel image clobber setup_data")

Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>
---
 hw/i386/microvm.c | 3 ++-
 hw/i386/x86.c     | 9 +++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 29f30dd6d3..587ca53def 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -417,7 +417,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
     if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline)) {
         fprintf(stderr, "qemu: virtio mmio cmdline too large, skipping\n");
     } else {
-        memcpy(existing_cmdline, cmdline, len + 1);
+        fw_cfg_modify_i32(x86ms->fw_cfg, FW_CFG_CMDLINE_SIZE, len + 1);
+        fw_cfg_modify_string(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA, cmdline);
     }
     g_free(cmdline);
 }
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index eaff4227bd..ac6d921a6b 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -827,6 +827,15 @@ void x86_load_linux(X86MachineState *x86ms,
     /* Make a copy, since we might append arbitrary bytes to it later. */
     kernel_cmdline = g_strndup(machine->kernel_cmdline, cmdline_size);
 
+    /*
+     * If no kernel cmdline was passed as a parameter, machine->kernel_cmdline is
+     * blank but fw_cfg is undefined. The microvm cmdline fiddling hack requires
+     * it to be defined, even if it is empty, as g_strndup(NULL) == NULL and 
+     * g_strndup("") != NULL
+     */
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(machine->kernel_cmdline) + 1);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline, strlen(machine->kernel_cmdline));
+
     /* load the kernel header */
     f = fopen(kernel_filename, "rb");
     if (!f) {
-- 
2.37.2


