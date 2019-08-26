Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0207C9CB11
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 09:56:24 +0200 (CEST)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i29rS-0005CU-Uo
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 03:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42072)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i29n8-0000Dt-6P
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 03:51:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i29n5-0002tu-TS
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 03:51:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56008)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i29n5-0002tQ-I2; Mon, 26 Aug 2019 03:51:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 660897F741;
 Mon, 26 Aug 2019 07:51:50 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-227.ams2.redhat.com [10.36.116.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 367C360F82;
 Mon, 26 Aug 2019 07:51:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Aug 2019 09:51:11 +0200
Message-Id: <20190826075112.25637-7-david@redhat.com>
In-Reply-To: <20190826075112.25637-1-david@redhat.com>
References: <20190826075112.25637-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Mon, 26 Aug 2019 07:51:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 6/7] hppa/tcg: Call probe_write() also for
 CONFIG_USER_ONLY
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

We now have a variant for CONFIG_USER_ONLY as well.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/hppa/op_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index df0f1361ef..f0516e81f1 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -137,9 +137,7 @@ static void do_stby_e(CPUHPPAState *env, target_ulong=
 addr, target_ureg val,
     default:
         /* Nothing is stored, but protection is checked and the
            cacheline is marked dirty.  */
-#ifndef CONFIG_USER_ONLY
         probe_write(env, addr, 0, cpu_mmu_index(env, 0), ra);
-#endif
         break;
     }
 }
--=20
2.21.0


