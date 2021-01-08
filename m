Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D9C2EF2F8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 14:24:42 +0100 (CET)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxrkv-0007Fk-2i
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 08:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxrhU-0005lh-3R
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 08:21:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxrhO-0002gy-Nb
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 08:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610112061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wl9+mwGeBbaD60x25URY1Epe/mimBi0dflDbNP+Ago=;
 b=QrIZQ9gFDqZSc//EvHEGkHn/1aZb+yPNDIrcvHxbLgwN0ldbTalYL3gOCh6onkv+xmiAmg
 HfGNIjeWDNlV80u8VocfijNhBg3he2RoZyzzAD6bPiDdXGUaIqZQ4dbwxbNm16Oww46xRr
 aChRlVMqXwHm1TpDixnA5HLlTL4bpag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-CzWy8NJAP1iQW1XHVV6F-g-1; Fri, 08 Jan 2021 08:20:59 -0500
X-MC-Unique: CzWy8NJAP1iQW1XHVV6F-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CD55804002;
 Fri,  8 Jan 2021 13:20:58 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-168.ams2.redhat.com [10.36.114.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A4AA5D9C0;
 Fri,  8 Jan 2021 13:20:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] s390x/tcg: Fix ALGSI
Date: Fri,  8 Jan 2021 14:20:46 +0100
Message-Id: <20210108132049.8501-2-david@redhat.com>
In-Reply-To: <20210108132049.8501-1-david@redhat.com>
References: <20210108132049.8501-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like something went wrong whiel touching that line. Instead of "r1"
we need a new temporary. Also, we have to pass MO_TEQ, to indicate that
we are working with 64-bit values. Let's revert these changes.

Fixes: ff26d287bddc ("target/s390x: Improve cc computation for ADD LOGICAL")
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


