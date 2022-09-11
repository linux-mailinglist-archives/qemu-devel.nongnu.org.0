Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38FB5B5205
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:42:27 +0200 (CEST)
Received: from localhost ([::1]:49940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWao-00058J-Sr
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1g-0001pd-Th
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1f-0007PZ-Ad
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+eX1od6QHLDlQzvBK0qDAVBO4mDaRubV0sfXxiBQC28=;
 b=Weyugi0iDpXiPDbn8G2TKP0J0sKOVv0vWeI4lY8xCCAR8ho5Ua7gvw+C6CO6l1MEJzbVdV
 JzJdbXow0K9qOglnyYQf0xK0TPB9mInuc80qyAFuRQiofaSevLw1dLCvHIg/gs3mgaoZ+T
 AtRaFbnAetkicNLyZTn8/QlyoeHjVBM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-133-lQ4n4CRBN8-ElAZff20Ybw-1; Sun, 11 Sep 2022 19:06:00 -0400
X-MC-Unique: lQ4n4CRBN8-ElAZff20Ybw-1
Received: by mail-ed1-f69.google.com with SMTP id
 q18-20020a056402519200b0043dd2ff50feso4948145edd.9
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+eX1od6QHLDlQzvBK0qDAVBO4mDaRubV0sfXxiBQC28=;
 b=pMmi2ZlmlmVdqdwJnUbPa+shpcWl0qvP88O0rlESQO+okfj/+YQ2vEa0DRfxcUhw4c
 Z7BSmzRALNlxMBDiVSnOFiBnVjbY41fL67DEEnfzj6Tfzj0UV39EamgaTJrIa4bDs4U5
 OG3Wo9cT1D6sMi9skf/N6uexVAbGYGr0/o8kvf8E8uB2Osz8XF6UcpFMw10s5plSKcaf
 U9dfpbYRJUnV4dBpnGql+i5i0MbESAFSKgH1iSLCPoUnrz6kSv4ywC8rEWH0W10KcbRX
 wlDct+e89OolIWx0/x111acW3Iyg2ManyKD2l3pks28N1W6cCy3XelfMvbSNrutJtWVn
 Xt8Q==
X-Gm-Message-State: ACgBeo06MGDWn+5K9f2Mtch4RWAh6j3addksg3rv48F3m712BMB/d7AD
 g4hmcV4KwQqfR5kXP7wlmXdx90RTeH60PgUKZ+CcVsKBPhMYn/djeGigBOr2MAPkd/ATpoLcQQi
 hK5FerOzBJKYKqusSUxsF4zn2HZGAfoIrP/0G+IPj1XCbRwoPyzi8sZRb3KT8zw9808k=
X-Received: by 2002:a05:6402:1f01:b0:445:fbe8:4b2e with SMTP id
 b1-20020a0564021f0100b00445fbe84b2emr19935305edb.192.1662937559522; 
 Sun, 11 Sep 2022 16:05:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4JO0mmaS//QZL+irlnleywbmMmPBh9numh3N+T6GkibpfKgVAs+TkQuGDBQX0TqjeeqgTG5Q==
X-Received: by 2002:a05:6402:1f01:b0:445:fbe8:4b2e with SMTP id
 b1-20020a0564021f0100b00445fbe84b2emr19935292edb.192.1662937559240; 
 Sun, 11 Sep 2022 16:05:59 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a056402170700b0044e7f40c48esm4665525edu.62.2022.09.11.16.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>
Subject: [PATCH 33/37] target/i386: Enable AVX cpuid bits when using TCG
Date: Mon, 12 Sep 2022 01:04:13 +0200
Message-Id: <20220911230418.340941-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paul Brook <paul@nowt.org>

Include AVX, AVX2 and VAES in the guest cpuid features supported by TCG.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-40-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1db1278a59..ec0817a61d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -625,12 +625,12 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_EXT_SSE41 | CPUID_EXT_SSE42 | CPUID_EXT_POPCNT | \
           CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
           CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
-          CPUID_EXT_RDRAND)
+          CPUID_EXT_RDRAND | CPUID_EXT_AVX)
           /* missing:
           CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
           CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID, CPUID_EXT_FMA,
           CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
-          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER, CPUID_EXT_AVX,
+          CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER,
           CPUID_EXT_F16C */
 
 #ifdef TARGET_X86_64
@@ -653,14 +653,14 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ADX | \
           CPUID_7_0_EBX_PCOMMIT | CPUID_7_0_EBX_CLFLUSHOPT |            \
           CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_MPX | CPUID_7_0_EBX_FSGSBASE | \
-          CPUID_7_0_EBX_ERMS)
+          CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_AVX2)
           /* missing:
-          CPUID_7_0_EBX_HLE, CPUID_7_0_EBX_AVX2,
+          CPUID_7_0_EBX_HLE
           CPUID_7_0_EBX_INVPCID, CPUID_7_0_EBX_RTM,
           CPUID_7_0_EBX_RDSEED */
 #define TCG_7_0_ECX_FEATURES (CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_PKU | \
           /* CPUID_7_0_ECX_OSPKE is dynamic */ \
-          CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS)
+          CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS | CPUID_7_0_ECX_VAES)
 #define TCG_7_0_EDX_FEATURES 0
 #define TCG_7_1_EAX_FEATURES 0
 #define TCG_APM_FEATURES 0
-- 
2.37.2



