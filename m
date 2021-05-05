Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38BA3738B5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:42:33 +0200 (CEST)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEzA-0006dw-RS
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEuZ-0000pe-Pv
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:37:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEuY-0007Y8-3f
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620211065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2tCd5oUFZas3PBfiTRziGnVzff7j9B7otk8MCJCnpaU=;
 b=O6TAYVX2WY9sqErAMbsHBDAh4AKB/QoZQZXIJwlkhhjDFplmzDOXLiduxfUNwQfg/HL9RE
 a+DnEyvexc4GvdYEGVn/vX0plmJ14etDzyDxHNDYnYYvM5LwKt/vfqcLN+s2TwWmkEUy0m
 C3NEGU5BloOj0GakIZmEhxEBzSzJcX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-mz1bPctEOXuZagLhtuudfA-1; Wed, 05 May 2021 06:37:44 -0400
X-MC-Unique: mz1bPctEOXuZagLhtuudfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECFD21020C20;
 Wed,  5 May 2021 10:37:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B40995C3E0;
 Wed,  5 May 2021 10:37:25 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] block: use GDateTime for formatting timestamp when
 dumping snapshot info
Date: Wed,  5 May 2021 11:36:57 +0100
Message-Id: <20210505103702.521457-3-berrange@redhat.com>
In-Reply-To: <20210505103702.521457-1-berrange@redhat.com>
References: <20210505103702.521457-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 virtio-fs@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GDateTime APIs provided by GLib avoid portability pitfalls, such
as some platforms where 'struct timeval.tv_sec' field is still 'long'
instead of 'time_t'. When combined with automatic cleanup, GDateTime
often results in simpler code too.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/qapi.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index 943e7b15ad..06851fb469 100644
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


