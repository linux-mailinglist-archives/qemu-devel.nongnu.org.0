Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A365228E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 07:08:28 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfdgx-0003Qo-Pj
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 01:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hfdZH-00070d-Eq
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 01:00:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hfdZG-0002aS-65
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 01:00:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60228)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hfdZF-0002ZY-W2
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 01:00:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4E86530832EE
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 05:00:29 +0000 (UTC)
Received: from localhost (ovpn-116-76.gru2.redhat.com [10.97.116.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B39DB5C231;
 Tue, 25 Jun 2019 05:00:26 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 25 Jun 2019 02:00:07 -0300
Message-Id: <20190625050008.12789-6-ehabkost@redhat.com>
In-Reply-To: <20190625050008.12789-1-ehabkost@redhat.com>
References: <20190625050008.12789-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 25 Jun 2019 05:00:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 5/6] docs: Deprecate CPU model runnability
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
Cc: libvir-list@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document that CPU model runnability guarantees won't apply to
unversioned CPU models anymore.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: libvir-list@redhat.com
---
 qemu-deprecated.texi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index df04f2840b..5fafb62a6d 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -243,3 +243,22 @@ Note that if you are exposing the export via /dev/nbd0, it is easier
 to just export the entire image and then mount only /dev/nbd0p1 than
 it is to reinvoke @command{qemu-nbd -c /dev/nbd0} limited to just a
 subset of the image.
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
-- 
2.18.0.rc1.1.g3f1ff2140


