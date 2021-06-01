Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E148C397470
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:37:05 +0200 (CEST)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4Zs-0000bZ-Ug
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4OG-0002IQ-FF
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4OE-0007ab-RC
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OUpCO7YtxZeJ9uzwyHxjLe7IVac+o4JnDksCh3ohz4=;
 b=FefSUvqNaN0C1ZgR29qYZB/28HS0DwHfLuhXeQ9Xji48FfBpTyhLD1IPt9reuPc0Jwmp4Q
 D/zrhlNjgCOg7T+pN122vyeYjfPZGmSxHP/a1THqy+iqrPj4IV2KOSQ6FatYy5mYD1hB37
 Je60rUGPx/0ujl9l3OnBfkEXn4Q5zLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-xpFWjixpM32M-Rv2jfIa0g-1; Tue, 01 Jun 2021 09:25:00 -0400
X-MC-Unique: xpFWjixpM32M-Rv2jfIa0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97E61107ACED
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:24:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5B865D9CD;
 Tue,  1 Jun 2021 13:24:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8BB9F18003B0; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/13] meson: add trace_events_config[]
Date: Tue,  1 Jun 2021 15:24:07 +0200
Message-Id: <20210601132414.432430-7-kraxel@redhat.com>
In-Reply-To: <20210601132414.432430-1-kraxel@redhat.com>
References: <20210601132414.432430-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's an array of dicts, where each dict holds the configuration for one
trace-events file.  For now just fill it from trace_events_subdirs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 meson.build       |  1 +
 trace/meson.build | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index a45f1a844f13..84a9e17533cb 100644
--- a/meson.build
+++ b/meson.build
@@ -1774,6 +1774,7 @@ target_user_arch = {}
 
 # TODO: add each directory to the subdirs from its own meson.build, once
 # we have those
+trace_events_config = []
 trace_events_subdirs = [
   'crypto',
   'qapi',
diff --git a/trace/meson.build b/trace/meson.build
index 08f83a15c316..bc946495a714 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -2,10 +2,22 @@
 specific_ss.add(files('control-target.c'))
 
 trace_events_files = []
-foreach dir : [ '.' ] + trace_events_subdirs
-  trace_events_file = meson.source_root() / dir / 'trace-events'
+
+trace_events_config += {
+  'file'  : meson.source_root() / 'trace-events',
+  'group' : 'root',
+}
+foreach dir : trace_events_subdirs
+  trace_events_config += {
+    'file'  : meson.source_root() / dir / 'trace-events',
+    'group' : dir.underscorify(),
+  }
+endforeach
+
+foreach c : trace_events_config
+  trace_events_file = c.get('file')
   trace_events_files += [ trace_events_file ]
-  group_name = dir == '.' ? 'root' : dir.underscorify()
+  group_name = c.get('group')
   group = '--group=' + group_name
   fmt = '@0@-' + group_name + '.@1@'
 
-- 
2.31.1


