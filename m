Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B9C3A6901
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:29:14 +0200 (CEST)
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnaT-0001S6-7y
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnOf-0005JN-2F
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnOd-00088D-IM
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623680219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SF6gnA2Xyt9xGQy2f+xBIQc6mypDo9W6M+MZnaq4A4o=;
 b=QCJE84+3FkWXD/FlwAwDDUfvTtcYmNRA+FYTxjPp9n4vsQYqbzPvPIo9qORLEGvu6XqShs
 vyYbh1wlB3JrdKrBB21V1jyi8GYe1aRNtmzevK50FtlfsgF9ha39LV/Vfq6UJnEwZGGo8U
 375Cx2khLrgrmRRsaW2+O04exuO1Adw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-PpeJFid2P9eBUHUcbzD-9A-1; Mon, 14 Jun 2021 10:16:55 -0400
X-MC-Unique: PpeJFid2P9eBUHUcbzD-9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37C53107ACF6;
 Mon, 14 Jun 2021 14:16:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-55.ams2.redhat.com
 [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A41E819C66;
 Mon, 14 Jun 2021 14:16:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] migration: use GDateTime for formatting timestamp in
 snapshot names
Date: Mon, 14 Jun 2021 15:15:47 +0100
Message-Id: <20210614141549.100410-12-berrange@redhat.com>
In-Reply-To: <20210614141549.100410-1-berrange@redhat.com>
References: <20210614141549.100410-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GDateTime APIs provided by GLib avoid portability pitfalls, such
as some platforms where 'struct timeval.tv_sec' field is still 'long'
instead of 'time_t'. When combined with automatic cleanup, GDateTime
often results in simpler code too.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/savevm.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 52e2d72e4b..72848b946c 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2775,8 +2775,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
     QEMUFile *f;
     int saved_vm_running;
     uint64_t vm_state_size;
-    qemu_timeval tv;
-    struct tm tm;
+    g_autoptr(GDateTime) now = g_date_time_new_now_local();
     AioContext *aio_context;
 
     if (migration_is_blocked(errp)) {
@@ -2836,9 +2835,8 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
     memset(sn, 0, sizeof(*sn));
 
     /* fill auxiliary fields */
-    qemu_gettimeofday(&tv);
-    sn->date_sec = tv.tv_sec;
-    sn->date_nsec = tv.tv_usec * 1000;
+    sn->date_sec = g_date_time_to_unix(now);
+    sn->date_nsec = g_date_time_get_microsecond(now) * 1000;
     sn->vm_clock_nsec = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     if (replay_mode != REPLAY_MODE_NONE) {
         sn->icount = replay_get_current_icount();
@@ -2849,9 +2847,8 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
     if (name) {
         pstrcpy(sn->name, sizeof(sn->name), name);
     } else {
-        /* cast below needed for OpenBSD where tv_sec is still 'long' */
-        localtime_r((const time_t *)&tv.tv_sec, &tm);
-        strftime(sn->name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", &tm);
+        g_autofree char *autoname = g_date_time_format(now,  "vm-%Y%m%d%H%M%S");
+        pstrcpy(sn->name, sizeof(sn->name), autoname);
     }
 
     /* save the VM state */
-- 
2.31.1


