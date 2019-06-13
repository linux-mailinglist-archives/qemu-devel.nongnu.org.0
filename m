Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011BF432E8
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 08:17:41 +0200 (CEST)
Received: from localhost ([::1]:37144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbJ3M-0002dX-5x
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 02:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33663)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hbJ07-0000i5-Ux
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 02:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hbIts-0000lf-VC
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 02:07:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43125 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>) id 1hbItp-0000X0-CV
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 02:07:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45PYDg4xq8z9s9y; Thu, 13 Jun 2019 16:07:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1560406051;
 bh=6i0zhBW5Gvdt/eLBz96ga1Z1hrkgH3vTP1cI7EBbLvk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FP7C+bjKrDW23TCZrc7Eo8VahJQ9ESigzcCUwTU8au1pssatuSL0D+kV2r4OYRUth
 PL9+lxFi/7SsQxqvOwhSEpx5l0c3PqN8HBQzeNjToxc3N9RWHj1smLrv5CdGSm0OtZ
 4980EIbQndW/RGTeSxd3L2KnPSR55NtblazwM+aw=
From: David Gibson <david@gibson.dropbear.id.au>
To: crosa@redhat.com, qemu-devel@nongnu.org, arikalo@wavecomp.com,
 aurelien@aurel32.net, ehabkost@redhat.com
Date: Thu, 13 Jun 2019 16:07:26 +1000
Message-Id: <20190613060728.26955-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613060728.26955-1-david@gibson.dropbear.id.au>
References: <20190613060728.26955-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PATCH 1/3] tests/acceptance: Specify arch for
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment this test runs on whatever the host arch is.  But it looks
for 'unavailable-features' which is an x86 specific cpu property.  Tag it
to always use qemu-system-x86_64.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 tests/acceptance/cpu_queries.py | 3 +++
 1 file changed, 3 insertions(+)

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


