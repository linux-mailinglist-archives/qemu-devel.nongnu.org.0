Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE66A3F4A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:14:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWaVu-00059v-F8; Mon, 27 Feb 2023 05:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWaVs-00059O-LR
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:13:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWaVr-0000wM-7h
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677492822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2pyNNn+mCgyFvwhe2uyi4DpSobemHAZsOgHbvBT/e34=;
 b=BYw4rmv1+v5Ur3f0xf3kVrRdnbLAMFF8hJckzJ11R0vGOYo6phXLEGl2RVb8vY10wUYqR0
 nIE5x9Pk2nWEcVb9r0V+DlASdp9vEWEq2bV69zjS4g0X646tWaOaLQQxcg6PX6cOy3E5bq
 t3Vp6z/vlHvPmZJeHdBFwxZoMAkaOzE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-smOiXJKHMtCXfY3FcBkkiA-1; Mon, 27 Feb 2023 05:13:40 -0500
X-MC-Unique: smOiXJKHMtCXfY3FcBkkiA-1
Received: by mail-ed1-f69.google.com with SMTP id
 h13-20020a0564020e8d00b004a26ef05c34so7818303eda.16
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 02:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2pyNNn+mCgyFvwhe2uyi4DpSobemHAZsOgHbvBT/e34=;
 b=oaqNt54FUykxNQZn9vrwL1e9r+qn/LRt3d5L6HVlXZPNeSxnLnp7zNU5VqZgxeoLVc
 yh4evgLABHfr2Gr0I5aXSrCFnp5bcGj7sz7zxfvcvVdK4o9Ds6BgEdZKWQFg2L+78mKO
 FuJIJMioZS7AlhHiCTB2d+oNEH5m4DJjB3gTduOBtqI4uZdK+xRVIdFDvBHplBl+6X32
 J7X+AHsT1R4Y0XC5KMiphPUO8V2RYTMlHqlJo83PBfBzXcv3SJg9OOW0uT0HOR2lgshY
 fcj9yZsMKvabePI75yIufvNJuSjKOJkjWfS4MDwwOKZlxO03A4ptODOuMel2f+kOB83q
 dc4Q==
X-Gm-Message-State: AO0yUKX050q06799UMUNZ2kj2moIBBYokPV3XCV07QZRrRhI/nIHtgzr
 NoZpuQur9MOeGmwKqSnh9oyHQEpyApBL+Ldbd8kMrKmVh5J8TankwFD8V0wz+vwaO8tu9/afdsC
 AcaEACS4NeymiKdxDuAAMhMal7RhEMjFjomfCNZfQt93qKd8ss8PvadhF7PZLz/0QkK3MvftL
X-Received: by 2002:a17:906:b84c:b0:878:7c18:8fd9 with SMTP id
 ga12-20020a170906b84c00b008787c188fd9mr32069904ejb.44.1677492819538; 
 Mon, 27 Feb 2023 02:13:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+F7RorfYYtijxyjXBmGDALwvz8xPuqgtd+0N+InkAO2p7I4l13TMwmWnkAUM9RKV4sht9y4A==
X-Received: by 2002:a17:906:b84c:b0:878:7c18:8fd9 with SMTP id
 ga12-20020a170906b84c00b008787c188fd9mr32069883ejb.44.1677492819179; 
 Mon, 27 Feb 2023 02:13:39 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a1709064b0400b008e125ee7be4sm3039514eju.176.2023.02.27.02.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 02:13:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, xiaoyao.li@intel.com,
 chenyi.qiang@intel.com
Subject: [PATCH v4 1/4] target/i386: add FSRM to TCG
Date: Mon, 27 Feb 2023 11:13:28 +0100
Message-Id: <20230227101332.636203-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227101332.636203-1-pbonzini@redhat.com>
References: <20230227101332.636203-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Fast short REP MOVS can be added to TCG, since a trivial translation
of string operation is a good option for short lengths.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4d2b8d0444df..34e2cead870e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -661,7 +661,7 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
 #define TCG_7_0_ECX_FEATURES (CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_PKU | \
           /* CPUID_7_0_ECX_OSPKE is dynamic */ \
           CPUID_7_0_ECX_LA57 | CPUID_7_0_ECX_PKS | CPUID_7_0_ECX_VAES)
-#define TCG_7_0_EDX_FEATURES 0
+#define TCG_7_0_EDX_FEATURES CPUID_7_0_EDX_FSRM
 #define TCG_7_1_EAX_FEATURES 0
 #define TCG_APM_FEATURES 0
 #define TCG_6_EAX_FEATURES CPUID_6_EAX_ARAT
-- 
2.39.1


