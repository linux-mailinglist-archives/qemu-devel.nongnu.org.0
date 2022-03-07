Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0F94D067C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:26:41 +0100 (CET)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI48-00047F-Aq
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:26:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuj-00019P-3g
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:57 -0500
Received: from [2a00:1450:4864:20::635] (port=42731
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005Nj-8l
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:56 -0500
Received: by mail-ej1-x635.google.com with SMTP id hw13so33710040ejc.9
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=waGBxRYL0CRLQIlQJnrfINtyYKriftnKcMnSxcPeoYo=;
 b=F44uYW0assdFRkogJ4AgMCiM9zSUSCjQOWEgqBBHdKgAWqRkU4wSI5OdcLz+9uSUjQ
 y3VoG2kjZuI+BpeQkQT4Dcj136AnR8yyndoHJZCAJDjftK8jgFUjeXlqBPCMSeD3vtHi
 +AHyKqh7gwITSR3nS75wD3OEVbujGoKmrqODEy+U8xqgj7gsL1flwXPrFIgOIgYnill3
 dhaNGBprwH7zwPbijebPmGweOm2pH6OLNDx5w24AevwHKEydDYORxxoaUgIAbHWHAcNO
 PWerhG3LizsHPvxepfiCzHUFR26QK7kWCeMHEgO4xdImeExitqLf3DLS+QFWmav3NeES
 CqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=waGBxRYL0CRLQIlQJnrfINtyYKriftnKcMnSxcPeoYo=;
 b=3c9YmoEu2KikWI03Pyb6UT1cznPIcfA/Ydgp+S7c3ZeB+hns7yAtkHsihLHUU6OUck
 ktDkk9xQ7KAJL2W/a6Y/I0S9BvhnEz9q9aSEFu4190RtSP3wbSH5LCqGm0zbxcTDGPzG
 xv9bm953oceK78ntlZOqGn+Y48+CNy+tIfux/Oc8CZ0PaSrQQkuuPQRb6mg+qgrkjYZu
 ZhohrI8F4d5n1Jz2eVHGVoNQ3MzsAKJ2yimj/C6N542d6+u68zuPB8WGWjHDw1SdMAqC
 2OUwpk913sV3tErqnthKZECgCe16j7MXT/+L1tYVgBizt4DyJT7neMCKVd/stlucapVs
 UwXw==
X-Gm-Message-State: AOAM532wbANKyIXCVoRU0yNhAJGKN5aU6g3ZKp+6sOS5hmaDUHC5u2i0
 YRtep8SBA1PnkD5xdEPkfFkEw+sDSeI=
X-Google-Smtp-Source: ABdhPJztGOeKxR6fnNNS0dOdJU8XovrzUf54l0kqRtCqaiAqopD5FurCWnxob8BH9P7HeU7qyMEmSg==
X-Received: by 2002:a17:906:1e42:b0:6d6:df12:7f8d with SMTP id
 i2-20020a1709061e4200b006d6df127f8dmr10453906ejj.15.1646677005884; 
 Mon, 07 Mar 2022 10:16:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] x86: Fix the 64-byte boundary enumeration for extended
 state
Date: Mon,  7 Mar 2022 19:16:23 +0100
Message-Id: <20220307181633.596898-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

The extended state subleaves (EAX=0Dh, ECX=n, n>1).ECX[1]
indicate whether the extended state component locates
on the next 64-byte boundary following the preceding state
component when the compacted format of an XSAVE area is
used.

Right now, they are all zero because no supported component
needed the bit to be set, but the upcoming AMX feature will
use it.  Fix the subleaves value according to KVM's supported
cpuid.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20220217060434.52460-2-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c         | 1 +
 target/i386/cpu.h         | 6 ++++++
 target/i386/kvm/kvm-cpu.c | 1 +
 3 files changed, 8 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6c7ef1099b..0f3c477dfc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5488,6 +5488,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
                 const ExtSaveArea *esa = &x86_ext_save_areas[count];
                 *eax = esa->size;
                 *ebx = esa->offset;
+                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
             }
         }
         break;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e69ab5dd78..7bd9d58505 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -550,6 +550,11 @@ typedef enum X86Seg {
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
 
+#define ESA_FEATURE_ALIGN64_BIT         1
+
+#define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
+
+
 /* CPUID feature words */
 typedef enum FeatureWord {
     FEAT_1_EDX,         /* CPUID[1].EDX */
@@ -1356,6 +1361,7 @@ QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
     uint32_t offset, size;
+    uint32_t ecx;
 } ExtSaveArea;
 
 #define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index d95028018e..ce27d3b1df 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -104,6 +104,7 @@ static void kvm_cpu_xsave_init(void)
             if (sz != 0) {
                 assert(esa->size == sz);
                 esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
+                esa->ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
             }
         }
     }
-- 
2.34.1



