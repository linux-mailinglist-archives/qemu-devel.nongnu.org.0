Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF524AB785
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:34:56 +0100 (CET)
Received: from localhost ([::1]:59470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0QB-0002ff-Hf
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:34:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysz-00063t-FV
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:35 -0500
Received: from [2a00:1450:4864:20::329] (port=53793
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysv-0002Ir-84
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:31 -0500
Received: by mail-wm1-x329.google.com with SMTP id n8so9212155wmk.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jA/zGq0i7Q1AJkyr3sqI0LygQvi9DNMNVaVAvFtIKuY=;
 b=QLVEflRFJmDny8NAD6eca/CLGfpqmSlf0selnUFNV6IhmvmLi1rY8p7xrb5lUFx2qJ
 V87ElRakfTCzPcFmi8tVP2uh5EGK6RkkBJxnEG66dI6D5VvEpvcXe2m5KCRJchQWqnlP
 6Q+1wzlo9+MQqcxYQd9IEW5lIdTSvxGkp/6EUdgGrn/HZdBCVRvIZ439Ddox6TxSTg7w
 NZDV5kMA0p2jEtiP/0ASFu6idrHX/+Fom64ly6MrVZ4exQfVWbOGF+HjK6T8awsoUsJt
 70Jjqt/JNbRezGpGT3CnkeAbofpjXGpCUG+4MAL/C4DKrJ6ORz/nyGB4k8HTsIAazpZo
 0XrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jA/zGq0i7Q1AJkyr3sqI0LygQvi9DNMNVaVAvFtIKuY=;
 b=AFAIbRuUwJt9pGGr5LFdWVN7AqZCtFJ0xbJKimbFERO5GywZx/oK1Yv9bv8B1hgLZt
 m92hCYoHGvjlYHD7peexgTdb6CPIrpFnOPpF7DNblUjFKR7MhWx21verYpX6DPAyxZoa
 n8P4r+ihMRkDVRDCNP2i7A/QYvJImDs7jWtVg5G54K3aS8l3EHzjQy48URTOtccx2jHu
 IFfWatX8olBXmbj+Ywrdl7hYLYt+xzUd4kF/DRpvddaux13f3JGWfbhZ+qwggCddzN/8
 Q4BmsQ84je9VxiDBXUWHF0Pej3qsmThZA8ci3XsLhQ5JDLVGpxz5A4jhsF7QwGXkx/jn
 UrWw==
X-Gm-Message-State: AOAM530jAPPpjpVwzIMMpuZr3+sCsNQH5Tsri3/4do9VufN7sD9zSfsf
 8ZUvd2LCaEG4rJdvaKtUb9E4Ci6OIA4=
X-Google-Smtp-Source: ABdhPJyWIPdh0ZYJKEQ1lCJQVBCuCEKTe+/nuRtPehiIYFMWvEwzLys5o5wcdmvumZmJC9PJuC3klA==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr2982182wmj.111.1644220560842; 
 Sun, 06 Feb 2022 23:56:00 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l12sm3807977wrs.11.2022.02.06.23.56.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:56:00 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 20/21] softmmu: Add qemu_init_arch_modules()
Date: Mon,  7 Feb 2022 08:54:25 +0100
Message-Id: <20220207075426.81934-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

module_allow_arch() is the single target-specific call in the
whole vl.c file. Move the module initialization out to arch_init.c,
that way we'll be able to build vl.o once for all targets (the
next commit).

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/arch_init.h | 2 ++
 softmmu/arch_init.c        | 9 +++++++++
 softmmu/vl.c               | 5 +----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 70c579560a..79c2591425 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -28,4 +28,6 @@ enum {
 
 extern const uint32_t arch_type;
 
+void qemu_init_arch_modules(void);
+
 #endif
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 8919405c7b..79716f959b 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/module.h"
 #include "sysemu/arch_init.h"
 
 #ifdef TARGET_SPARC
@@ -39,3 +40,11 @@ int graphic_depth = 32;
 #endif
 
 const uint32_t arch_type = QEMU_ARCH;
+
+void qemu_init_arch_modules(void)
+{
+#ifdef CONFIG_MODULES
+    module_init_info(qemu_modinfo);
+    module_allow_arch(TARGET_NAME);
+#endif
+}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5e1b35ba48..08ff97f4e0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2814,10 +2814,7 @@ void qemu_init(int argc, char **argv, char **envp)
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
 
-#ifdef CONFIG_MODULES
-    module_init_info(qemu_modinfo);
-    module_allow_arch(TARGET_NAME);
-#endif
+    qemu_init_arch_modules();
 
     qemu_init_subsystems();
 
-- 
2.34.1


