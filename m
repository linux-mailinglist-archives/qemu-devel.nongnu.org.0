Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B185EEA2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 23:36:55 +0200 (CEST)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1himvu-0001pZ-5i
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 17:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38418)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1himVt-0006V9-Iw
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:10:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1himVn-0007In-0h
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35230)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1himVi-0007Fm-9L
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A50866971;
 Wed,  3 Jul 2019 21:09:46 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B79A984262;
 Wed,  3 Jul 2019 21:09:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Wed,  3 Jul 2019 18:08:10 -0300
Message-Id: <20190703210821.27550-33-ehabkost@redhat.com>
In-Reply-To: <20190703210821.27550-1-ehabkost@redhat.com>
References: <20190703210821.27550-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 03 Jul 2019 21:09:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v5 32/43] qmp: Add "alias-of" field to
 query-cpu-definitions
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Management software will be expected to resolve CPU model name
aliases using the new field.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190628002844.24894-2-ehabkost@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qapi/machine-target.json | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 5d7480f6ab..55310a6aa2 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -279,6 +279,12 @@
 #            to introspect properties configurable using -cpu or -global=
.
 #            (since 2.9)
 #
+# @alias-of: Name of CPU model this model is an alias for.  The target o=
f the
+#            CPU model alias may change depending on the machine type.
+#            Management software is supposed to translate CPU model alia=
ses
+#            in the VM configuration, because aliases may stop being
+#            migration-safe in the future (since 4.1)
+#
 # @unavailable-features is a list of QOM property names that
 # represent CPU model attributes that prevent the CPU from running.
 # If the QOM property is read-only, that means there's no known
@@ -302,7 +308,8 @@
             '*migration-safe': 'bool',
             'static': 'bool',
             '*unavailable-features': [ 'str' ],
-            'typename': 'str' },
+            'typename': 'str',
+            '*alias-of' : 'str' },
   'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I3=
86) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
=20
 ##
--=20
2.18.0.rc1.1.g3f1ff2140


