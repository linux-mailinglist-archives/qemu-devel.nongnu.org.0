Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040DB9ACDC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 12:14:02 +0200 (CEST)
Received: from localhost ([::1]:53738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i16a1-0005G7-2u
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 06:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1i16UP-0006gm-7A
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 06:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1i16UO-0008DU-6d
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 06:08:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38630)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1i16UN-0008Cq-WF; Fri, 23 Aug 2019 06:08:12 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 44A773099F76;
 Fri, 23 Aug 2019 10:08:11 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-2.ams2.redhat.com [10.36.117.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C40785D6B2;
 Fri, 23 Aug 2019 10:08:08 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 12:07:38 +0200
Message-Id: <20190823100741.9621-7-david@redhat.com>
In-Reply-To: <20190823100741.9621-1-david@redhat.com>
References: <20190823100741.9621-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 23 Aug 2019 10:08:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 6/9] hppa/tcg: Call probe_write() also for
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
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We now have a variant for CONFIG_USER_ONLY as well.

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


