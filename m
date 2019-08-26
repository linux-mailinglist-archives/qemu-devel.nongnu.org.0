Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 223339CB00
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 09:54:06 +0200 (CEST)
Received: from localhost ([::1]:50592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i29pE-0001sS-KO
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 03:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i29mp-00006u-4T
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 03:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i29mn-0002m2-3x
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 03:51:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i29ml-0002lB-7t; Mon, 26 Aug 2019 03:51:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7FB9C307D915;
 Mon, 26 Aug 2019 07:51:30 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-227.ams2.redhat.com [10.36.116.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2F746CE58;
 Mon, 26 Aug 2019 07:51:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Aug 2019 09:51:07 +0200
Message-Id: <20190826075112.25637-3-david@redhat.com>
In-Reply-To: <20190826075112.25637-1-david@redhat.com>
References: <20190826075112.25637-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 26 Aug 2019 07:51:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 2/7] s390x/tcg: Fix length calculation in
 probe_write_access()
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
Cc: Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hm... how did that "-" slip in (-TAGRET_PAGE_SIZE would be correct). This
currently makes us exceed one page in a single probe_write() call,
essentially leaving some memory unchecked.

Fixes: c5a7392cfb96 ("s390x/tcg: Provide probe_write_access helper")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 7819aca15d..4b43440e89 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -2623,7 +2623,7 @@ void probe_write_access(CPUS390XState *env, uint64_=
t addr, uint64_t len,
 #else
     /* test the actual access, not just any access to the page due to LA=
P */
     while (len) {
-        const uint64_t pagelen =3D -(addr | -TARGET_PAGE_MASK);
+        const uint64_t pagelen =3D -(addr | TARGET_PAGE_MASK);
         const uint64_t curlen =3D MIN(pagelen, len);
=20
         probe_write(env, addr, curlen, cpu_mmu_index(env, false), ra);
--=20
2.21.0


