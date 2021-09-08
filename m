Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566A40379B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:12:11 +0200 (CEST)
Received: from localhost ([::1]:39698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuYs-0003xH-CK
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRv-0006mo-OS
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:56218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRq-00033m-Sg
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:59 -0400
Received: by mail-wm1-x335.google.com with SMTP id g74so1261128wmg.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOb4IPvQ1urvg2WoCHadP1b4B/KHW5IQqVRTE+ZK8/Y=;
 b=Tepe+3ZBAMhBj/Ivrpe9PNMt1xQBNiAU4R9U/ImCr9henBC3EeHgRs36rjwVvSinU8
 Bi0+n2wz2ntEuCeT1WKDe1ftty0SiIORJ6Un6F8rjaBb9a0eTrpXNo5N4/A75Xffu4b2
 0FouJ/dG2V4mo90VL6iff9QA8BUS0u048vf9njK4q272jbjsP07UxICjIq9ah7YXJcCZ
 kBZkMtNFliYNUCbFw6Naa0x8xIIguBsI2gund5EZJ7Ty8B6suAon8IDF97m/j3Uz0zqa
 xZSnl7XEYm5h+XWGVQv0gcCOWt55dF//ZgNYxsDM9Uea8h8Gf1E6I2bqYb+L9FPPqhWU
 4xzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KOb4IPvQ1urvg2WoCHadP1b4B/KHW5IQqVRTE+ZK8/Y=;
 b=pXT+zRQB9yzI1TpX7xXJYwhQ0ouHLWoFpI2hF1wFwQLnD/1+Rab0wvSnX3RNTH+Kqb
 fvhEbzaxNerKVmuEHB/Tl16wJucmB9maavlRpXuP1/6hq/UMuw2cpKWHsdzFykagSeoo
 MrmcXQ4XpS9LgV/yt4H+jTnYmapFTsV9dxVFFWtbK2Gok4xXgAFY+pbMFKHGOz5BnbSH
 gxrjVLz0yZ/V74dGRqI1hi0iamoOlWeXNDFNpAsQMH1ykuRy3U49IdmL+BmncMUrRBoj
 SA96FH/1nwqkjmn8OqokrI9hXzLbWdF6AQgF63dgc5IcLPnHc/C0WokXUGliA8LmtmE+
 TVnQ==
X-Gm-Message-State: AOAM533xohh7lcJsLpaa9wfBE4+T9BlYMyw1b1wo7lN9ofis6YvDBqkz
 WvuwqdMiYLfk70chUAJTR3VfNEoTJ14=
X-Google-Smtp-Source: ABdhPJy1EjUuOIXj8VTU/shjSDvxTfAtS13+w+Fcx6koDzbDds/qbfBiEshUUpq+ge6AxpsaBVGZAA==
X-Received: by 2002:a05:600c:2f90:: with SMTP id
 t16mr2674286wmn.136.1631095492394; 
 Wed, 08 Sep 2021 03:04:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 23/43] i386: Propagate SGX CPUID sub-leafs to KVM
Date: Wed,  8 Sep 2021 12:04:06 +0200
Message-Id: <20210908100426.264356-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

The SGX sub-leafs are enumerated at CPUID 0x12.  Indices 0 and 1 are
always present when SGX is supported, and enumerate SGX features and
capabilities.  Indices >=2 are directly correlated with the platform's
EPC sections.  Because the number of EPC sections is dynamic and user
defined, the number of SGX sub-leafs is "NULL" terminated.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-15-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 488926a95f..f6bbf33bc1 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1703,6 +1703,25 @@ int kvm_arch_init_vcpu(CPUState *cs)
             }
             break;
         case 0x7:
+        case 0x12:
+            for (j = 0; ; j++) {
+                c->function = i;
+                c->flags = KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+                c->index = j;
+                cpu_x86_cpuid(env, i, j, &c->eax, &c->ebx, &c->ecx, &c->edx);
+
+                if (j > 1 && (c->eax & 0xf) != 1) {
+                    break;
+                }
+
+                if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
+                    fprintf(stderr, "cpuid_data is full, no space for "
+                                "cpuid(eax:0x12,ecx:0x%x)\n", j);
+                    abort();
+                }
+                c = &cpuid_data.entries[cpuid_i++];
+            }
+            break;
         case 0x14: {
             uint32_t times;
 
-- 
2.31.1



