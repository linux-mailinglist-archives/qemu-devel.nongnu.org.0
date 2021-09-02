Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B25A3FF182
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:34:32 +0200 (CEST)
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpfb-0006lr-CZ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpPw-00028q-19; Thu, 02 Sep 2021 12:18:21 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpPp-0002c9-NY; Thu, 02 Sep 2021 12:18:18 -0400
Received: by mail-wm1-x332.google.com with SMTP id e26so1676153wmk.2;
 Thu, 02 Sep 2021 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UWFl0S8+QJmSRfKpaWNU58d5jvI099dEW79c4Eds8Co=;
 b=qyX0fbK8beMEiA2sBSgl3PW3ky5dGcSVCBtTwKFMLbBLTDoVjxKFiSsk0jDC/pFJh8
 EQJ9wt19ZKu7z9D2NO2X1GBhffNKLdpe3QtarXXg5bKru7SgrpNFq7ykSau/rj7BWEMU
 1lB3fKoh6dEiYxH/wEudtnGa9nyEo7DeltzASvLMnmAUaT41c/G+J+JRbl3ezoYTAza1
 Y+ETvUqkI+1eP+JhGzMn2Azr7F5hdjAx5ZUxT+4ueBQ0CSz4Bd282avi1jucNAchPVMA
 9SsBqrFRz0Y5wm79SMIMZa6Daop/L/LafP8vvrGNOlI29+ElFdjMqyjQo9hpcEC0Ade/
 GupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UWFl0S8+QJmSRfKpaWNU58d5jvI099dEW79c4Eds8Co=;
 b=QibJUtSf5nqETljd6uRi8NNp5RuJgAL4x2QjRApc2Lv7n6vQt1BvqND8DzIlSKoLKd
 cQ8ADNC1S7GV0/tqjJhZT45/mXFLTbHYTL4HyAtkiIiH2ZowPbnwDjpSUIqXgFeaY5Tt
 xcV9eixg/dfsWpjNxQDJ27hVGtgFixOb5scdvytCvkdBbF56qhSoY10MGgf6JwL732tA
 ZrJswdTE5mjJ0QobnHRSiVRLAcHSpgcPAsKy1qa0V1nC0ulFqvy7L0vT07tckDq0nSJ6
 +2CvnEbrznqy1wu09lKx9bmAG2tH5GJMR9fCDRzYX8MJW1VA+xBhzXPUKce40KvFtl19
 C8AQ==
X-Gm-Message-State: AOAM532cvXIs6wKSwc3WLJllaZI8eHZRs1mN/cZ9gmrgMakaduestv5G
 sSdSNY8avenjvbJCExscH+3ZOT5RYCc=
X-Google-Smtp-Source: ABdhPJxiiVaTYWvAG9DN++m79S0TQSTDr2C/1kQW8ctmk5/+oYLKUYcjyiQjFsrDz4LSrxOSg3eaUA==
X-Received: by 2002:a1c:202:: with SMTP id 2mr3928971wmc.122.1630599486805;
 Thu, 02 Sep 2021 09:18:06 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 k14sm2234887wri.46.2021.09.02.09.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:18:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/30] target/ppc: Simplify has_work() handlers
Date: Thu,  2 Sep 2021 18:15:35 +0200
Message-Id: <20210902161543.417092-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The common ppc_cpu_has_work() handler already checks for cs->halted,
so we can simplify all callees.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/cpu_init.c | 294 ++++++++++++++++++++----------------------
 1 file changed, 138 insertions(+), 156 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index bbad16cc1ec..c8ec47d58fa 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7589,33 +7589,29 @@ static bool cpu_has_work_POWER7(CPUState *cs)
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
 
-    if (cs->halted) {
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
-            return true;
-        }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
-            return true;
-        }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK)) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-            return true;
-        }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HMI)) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-            return true;
-        }
-        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
-            return true;
-        }
+    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
         return false;
-    } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
+        return true;
+    }
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
+        return true;
+    }
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK)) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
+        return true;
+    }
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HMI)) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
+        return true;
+    }
+    if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
+        return true;
+    }
+    return false;
 }
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
@@ -7750,41 +7746,37 @@ static bool cpu_has_work_POWER8(CPUState *cs)
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
 
-    if (cs->halted) {
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
-            return true;
-        }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
-            return true;
-        }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK)) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
-            return true;
-        }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HMI)) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
-            return true;
-        }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
-            return true;
-        }
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) &&
-            (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
-            return true;
-        }
-        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
-            return true;
-        }
+    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
         return false;
-    } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
+        return true;
+    }
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
+        return true;
+    }
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK)) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
+        return true;
+    }
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HMI)) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
+        return true;
+    }
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
+        return true;
+    }
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
+        return true;
+    }
+    if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
+        return true;
+    }
+    return false;
 }
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
@@ -7948,58 +7940,53 @@ static bool cpu_has_work_POWER9(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
+    uint64_t psscr = env->spr[SPR_PSSCR];
 
-    if (cs->halted) {
-        uint64_t psscr = env->spr[SPR_PSSCR];
-
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-
-        /* If EC is clear, just return true on any pending interrupt */
-        if (!(psscr & PSSCR_EC)) {
-            return true;
-        }
-        /* External Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
-            (env->spr[SPR_LPCR] & LPCR_EEE)) {
-            bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (heic == 0 || !msr_hv || msr_pr) {
-                return true;
-            }
-        }
-        /* Decrementer Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
-            (env->spr[SPR_LPCR] & LPCR_DEE)) {
-            return true;
-        }
-        /* Machine Check or Hypervisor Maintenance Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK |
-            1u << PPC_INTERRUPT_HMI)) && (env->spr[SPR_LPCR] & LPCR_OEE)) {
-            return true;
-        }
-        /* Privileged Doorbell Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
-            (env->spr[SPR_LPCR] & LPCR_PDEE)) {
-            return true;
-        }
-        /* Hypervisor Doorbell Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) &&
-            (env->spr[SPR_LPCR] & LPCR_HDEE)) {
-            return true;
-        }
-        /* Hypervisor virtualization exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HVIRT)) &&
-            (env->spr[SPR_LPCR] & LPCR_HVEE)) {
-            return true;
-        }
-        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
-            return true;
-        }
+    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
         return false;
-    } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
+
+    /* If EC is clear, just return true on any pending interrupt */
+    if (!(psscr & PSSCR_EC)) {
+        return true;
+    }
+    /* External Exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
+        (env->spr[SPR_LPCR] & LPCR_EEE)) {
+        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
+        if (heic == 0 || !msr_hv || msr_pr) {
+            return true;
+        }
+    }
+    /* Decrementer Exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
+        (env->spr[SPR_LPCR] & LPCR_DEE)) {
+        return true;
+    }
+    /* Machine Check or Hypervisor Maintenance Exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK |
+        1u << PPC_INTERRUPT_HMI)) && (env->spr[SPR_LPCR] & LPCR_OEE)) {
+        return true;
+    }
+    /* Privileged Doorbell Exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
+        (env->spr[SPR_LPCR] & LPCR_PDEE)) {
+        return true;
+    }
+    /* Hypervisor Doorbell Exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) &&
+        (env->spr[SPR_LPCR] & LPCR_HDEE)) {
+        return true;
+    }
+    /* Hypervisor virtualization exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HVIRT)) &&
+        (env->spr[SPR_LPCR] & LPCR_HVEE)) {
+        return true;
+    }
+    if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
+        return true;
+    }
+    return false;
 }
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
@@ -8158,58 +8145,53 @@ static bool cpu_has_work_POWER10(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
+    uint64_t psscr = env->spr[SPR_PSSCR];
 
-    if (cs->halted) {
-        uint64_t psscr = env->spr[SPR_PSSCR];
-
-        if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-            return false;
-        }
-
-        /* If EC is clear, just return true on any pending interrupt */
-        if (!(psscr & PSSCR_EC)) {
-            return true;
-        }
-        /* External Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
-            (env->spr[SPR_LPCR] & LPCR_EEE)) {
-            bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (heic == 0 || !msr_hv || msr_pr) {
-                return true;
-            }
-        }
-        /* Decrementer Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
-            (env->spr[SPR_LPCR] & LPCR_DEE)) {
-            return true;
-        }
-        /* Machine Check or Hypervisor Maintenance Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK |
-            1u << PPC_INTERRUPT_HMI)) && (env->spr[SPR_LPCR] & LPCR_OEE)) {
-            return true;
-        }
-        /* Privileged Doorbell Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
-            (env->spr[SPR_LPCR] & LPCR_PDEE)) {
-            return true;
-        }
-        /* Hypervisor Doorbell Exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) &&
-            (env->spr[SPR_LPCR] & LPCR_HDEE)) {
-            return true;
-        }
-        /* Hypervisor virtualization exception */
-        if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HVIRT)) &&
-            (env->spr[SPR_LPCR] & LPCR_HVEE)) {
-            return true;
-        }
-        if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
-            return true;
-        }
+    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
         return false;
-    } else {
-        return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
     }
+
+    /* If EC is clear, just return true on any pending interrupt */
+    if (!(psscr & PSSCR_EC)) {
+        return true;
+    }
+    /* External Exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
+        (env->spr[SPR_LPCR] & LPCR_EEE)) {
+        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
+        if (heic == 0 || !msr_hv || msr_pr) {
+            return true;
+        }
+    }
+    /* Decrementer Exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DECR)) &&
+        (env->spr[SPR_LPCR] & LPCR_DEE)) {
+        return true;
+    }
+    /* Machine Check or Hypervisor Maintenance Exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_MCK |
+        1u << PPC_INTERRUPT_HMI)) && (env->spr[SPR_LPCR] & LPCR_OEE)) {
+        return true;
+    }
+    /* Privileged Doorbell Exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_DOORBELL)) &&
+        (env->spr[SPR_LPCR] & LPCR_PDEE)) {
+        return true;
+    }
+    /* Hypervisor Doorbell Exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HDOORBELL)) &&
+        (env->spr[SPR_LPCR] & LPCR_HDEE)) {
+        return true;
+    }
+    /* Hypervisor virtualization exception */
+    if ((env->pending_interrupts & (1u << PPC_INTERRUPT_HVIRT)) &&
+        (env->spr[SPR_LPCR] & LPCR_HVEE)) {
+        return true;
+    }
+    if (env->pending_interrupts & (1u << PPC_INTERRUPT_RESET)) {
+        return true;
+    }
+    return false;
 }
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
-- 
2.31.1


