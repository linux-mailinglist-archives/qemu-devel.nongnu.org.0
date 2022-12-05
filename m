Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739CE642A4B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:22:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CLD-0008MX-13; Mon, 05 Dec 2022 09:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2CL6-0008Ia-2q
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:21:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2CL3-00047G-Bd
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:20:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670250055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QWIwt1hjeClWI0Euub/s9kW+f3hU1TkrFb58/fZWrPs=;
 b=Ef6UEmQqSx8e7cHKn7d/aL5pySUy2vTO6u9tO7bSpNmGEQsxSLkIrNZ7ElQQh6eye8CX8f
 be2Qd9jZ5KOdxDXpQb9AL5Aa1LFIG6cU4edbeanSiaEG/gRVJKrQiozkzQFPvk70NEyyim
 gPiHy/Q2y6e18177+vmbFBOIhvhwN5k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-IpY50LaxN4CpJxY_Gc1EMg-1; Mon, 05 Dec 2022 09:20:52 -0500
X-MC-Unique: IpY50LaxN4CpJxY_Gc1EMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E72541C0CE63;
 Mon,  5 Dec 2022 14:20:51 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27DF340C6E13;
 Mon,  5 Dec 2022 14:20:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH for-8.0] target/s390x/tcg/mem_helper: Test the right bits in
 psw_key_valid()
Date: Mon,  5 Dec 2022 15:20:43 +0100
Message-Id: <20221205142043.95185-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The PSW key mask is a 16 bit field, and the psw_key variable is
in the range from 0 to 15, so it does not make sense to use
"0x80 >> psw_key" for testing the bits here. We should use 0x8000
instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Found by code inspection (Linux likely does not use these PSW key masks
 yet, otherwise we might have noticed earlier)

 target/s390x/tcg/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 9542fad59b..cb82cd1c1d 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -51,7 +51,7 @@ static inline bool psw_key_valid(CPUS390XState *env, uint8_t psw_key)
 
     if (env->psw.mask & PSW_MASK_PSTATE) {
         /* PSW key has range 0..15, it is valid if the bit is 1 in the PKM */
-        return pkm & (0x80 >> psw_key);
+        return pkm & (0x8000 >> psw_key);
     }
     return true;
 }
-- 
2.31.1


