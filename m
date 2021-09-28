Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74E541AFFD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:25:18 +0200 (CEST)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVD6j-0001W9-Kt
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaG-0006Yc-QX
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:44 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaB-0001TJ-TP
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:42 -0400
Received: by mail-ed1-x52b.google.com with SMTP id v18so47486825edc.11
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VDdHQ7wAYQQjw1FA0X2CemkmylszfW2NxiKOBkxwC/s=;
 b=G2hxwVaYmYTouEficz6IpWTbFODxX2ZeUBLtBZ0OAu5MLHNyKO5npYt31fjltGlLRF
 Jcpfor9gfLTjpPqI4123UHRDV9m2nFL5EQb4im2l5x+SqxH4TY/U6Wsn0EZL0JhnIqEg
 WBXNsEKBlL5PuuLcyNW5vUvpCfEu9bQ0xGDY36i77TZqibYUFAkhgg65WXcqf5kRSCJV
 5HvIVCt2CKoe4sYBP2OqSTN1EEXBFu5ljQq/X5IDfDQGwMrO+aMdcAHO+nzliKsbi0xT
 O8ICwqgjbA3s2B/ocG8+ik4vr6suh29qIwVZKfYhTdQZburyVaAwDN3RBQXza9S0eVFX
 CqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VDdHQ7wAYQQjw1FA0X2CemkmylszfW2NxiKOBkxwC/s=;
 b=oj88hjWLXJ8ccF5fjORnHC5io0TOl1u+Qq3bid2qIXT9DOqGM5kpwtOWiHH0brdQLy
 mOnv71Iq2tFDBpAyWeL/jgoCRpVHwgoJ7D6QdQwRw6ng+jz0UnI15IjnQ8X1HYocF4FY
 qGr9e6jKdUGe/CiUyDdLRokTrcx4DbyKki+PjazP84eQR1gvRogJyC4/8ebeYwtn+Xaj
 tfH0+dmXxzVQXQBQHX9+HaHcbQ+Jxn/rMMdu6w5MDDQjsC7e1jCfEyy6xUMzSGL9R9tU
 1PT31vPAHQ0b1oKgjYraLsSpAcQjuYQGFDNaomhn/BLl4ausIDWszmM4r+Vgt4G2iFej
 bQwg==
X-Gm-Message-State: AOAM531fEXLphymUK4oojuIzQxHd+Dz/ije6ZsQTyKkzHMRzjDWUBuWN
 bqeLXDFBJTc+l/CAvHNC7aRQWCRVK3s=
X-Google-Smtp-Source: ABdhPJwBCVM7VTHic1sYvntuT0gdkm/XHf9RsheMsIR/MVmh3pjsMZXhdN8xWM+rUALMcJ1HkINhMA==
X-Received: by 2002:a05:6402:1841:: with SMTP id
 v1mr7377592edy.170.1632833491401; 
 Tue, 28 Sep 2021 05:51:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/33] Adjust min CPUID level to 0x12 when SGX is enabled
Date: Tue, 28 Sep 2021 14:50:59 +0200
Message-Id: <20210928125116.183620-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
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

SGX capabilities are enumerated through CPUID_0x12.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-16-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index de58599a3d..cacec605bf 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6154,6 +6154,11 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
         if (sev_enabled()) {
             x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);
         }
+
+        /* SGX requires CPUID[0x12] for EPC enumeration */
+        if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
+            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
+        }
     }
 
     /* Set cpuid_*level* based on cpuid_min_*level, if not explicitly set */
-- 
2.31.1



