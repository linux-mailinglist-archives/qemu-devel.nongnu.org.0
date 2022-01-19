Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71FA493735
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:26:16 +0100 (CET)
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7EN-0008SV-U5
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:26:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6Oa-0006aS-M7
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:32:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6OX-0004fr-Nu
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642581161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2H9o+dkLFgh+Hfd6dSYyQ2xHGDnDxdycc3HkGkOGLY=;
 b=fn3boZx0VmhX8v3lmLZ3KpEBdZ04d+gGymJ4+nkl8AKWNQCCZJR6mxiT2Eau1lM9tOdSkX
 1bDycnD2b4pOVTB4QZb/cXiZrfWXkw2y40TxVDfkGyXMVtuh8Ts+U4qeTa7nhUE6lzO5P/
 H8NdCHRVkQZMQsNDz4XPDo4QTXZNLQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-zGIsMf-WPyKXonSiAsx8Hw-1; Wed, 19 Jan 2022 03:32:38 -0500
X-MC-Unique: zGIsMf-WPyKXonSiAsx8Hw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BE671966328;
 Wed, 19 Jan 2022 08:32:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73CBB4F858;
 Wed, 19 Jan 2022 08:32:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] target/s390x: Fix SRDA CC calculation
Date: Wed, 19 Jan 2022 09:32:08 +0100
Message-Id: <20220119083215.120911-4-thuth@redhat.com>
In-Reply-To: <20220119083215.120911-1-thuth@redhat.com>
References: <20220119083215.120911-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

SRDA uses r1_D32 for binding the first operand and s64 for setting CC.
cout_s64() relies on o->out being the shift result, however,
wout_r1_D32() clobbers it.

Fix by using a temporary.

Fixes: a79ba3398a0a ("target-s390: Convert SHIFT DOUBLE")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220112165016.226996-3-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f180853e7a..766b4c87b2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5420,9 +5420,11 @@ static void wout_r1_P32(DisasContext *s, DisasOps *o)
 static void wout_r1_D32(DisasContext *s, DisasOps *o)
 {
     int r1 = get_field(s, r1);
+    TCGv_i64 t = tcg_temp_new_i64();
     store_reg32_i64(r1 + 1, o->out);
-    tcg_gen_shri_i64(o->out, o->out, 32);
-    store_reg32_i64(r1, o->out);
+    tcg_gen_shri_i64(t, o->out, 32);
+    store_reg32_i64(r1, t);
+    tcg_temp_free_i64(t);
 }
 #define SPEC_wout_r1_D32 SPEC_r1_even
 
-- 
2.27.0


