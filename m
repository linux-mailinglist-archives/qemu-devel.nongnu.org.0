Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740916867C1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDcv-0006lj-Nz; Wed, 01 Feb 2023 08:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNDct-0006l7-9m
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:58:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNDcr-00033r-RA
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675259893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6E43QDqsPyPDXX60KATrLVlrphoW+MpFw34uTLFnIbA=;
 b=HwU/qCEqsWv8OFY/RCRfcyy09t+OfQ/Puu5p+NCaIEprf9tPoczE45wcdM8TLa0JhZmAl2
 v9cEGXBo881iZU0IuXy1yK7WCFCa0Y5LDGqs5Ox3MVdygxgyHMYcuLw9cybZVGnql+67rx
 nym2jmLSSyywjpwhXlVEdN3rz4kGSPM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-ufRD_46yOUerd24msxYMvA-1; Wed, 01 Feb 2023 08:58:02 -0500
X-MC-Unique: ufRD_46yOUerd24msxYMvA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D5F3C218A0;
 Wed,  1 Feb 2023 13:58:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6AE040E4314;
 Wed,  1 Feb 2023 13:58:01 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Yang Zhong <yang.zhong@linux.intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jing Liu <jing2.liu@intel.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 2/2] target/i386: add support for FB_CLEAR feature
Date: Wed,  1 Feb 2023 08:57:59 -0500
Message-Id: <20230201135759.555607-3-eesposit@redhat.com>
In-Reply-To: <20230201135759.555607-1-eesposit@redhat.com>
References: <20230201135759.555607-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

As reported by the Intel's doc:
"FB_CLEAR: The processor will overwrite fill buffer values as part of
MD_CLEAR operations with the VERW instruction.
On these processors, L1D_FLUSH does not overwrite fill buffer values."

If this cpu feature is present in host, allow QEMU to choose whether to
show it to the guest too.
One disadvantage of not exposing it is that the guest will report
a non existing vulnerability in
/sys/devices/system/cpu/vulnerabilities/mmio_stale_data
because the mitigation is present only when the cpu has
        (FLUSH_L1D and MD_CLEAR) or FB_CLEAR
features enabled.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 target/i386/cpu.h | 1 +
 target/i386/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 4948130900..68a6ded0d7 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -975,6 +975,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define MSR_ARCH_CAP_PSCHANGE_MC_NO     (1U << 6)
 #define MSR_ARCH_CAP_TSX_CTRL_MSR       (1U << 7)
 #define MSR_ARCH_CAP_TAA_NO             (1U << 8)
+#define MSR_ARCH_CAP_FB_CLEAR           (1U << 17)
 
 #define MSR_CORE_CAP_SPLIT_LOCK_DETECT  (1U << 5)
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 390120cad8..1405eb42d6 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1010,7 +1010,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "ssb-no", "mds-no", "pschange-mc-no", "tsx-ctrl",
             "taa-no", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, "fb-clear", NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-- 
2.39.1


