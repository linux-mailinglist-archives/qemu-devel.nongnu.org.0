Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0127D645AF4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:31:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uQ1-0007L0-Fw; Wed, 07 Dec 2022 08:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2uPz-0007HZ-9i
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:24:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2uPx-0000yP-Qc
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8LoZpNo6AUtjPDRlMv/iTUhqN7M0ntxBz11qfxQEXDM=;
 b=Tt8LhYrV9b2F+wnTiICNVKa+ua5rK801Fq/8jqmWyhGPlYd0hA5tTQF5WkFr2yQZGhwYRo
 DBhb8VYfJ3YYF2/j1uX6zCWdp1xNQYtpNTygg0NAXB6pvqglBGK2UEsxh40OWM5w354j7r
 64dACv2/iSJae+vS6ee/qRcyXoMuVec=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-OBELLo2FOou0Fet1fDSD1w-1; Wed, 07 Dec 2022 08:24:52 -0500
X-MC-Unique: OBELLo2FOou0Fet1fDSD1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52E378339C5;
 Wed,  7 Dec 2022 13:24:52 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7411F2166B26;
 Wed,  7 Dec 2022 13:24:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 stefanha@fmail.com, peter.maydell@linaro.org
Subject: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Date: Wed,  7 Dec 2022 14:24:39 +0100
Message-Id: <20221207132439.635402-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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

Initialize r0-3 to avoid compilation errors when
-Werror=maybe-uninitialized is used

../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
 2495 |     d->Q(3) = r3;
      |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
 2494 |     d->Q(2) = r2;
      |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
 2493 |     d->Q(1) = r1;
      |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
 2492 |     d->Q(0) = r0;
      |     ~~~~~~~~^~~~

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")

---

Am I the only one getting this? Or anything wrong in my setup.
---
 target/i386/ops_sse.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 3cbc36a59d..b77071b8da 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2451,7 +2451,7 @@ void glue(helper_vpgatherqq, SUFFIX)(CPUX86State *env,
 #if SHIFT >= 2
 void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
 {
-    uint64_t r0, r1, r2, r3;
+    uint64_t r0 = 0, r1 = 0, r2 = 0, r3 = 0;
 
     switch (order & 3) {
     case 0:
-- 
2.37.3


