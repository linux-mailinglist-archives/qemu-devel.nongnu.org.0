Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5D6F2490
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:17:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVw-0006Wv-CW; Sat, 29 Apr 2023 08:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVf-0006HD-LD
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVe-0004wG-5T
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tk04m5HgptbG8YCpVathlHNG/5l9vROJS4WjJ+ft1YY=;
 b=MJq1zpJk/s4hvXmR32Z9lXiKqOIXd6f3X1dUJ+NffPY2O2qkjXWYlhWjtDLE1onqmzKFxd
 rG0fxPTxiirJwtIXin3OAq4AACF5cT2yFgstg9jDlB9mdaUOcnhBiP84Luxn0J18TZDVC4
 ateu3nmy1HGKcbnmUp9h+9z3Yh7j5Iw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-0UlZ9bZzMLShCge4HxXwpQ-1; Sat, 29 Apr 2023 08:16:59 -0400
X-MC-Unique: 0UlZ9bZzMLShCge4HxXwpQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50a14564599so18566830a12.0
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770618; x=1685362618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tk04m5HgptbG8YCpVathlHNG/5l9vROJS4WjJ+ft1YY=;
 b=Yi2OU3/E/2J2zPhBf4XBerxg+W3etDFKF7Q+zr8MQsssFigVuGsxJoHJNuow++dxvS
 4ZjWxnwHE/TToiFr1r7TX6khK+f5OU8vMqYkcCnF+/KOsXBZJDM+v1ciCWbRRr+CDBUL
 2/OVkxEN5wg9DU3BoQ4ksQW+WlFtDlAyQBbUBQvhchjXmsdrfC/3pLew3hTCS85C+o3D
 axeyczLLgg8V4aNiCXQSCtrQ3u/vSZJMDeVzSQIVdtfzYRusDWzLd1FY4fcH30vc0/lB
 OnNfYkTc2BJ8MP31E65D76w3APf2mb0ayYJfr9k1DAKrLuKHXcGlj/C08MtQUpB4CTJU
 D9+g==
X-Gm-Message-State: AC+VfDxc03HmTVqGmaF9XP0znNRKtIbiKO7LBHyIzozPfyn+WBSLOY9f
 5U0jcgiIbpUhlT1h54Eoa4Cp198g73eV9XOLcBVVq1mA4ChnNWIb/OwkiievnLztDo8yC2HX+JZ
 Vh719rMr/8BsCDF6U4uYoN+mlbmtWbCc3/+ETpBrwlbiwMfCER66ay56hc9lq/50ebwGEkrhaJU
 U=
X-Received: by 2002:a17:907:9807:b0:94a:653b:ba41 with SMTP id
 ji7-20020a170907980700b0094a653bba41mr7779332ejc.15.1682770617884; 
 Sat, 29 Apr 2023 05:16:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ53grshhOBo6XUuN+vVQU03SPqil40VY9Z7miWwwtvOjsHL1EsaG84ScddjoV434oW01sHLtw==
X-Received: by 2002:a17:907:9807:b0:94a:653b:ba41 with SMTP id
 ji7-20020a170907980700b0094a653bba41mr7779316ejc.15.1682770617660; 
 Sat, 29 Apr 2023 05:16:57 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a17090694c900b0095354acf666sm12513076ejy.92.2023.04.29.05.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxi Chen <jiaxi.chen@linux.intel.com>, Tao Su <tao1.su@linux.intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PULL 10/17] target/i386: Add support for PREFETCHIT0/1 in CPUID
 enumeration
Date: Sat, 29 Apr 2023 14:16:29 +0200
Message-Id: <20230429121636.230934-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jiaxi Chen <jiaxi.chen@linux.intel.com>

Latest Intel platform Granite Rapids has introduced a new instruction -
PREFETCHIT0/1, which moves code to memory (cache) closer to the
processor depending on specific hints.

The bit definition:
CPUID.(EAX=7,ECX=1):EDX[bit 14]

Add CPUID definition for PREFETCHIT0/1.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Message-Id: <20230303065913.1246327-7-tao1.su@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0204a3ac801a..823320fe420c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -897,7 +897,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, NULL, NULL, NULL,
             "avx-vnni-int8", "avx-ne-convert", NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, "prefetchiti", NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index b46d52f3fa44..8504aaac6807 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -925,6 +925,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EDX_AVX_VNNI_INT8     (1U << 4)
 /* AVX NE CONVERT Instructions */
 #define CPUID_7_1_EDX_AVX_NE_CONVERT    (1U << 5)
+/* PREFETCHIT0/1 Instructions */
+#define CPUID_7_1_EDX_PREFETCHITI       (1U << 14)
 
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
-- 
2.40.0


