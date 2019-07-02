Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937635C93C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 08:22:07 +0200 (CEST)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiCB4-0006sV-Pb
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 02:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58216)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByf-0004lG-0k
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hiByd-0002p5-VA
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 02:09:16 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35329 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hiByd-0002nO-Jk; Tue, 02 Jul 2019 02:09:15 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45dDMg4HwQz9sP7; Tue,  2 Jul 2019 16:09:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562047743;
 bh=b75CAUYLIbQe1Qpo7nfZqxRFQUGmzusldu8XhS1oYo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L2yOvScRBCCWn8ecQRjOA0iUSFkWYEVpggYG9w6Zng6KJpBAJ9WiaGmxyBfidZynY
 yXz1h0m56l7J07CtdyFGjcdkv0end/iFRG0mzoip9GJBzaoT2NdiBuCM3w4HroNC1K
 WQKb53SCy23ShIMuuhTqBI4UhutBU4fMLE5LWlaw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue,  2 Jul 2019 16:08:18 +1000
Message-Id: <20190702060857.3926-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702060857.3926-1-david@gibson.dropbear.id.au>
References: <20190702060857.3926-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 10/49] target/ppc: fix compile error in
 kvmppc_define_rtas_kernel_token()
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

gcc9 reports :

In file included from /usr/include/string.h:494,
                 from ./include/qemu/osdep.h:101,
                 from ./target/ppc/kvm.c:17:
In function =E2=80=98strncpy=E2=80=99,
    inlined from =E2=80=98kvmppc_define_rtas_kernel_token=E2=80=99 at ./t=
arget/ppc/kvm.c:2648:5:
/usr/include/bits/string_fortified.h:106:10: error: =E2=80=98__builtin_st=
rncpy=E2=80=99 specified bound 120 equals destination size [-Werror=3Dstr=
ingop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__=
dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190615081252.28602-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 4b4989c0af..9014ed029f 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2650,7 +2650,7 @@ int kvmppc_define_rtas_kernel_token(uint32_t token,=
 const char *function)
         return -ENOENT;
     }
=20
-    strncpy(args.name, function, sizeof(args.name));
+    strncpy(args.name, function, sizeof(args.name) - 1);
=20
     return kvm_vm_ioctl(kvm_state, KVM_PPC_RTAS_DEFINE_TOKEN, &args);
 }
--=20
2.21.0


