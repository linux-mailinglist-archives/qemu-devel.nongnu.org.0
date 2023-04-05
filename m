Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7746D7984
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:19:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0E1-0006lj-UI; Wed, 05 Apr 2023 06:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Dz-0006ia-MT
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:18:43 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Dx-0002Eb-Bj
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:18:43 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso2519156wmq.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGm3E04zIWsYk05zgucyUicl5+3W8OYlCuN37xDTmqU=;
 b=rTu1tRZPqV4LFx/UoOZi2WLzS6khixq6d/WYxFS7eNNn/OYGeFnv0qc3Qcr02VSKxy
 rb660oY/fmNu7J89tEYsSKeFFMuIPWe0bwl6jY9zC3o3nLjl9EKCdNxVkCbBuJ6lm5CH
 gjTz1i3s9XYei/E+itmN9I/+2jlgOY1BBVZJB9fjEYyywfgateusSwusPqpu7NrWhMR0
 GMl837ggRVzo1kt3Z33apYrhv71R+7WptfZnBSbUKuQc75ogJNF4kCG2j8Ggv1YnBRCy
 yVn/ZgcJgjoRbF4Cbyz/wswjzVjQZxiYa1fX9y35/BD8s5WDn2b95Nx3tL6XSawRO0qk
 iJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IGm3E04zIWsYk05zgucyUicl5+3W8OYlCuN37xDTmqU=;
 b=etGAUUR/MQZR8YIwEV3ZXnRMBaMdkzJFyEfIBBcLavYMKxoqZsmOqgZVNgTb7U23VE
 43qaXEUQcvG3b3oQhZON42kD4XZ3NJbrj7dtUXes3+dlraaFC8eRF/S15yehjgGIDTMo
 b6QJNpduXSWWGSY2eTtNKsftIikOIRPnH+41djfhodOAr9lOeGX+ge4aj7r3/QN61a3q
 3Adu1Ok03H5Ja2Zt8iKXGGqn6yx6DNYVNVV0BLmoi378vlsF+YVpkYfG3gAK49bxBk5o
 aGL0n3qgx1Qvdhv+JvSAbX6trS7JP0rMgcROSkiaOCESTXh6GGF6VsEds/m0FL0BDL+q
 2vlA==
X-Gm-Message-State: AAQBX9fJPZAPKh6nLmUSs8Zck3N0YbWgwM4+M8cu5PWbdIEYxQrTXha3
 cXiJATrKMcu/oMopDBHppntLLWh+UOb4zBDD0h8=
X-Google-Smtp-Source: AKy350ZDfAFPi7DjfgX/oekuSK5IMwY5EAU6LrxLx1bImlo8Bj5BMxd5ZdtWz6ZThOU3rdF/7XqStA==
X-Received: by 2002:a1c:770e:0:b0:3ed:8780:f27b with SMTP id
 t14-20020a1c770e000000b003ed8780f27bmr4338493wmi.16.1680689919738; 
 Wed, 05 Apr 2023 03:18:39 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a1c7906000000b003ee4e99a8f6sm1696262wme.33.2023.04.05.03.18.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:18:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/14] accel: Destroy HAX vCPU threads once done
Date: Wed,  5 Apr 2023 12:18:01 +0200
Message-Id: <20230405101811.76663-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

When the vCPU thread finished its processing, destroy
it and signal its destruction to generic vCPU management
layer.

Add a sanity check for the vCPU accelerator context.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hax/hax-accel-ops.c | 3 +++
 target/i386/hax/hax-all.c       | 1 +
 2 files changed, 4 insertions(+)

diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 18114fe34d..0157a628a3 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -53,6 +53,8 @@ static void *hax_cpu_thread_fn(void *arg)
 
         qemu_wait_io_event(cpu);
     } while (!cpu->unplug || cpu_can_run(cpu));
+    hax_vcpu_destroy(cpu);
+    cpu_thread_signal_destroyed(cpu);
     rcu_unregister_thread();
     return NULL;
 }
@@ -69,6 +71,7 @@ static void hax_start_vcpu_thread(CPUState *cpu)
              cpu->cpu_index);
     qemu_thread_create(cpu->thread, thread_name, hax_cpu_thread_fn,
                        cpu, QEMU_THREAD_JOINABLE);
+    assert(cpu->hax_vcpu);
 #ifdef _WIN32
     cpu->hThread = qemu_thread_get_handle(cpu->thread);
 #endif
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index a2321a1eff..38a4323a3c 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -209,6 +209,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     CloseHandle(cpu->hThread);
 #endif
     g_free(vcpu);
+    cpu->hax_vcpu = NULL;
     return 0;
 }
 
-- 
2.38.1


