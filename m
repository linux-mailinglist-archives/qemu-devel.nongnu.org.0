Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9AF403791
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:09:51 +0200 (CEST)
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuWc-0006fd-KT
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRt-0006i9-IJ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:57 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRq-00034m-Pi
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:57 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1071603wmi.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwjqCRXQx9MlfSnrV5qD4bpa9qVZzm/hjGfrBWyX5Yo=;
 b=Qpoxbwikarak01B9E9s5kBIDsoVc+PEr8MDb3gaF2tLF/ibIBwJ0kNGcHkgqHaOk0s
 +BfLgRaNSwqqd/0FUzDKO8ogXNu+1oCkDh5uS/PCzTxf+gjTLYFLhsiXjXaem61IsoLz
 WehHM55s9K3jrSRU+wfhSgfNJiCr3YYXUDDXu6GN6rNXg8o20E43Suz18pVpDdC2Lg5q
 HGgV5uTnt8V1d+0Zu6QZFjz7UvRiomljaS/xfHrXRO3MLscAsgYRYi75jBW/miCuRwnI
 LsyjGs5B0ttfZ4WxDekQU2LunDUSxhrSZKJIOIvU7QGF+lrnGL9mraSZLf3+1MWFiSNt
 SECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JwjqCRXQx9MlfSnrV5qD4bpa9qVZzm/hjGfrBWyX5Yo=;
 b=EmhQderwPh4ae1vXAKANlYKZiM9Nkxem2pRk4gOQcLsUEmyDy3twI7JSrUHWoDzial
 kurEIzGDeX/hwTuYKePN1joFWp7CRJIb8I5xo/WV/CDKx9H9RB0dN5jqqf9AuWKjc63s
 hm5jzCFJ7QegjrMz3HXX/cEZEyQB040Xd6waTo/Jrfv0UBm9hdl5CQje+mHMoRK8HBJx
 S84X1diX36i3zGOmKnXegw1kroGWZrj8olw2ULSVyEQh5nCgIajHBor7/SV385KfVEF1
 kvrddtO3xUkCVAmqyr+HgR1xSN4DDtpDaaqfN8zA/8GGzOpHhcKBJvRpBH4iEgVNpz2Z
 vPDA==
X-Gm-Message-State: AOAM532Td5EeEyXCDMzRD66/jHqpAGLVUx1L1Csu0a9va5ckvf4EwROn
 n/Vkql0zbwPAOpV9h3d0aRcbFz3kmFw=
X-Google-Smtp-Source: ABdhPJx44nsPEfU+w897ToMcsWaUueCyRBnuhk2keLhv9c4/M2lE35C4pZ6gcmjlKVev8m/Q91Rn2A==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr2288752wmc.19.1631095493397;
 Wed, 08 Sep 2021 03:04:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 24/43] Adjust min CPUID level to 0x12 when SGX is enabled
Date: Wed,  8 Sep 2021 12:04:07 +0200
Message-Id: <20210908100426.264356-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
index 3b1f9cbdf6..2774550501 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6153,6 +6153,11 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
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



