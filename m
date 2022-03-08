Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C174D1696
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:48:48 +0100 (CET)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYKe-0003Sj-0l
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7k-0007rh-Ia
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:28 -0500
Received: from [2a00:1450:4864:20::531] (port=38737
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7g-00061b-FD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:26 -0500
Received: by mail-ed1-x531.google.com with SMTP id h13so11903714ede.5
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7sbpjvbdH49qnXY2FpOJVOxJSU0keOkFOijV/ibCMY=;
 b=UwpCjohHYbGqEncIkxb2mGxjPgB3cfwLoPiqVR87V1wJu+nrifjh7WCy/sd8/hZoAa
 L4NCgpNJInCQHQH2ENqIBHtNsYbPwMEuurdq30Q1P+4aXsoVFy/KshzhhfRzUyIhSsh7
 SaGbZ/wAZlzvamJwaxKOfdwTYFWg8juX0/KCT0hW5LIJh5nFxhAm3MMSipgsyaNr1fBx
 FBox/fVY3/FAPgybc4s842f5sG11k1jIUXyzUFuiiZSCwdF2NAog/EwPpacvzdZ00iqb
 GzM/B2OvpSfgYYuVBFIAt1+3Pbg8sBEzhvwns9GO7UO5Q3cHX9gBXfS+ar2w8Gq6CKgv
 QQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A7sbpjvbdH49qnXY2FpOJVOxJSU0keOkFOijV/ibCMY=;
 b=NoNGJS1Qk74XQiOtFcnQzbK/PSSCTwbywWigOsFPb+IUX0OpvFGxWEZ2G4S8BY5bCb
 IdvbPN8MoPGQo5lotHfohprOLMKAIBYb7LmblvxehRyGoBHlK6cRrZtMGbdsoz5GZbft
 A2eTuZQgyk/7TkY+stdCmHysQto2HqcstzoxHiL/NjDM14SMh5U3U/C3FCr80ncale7g
 06slafbH3a/W7Sa9vI2HT4sf1EpZqeIEf2bbREU1kk2YgvM/jwC9L0aRAv1PUrzKXW1y
 1s+j157UkG8zTjMqR4K3GlgraEEsmnotm//ZZ3rXV/+Bb3dGijTI+nOp8hQmy8NaBOsI
 BdqA==
X-Gm-Message-State: AOAM532FZ25GDLOKzj0U5i1Bdk/hJrM3J7HA5Cq5LkaojYrLftQ9rGag
 UMdbM5SR9Hnm/Kn0wu2OwJ/gepRaAzQ=
X-Google-Smtp-Source: ABdhPJwQJxMHYOI+vFNFSiRBHs1bILcaOucwKWbyN+YRkWO2y8iZ7IrZ3IfVQ52ivgywGWEvN+2COw==
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id
 f1-20020a056402194100b00413282209c8mr15703886edz.13.1646739323115; 
 Tue, 08 Mar 2022 03:35:23 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/22] KVM: SVM: always set MSR_AMD64_TSC_RATIO to default value
Date: Tue,  8 Mar 2022 12:34:44 +0100
Message-Id: <20220308113445.859669-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Even when the feature is not supported in guest CPUID,
still set the msr to the default value which will
be the only value KVM will accept in this case

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20220223115824.319821-1-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 916d3354fe..a88d6554c8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5997,9 +5997,7 @@ static void x86_cpu_reset(DeviceState *dev)
 
     x86_cpu_set_sgxlepubkeyhash(env);
 
-    if (env->features[FEAT_SVM] & CPUID_SVM_TSCSCALE) {
-        env->amd_tsc_scale_msr =  MSR_AMD64_TSC_RATIO_DEFAULT;
-    }
+    env->amd_tsc_scale_msr =  MSR_AMD64_TSC_RATIO_DEFAULT;
 
 #endif
 }
-- 
2.35.1



