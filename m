Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185BC67E943
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:17:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQTE-0006ta-Fe; Fri, 27 Jan 2023 10:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSb-0006SH-QQ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:15 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSX-0007m8-Nd
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:13 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so5619787wml.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2Gttyqqmk9FJzTdv4GV6HEHY8zcoxRPE3NZzmrf+n4=;
 b=VA6NUCDFx8lOL0Z+1x3S3zxS7fGzsnMOU3H/Iuknae4YporvaEybf2o8k99xXmXi6V
 EQqAGs342LLVqxVSoKJni7g9Cow+rAUCSbQ2RnthBF6g1P9p7jvy3pvwmvN4Yu2l2Je/
 Db7oi1IvUo4zgBlalajjgIUblSBXSoxthCrNE/3PSRFm3OmFnrdC3sr0hhCmCJGasT1N
 fCwnOQSvkQKRQqjNvhGLQaCBWEp/xqjlCPoXSulAm7n7bhRyqjGpSKNegbOF7dwvOwGv
 +0wUlT2SjecqMBe/3wC8YbB419IAovE2jsj3tqI1cIxVqc4bQ5b6itSXfiMQQtc4JqiX
 85Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W2Gttyqqmk9FJzTdv4GV6HEHY8zcoxRPE3NZzmrf+n4=;
 b=Ss72HoxdEqjni7KS066bCxCktbUBGe4DfjEwW98F3jjVGtkicHEfxjPAEeAO2Eoy3V
 DUh32ru3wwlg/vEI/dsjCzUE+Mz06p2vDcC00gmvvZRYYASJ0rIqo0fz3tyXjBjhHJ9o
 Qedv1J/Ggta+pXoO5Gt1f579DVMCqt+odgcfjCprV6qoCvdQ08vDzuvDyZtkqFSZcEAq
 DnunAOpWWT++Xgydi3fSZgXGT/b/ErN8LJ5xpZx/YAjKIEahwTY9DJ4QWU5FRam9rMPC
 iP6rnEXb642REyp4sUtecTrp+6sj+hyxtecmaq5AQM/tLLAxSyFC1zXOv00SSAbws5Dc
 2YGg==
X-Gm-Message-State: AFqh2koORvh1MN5/UW1qNZmpty3aM8LmGlcgdof/E7B8M2UgFfXLq0Or
 dRgCwRiroc98IRFfZ899vjInyg==
X-Google-Smtp-Source: AMrXdXsum66V9SryNqits/WuEqHeWo9nn9HzIUCwkYhiaMnfsqf9QZYrXWrHdPjjuSf/+nymGP9kJg==
X-Received: by 2002:a05:600c:2056:b0:3db:ce8:6662 with SMTP id
 p22-20020a05600c205600b003db0ce86662mr38049375wmg.31.1674832568124; 
 Fri, 27 Jan 2023 07:16:08 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:16:07 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 16/16] target/arm/kvm-rme: Disable readonly mappings
Date: Fri, 27 Jan 2023 15:07:29 +0000
Message-Id: <20230127150727.612594-17-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

KVM does not support creating read-only mappings for realms at the
moment. Add an arch helper to detect whether read-only mappings are
supported.

Device ROM and flash normally use read-only mappings. Device ROM seems
limited to legacy use and does not need to be trusted by the guest, so
trapping reads should be fine. Flash on the other hand, is used for the
firmware and needs to be both executable and measured. It may be
necessary to replace flash with RAM in order to run firmwares like edk2
in realms.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/sysemu/kvm.h | 2 ++
 accel/kvm/kvm-all.c  | 8 +++++++-
 target/arm/kvm-rme.c | 9 +++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index e9a97eda8c..8d467c76c6 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -581,5 +581,7 @@ bool kvm_arch_cpu_check_are_resettable(void);
 
 bool kvm_dirty_ring_enabled(void);
 
+bool kvm_arch_readonly_mem_allowed(KVMState *s);
+
 uint32_t kvm_dirty_ring_size(void);
 #endif
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f99b0becd8..56cdd2e9e9 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2267,6 +2267,11 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
+bool __attribute__((weak)) kvm_arch_readonly_mem_allowed(KVMState *s)
+{
+    return true;
+}
+
 static void query_stats_cb(StatsResultList **result, StatsTarget target,
                            strList *names, strList *targets, Error **errp);
 static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
@@ -2520,7 +2525,8 @@ static int kvm_init(MachineState *ms)
     }
 
     kvm_readonly_mem_allowed =
-        (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0);
+        (kvm_check_extension(s, KVM_CAP_READONLY_MEM) > 0) &&
+        kvm_arch_readonly_mem_allowed(s);
 
     kvm_eventfds_allowed =
         (kvm_check_extension(s, KVM_CAP_IOEVENTFD) > 0);
diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 1baed79d46..2812a52aeb 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -62,6 +62,15 @@ bool kvm_arm_rme_enabled(void)
     return !!cgs_to_rme(cgs);
 }
 
+/*
+ * KVM does not support creating read-only stage-2 mappings for realms at the
+ * moment
+ */
+bool kvm_arch_readonly_mem_allowed(KVMState *s)
+{
+    return !kvm_arm_rme_enabled();
+}
+
 static int rme_create_rd(RmeGuest *guest, Error **errp)
 {
     int ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
-- 
2.39.0


