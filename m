Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193A9581E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 09:18:03 +0200 (CEST)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzyP3-0007qp-Ob
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 03:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8Y-0005gQ-4I
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:01:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8W-0003NE-Tv
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19919)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzy8U-0003IO-BE
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D515C300895A
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 07:00:51 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-20.ams2.redhat.com
 [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDB8B11E523;
 Tue, 20 Aug 2019 07:00:50 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 08:59:37 +0200
Message-Id: <1566284395-30287-19-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
References: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 20 Aug 2019 07:00:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 18/36] replay: Remove host_clock_last
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Now we're not using the 'last' field in the timer, remove it from
replay.

Bump the version number of the replay structure since we've
removed the field.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20190724115823.4199-4-dgilbert@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 replay/replay-snapshot.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
index 756f48b..3a58734 100644
--- a/replay/replay-snapshot.c
+++ b/replay/replay-snapshot.c
@@ -24,7 +24,6 @@ static int replay_pre_save(void *opaque)
 {
     ReplayState *state = opaque;
     state->file_offset = ftell(replay_file);
-    state->host_clock_last = qemu_clock_get_last(QEMU_CLOCK_HOST);
 
     return 0;
 }
@@ -34,7 +33,6 @@ static int replay_post_load(void *opaque, int version_id)
     ReplayState *state = opaque;
     if (replay_mode == REPLAY_MODE_PLAY) {
         fseek(replay_file, state->file_offset, SEEK_SET);
-        qemu_clock_set_last(QEMU_CLOCK_HOST, state->host_clock_last);
         /* If this was a vmstate, saved in recording mode,
            we need to initialize replay data fields. */
         replay_fetch_data_kind();
@@ -50,8 +48,8 @@ static int replay_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_replay = {
     .name = "replay",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .pre_save = replay_pre_save,
     .post_load = replay_post_load,
     .fields = (VMStateField[]) {
@@ -62,7 +60,6 @@ static const VMStateDescription vmstate_replay = {
         VMSTATE_UINT32(has_unread_data, ReplayState),
         VMSTATE_UINT64(file_offset, ReplayState),
         VMSTATE_UINT64(block_request_id, ReplayState),
-        VMSTATE_UINT64(host_clock_last, ReplayState),
         VMSTATE_INT32(read_event_kind, ReplayState),
         VMSTATE_UINT64(read_event_id, ReplayState),
         VMSTATE_INT32(read_event_checkpoint, ReplayState),
-- 
1.8.3.1



