Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E500143BD4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 12:13:44 +0100 (CET)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itrTa-00066M-O3
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 06:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itrLJ-0003hh-Jc
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:05:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itrLE-0002fN-Ut
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:05:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20570
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itrLE-0002ev-Rm
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 06:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579604704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CleyiTyFzeU7YFGR9t8XlXBZmAxEriIlOMwBzucwkpQ=;
 b=PQNiJGg56cBkEdlMbT0/TTxIEFLYVPPfH7LLrc6jwIX/W5wRc1odh2xQyy27Q7fZ7p9dOZ
 GHW5xZ9h+t7N518HxKitLYHWJCfM107skk/p3Yxj8IGhaH6jPIF5RVwZnUgyOFOWqiAcWP
 OQVvwSpdHSCylTLIsDySH5KYBrMsst0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-EdVqMcpMOy2sK8ntRqZvkQ-1; Tue, 21 Jan 2020 06:05:03 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E5B18A6EC1;
 Tue, 21 Jan 2020 11:05:01 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A48C811F8;
 Tue, 21 Jan 2020 11:04:53 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/10] qom/object: Display more helpful message when a
 parent is missing
Date: Tue, 21 Jan 2020 12:03:45 +0100
Message-Id: <20200121110349.25842-7-philmd@redhat.com>
In-Reply-To: <20200121110349.25842-1-philmd@redhat.com>
References: <20200121110349.25842-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: EdVqMcpMOy2sK8ntRqZvkQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU object model is scarse in documentation. Some calls are
recursive, and it might be hard to figure out even trivial issues.

We can avoid developers to waste time in a debugging session by
displaying a simple error message.

This commit is also similar to e02bdf1cecd2 ("Display more helpful
message when an object type is missing").

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: New patch
---
 qom/object.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index 0d971ca897..bc13a55094 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -173,7 +173,11 @@ static TypeImpl *type_get_parent(TypeImpl *type)
 {
     if (!type->parent_type && type->parent) {
         type->parent_type =3D type_get_by_name(type->parent);
-        g_assert(type->parent_type !=3D NULL);
+        if (!type->parent_type) {
+            fprintf(stderr, "Object '%s' missing its parent '%s'\n",
+                    type->name, type->parent);
+            abort();
+        }
     }
=20
     return type->parent_type;
--=20
2.21.1


