Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC065FCF8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:42:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDi6C-0002Z1-2w; Fri, 06 Jan 2023 03:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi69-0002Xj-Na
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi68-0005VX-7P
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672993747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YECT37xFnoENI7l6yJNtVYwVr86adRzuuOKbFfDnvY8=;
 b=G42y6+JM2RZtc5Iwr9tD1Cpd+U8liZLZjPXGFpA/sgu9QHjK1+ysIgjK1TnR0bQpaOo6bj
 ZUjpfIzIwVnyKiit0kGw+ok1/bFH2W34+rGV7Ajq51hkKJhz1fq1TFb23hiq8MGC6KtmBC
 B9CEN+CokwOt0bu+cyfdkvhjHC0TGys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-KHWM2W1JO2OpKPFe7uJvuw-1; Fri, 06 Jan 2023 03:29:04 -0500
X-MC-Unique: KHWM2W1JO2OpKPFe7uJvuw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22FA8101A52E;
 Fri,  6 Jan 2023 08:29:04 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2434492B06;
 Fri,  6 Jan 2023 08:29:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL 05/15] hw/s390x/pv: Restrict Protected Virtualization to sysemu
Date: Fri,  6 Jan 2023 09:28:43 +0100
Message-Id: <20230106082853.31787-6-thuth@redhat.com>
In-Reply-To: <20230106082853.31787-1-thuth@redhat.com>
References: <20230106082853.31787-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Protected Virtualization is irrelevant in user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221217152454.96388-4-philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/cpu_features.c | 4 ++++
 target/s390x/cpu_models.c   | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
index 5528acd082..2e4e11d264 100644
--- a/target/s390x/cpu_features.c
+++ b/target/s390x/cpu_features.c
@@ -14,7 +14,9 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "cpu_features.h"
+#ifndef CONFIG_USER_ONLY
 #include "hw/s390x/pv.h"
+#endif
 
 #define DEF_FEAT(_FEAT, _NAME, _TYPE, _BIT, _DESC) \
     [S390_FEAT_##_FEAT] = {                        \
@@ -107,6 +109,7 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
         feat = find_next_bit(features, S390_FEAT_MAX, feat + 1);
     }
 
+#ifndef CONFIG_USER_ONLY
     if (!s390_is_pv()) {
         return;
     }
@@ -147,6 +150,7 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
     default:
         return;
     }
+#endif
 }
 
 void s390_add_from_feat_block(S390FeatBitmap features, S390FeatType type,
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index c3a4f80633..065ec6d66c 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -23,8 +23,8 @@
 #include "qemu/qemu-print.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/sysemu.h"
-#endif
 #include "hw/s390x/pv.h"
+#endif
 
 #define CPUDEF_INIT(_type, _gen, _ec_ga, _mha_pow, _hmfai, _name, _desc) \
     {                                                                    \
@@ -236,6 +236,7 @@ bool s390_has_feat(S390Feat feat)
         return 0;
     }
 
+#ifndef CONFIG_USER_ONLY
     if (s390_is_pv()) {
         switch (feat) {
         case S390_FEAT_DIAG_318:
@@ -259,6 +260,7 @@ bool s390_has_feat(S390Feat feat)
             break;
         }
     }
+#endif
     return test_bit(feat, cpu->model->features);
 }
 
-- 
2.31.1


