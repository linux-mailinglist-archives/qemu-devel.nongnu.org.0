Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402202FEAC0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:55:51 +0100 (CET)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZV8-0001rX-9f
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQJ-0005Tx-DB
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQA-0003Qn-Ru
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611233440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5w+EbpxTtIo2va5BC74piYddpK5j2FGaK9bouiZ6lPg=;
 b=PHue0WRI1a6ZfXRZ65pk6VQU844pz3HNq2Qguf6LSJc5IFzB//rgFMWVPgKZhXeGy+gdCi
 ChfMmHSVj2H9+Ix2EQx0vjAgdwFywKnWln3IW7MEjDT7ocoDX5MHVa0qecIOKQ3sCiPGZ2
 AIcUPKTZxl3rP9C/zB2cop2RX1jO0Co=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-t2ZhqHRRP9mL1is-Z0wrnw-1; Thu, 21 Jan 2021 07:50:37 -0500
X-MC-Unique: t2ZhqHRRP9mL1is-Z0wrnw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADAF31572E
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:50:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85E735C8A7;
 Thu, 21 Jan 2021 12:50:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E439F18003AD; Thu, 21 Jan 2021 13:50:28 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/8] meson: add module_trace & module_trace_src
Date: Thu, 21 Jan 2021 13:50:23 +0100
Message-Id: <20210121125028.3247190-4-kraxel@redhat.com>
In-Reply-To: <20210121125028.3247190-1-kraxel@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

module_trace is a dict which keeps track of the trace source files for a
module.

module_trace_src collects the trace source files for a given trace-events file,
which then either added to the source set or to a new module_trace dict
depending on whenever they are for a module or core qemu.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build       |  3 ++-
 trace/meson.build | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 7462a50b4c36..a073fcd301c5 100644
--- a/meson.build
+++ b/meson.build
@@ -1890,7 +1890,8 @@ foreach d, list : modules
   foreach m, module_ss : list
     if enable_modules and targetos != 'windows'
       module_ss = module_ss.apply(config_all, strict: false)
-      sl = static_library(d + '-' + m, [genh, module_ss.sources()],
+      module_trace_src = module_trace.get(d + '-' + m, [])
+      sl = static_library(d + '-' + m, [genh, module_ss.sources(), module_trace_src],
                           dependencies: [modulecommon, module_ss.dependencies()], pic: true)
       if d == 'block'
         block_mods += sl
diff --git a/trace/meson.build b/trace/meson.build
index 3a2b39dd6291..843b472ba943 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -2,6 +2,7 @@
 specific_ss.add(files('control-target.c'))
 
 trace_events_files = []
+module_trace = {}
 
 trace_events_config += {
   'file'  : meson.source_root() / 'trace-events',
@@ -19,6 +20,8 @@ foreach c : trace_events_config
   trace_events_files += [ trace_events_file ]
   group = '--group=' + c.get('group')
   fmt = '@0@-' + c.get('group') + '.@1@'
+  mod = c.get('module', '')
+  module_trace_src = []
 
   trace_h = custom_target(fmt.format('trace', 'h'),
                           output: fmt.format('trace', 'h'),
@@ -34,10 +37,10 @@ foreach c : trace_events_config
                                 output: fmt.format('trace-ust', 'h'),
                                 input: trace_events_file,
                                 command: [ tracetool, group, '--format=ust-events-h', '@INPUT@', '@OUTPUT@' ])
-    trace_ss.add(trace_ust_h, lttng, urcubp)
+    module_trace_src += [ trace_ust_h, lttng, urcubp ]
     genh += trace_ust_h
   endif
-  trace_ss.add(trace_h, trace_c)
+  module_trace_src += [ trace_h, trace_c ]
   if 'CONFIG_TRACE_DTRACE' in config_host
     trace_dtrace = custom_target(fmt.format('trace-dtrace', 'dtrace'),
                                  output: fmt.format('trace-dtrace', 'dtrace'),
@@ -47,17 +50,22 @@ foreach c : trace_events_config
                                    output: fmt.format('trace-dtrace', 'h'),
                                    input: trace_dtrace,
                                    command: [ 'dtrace', '-DSTAP_SDT_V2', '-o', '@OUTPUT@', '-h', '-s', '@INPUT@' ])
-    trace_ss.add(trace_dtrace_h)
+    module_trace_src += trace_dtrace_h
     if host_machine.system() != 'darwin'
       trace_dtrace_o = custom_target(fmt.format('trace-dtrace', 'o'),
                                      output: fmt.format('trace-dtrace', 'o'),
                                      input: trace_dtrace,
                                      command: [ 'dtrace', '-DSTAP_SDT_V2', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
-      trace_ss.add(trace_dtrace_o)
+      module_trace_src += trace_dtrace_o
     endif
 
     genh += trace_dtrace_h
   endif
+  if enable_modules and mod != ''
+    module_trace += { mod : module_trace_src }
+  else
+    trace_ss.add(module_trace_src)
+  endif
 endforeach
 
 trace_events_all = custom_target('trace-events-all',
-- 
2.29.2


