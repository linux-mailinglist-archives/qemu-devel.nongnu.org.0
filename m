Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F502C2C3C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:05:14 +0100 (CET)
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khaob-0003WL-GY
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khamf-00025U-Uo
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khamc-0006fC-5f
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606233789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WH5732k6G7uFmvrqu95elOeMvnSIYLKNtXbgVgzlLDQ=;
 b=fJ+0JZ2ZKxKupuvrKFvOXuPJNWWH/JYcxkoL8McikO9DzrZ7Jq1jcoLM9xGE/x07LdbRxD
 qR0Sf7yIYpkIwfnTYwVI0IkYZZQVbQvcKITAXwTTQdX4QjUG5CVzM5jbCmO3+oE2fzYPuu
 MlE2ktUZeW56ZF8Ouob6MKUeHIty6NU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-Qge7KQadNrmrqCWQIRUzRA-1; Tue, 24 Nov 2020 11:03:07 -0500
X-MC-Unique: Qge7KQadNrmrqCWQIRUzRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E1501007465
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:03:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A6D260BE5;
 Tue, 24 Nov 2020 16:02:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5C59417535; Tue, 24 Nov 2020 17:02:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] meson: add trace_events_config[]
Date: Tue, 24 Nov 2020 17:02:52 +0100
Message-Id: <20201124160255.28111-2-kraxel@redhat.com>
In-Reply-To: <20201124160255.28111-1-kraxel@redhat.com>
References: <20201124160255.28111-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
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
index 5062407c7052..b62f71c6b4f1 100644
--- a/meson.build
+++ b/meson.build
@@ -1386,6 +1386,7 @@ target_softmmu_arch = {}
 
 # TODO: add each directory to the subdirs from its own meson.build, once
 # we have those
+trace_events_config = []
 trace_events_subdirs = [
   'accel/kvm',
   'accel/tcg',
diff --git a/trace/meson.build b/trace/meson.build
index 843ea1449540..552371b84241 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -1,12 +1,23 @@
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
2.27.0


