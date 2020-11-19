Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79382B8DD4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 09:47:30 +0100 (CET)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffbF-0007OG-OX
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 03:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kffYt-0005bx-HT
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:45:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kffYr-0002K3-C4
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605775500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MM8jCfmBjgxwtUvR4dGJD1DN6ETQTKzmpXji6sS0Wzc=;
 b=hZpO1Fl1EUaL1H1r8uX6CRIIWB7QCabwBW1UIKXxN4M6zHDRjGBwaBdBu682VimySFHq2R
 i+PT7RemPQOtRa2saV3ich2AHzA4tbGrjgHX5gBCQAKjHMBBnxA8wJzxhMXBdrHICC15XV
 pbhDIdPFHsNWJRc2dmBqxPsE9jM5npE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-A91H2cslNu-l8QAire0ocA-1; Thu, 19 Nov 2020 03:44:57 -0500
X-MC-Unique: A91H2cslNu-l8QAire0ocA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5619364157
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:44:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B8995D9D5;
 Thu, 19 Nov 2020 08:44:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 16025A1EE; Thu, 19 Nov 2020 09:44:48 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] meson: add trace_events_config[]
Date: Thu, 19 Nov 2020 09:44:45 +0100
Message-Id: <20201119084448.24397-2-kraxel@redhat.com>
In-Reply-To: <20201119084448.24397-1-kraxel@redhat.com>
References: <20201119084448.24397-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
index 132bc4978242..04bd9b57e401 100644
--- a/meson.build
+++ b/meson.build
@@ -1365,6 +1365,7 @@ target_softmmu_arch = {}
 
 # TODO: add each directory to the subdirs from its own meson.build, once
 # we have those
+trace_events_config = []
 trace_events_subdirs = [
   'accel/kvm',
   'accel/tcg',
diff --git a/trace/meson.build b/trace/meson.build
index d5fc45c628d4..66395d3e2ba7 100644
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


