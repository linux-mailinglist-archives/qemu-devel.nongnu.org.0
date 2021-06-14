Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A622E3A68E7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:22:47 +0200 (CEST)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnUE-0007kw-Mc
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnOl-0005UW-Ra
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lsnOh-00089s-02
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623680222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zKXLzUGQddzKdhiPGzzYpWf5P08Di07lGpeA7yAadI=;
 b=fbx/XkY84FUe7mkCP8Cu+Iq7cfwxd++x1/UOYKovezfMxlPc4uJ4BGQ3GZbfcqQNlvdNKE
 Y48xStS09FZYbkxT8rCdMoy841kXpZSptKwcezgGB4XfMZKe7Y/5EHDykT/Y16E3U8VTWR
 HybU7d5BfZwSijfhRcFhbmIlNcddgOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-Kb7-9YHAO9ShklPqIllgmA-1; Mon, 14 Jun 2021 10:16:58 -0400
X-MC-Unique: Kb7-9YHAO9ShklPqIllgmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 491B8100C661;
 Mon, 14 Jun 2021 14:16:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-55.ams2.redhat.com
 [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94B8519C66;
 Mon, 14 Jun 2021 14:16:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] block: use GDateTime for formatting timestamp when
 dumping snapshot info
Date: Mon, 14 Jun 2021 15:15:48 +0100
Message-Id: <20210614141549.100410-13-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/qapi.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index dc69341bfe..cf557e3aea 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -663,10 +663,8 @@ BlockStatsList *qmp_query_blockstats(bool has_query_nodes,
 
 void bdrv_snapshot_dump(QEMUSnapshotInfo *sn)
 {
-    char date_buf[128], clock_buf[128];
+    char clock_buf[128];
     char icount_buf[128] = {0};
-    struct tm tm;
-    time_t ti;
     int64_t secs;
     char *sizing = NULL;
 
@@ -674,10 +672,9 @@ void bdrv_snapshot_dump(QEMUSnapshotInfo *sn)
         qemu_printf("%-10s%-17s%8s%20s%13s%11s",
                     "ID", "TAG", "VM SIZE", "DATE", "VM CLOCK", "ICOUNT");
     } else {
-        ti = sn->date_sec;
-        localtime_r(&ti, &tm);
-        strftime(date_buf, sizeof(date_buf),
-                 "%Y-%m-%d %H:%M:%S", &tm);
+        g_autoptr(GDateTime) date = g_date_time_new_from_unix_local(sn->date_sec);
+        g_autofree char *date_buf = g_date_time_format(date, "%Y-%m-%d %H:%M:%S");
+
         secs = sn->vm_clock_nsec / 1000000000;
         snprintf(clock_buf, sizeof(clock_buf),
                  "%02d:%02d:%02d.%03d",
-- 
2.31.1


