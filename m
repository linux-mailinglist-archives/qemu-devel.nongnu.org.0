Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D371047634B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:28:44 +0100 (CET)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxatH-0007St-Us
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq6-0003tZ-4e
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:26 -0500
Received: from [2a00:1450:4864:20::433] (port=36676
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq3-0004F3-LN
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:25 -0500
Received: by mail-wr1-x433.google.com with SMTP id u17so40260807wrt.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLbXvMbGolCMgEVnGKawTCj/7CpubmYtlSKjPtoEByc=;
 b=HqaFPyhWflDol8yEAyFuyEXovaqnPrlQKg74MYStzL271o3GzSKjO+ev+TCw4ngN2N
 /4ZaxkIN6YUfA9tYr/wbgWlrsJENA9nKQJNwws0etf4ETrX6yyifX0Aob1sj+Y1QmbUN
 NmZkzbtDPi6KQ7+UXf4CqbzOXzhelZMlCBeHKbuRRjPLEL9aM7TEBGl40ucb+5VwvrYh
 RLymkfTuw1hSEjfRI2tzpdy7kRW3se5HVrf3H6N8bqMOEl5Fhq33JHNZOFseKhhMR9px
 oHnwgDIUZ/lmLNxiVV6e1o2dz36VBAZyRn83f65AAO2p2HLWcku8a7z6Wi4AdWqzo2hc
 CSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rLbXvMbGolCMgEVnGKawTCj/7CpubmYtlSKjPtoEByc=;
 b=tWqALyNJ3Qbnwpkh25DQ5o/pbcvMJwHbZt84b11oQ6t6xVixPSu4Fw4/tsFbIJHOPl
 RIdTDc1cGFNScGUCH2AtveXDvVpUhhTAMqQLJm39b3FixkStbNlcy1LGzU2qnvIqrZ4Z
 cuifdnncrFd5htLNJzx3C442tr4R/2kzyLDeg3HZApNiMwwE99ilxMXQl5xDF5JKsw2+
 /ETLnnoB3ikFGgVGn3E1U6gqR4gd2pQtUoOeTMrbJO4jlJvFkxRQ0RLVG1jU9VAojnXl
 hHH3VjpZ8UZdDlDK37yFOr5rYFmVR2w72sUMBO5AanA8k+MY2Pm66v3IV5xE0FKH5AZL
 q/1Q==
X-Gm-Message-State: AOAM533vlqLjhAzTZRYHP8oCCDmnrpZgqqMYRMdxQ2e/wbY64Aoj2fz5
 PBFgf7fl4E3PmHacRorCrfCSu0tKwvc=
X-Google-Smtp-Source: ABdhPJxV4tZr7vHjZw6xXfRFa7Gvi1jg1Izb52vCX8RUvqiICtbejgMeVTGiuT3phNeLel+TCYxRWw==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr6170774wrw.118.1639599922307; 
 Wed, 15 Dec 2021 12:25:22 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] gdbstub, kvm: let KVM report supported singlestep flags
Date: Wed, 15 Dec 2021 21:25:10 +0100
Message-Id: <20211215202515.91586-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
[Extracted from Maxim's patch into a separate commit. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211111110604.207376-5-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c  | 12 ++++++++++++
 gdbstub.c            | 10 +++++++++-
 include/sysemu/kvm.h | 15 +++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index eecd8031cf..2f5597572a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -168,6 +168,8 @@ bool kvm_vm_attributes_allowed;
 bool kvm_direct_msi_allowed;
 bool kvm_ioeventfd_any_length_allowed;
 bool kvm_msi_use_devid;
+bool kvm_has_guest_debug;
+int kvm_sstep_flags;
 static bool kvm_immediate_exit;
 static hwaddr kvm_max_slot_size = ~0;
 
@@ -2564,6 +2566,16 @@ static int kvm_init(MachineState *ms)
     kvm_ioeventfd_any_length_allowed =
         (kvm_check_extension(s, KVM_CAP_IOEVENTFD_ANY_LENGTH) > 0);
 
+#ifdef KVM_CAP_SET_GUEST_DEBUG
+    kvm_has_guest_debug =
+        (kvm_check_extension(s, KVM_CAP_SET_GUEST_DEBUG) > 0);
+#endif
+
+    kvm_sstep_flags = 0;
+    if (kvm_has_guest_debug) {
+        kvm_sstep_flags = SSTEP_ENABLE;
+    }
+
     kvm_state = s;
 
     ret = kvm_arch_init(ms, s);
diff --git a/gdbstub.c b/gdbstub.c
index a955175fd4..3c14c6a038 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -391,6 +391,8 @@ static void init_gdbserver_state(void)
      */
     if (replay_mode != REPLAY_MODE_NONE) {
         gdbserver_state.supported_sstep_flags = SSTEP_ENABLE;
+    } else if (kvm_enabled()) {
+        gdbserver_state.supported_sstep_flags = kvm_get_supported_sstep_flags();
     } else {
         gdbserver_state.supported_sstep_flags =
             SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
@@ -400,7 +402,8 @@ static void init_gdbserver_state(void)
      * By default use no IRQs and no timers while single stepping so as to
      * make single stepping like an ICE HW step.
      */
-    gdbserver_state.sstep_flags = gdbserver_state.supported_sstep_flags;
+    gdbserver_state.sstep_flags = SSTEP_ENABLE | SSTEP_NOIRQ | SSTEP_NOTIMER;
+    gdbserver_state.sstep_flags &= gdbserver_state.supported_sstep_flags;
 
 }
 
@@ -3520,6 +3523,11 @@ int gdbserver_start(const char *device)
         return -1;
     }
 
+    if (kvm_enabled() && !kvm_supports_guest_debug()) {
+        error_report("gdbstub: KVM doesn't support guest debugging");
+        return -1;
+    }
+
     if (!device)
         return -1;
     if (strcmp(device, "none") != 0) {
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 7b22aeb6ae..6eb39a088b 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -46,6 +46,8 @@ extern bool kvm_readonly_mem_allowed;
 extern bool kvm_direct_msi_allowed;
 extern bool kvm_ioeventfd_any_length_allowed;
 extern bool kvm_msi_use_devid;
+extern bool kvm_has_guest_debug;
+extern int kvm_sstep_flags;
 
 #define kvm_enabled()           (kvm_allowed)
 /**
@@ -167,6 +169,17 @@ extern bool kvm_msi_use_devid;
  */
 #define kvm_msi_devid_required() (kvm_msi_use_devid)
 
+/*
+ * Does KVM support guest debugging
+ */
+#define kvm_supports_guest_debug() (kvm_has_guest_debug)
+
+/*
+ * kvm_supported_sstep_flags
+ * Returns: SSTEP_* flags that KVM supports for guest debug
+ */
+#define kvm_get_supported_sstep_flags() (kvm_sstep_flags)
+
 #else
 
 #define kvm_enabled()           (0)
@@ -184,6 +197,8 @@ extern bool kvm_msi_use_devid;
 #define kvm_direct_msi_enabled() (false)
 #define kvm_ioeventfd_any_length_enabled() (false)
 #define kvm_msi_devid_required() (false)
+#define kvm_supports_guest_debug() (false)
+#define kvm_get_supported_sstep_flags() (0)
 
 #endif  /* CONFIG_KVM_IS_POSSIBLE */
 
-- 
2.33.1



