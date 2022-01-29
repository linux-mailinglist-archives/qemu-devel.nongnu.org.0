Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E2B4A2D9E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 11:26:00 +0100 (CET)
Received: from localhost ([::1]:44016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDkvf-0007bL-AM
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 05:25:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nDkuJ-0006Q9-3a
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 05:24:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nDkuG-0007bm-BF
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 05:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643451871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W0biUixU6ufiYQTueeS7pBPYD6cD6Z+SqSJWF9fP/uc=;
 b=DepBRn3xow0tf+kez63+UC+tWe1mperbq4sv6vIHGced2i2cNpYFrjkAGlgcyc+97GdG5a
 ztIrerq5nuZdcFlD4h+398/Dw/DFv9eqXgm6M3Yd2xSMgeZ4A+74Rz7r4FJCWnNjmNV3yV
 PDMWld0nXJJ2z69uTdNlx8SKwVIzUVw=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-fuJxmazVOpe69yriIbdYZA-1; Sat, 29 Jan 2022 05:24:28 -0500
X-MC-Unique: fuJxmazVOpe69yriIbdYZA-1
Received: by mail-ua1-f69.google.com with SMTP id
 e22-20020ab031d6000000b0030525c25702so4602011uan.6
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 02:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0biUixU6ufiYQTueeS7pBPYD6cD6Z+SqSJWF9fP/uc=;
 b=DU+qzpJSPVXE7M6NgoF0uD8mXy596CgaBfIyU0lke046OLetidCtCHoWz6z7jiuvGr
 UiFaqCJkfBVttssab8Z+P+6NjdbudAr/SRGI26ZiXZJEE8q6UBLDwll2BHIXjl3ctxQs
 wQPo/1C5t/p8KMSE/XMLTYmhOT5GjrbrndFD9TWbd6ppRaGDOyi71lytAJR8z7GYs+IV
 fv7d9yVgmBhVLQ39tsdWidFz87G3jZKViNdIYnriwzHVt0pyVU9Rp6lPFOrXHABNEWlQ
 1NXkSLRoKRakmvixKj3hL2T22nm9RfWjv/qCgi7pbkobS6XA1pMfghUEdEPu1BJiA0Y8
 MceQ==
X-Gm-Message-State: AOAM532dCi86k/LwElVcg8LkaxTc6QcUoZ0lbuDDzwIB6LyFkvLQ0Fpu
 a35O8Chl2rieOslU8lsQeW2EyEia90XnHFLSZ2/hs5EWSacE7EERTXl9MjYm6DtkN7t2K7icZ4M
 tbaX3KKx56yWiZJ0=
X-Received: by 2002:ab0:49a9:: with SMTP id e38mr5423455uad.8.1643451867637;
 Sat, 29 Jan 2022 02:24:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzG3c8QDkyguAYHtyIAlCEtu0cPTxxyd2+9lZIz2viekHkNyUDR9kGlTdZiYti7AaJ7bUIHuw==
X-Received: by 2002:ab0:49a9:: with SMTP id e38mr5423442uad.8.1643451867420;
 Sat, 29 Jan 2022 02:24:27 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:95e9:6da1:67bd:fdc3:e12e])
 by smtp.gmail.com with ESMTPSA id v201sm2363565vkv.54.2022.01.29.02.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 02:24:26 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yang Zhong <yang.zhong@intel.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
Date: Sat, 29 Jan 2022 07:23:37 -0300
Message-Id: <20220129102336.387460-1-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While trying to bring a VM with EPYC-Milan cpu on a host with
EPYC-Milan cpu (EPYC 7313), the following warning can be seen:

qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EBX.erms [bit 9]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EDX.fsrm [bit 4]

Even with this warning, the host goes up.

Then, grep'ing cpuid output on both guest and host, outputs:

extended feature flags (7):
      enhanced REP MOVSB/STOSB                 = false
      fast short REP MOV                       = false
      (simple synth)  = AMD EPYC (3rd Gen) (Milan B1) [Zen 3], 7nm
   brand = "AMD EPYC 7313 16-Core Processor               "

This means that for the same -cpu model (EPYC-Milan), the vcpu may or may
not have the above feature bits set, which is usually not a good idea for
live migration:
Migrating from a host with these features to a host without them can
be troublesome for the guest.

Remove the "optional" features (erms, fsrm) from Epyc-Milan, in order to
avoid possible after-migration guest issues.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---

Does this make sense? Or maybe I am missing something here.

Having a kvm guest running with a feature bit, while the host
does not support it seems to cause a possible break the guest.


 target/i386/cpu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e636800..a4bbd38ed0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4160,12 +4160,9 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
             CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |
             CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT |
-            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_ERMS |
-            CPUID_7_0_EBX_INVPCID,
+            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_INVPCID,
         .features[FEAT_7_0_ECX] =
             CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_PKU,
-        .features[FEAT_7_0_EDX] =
-            CPUID_7_0_EDX_FSRM,
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
             CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES,
-- 
2.34.1


