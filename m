Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD42F1B2A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:40:12 +0100 (CET)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0El-0006ck-FI
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kz0Db-0005Jf-8q
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:38:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kz0DZ-0000Ws-It
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610383136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcL3JiDdrgheCaJxJGKj3OEf8MIV5KlgDXI9W+pBN0o=;
 b=iqoSw09hT6nDHRfESapTnVpSC3cQPA7Y1f3agzwzpeDvrWBl4KgnoB+Lk8Dt9fZgqVFQtS
 635TGCbsdox2xhdYFwd/JWK4fsyrohbsjJ2Mpk6I9DOpkXlM+2w5u7nG2hxMyXrI17L6Oz
 Ux7VLmVpcdvtpn9bTkxdjyZhySlAqDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-ykChhc8YOYisUHP7Pl6Ziw-1; Mon, 11 Jan 2021 11:38:55 -0500
X-MC-Unique: ykChhc8YOYisUHP7Pl6Ziw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E55DEB8100;
 Mon, 11 Jan 2021 16:38:53 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-103.ams2.redhat.com [10.36.115.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 371DF1971B;
 Mon, 11 Jan 2021 16:38:51 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] s390x/tcg: Fix ALGSI
Date: Mon, 11 Jan 2021 17:38:41 +0100
Message-Id: <20210111163845.18148-2-david@redhat.com>
In-Reply-To: <20210111163845.18148-1-david@redhat.com>
References: <20210111163845.18148-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 qemu-s390x@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like something went wrong whiel touching that line. Instead of "r1"
we need a new temporary. Also, we have to pass MO_TEQ, to indicate that
we are working with 64-bit values. Let's revert these changes.

Fixes: ff26d287bddc ("target/s390x: Improve cc computation for ADD LOGICAL")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 26badb663a..eac5136ee5 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -76,7 +76,7 @@
 /* ADD LOGICAL WITH SIGNED IMMEDIATE */
     D(0xeb6e, ALSI,    SIY,   GIE, la1, i2_32u, new, 0, asi, addu32, MO_TEUL)
     C(0xecda, ALHSIK,  RIE_d, DO,  r3_32u, i2_32u, new, r1_32, add, addu32)
-    C(0xeb7e, ALGSI,   SIY,   GIE, la1, i2, r1, 0, asiu64, addu64)
+    D(0xeb7e, ALGSI,   SIY,   GIE, la1, i2, new, 0, asiu64, addu64, MO_TEQ)
     C(0xecdb, ALGHSIK, RIE_d, DO,  r3, i2, r1, 0, addu64, addu64)
 /* ADD LOGICAL WITH SIGNED IMMEDIATE HIGH */
     C(0xcc0a, ALSIH,   RIL_a, HW,  r1_sr32, i2_32u, new, r1_32h, add, addu32)
-- 
2.29.2


