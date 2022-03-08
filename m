Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF74D16B4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:55:22 +0100 (CET)
Received: from localhost ([::1]:45388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYQz-0004QK-Rn
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:55:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7g-0007pV-IH
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:26 -0500
Received: from [2a00:1450:4864:20::631] (port=38829
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7a-0005zs-Ld
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:21 -0500
Received: by mail-ej1-x631.google.com with SMTP id r13so38568131ejd.5
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7TWk9SqY2ylsd58gfzay36BekA31rTVa3Rhyz0PPW0=;
 b=deGDBmyUi9jc8h+pK6xGele3caUHxv+FOhaF5iR/eHy/zpGsKLPIiWqHJnSYXmwIbd
 4ixz3ufGfoeKwcbFJEskwGixeoaWlWZ01iqofdwi5i2iYIVKA2YcEcwx18Yj5jGmsf1k
 1QI0Ehfki35q4+yJsaX2ouVskZMwStm0MGnV2rHo4rXfIxytUFmIFM2PtKuRZM9p2dCu
 GeiWi2lBMGhjIHtoH699xMN/gN4v2qUBIuCNHPsWdh+B0XWEYjMITZcML5yw50IYWGFL
 UTDsRlqDgJLnNlX+z+TOUKAvZAL/WAg1WwHfdHC6CYPh+n2OMvfV5lQBxdp/TGgFuPPi
 lRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Z7TWk9SqY2ylsd58gfzay36BekA31rTVa3Rhyz0PPW0=;
 b=gLHz3WlfCrGwpun4r3qSwtuZYNqb4rFM3Y0savktcIJ8L/deYxZZf1gSTAaLcfmhbw
 Do3X2M4cxgePEODvKybI0Ek2hmvtHQOxSbTzoqjk/y5jrMQts8Rz7U4/bpZYO8jkovm4
 /UcMHVxtWPi3jvlLSQMGsLyXVHTuu/79o5Vwu7E7HBaDKtA/Nhl4Ztj0LGZxg3+vVlwD
 lfQ3WGq0oZjDfLgz5PLip2RPVGF221kEqoYMAScHOlvqHdBswyONJyPPS1wwDiyv/CTK
 uXUr3dnUiJg1y629AU2a1iNOg0C/Sl30FbH/dum0EXwCtBwjHTpC+BKUNanx5jP2Fdum
 4K3w==
X-Gm-Message-State: AOAM5301C3+dul3UHyPAi9kleiMMfd4TZtznn7oK+ZcW83OnbPD8Gawv
 m6d5yuIEEBzj3/KHAPF5mgvQ4T1Dar8=
X-Google-Smtp-Source: ABdhPJxywurdsw20RHa1TgamxEWxA+oczWnjqFed2lPLASS+RKAN6juDVeb/PgjCPWta2uhNWQhMRw==
X-Received: by 2002:a17:907:72c1:b0:6da:be5e:dc98 with SMTP id
 du1-20020a17090772c100b006dabe5edc98mr12858330ejc.283.1646739310651; 
 Tue, 08 Mar 2022 03:35:10 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/22] x86: Fix the 64-byte boundary enumeration for extended
 state
Date: Tue,  8 Mar 2022 12:34:36 +0100
Message-Id: <20220308113445.859669-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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
2.35.1



