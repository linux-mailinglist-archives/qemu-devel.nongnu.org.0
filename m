Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B94A2FEAA8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:52:33 +0100 (CET)
Received: from localhost ([::1]:44518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZRw-0006pN-9y
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQI-0005T8-H6
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQA-0003Qa-Q3
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611233440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7lc8BnwFQ/6CwvlweZPvkXTyV5sQvoKgEv2SCOfHzXE=;
 b=VJcTfxuli/Sf0AxT8Bn1n7VjPl2cnOzWmrQvKSc/hCR41TBUQ8zAPZIIDIK8+BQatkh2NK
 5C8CEW9A+eOL//x4iAaDjRn13wnEuEryXXBTDecxU5/hkMTzTtfBoCzWURXku73H1XD9Ko
 Zc3skfTz+VTdzdHwNjKyYvfx8hYjk98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-y6aDet9zOP-ekizSYgpxmg-1; Thu, 21 Jan 2021 07:50:37 -0500
X-MC-Unique: y6aDet9zOP-ekizSYgpxmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A3B21005D50
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:50:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 571C15D749;
 Thu, 21 Jan 2021 12:50:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CDC27180039D; Thu, 21 Jan 2021 13:50:28 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/8] meson: add trace_events_config[]
Date: Thu, 21 Jan 2021 13:50:21 +0100
Message-Id: <20210121125028.3247190-2-kraxel@redhat.com>
In-Reply-To: <20210121125028.3247190-1-kraxel@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's an array of dicts, where each dict holds the configuration for one
trace-events file.  For now just fill it from trace_events_subdirs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build       |  1 +
 trace/meson.build | 21 ++++++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index af2bc8974111..1f3d48b53a06 100644
--- a/meson.build
+++ b/meson.build
@@ -1677,6 +1677,7 @@ target_softmmu_arch = {}
 
 # TODO: add each directory to the subdirs from its own meson.build, once
 # we have those
+trace_events_config = []
 trace_events_subdirs = [
   'accel/kvm',
   'accel/tcg',
diff --git a/trace/meson.build b/trace/meson.build
index a0be8f9b0db9..3a2b39dd6291 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -2,12 +2,23 @@
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
-  group = '--group=' + group_name
-  fmt = '@0@-' + group_name + '.@1@'
+  group = '--group=' + c.get('group')
+  fmt = '@0@-' + c.get('group') + '.@1@'
 
   trace_h = custom_target(fmt.format('trace', 'h'),
                           output: fmt.format('trace', 'h'),
-- 
2.29.2


