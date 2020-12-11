Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C02D7984
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:36:56 +0100 (CET)
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkTT-0007kl-QT
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHq-0004bD-CS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHn-00062j-M5
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607700286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynz+NF3wqknfz0B2Ut8E/9qZJ9FPq6qcYfbYsdobs2I=;
 b=V6Y/sZNrAcTDcjbKAQ+JBo10YTByNyZhYSF5nNJb08LWSF3s9WhgVk5a5/Wsn2d3dPX0JX
 urKs3uc/NmkP/9B/QgkAH9Rz//bfOiW8k9ogk/PpHKwY94ni7M0osheiVvDx90yqmJuLmb
 apmkXy4eVGBcQo1ncp+nZn/So+nAC20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-8tNU0ETTNQGGL9pSv7mAYQ-1; Fri, 11 Dec 2020 10:24:41 -0500
X-MC-Unique: 8tNU0ETTNQGGL9pSv7mAYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E84580205E;
 Fri, 11 Dec 2020 15:24:40 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E715100239F;
 Fri, 11 Dec 2020 15:24:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 05/12] target/i386: silence the compiler warnings in
 gen_shiftd_rm_T1
Date: Fri, 11 Dec 2020 16:24:19 +0100
Message-Id: <20201211152426.350966-6-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
References: <20201211152426.350966-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

The current "#ifdef TARGET_X86_64" statement affects
the compiler's determination of fall through.

When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
target/i386/translate.c: In function ‘gen_shiftd_rm_T1’:
target/i386/translate.c:1773:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
         if (is_right) {
            ^
target/i386/translate.c:1782:5: note: here
     case MO_32:
     ^~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201030004046.2191790-2-kuhn.chenqun@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/i386/translate.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 4c57307e42..dcf48f053f 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -1777,9 +1777,12 @@ static void gen_shiftd_rm_T1(DisasContext *s, MemOp ot, int op1,
         } else {
             tcg_gen_deposit_tl(s->T1, s->T0, s->T1, 16, 16);
         }
-        /* FALLTHRU */
-#ifdef TARGET_X86_64
+        /*
+         * If TARGET_X86_64 defined then fall through into MO_32 case,
+         * otherwise fall through default case.
+         */
     case MO_32:
+#ifdef TARGET_X86_64
         /* Concatenate the two 32-bit values and use a 64-bit shift.  */
         tcg_gen_subi_tl(s->tmp0, count, 1);
         if (is_right) {
-- 
2.27.0


