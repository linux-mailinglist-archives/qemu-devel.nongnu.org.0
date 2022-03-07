Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE8D4D069D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:33:41 +0100 (CET)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIAu-00047A-N8
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHul-0001II-M1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:59 -0500
Received: from [2a00:1450:4864:20::633] (port=46894
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuf-0005OY-SI
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:59 -0500
Received: by mail-ej1-x633.google.com with SMTP id qx21so33792534ejb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vbENdtqNo7P6LUkUy9opFFE8Xsb+w0xvUOKfrIByXG0=;
 b=oYM4OFgVuyvqCaD8iwmVmYNwwSmbms2RD4Eq8AWdOve95q7JhzE5ifYau1qDxdy1ej
 V1cOIegbyuEXV8YRtk1Wq+4stxXggmHvnNfdNhLowQ7Pgw1/C+Cp1ZFOSdVd7MU4UHS1
 ew24Tk0DH1dehQOBfCW2xS/GoHXO54SsBQI/yB1/+GfCkEtFfiJWj7qjRXyhJ6FN51t0
 sFTmZqclAVtI1Bq8uGzjTQ7c1+xEky83lu/huC/CB7LPdtSBxhmVos4NR8I8vdINfk/B
 E8Dvc6WKu8WNWtmW+XLacb6UalQzx8t8bL6fZoMQTs0HchihVXP+nyMApR5JLSzJVC7e
 libQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vbENdtqNo7P6LUkUy9opFFE8Xsb+w0xvUOKfrIByXG0=;
 b=I1HnYCKCOAt2JYJNbwsP9ZQ7Krz2neIN3Um7j/gLC44Qn05cX3kko/u+vPFYqNY3GJ
 kaBH84rFkPOmZjQlbLt7Ko1pdOkOtKYTYA5odBsDMTR/vvjfsygrrQyrEBqQzl26G+Of
 lC2eEPJpW9XMDLlvcdk+2bdjCQmyyrgO/zCE7qT5lQnVjwC6a/oIsPDZc6Fu03bYwVZd
 pldML+8Al3FDlyHnuJLrHBmey58lTG7JvlHilupmiBtGrWgwPnXEAtaXGuSuvFbG2zxL
 sm/63+kgHnrEaevjX6jUgUB4iBo0k9rWOtK5mifE/Ll9iEdLcEuAtnMGZV1MjA/bkEeH
 6LIA==
X-Gm-Message-State: AOAM533x8M4ADxpohBCafn6L8KS09JrnvpTwcyRInM+C+DFlgz5yyn10
 7zX/8yQ+LNAQdMxmDAByIojI+MGFQHA=
X-Google-Smtp-Source: ABdhPJwq0ys+qnMwy5y/DftGa5hdsCclsri41DAxZS6JKSlajiiDAjgvn/itjt5/t4sX/5mLHHCqwQ==
X-Received: by 2002:a17:907:c16:b0:6da:7d72:1357 with SMTP id
 ga22-20020a1709070c1600b006da7d721357mr9985820ejc.251.1646677012657; 
 Mon, 07 Mar 2022 10:16:52 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] KVM: SVM: always set MSR_AMD64_TSC_RATIO to default value
Date: Mon,  7 Mar 2022 19:16:31 +0100
Message-Id: <20220307181633.596898-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
2.34.1



