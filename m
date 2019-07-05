Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA0360DFB
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 00:48:07 +0200 (CEST)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjWzu-00068J-JK
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 18:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55373)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hjWVt-0008Md-C2
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:17:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hjWVq-00041w-Ny
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:17:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43980)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hjWVo-0003v1-VK
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:17:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3EB4B8535D;
 Fri,  5 Jul 2019 22:16:38 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3CA44C7;
 Fri,  5 Jul 2019 22:16:37 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Fri,  5 Jul 2019 19:15:00 -0300
Message-Id: <20190705221504.25166-39-ehabkost@redhat.com>
In-Reply-To: <20190705221504.25166-1-ehabkost@redhat.com>
References: <20190705221504.25166-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 05 Jul 2019 22:16:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v6 38/42] docs: Deprecate CPU model runnability
 guarantees
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

Document that CPU model runnability guarantees won't apply to
unversioned CPU models anymore.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190628002844.24894-9-ehabkost@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 qemu-deprecated.texi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index e6891c3a93..c90b08d553 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -292,3 +292,22 @@ subset of the image.
 In the future, QEMU will require Python 3 to be available at
 build time.  Support for Python 2 in scripts shipped with QEMU
 is deprecated.
+
+@section Backwards compatibility
+
+@subsection Runnability guarantee of CPU models (since 4.1.0)
+
+Previous versions of QEMU never changed existing CPU models in
+ways that introduced additional host software or hardware
+requirements to the VM.  This allowed management software to
+safely change the machine type of an existing VM without
+introducing new requirements ("runnability guarantee").  This
+prevented CPU models from being updated to include CPU
+vulnerability mitigations, leaving guests vulnerable in the
+default configuration.
+
+The CPU model runnability guarantee won't apply anymore to
+existing CPU models.  Management software that needs runnability
+guarantees must resolve the CPU model aliases using te
+``alias-of'' field returned by the ``query-cpu-definitions'' QMP
+command.
--=20
2.18.0.rc1.1.g3f1ff2140


