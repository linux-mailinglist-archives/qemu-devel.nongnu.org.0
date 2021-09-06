Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F356401C4D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:30:17 +0200 (CEST)
Received: from localhost ([::1]:40354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEhU-0004rT-Cn
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPZ-000185-J8
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPY-0007mo-5u
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:45 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q11so9789812wrr.9
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HvVwDW0UEsMND2Epmw+EH1l2m7EcZiok6GeyK4r1PQ=;
 b=gttU3mzvHh+IVH8U0R7ErXogIyCrA7LGGx0Rv4K1QnM1EuUCgVkPQPiJ4UnjVUWdCJ
 wSZM5hm4P5UcE+QqisQXP0N1bhjn3LFjiBUblgHyU6YfQav1UOjcO+YE4dj8Mg/wIAqM
 V1bt3OiLcDt0C8dzhuYoc56r0fTYGejnjjBVR1DEnzom/3ILQvSkJWiP0fb9gdap67ff
 6ftOX7bWl91JJty0/VzyEpU1S3KjdKZ/QSPI/SgzuEGuDLJ/yYoXHl1cojskWPRE+A28
 KH63JT0Xf0O1Zu8CT9uvgMn6YBsNI+mZ3Af94AUGMyvuEpFJfHhleCll6ozfVCfPErbv
 p9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6HvVwDW0UEsMND2Epmw+EH1l2m7EcZiok6GeyK4r1PQ=;
 b=ub9ulorsNugrtmXtB9hV2QMBxgykJzijFWxAxfjgXcYbwhxgInP/gkxV7kg9nug+Q0
 O59wb8trDyAR5WW3UKrvHxHnKY7bS8Sj1T53seV8lXQLOONwNd4hOB7/QRwKrGgJxkgE
 jz1GSNbyQ25pOFAYxpNimfSPam43CfzCoogwMgAnJJwZGA0d0nTloH7Wcv3W2xCgSvTm
 O3gBo+v20vG1UHvqmomNOKzSUI5NPa0BPlFBs9SYNUu7DtKcTWMOTDpxEgxj3Xi9UBOg
 d/nfHcLfK/h2EJmaetQ3Jl6LWqi60eizFec0HLYEauOCe/SF4nZ4qyQNvhV1KQUcj0o9
 e1xA==
X-Gm-Message-State: AOAM532CfMl4BSnPRdukTDH3cy+0V1sE6SFcncSg80nXpHOfYVOFBi7R
 jEbjMGjFiLx2SIFT8DHbxJNEcBsnbyk=
X-Google-Smtp-Source: ABdhPJzQo2EhUwPHLtDbIy6eMZaWq6VAQiZfpact4MqMtudPoCiE8em1RIj75qpVEdsPpPP/vNzHgg==
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr13174844wrq.212.1630933902811; 
 Mon, 06 Sep 2021 06:11:42 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/36] hw/i386/fw_cfg: Set SGX bits in feature control fw_cfg
 accordingly
Date: Mon,  6 Sep 2021 15:10:47 +0200
Message-Id: <20210906131059.55234-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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



