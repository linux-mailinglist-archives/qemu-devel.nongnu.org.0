Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD92C2C3B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:05:13 +0100 (CET)
Received: from localhost ([::1]:45758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khaoZ-0003TX-UB
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khamg-00026F-K3
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khamc-0006fB-8X
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606233789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ymlc93WzJ/6HnHj/g1ZnMnhNSsYC1BQKFIVvY4h5Iw8=;
 b=OCMkyIU4EFbol35xXG6u+1XoEj72VetT6VTGtcs1pQX33IXvO2+tXOaGOH8tLTKtd9mbHr
 4kk8UPdOscll2pnh+hBPsICwQ90LYlGl2bouR2mcWugQpBBUNE7ULilqA71XN0B+ImHkrt
 q3zlsLNLbEAcW7sy9NsaVAhKP3XOPNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-vMOD4LF7O2uojxSOaDIRaQ-1; Tue, 24 Nov 2020 11:03:04 -0500
X-MC-Unique: vMOD4LF7O2uojxSOaDIRaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B82C809DE3
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:03:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6592D189A4;
 Tue, 24 Nov 2020 16:02:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6F9539D92; Tue, 24 Nov 2020 17:02:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] meson: add module_trace & module_trace_src
Date: Tue, 24 Nov 2020 17:02:54 +0100
Message-Id: <20201124160255.28111-4-kraxel@redhat.com>
In-Reply-To: <20201124160255.28111-1-kraxel@redhat.com>
References: <20201124160255.28111-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build       |  3 ++-
 trace/meson.build | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index a85d331668fa..0000cc286120 100644
--- a/meson.build
+++ b/meson.build
@@ -1591,7 +1591,8 @@ foreach d, list : modules
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
index 552371b84241..b4e59ce9668b 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -1,6 +1,7 @@
 specific_ss.add(files('control-target.c'))
 
 trace_events_files = []
+module_trace = {}
 
 trace_events_config += {
   'file'  : meson.source_root() / 'trace-events',
@@ -18,6 +19,8 @@ foreach c : trace_events_config
   trace_events_files += [ trace_events_file ]
   group = '--group=' + c.get('group')
   fmt = '@0@-' + c.get('group') + '.@1@'
+  mod = c.get('module', '')
+  module_trace_src = []
 
   trace_h = custom_target(fmt.format('trace', 'h'),
                           output: fmt.format('trace', 'h'),
@@ -36,10 +39,10 @@ foreach c : trace_events_config
                                 input: trace_events_file,
                                 command: [ tracetool, group, '--format=ust-events-h', '@INPUT@' ],
                                 capture: true)
-    trace_ss.add(trace_ust_h, lttng, urcubp)
+    module_trace_src += [ trace_ust_h, lttng, urcubp ]
     genh += trace_ust_h
   endif
-  trace_ss.add(trace_h, trace_c)
+  module_trace_src += [ trace_h, trace_c ]
   if 'CONFIG_TRACE_DTRACE' in config_host
     trace_dtrace = custom_target(fmt.format('trace-dtrace', 'dtrace'),
                                  output: fmt.format('trace-dtrace', 'dtrace'),
@@ -50,17 +53,22 @@ foreach c : trace_events_config
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
2.27.0


