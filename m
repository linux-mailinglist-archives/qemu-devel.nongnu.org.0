Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB1F6C81E4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:54:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjT1-0005PD-HG; Fri, 24 Mar 2023 11:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjSy-0005Ga-Or
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjSx-0001ky-5U
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679672185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JSapDZguOsxehwqI3Mr8KAptdRnY/urpIRZ2gdVUedY=;
 b=N/e0SyOHf/fvqQtJHU6/jyVxjtrZG2EJVjLkx2JfYrdF31BHqkbv38ZfdWp2tp6NJm2nDy
 ckMhIWMFncS62Fs2j8RdphVtvxmLJM0rcUd28ExAK4DbkZr9FkohhggRwY3AZJFOou5V3t
 1lcZA5Rg1mdUIteEisG96Bui53VGU2U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-OxGH8fOMNxaY0bPJr_bohA-1; Fri, 24 Mar 2023 11:36:21 -0400
X-MC-Unique: OxGH8fOMNxaY0bPJr_bohA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D866855420;
 Fri, 24 Mar 2023 15:36:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B9E2140EBF4;
 Fri, 24 Mar 2023 15:36:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/8] target/s390x: Fix float_comp_to_cc() prototype
Date: Fri, 24 Mar 2023 16:36:05 +0100
Message-Id: <20230324153610.224673-4-thuth@redhat.com>
In-Reply-To: <20230324153610.224673-1-thuth@redhat.com>
References: <20230324153610.224673-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

From: Cédric Le Goater <clg@redhat.com>

GCC13 reports an error :

../target/s390x/tcg/fpu_helper.c:123:5: error: conflicting types for ‘float_comp_to_cc’ due to enum/integer mismatch; have ‘int(CPUS390XState *, FloatRelation)’ {aka ‘int(struct CPUArchState *, FloatRelation)’} [-Werror=enum-int-mismatch]

  123 | int float_comp_to_cc(CPUS390XState *env, FloatRelation float_compare)
      |     ^~~~~~~~~~~~~~~~
In file included from ../target/s390x/tcg/fpu_helper.c:23:
../target/s390x/s390x-internal.h:302:5: note: previous declaration of ‘float_comp_to_cc’ with type ‘int(CPUS390XState *, int)’ {aka ‘int(struct CPUArchState *, int)’}
  302 | int float_comp_to_cc(CPUS390XState *env, int float_compare);
      |     ^~~~~~~~~~~~~~~~

Fixes: 71bfd65c5f ("softfloat: Name compare relation enum")
Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230321161609.716474-3-clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/s390x-internal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 5d4361d35b..825252d728 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -11,6 +11,7 @@
 #define S390X_INTERNAL_H
 
 #include "cpu.h"
+#include "fpu/softfloat.h"
 
 #ifndef CONFIG_USER_ONLY
 typedef struct LowCore {
@@ -299,7 +300,7 @@ uint32_t set_cc_nz_f128(float128 v);
 uint8_t s390_softfloat_exc_to_ieee(unsigned int exc);
 int s390_swap_bfp_rounding_mode(CPUS390XState *env, int m3);
 void s390_restore_bfp_rounding_mode(CPUS390XState *env, int old_mode);
-int float_comp_to_cc(CPUS390XState *env, int float_compare);
+int float_comp_to_cc(CPUS390XState *env, FloatRelation float_compare);
 
 #define DCMASK_ZERO             0x0c00
 #define DCMASK_NORMAL           0x0300
-- 
2.31.1


