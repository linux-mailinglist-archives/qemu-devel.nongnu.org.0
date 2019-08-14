Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58CD8D6FF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 17:13:40 +0200 (CEST)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxuy3-0000oI-Md
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 11:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1hxuxG-0000Gj-Ak
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 11:12:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hxuxF-0003em-3Q
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 11:12:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49030)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hxuxE-0003eU-Ur; Wed, 14 Aug 2019 11:12:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E587AC05AA6E;
 Wed, 14 Aug 2019 15:12:46 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45EBD60852;
 Wed, 14 Aug 2019 15:12:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Aug 2019 17:12:42 +0200
Message-Id: <20190814151242.27199-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 14 Aug 2019 15:12:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1] s390x/tcg: Fix VERIM with 32/64 bit elements
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
 Cornelia Huck <cohuck@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrong order of operands. The constant always comes last. Makes QEMU crash
reliably on specific git fetch invocations.

Reported-by: Stefano Brivio <sbrivio@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

I guess it is too late for 4.1 :(

---
 target/s390x/translate_vx.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 41d5cf869f..0caddb3958 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -213,7 +213,7 @@ static void get_vec_element_ptr_i64(TCGv_ptr ptr, uin=
t8_t reg, TCGv_i64 enr,
                        vec_full_reg_offset(v3), ptr, 16, 16, data, fn)
 #define gen_gvec_3i(v1, v2, v3, c, gen) \
     tcg_gen_gvec_3i(vec_full_reg_offset(v1), vec_full_reg_offset(v2), \
-                    vec_full_reg_offset(v3), c, 16, 16, gen)
+                    vec_full_reg_offset(v3), 16, 16, c, gen)
 #define gen_gvec_4(v1, v2, v3, v4, gen) \
     tcg_gen_gvec_4(vec_full_reg_offset(v1), vec_full_reg_offset(v2), \
                    vec_full_reg_offset(v3), vec_full_reg_offset(v4), \
--=20
2.21.0


