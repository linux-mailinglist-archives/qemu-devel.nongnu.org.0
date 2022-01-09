Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AEA488ADA
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:14:34 +0100 (CET)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bm5-0006FU-8r
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:14:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6bek-0006Xg-Hq; Sun, 09 Jan 2022 12:06:59 -0500
Received: from [2a00:1450:4864:20::329] (port=54238
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6bei-0005VZ-1H; Sun, 09 Jan 2022 12:06:58 -0500
Received: by mail-wm1-x329.google.com with SMTP id l4so7280279wmq.3;
 Sun, 09 Jan 2022 09:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iN7rmJCyt/9XOylIukKsQBez3yTqjDEoUhXX6uhz6nk=;
 b=Di1keJS+l27M8x/2G1Ma02PH3svXk6aZYshOdEgw8pO5f8c6P5TS+m4zTmRBT6wHT1
 HpAFYord7URVOLUT6qOWTEoG5jnilJEpFrFu1ddd8HlDr7iviK1ZEahau0btNWYq5pGZ
 W3T1zITmOcl1OcMU9dtKFn5hYIjEZx6dyBA/FOnW4N00bw8dF9h0bF9KHTMA5YaEmNiV
 6YMq41dytMsZIjQxFZddMOMaJopuJoyb7Sc+Bk2y8T4N15c6j2ms6FISYbUcXk0KGMx6
 3JIfKBpsS6q3SnPQWOunnv+sV1nZJer91sONHd/1OJ06ICZG9rbySxialH8s9a0GDbl6
 QdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iN7rmJCyt/9XOylIukKsQBez3yTqjDEoUhXX6uhz6nk=;
 b=ffyzOVFqh5XArw9CuUWrU9bhd/SDBD6O0SNDaJ/5EjwPAyktdCiPeYJ3ckga/Hky4n
 HydfCQOK6QXamuGHKbGgQWZ7eHh2Gatnip+AGqgIrDKYxrEsCC6jPKp9jH0V9ufsa/dt
 ONxjrtcOV6j/jHAhJSQXo6o9rsCuxz/Cua0yzxjtATOTM6F4PJnpdhdhpKqYBi5Dxrmf
 XMqxTq2cLhKGhVEmWLGijPbAsnYudb0WQ/+ic7dm3cMR9mn/bqTwV0UZFa+qHkW7pfGY
 0Xvr4l2vMNG4OVGwHtMBsNPbarRrm/T8f5CLGJsqZsH8hHFFHgmJfJaOYO5kPnfTPHH9
 16AQ==
X-Gm-Message-State: AOAM532PLjRBAeIY3bo1Pm43GaQARNarqhO2/AcQKeqR/dbZ9WBHw40V
 ox9K5bWyWNhYKLpQ01b0VymPPA3w08iN0w==
X-Google-Smtp-Source: ABdhPJw3MuOwK9vZxcFIlXVLvNPrCLICTpof4A+kTv79iWz4xF4v2k3c2I+pMcccXWkH1cveYVfkQA==
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr12130113wma.79.1641748014215; 
 Sun, 09 Jan 2022 09:06:54 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id e13sm4599960wmq.10.2022.01.09.09.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:06:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 5/6] hvf: Remove deprecated hv_vcpu_flush() calls
Date: Sun,  9 Jan 2022 18:06:11 +0100
Message-Id: <20220109170612.574104-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109170612.574104-1-f4bug@amsat.org>
References: <20220109170612.574104-1-f4bug@amsat.org>
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building on macOS 12, we get:

  In file included from ../target/i386/hvf/hvf.c:59:
  ../target/i386/hvf/vmx.h:174:5: error: 'hv_vcpu_flush' is deprecated: first deprecated in macOS 11.0 - This API has no effect and always returns HV_UNSUPPORTED [-Werror,-Wdeprecated-declarations]
      hv_vcpu_flush(vcpu);
      ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Hypervisor.framework/Headers/hv.h:364:20: note: 'hv_vcpu_flush' has been explicitly marked deprecated here
  extern hv_return_t hv_vcpu_flush(hv_vcpuid_t vcpu)
                     ^

Since this call "has no effect", simply remove it ¯\_(ツ)_/¯

Not very useful deprecation doc:
https://developer.apple.com/documentation/hypervisor/1441386-hv_vcpu_flush

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/vmx.h      | 2 --
 target/i386/hvf/x86_task.c | 1 -
 target/i386/hvf/x86hvf.c   | 2 --
 3 files changed, 5 deletions(-)

diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
index 6df87116f62..094fb9b9dc9 100644
--- a/target/i386/hvf/vmx.h
+++ b/target/i386/hvf/vmx.h
@@ -159,7 +159,6 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
     wvmcs(vcpu, VMCS_GUEST_CR0, cr0 | CR0_NE | CR0_ET);
 
     hv_vcpu_invalidate_tlb(vcpu);
-    hv_vcpu_flush(vcpu);
 }
 
 static inline void macvm_set_cr4(hv_vcpuid_t vcpu, uint64_t cr4)
@@ -171,7 +170,6 @@ static inline void macvm_set_cr4(hv_vcpuid_t vcpu, uint64_t cr4)
     wvmcs(vcpu, VMCS_CR4_MASK, CR4_VMXE);
 
     hv_vcpu_invalidate_tlb(vcpu);
-    hv_vcpu_flush(vcpu);
 }
 
 static inline void macvm_set_rip(CPUState *cpu, uint64_t rip)
diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
index 422156128b7..c8dc3d48fa8 100644
--- a/target/i386/hvf/x86_task.c
+++ b/target/i386/hvf/x86_task.c
@@ -181,5 +181,4 @@ void vmx_handle_task_switch(CPUState *cpu, x68_segment_selector tss_sel, int rea
     store_regs(cpu);
 
     hv_vcpu_invalidate_tlb(cpu->hvf->fd);
-    hv_vcpu_flush(cpu->hvf->fd);
 }
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 907f09f1b43..bec9fc58146 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -125,8 +125,6 @@ static void hvf_put_segments(CPUState *cpu_state)
 
     hvf_set_segment(cpu_state, &seg, &env->ldt, false);
     vmx_write_segment_descriptor(cpu_state, &seg, R_LDTR);
-    
-    hv_vcpu_flush(cpu_state->hvf->fd);
 }
     
 void hvf_put_msrs(CPUState *cpu_state)
-- 
2.33.1


