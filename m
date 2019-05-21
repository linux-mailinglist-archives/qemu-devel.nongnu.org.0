Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2963257E7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 21:00:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT9zX-0004If-T5
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 15:00:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hT9u9-0008PN-7Q
	for qemu-devel@nongnu.org; Tue, 21 May 2019 14:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hT9r7-0005O5-28
	for qemu-devel@nongnu.org; Tue, 21 May 2019 14:51:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hT9r3-0005Iz-E7
	for qemu-devel@nongnu.org; Tue, 21 May 2019 14:51:19 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F221080F81;
	Tue, 21 May 2019 18:51:07 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A2A25C269;
	Tue, 21 May 2019 18:51:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue, 21 May 2019 15:50:58 -0300
Message-Id: <20190521185059.28236-3-ehabkost@redhat.com>
In-Reply-To: <20190521185059.28236-1-ehabkost@redhat.com>
References: <20190521185059.28236-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 21 May 2019 18:51:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 2/3] docs: recommend use of md-clear feature on
 all Intel CPUs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Update x86 CPU model guidance to recommend that the md-clear feature is
manually enabled with all Intel CPU models, when supported by the host
microcode.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Message-Id: <20190515141011.5315-3-berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/qemu-cpu-models.texi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/qemu-cpu-models.texi b/docs/qemu-cpu-models.texi
index 23c11dc86f..ad040cfc98 100644
--- a/docs/qemu-cpu-models.texi
+++ b/docs/qemu-cpu-models.texi
@@ -200,6 +200,18 @@ Not included by default in any Intel CPU model.
 Should be explicitly turned on for all Intel CPU models.
=20
 Note that not all CPU hardware will support this feature.
+
+@item @code{md-clear}
+
+Required to confirm the MDS (CVE-2018-12126, CVE-2018-12127, CVE-2018-12=
130,
+CVE-2019-11091) fixes.
+
+Not included by default in any Intel CPU model.
+
+Must be explicitly turned on for all Intel CPU models.
+
+Requires the host CPU microcode to support this feature before it
+can be used for guest CPUs.
 @end table
=20
=20
--=20
2.18.0.rc1.1.g3f1ff2140


