Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA5A6F249E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVY-0006Df-I7; Sat, 29 Apr 2023 08:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVX-0006Cg-9t
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVV-0004th-Pb
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wWEBPtqtcK7SRP2OJS9qr7tuHGua11ptsOCd1VxR/f4=;
 b=O0WnkoiN0cE+2CSsBrHGmNbX1RfbVwk2biuWZHgRLlKZoDQhZHGfDXlKG3pTPwSjDFL1mP
 ciCBl8dp2yOXpekKejE6maa/46TmJtsZyI28pD0B1BAZ0EEoGGF/sb0jRCumTT1YehP0GR
 aqvn3rOBtLhkifq4VUlbXv/p5GmIFYo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-xlZYvx6jOpyWkN6wluOqsg-1; Sat, 29 Apr 2023 08:16:51 -0400
X-MC-Unique: xlZYvx6jOpyWkN6wluOqsg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5067ce9bf7bso840373a12.2
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770610; x=1685362610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWEBPtqtcK7SRP2OJS9qr7tuHGua11ptsOCd1VxR/f4=;
 b=FyunZA8qanymRYbENV6DkN8vUsDISZ6d5oXY4z/0hzOxn2QDeMklwRtEVVZPD22j+P
 98+3avHFx3ImaIsyef813rtr+Aj98bufYBTiNg0kDtOHVjVOn9YvkiYOwGy5gaUepoqV
 3KYPnC+o5i6zoX8LykISuJJo868lepVI1IWkvz9AFaCno6bMdzxJNScOIUrNC8ItSJgE
 KlUJqGS09dJuNoDukbnpwM2fJy5g7stg2HCzWVsOFnMicl1/nhfdcWOL1hh+ZYqhlQT5
 Ek8WVEX1wP+sTaRRAaeM4eSv/E78g5Dqt9QdlqQofSsv90ouC0fQiUYoR50HZv68FI2T
 AGHA==
X-Gm-Message-State: AC+VfDzzgfhFwhVet3mR9CKjKNimOYfEcD/ZTKkYecUbgDtm0yY1npRp
 nXki33VZrNzL27lB2mR2Sw7IWCto2BsqVGbMt9hjZ0amuLByJVhIRgJ70qffTus/qWMk4atqRt9
 3LuRP4HhTIlqgSJfoeEqtb+rKiUC2qFMXldU4jKiIy91QD/C9CXRtUeV39UmNhSrnWNo+IQC575
 w=
X-Received: by 2002:a05:6402:2029:b0:506:a7a4:88a9 with SMTP id
 ay9-20020a056402202900b00506a7a488a9mr1603861edb.4.1682770610114; 
 Sat, 29 Apr 2023 05:16:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Ik6CI4Blhg0HRMSL11zSFkUtlsyiG9w7WURkra0EKAg0oeDHcUG5O7rJr4M1sE0+TybYtrQ==
X-Received: by 2002:a05:6402:2029:b0:506:a7a4:88a9 with SMTP id
 ay9-20020a056402202900b00506a7a488a9mr1603844edb.4.1682770609865; 
 Sat, 29 Apr 2023 05:16:49 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bc28-20020a056402205c00b00506c3c0d393sm10283619edb.78.2023.04.29.05.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxi Chen <jiaxi.chen@linux.intel.com>, Tao Su <tao1.su@linux.intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Subject: [PULL 06/17] target/i386: Add support for AMX-FP16 in CPUID
 enumeration
Date: Sat, 29 Apr 2023 14:16:25 +0200
Message-Id: <20230429121636.230934-7-pbonzini@redhat.com>
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
AMX-FP16, which performs dot-products of two FP16 tiles and accumulates
the results into a packed single precision tile. AMX-FP16 adds FP16
capability and allows a FP16 GPU trained model to run faster without
loss of accuracy or added SW overhead.

The bit definition:
CPUID.(EAX=7,ECX=1):EAX[bit 21]

Add CPUID definition for AMX-FP16.

Signed-off-by: Jiaxi Chen <jiaxi.chen@linux.intel.com>
Signed-off-by: Tao Su <tao1.su@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Message-Id: <20230303065913.1246327-3-tao1.su@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 target/i386/cpu.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 67210ffd79b9..841c407d6d76 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -879,7 +879,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, NULL, "fzrm", "fsrs",
             "fsrc", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, "amx-fp16", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
         },
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d5843c15558f..7deb37eca5a8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -915,6 +915,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_1_EAX_FSRS              (1U << 11)
 /* Fast Short REP CMPS/SCAS */
 #define CPUID_7_1_EAX_FSRC              (1U << 12)
+/* Support Tile Computational Operations on FP16 Numbers */
+#define CPUID_7_1_EAX_AMX_FP16          (1U << 21)
 
 /* XFD Extend Feature Disabled */
 #define CPUID_D_1_EAX_XFD               (1U << 4)
-- 
2.40.0


