Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3AB13A3C8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 10:29:22 +0100 (CET)
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irIVk-0007Gu-So
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 04:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irITW-0005JZ-1b
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:27:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irITU-0006Oj-R8
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:27:01 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39154
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irITU-0006OU-MN
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 04:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578994020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ep/mdFe58oIx18pwRhWkg/D1I02FCTVyA7jE4yQkeXs=;
 b=eexHpeV76s1IQTRyeiWXS1Oz2ZxZ/UzWJHjhNkYw/dwehWwngNQiGip9omv56MpU64ck4D
 DGypt5RG9fFjHRfyXtHJxQVXezXZyRnnGdVmAdDW6bOvUsCy8IX1L3EEXR79AipDMLWvWB
 Xj1fmCdogC5ekPIw/lisJVzJaWVXAPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-RULCHMoFOXqFDmpZtjKpZw-1; Tue, 14 Jan 2020 04:26:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2977A477;
 Tue, 14 Jan 2020 09:26:57 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6267C384;
 Tue, 14 Jan 2020 09:26:48 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/29] runstate: ignore finishmigrate -> prelaunch transition
Date: Tue, 14 Jan 2020 10:25:43 +0100
Message-Id: <20200114092606.1761-7-quintela@redhat.com>
In-Reply-To: <20200114092606.1761-1-quintela@redhat.com>
References: <20200114092606.1761-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: RULCHMoFOXqFDmpZtjKpZw-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Commit 1bd71dce4bf2 tries to prevent a finishmigrate -> prelaunch
transition by exiting at the beginning of the main_loop_should_exit()
function if the state is already finishmigrate.

As the finishmigrate state is set in the migration thread it can
happen concurrently to the function. The migration thread and the
function are normally protected by the iothread mutex and thus the
state should no evolve between the start of the function and its end.

Unfortunately during the function life the lock is released by
pause_all_vcpus() just before the point we need to be sure we are
not in finishmigrate state and if the migration thread is waiting
for the lock it will take the opportunity to change the state
to finishmigrate.

The only way to be sure we are not in the finishmigrate state when
we need is to check the state after the pause_all_vcpus() function.

Fixes: 1bd71dce4bf2 ("runstate: ignore exit request in finish migrate state=
")
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 vl.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/vl.c b/vl.c
index 158a05ed32..ba3e176094 100644
--- a/vl.c
+++ b/vl.c
@@ -1604,9 +1604,6 @@ static bool main_loop_should_exit(void)
     RunState r;
     ShutdownCause request;
=20
-    if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
-        return false;
-    }
     if (preconfig_exit_requested) {
         if (runstate_check(RUN_STATE_PRECONFIG)) {
             runstate_set(RUN_STATE_PRELAUNCH);
@@ -1635,8 +1632,13 @@ static bool main_loop_should_exit(void)
         pause_all_vcpus();
         qemu_system_reset(request);
         resume_all_vcpus();
+        /*
+         * runstate can change in pause_all_vcpus()
+         * as iothread mutex is unlocked
+         */
         if (!runstate_check(RUN_STATE_RUNNING) &&
-                !runstate_check(RUN_STATE_INMIGRATE)) {
+                !runstate_check(RUN_STATE_INMIGRATE) &&
+                !runstate_check(RUN_STATE_FINISH_MIGRATE)) {
             runstate_set(RUN_STATE_PRELAUNCH);
         }
     }
--=20
2.24.1


