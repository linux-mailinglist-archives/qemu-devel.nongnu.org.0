Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0995123CE7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 03:09:55 +0100 (CET)
Received: from localhost ([::1]:48482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihOmg-0003s5-DF
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 21:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52380)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ihOek-0002zz-5Q
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 21:01:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ihOeb-0005eJ-T0
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 21:01:37 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24478
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ihOea-0005bc-Ep
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 21:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576634490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pe09oFj+dplfSAmWzK13nOJ+j8pDv/xrYGnj1YjPya4=;
 b=Ee5zCcJFqU2kOWHFzOzw6f6zYrWsQWNLn4r8jUJ/T5Yzv9+cqpe+TMsqR7vQK0QmCcUh+J
 t1DD8oWTlqc+WccRoHTxS2XPv2PsecZfPcf6nPt0Q6OSswPP4zDbaaQvK9mR1g6vBWLDoP
 48E2L00CKDrkCISLAg1cYcsH/8p19x8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-4QlvFONpMYqfMy2ZRD_CXg-1; Tue, 17 Dec 2019 21:01:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A303800053
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 02:01:25 +0000 (UTC)
Received: from secure.mitica (ovpn-116-32.ams2.redhat.com [10.36.116.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EA6419C58;
 Wed, 18 Dec 2019 02:01:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/10] migration: Increase default number of multifd
 channels to 16
Date: Wed, 18 Dec 2019 03:01:10 +0100
Message-Id: <20191218020119.3776-2-quintela@redhat.com>
In-Reply-To: <20191218020119.3776-1-quintela@redhat.com>
References: <20191218020119.3776-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 4QlvFONpMYqfMy2ZRD_CXg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can scale much better with 16, so we can scale to higher numbers.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 354ad072fa..e7f707e033 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -86,7 +86,7 @@
=20
 /* The delay time (in ms) between two COLO checkpoints */
 #define DEFAULT_MIGRATE_X_CHECKPOINT_DELAY (200 * 100)
-#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
+#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 16
=20
 /* Background transfer rate for postcopy, 0 means unlimited, note
  * that page requests can still exceed this limit.
--=20
2.23.0


