Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D2964F424
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:31:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Imn-0005xy-35; Fri, 16 Dec 2022 17:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Imj-0005xY-TW
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:29 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Imh-0004Yo-LR
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:29 -0500
Received: by mail-ed1-x529.google.com with SMTP id d20so5578190edn.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubryi+kT4ZgfJta0po2rO0OCWUN41wpa/A7EK1wMX3A=;
 b=CPXJdzqqTPQTVBAhjt52mM6Sr6Xb2LTSI4KR89AdwMhHcVAmf4Mp1len6K6NxdXMn6
 UZs2G9WzLdjSLmcG7LMBJrmkYXE0xq/0WDA0EqkzUSJoVoUe6Ty7bR+RxNoXHb06FAcU
 9zjZVvVuYfBTAcQ6XmZBQ1Rn/FmzkqtchgoNVkvcngRI3ngEAKOBhsrt88tEZayyBs95
 0L2yBCjMWBqpEZzUUwJ3wy/AQCXSPtKmgVXba/JGHv5pgBCICijfsU+XTL3FbyhTi5BB
 2nkqw76Gxx33g6P1WlVLOEVggs9LFB8b/rulK4aorqYsvPAp4H4liq7OmslsNi6ZkBYA
 nPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ubryi+kT4ZgfJta0po2rO0OCWUN41wpa/A7EK1wMX3A=;
 b=ZA71hejDts7IAs4UNu1EwbmM44eDiH0657iD8eLZMgoH59mSUZ5ufbxj0uMO+9ccW1
 /lv/hRaPf3hQKCydlYFn/bA0OxlECg0JOQZ3M4cmsFFwrV64JImuIORwzN41+iTKVMUk
 72uCRg1jabkjG6N0bbKqU8aWgC/YNMBUYF2M8ThPbw4SgHTf5dwVhVFN1al7bNBR+01+
 goEpczPH+PJEGxZNKT9QCfOwbSmeHUZg2XF27dJOBvRFBoJZKHMszu6ax0yd7RrY4xRi
 UsZpNV+yAzcChEra6+l1mQ7pyz0uET3gfrLz3xaNVKO4W6P2KCoT7pfCinfEmg3MAapN
 s4fg==
X-Gm-Message-State: ANoB5pm1wMuntPAq2dsPRwVSWJB8DTh0OPYiHuiWdIc1rJxIKXlYg1fa
 3ExO1kb8j0PwWfUItbX/2znrsF8+7K0FZiWcA+8=
X-Google-Smtp-Source: AA0mqf7hbCF6/YLJgPUrP29bqDep1dHdTtfN9t1gEYNPFhIVhf0JIMK70cl7X0xfep0qFWR2Tt2EzQ==
X-Received: by 2002:a05:6402:28a:b0:45c:be41:a473 with SMTP id
 l10-20020a056402028a00b0045cbe41a473mr28858111edv.29.1671228145924; 
 Fri, 16 Dec 2022 14:02:25 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a056402019100b004722d7e8c7csm1323355edv.14.2022.12.16.14.02.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:02:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/5] target/i386: Remove x86_cpu_dump_local_apic_state() dead
 stub
Date: Fri, 16 Dec 2022 23:01:57 +0100
Message-Id: <20221216220158.6317-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220158.6317-1-philmd@linaro.org>
References: <20221216220158.6317-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

x86_cpu_dump_local_apic_state() is called from monitor.c which
is only compiled for system emulation since commit bf95728400
("monitor: remove target-specific code from monitor.c").

Interestingly this stub was added few weeks later in commit
1f871d49e3 ("hmp: added local apic dump state") and was not
necessary by that time.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu-dump.c | 5 +----
 target/i386/cpu.h      | 4 ++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
index 08ac957e99..40697064d9 100644
--- a/target/i386/cpu-dump.c
+++ b/target/i386/cpu-dump.c
@@ -335,10 +335,7 @@ void x86_cpu_dump_local_apic_state(CPUState *cs, int flags)
     }
     qemu_printf(" PPR 0x%02x\n", apic_get_ppr(s));
 }
-#else
-void x86_cpu_dump_local_apic_state(CPUState *cs, int flags)
-{
-}
+
 #endif /* !CONFIG_USER_ONLY */
 
 #define DUMP_CODE_BYTES_TOTAL    50
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9824b7f8f2..32d048f326 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2355,12 +2355,16 @@ typedef int X86CPUVersion;
  */
 void x86_cpu_set_default_version(X86CPUVersion version);
 
+#ifndef CONFIG_USER_ONLY
+
 #define APIC_DEFAULT_ADDRESS 0xfee00000
 #define APIC_SPACE_SIZE      0x100000
 
 /* cpu-dump.c */
 void x86_cpu_dump_local_apic_state(CPUState *cs, int flags);
 
+#endif
+
 /* cpu.c */
 bool cpu_is_bsp(X86CPU *cpu);
 
-- 
2.38.1


