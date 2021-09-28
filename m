Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D034341AFB8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:15:19 +0200 (CEST)
Received: from localhost ([::1]:51418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCx4-00042F-Oh
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaC-0006Uo-6o
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:40 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa6-0001Q4-II
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id v10so78451380edj.10
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HvVwDW0UEsMND2Epmw+EH1l2m7EcZiok6GeyK4r1PQ=;
 b=qRhNf5AkSiMLm3G+eCy2k5t8N9duo3ALrxMhGLyWhlawhd/iIe42WxWezWkSjQD3xK
 pmXyz7wBNa7m925hiSHMzCHmYnDgKKTNAUpfn3UX3FSLzdawyEoqGslV1LrQ69fU3kq7
 k9tCoT5GRfty2ai7gEMAW/NmKxIYmSsSfl3ZPpSVovVpzY0/f1RtQKGjijv5uz0W8iAu
 mF77ol53UIiKb2ikynvrwe2ZLLPvB9ETdpPbSsNdFms+qFwXTDR9GcnZMB+9JUXbl/zo
 iGTGjT+TZ3UJlVXCDV06Ci2qGFu4odZ0xmHcRe3MNNyDvYCKt1JrPixyArzAYZMfQZLp
 k0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6HvVwDW0UEsMND2Epmw+EH1l2m7EcZiok6GeyK4r1PQ=;
 b=MrCOEFiP64anbspHc2WGM9z4IXHcds1ZqqmL11zgN9pdxY2OEpckQ4tMMv+jqZ+8hN
 A1O6foH0MtSV2V7JnwMVc2ubBtgKMTHSCKAZlbjZ1Bafim/wUowJ+seyN9n1RdQjSNUB
 3VCEKjSly5k8eyG5Vc+3tGh+asmrnvXxJNtJZxGOqsooKHpfZNOPPiCA3yNmhf7x03i0
 I8hqt0YXCFXdzXoXxbwHNWNpZDyAAllLcgRCl2Xc6YRB72wmtWSCBc9trgbvGYPWUfgl
 qHfcYhyT/sINnbj/wEDWcxGtQwK+YJhuR6SyudyhmXlnjpvnLX2wMFxondJzlHDrFbcX
 JcZg==
X-Gm-Message-State: AOAM531lB58wF1itIqn4UabMV2C29swrl/gWKZ80g5Xf7SQXus9LRSpA
 Y0UO0utawOXmg2M1e2XMA5J4PA7yNyc=
X-Google-Smtp-Source: ABdhPJzNC9dCKoDE0OP8z4fO2kSGl69ROSlG+0s4zK6CJx60qzG6p+5Y6s/2VMr4DKgJeh5LCrXRkQ==
X-Received: by 2002:a17:907:7601:: with SMTP id
 jx1mr6485896ejc.69.1632833492136; 
 Tue, 28 Sep 2021 05:51:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/33] hw/i386/fw_cfg: Set SGX bits in feature control fw_cfg
 accordingly
Date: Tue, 28 Sep 2021 14:51:00 +0200
Message-Id: <20210928125116.183620-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Request SGX an SGX Launch Control to be enabled in FEATURE_CONTROL
when the features are exposed to the guest. Our design is the SGX
Launch Control bit will be unconditionally set in FEATURE_CONTROL,
which is unlike host bios.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-17-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/fw_cfg.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index 4e68d5dea4..f6d036dfbe 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -159,7 +159,7 @@ void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg)
 {
     X86CPU *cpu = X86_CPU(ms->possible_cpus->cpus[0].cpu);
     CPUX86State *env = &cpu->env;
-    uint32_t unused, ecx, edx;
+    uint32_t unused, ebx, ecx, edx;
     uint64_t feature_control_bits = 0;
     uint64_t *val;
 
@@ -174,6 +174,14 @@ void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg)
         feature_control_bits |= FEATURE_CONTROL_LMCE;
     }
 
+    cpu_x86_cpuid(env, 0x7, 0, &unused, &ebx, &ecx, &unused);
+    if (ebx & CPUID_7_0_EBX_SGX) {
+        feature_control_bits |= FEATURE_CONTROL_SGX;
+    }
+    if (ecx & CPUID_7_0_ECX_SGX_LC) {
+        feature_control_bits |= FEATURE_CONTROL_SGX_LC;
+    }
+
     if (!feature_control_bits) {
         return;
     }
-- 
2.31.1



