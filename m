Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27A76D7972
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:18:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0Dq-0006C2-P7; Wed, 05 Apr 2023 06:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Do-0006Bm-Uc
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:18:32 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Dl-0001iL-7z
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:18:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n19so20586619wms.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3PbVXrARru//womsk1QFTfUC/jT1xFpRBIRhWzNLeg=;
 b=c4FFRXSdAKN2IWwtiqV7Ffzer7xJF5apMUkKlQiTaxUK2YipBsMKVqtP9PC9OjOLHc
 rMq0iWLrZJBM6oJj3ZcxNuV1npeN62fnwpOyTCL/NyjHhKWn4eE/PATJuuf/ffKK2NvR
 l5O6MKTRN5ifGk9nigJmitObdfRL5i9btUsj2E5xzt7sy+nX/kRuir/iAaexJdDqUFJg
 4racwp2lla6NgRk1CkowemsGQ25lhbtxKUZ69OG2cP31L9IIwSsFNGT7+hn7ucd+REZe
 bpReBOAvbbifyVLiPMUCDSGVvfBSE6MFot4sUTf8DSomPdPCaRK9s3qVOS+XAggbGFny
 j31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z3PbVXrARru//womsk1QFTfUC/jT1xFpRBIRhWzNLeg=;
 b=AUNppbIohbXabskKbZeSlLcCyfcJfbp8Vis3KvQyypf5IOEcuyeuRn3z+ZkkO34PPM
 hfFUbmZhcfyFk0Ajyvu+Rf0HreRmEXI1P18o51XATEbBBgp3YKSJYJYf9ku4YHeRkIQU
 8oRG5CB0zJsgL0j/Ox/Km5pceOOIU7FU6zSSPX3BPbsHFEBWWX58KAXCMRwf5eNrs27b
 l5mpiyWmcHdm3brd/YOA0sdLUQbI9dXUhHhlElzQRRGF4Y+j4S5ybfLX0Ir6zCtl+cOS
 EclFFhgt/bcSWIYF74ZEooXza9vXOytCm5qSXmCZwsphC7DQMQznOmt4nsTwbdEPKcNq
 A24w==
X-Gm-Message-State: AAQBX9c5GHM+Rj8a3qfnpuHyZQpTuK5b3LDhSQADZtKB/u3gsa5XdY0l
 PHTaZx8Xinxu/LfgHWQ3GlQWWasqN8pGobQANBs=
X-Google-Smtp-Source: AKy350brt1TNZ7pG57+pZfUAcAl5eE1plZdTvYqjEnxz0kMrxGEeLijqmQ0ROub7VB7ZqCDrKQfQFA==
X-Received: by 2002:a05:600c:2942:b0:3ee:4ee:bf73 with SMTP id
 n2-20020a05600c294200b003ee04eebf73mr4220330wmd.24.1680689907651; 
 Wed, 05 Apr 2023 03:18:27 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 ay8-20020a05600c1e0800b003edddae1068sm1744815wmb.9.2023.04.05.03.18.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:18:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: [PATCH 02/14] accel: Remove unused hThread variable on TCG/WHPX
Date: Wed,  5 Apr 2023 12:17:59 +0200
Message-Id: <20230405101811.76663-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On Windows hosts, cpu->hThread is assigned but never accessed:
remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c   | 4 ----
 accel/tcg/tcg-accel-ops-rr.c      | 3 ---
 target/i386/whpx/whpx-accel-ops.c | 3 ---
 3 files changed, 10 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index d50239e0e2..19cfb26c02 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -152,8 +152,4 @@ void mttcg_start_vcpu_thread(CPUState *cpu)
 
     qemu_thread_create(cpu->thread, thread_name, mttcg_cpu_thread_fn,
                        cpu, QEMU_THREAD_JOINABLE);
-
-#ifdef _WIN32
-    cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
 }
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 290833a37f..dafff71530 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -291,9 +291,6 @@ void rr_start_vcpu_thread(CPUState *cpu)
 
         single_tcg_halt_cond = cpu->halt_cond;
         single_tcg_cpu_thread = cpu->thread;
-#ifdef _WIN32
-        cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
     } else {
         /* we share the thread */
         cpu->thread = single_tcg_cpu_thread;
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index e8dc4b3a47..67cad86720 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -71,9 +71,6 @@ static void whpx_start_vcpu_thread(CPUState *cpu)
              cpu->cpu_index);
     qemu_thread_create(cpu->thread, thread_name, whpx_cpu_thread_fn,
                        cpu, QEMU_THREAD_JOINABLE);
-#ifdef _WIN32
-    cpu->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
 }
 
 static void whpx_kick_vcpu_thread(CPUState *cpu)
-- 
2.38.1


