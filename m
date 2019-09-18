Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80768B5DE4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 09:19:53 +0200 (CEST)
Received: from localhost ([::1]:55242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAUFk-0002Fz-KT
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 03:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iAUD8-0000gE-1g
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 03:17:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iAUD7-0003DR-02
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 03:17:09 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50549 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1iAUD5-0003CL-PI
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 03:17:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46YBB64z9Dz9sP3; Wed, 18 Sep 2019 17:17:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1568791022;
 bh=Ee6r39NQyeFY3c3LXfZ/hGKxzW7XEVMggHRBTMEmFE4=;
 h=From:To:Cc:Subject:Date:From;
 b=XjwOh60eAF1SNxMdVrt/t+eQg4sbB83SYEH/hC7x75hL59JscT5oXHaytdRdNXj/p
 UtwN9ovBDl3a6P9YssXpA7Qi1JjKLNOUfr8ew8iWQAiXRbAhl7fkIYIytPB/pe/Ipl
 QKqZQoQfVdNMVcq8B0dOdBgIKxiDyK3AK4AZuz5g=
From: David Gibson <david@gibson.dropbear.id.au>
To: ehabkost@redhat.com,
	crosa@redhat.com
Date: Wed, 18 Sep 2019 17:06:54 +1000
Message-Id: <20190918070654.19356-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [RESEND PATCH] tests/acceptance: Specify arch for
 QueryCPUModelExpansion
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment this test runs on whatever the host arch is.  But it looks
for 'unavailable-features' which is an x86 specific cpu property.  Tag it
to always use qemu-system-x86_64.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/cpu_queries.py | 3 +++
 1 file changed, 3 insertions(+)

I sent this a while back, but it seems to have been forgotten.  As far
as I can tell the current logic is Just Plain Wrong, on any host other
than x86.

diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queri=
es.py
index e71edec39f..af47d2795a 100644
--- a/tests/acceptance/cpu_queries.py
+++ b/tests/acceptance/cpu_queries.py
@@ -18,6 +18,9 @@ class QueryCPUModelExpansion(Test):
     """
=20
     def test(self):
+        """
+        :avocado: tags=3Darch:x86_64
+        """
         self.vm.set_machine('none')
         self.vm.add_args('-S')
         self.vm.launch()
--=20
2.21.0


