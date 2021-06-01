Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0454397426
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:27:02 +0200 (CEST)
Received: from localhost ([::1]:53396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4Q9-0005r5-UR
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4OU-0002zv-4r
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4OS-0007jH-3a
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dt7vWFEn+keuyAa/I70krfhnNtm+YyDUAktbvUfxM3o=;
 b=hVnDKfvSaxh3d2/GpiqjCPHWfSl2YBzc+5YtAq/AkN7F9nLZvc5QP+JywWwrHA74udaT/u
 Ib1yLJnGVuUIM/2pqDtd6g7VoRECfZJ4i5+jSNwkNo/FsOYmTbNu+7duZbjs32ikoVLk0V
 8gioxL20ax+FqFWMtO6XyTGBJ9UYWoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-ozxFfBF5MhOdUAntJW6R1A-1; Tue, 01 Jun 2021 09:25:13 -0400
X-MC-Unique: ozxFfBF5MhOdUAntJW6R1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D71ED803622
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:25:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B87436807;
 Tue,  1 Jun 2021 13:25:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A33A418007A2; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/13] meson: add module_trace & module_trace_src
Date: Tue,  1 Jun 2021 15:24:09 +0200
Message-Id: <20210601132414.432430-9-kraxel@redhat.com>
In-Reply-To: <20210601132414.432430-1-kraxel@redhat.com>
References: <20210601132414.432430-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

module_trace is a dict which keeps track of the trace source files for a
module.

module_trace_src collects the trace source files for a given trace-events file,
which then either added to the source set or to a new module_trace dict
depending on whenever they are for a module or core qemu.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 meson.build       |  5 ++++-
 trace/meson.build | 17 ++++++++++++-----
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index b1f2e7920977..0e1c2f995d79 100644
--- a/meson.build
+++ b/meson.build
@@ -1763,6 +1763,7 @@ user_ss = ss.source_set()
 util_ss = ss.source_set()
 
 modules = {}
+module_trace = {}
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
@@ -2017,7 +2018,9 @@ foreach d, list : modules
   foreach m, module_ss : list
     if enable_modules and targetos != 'windows'
       module_ss = module_ss.apply(config_all, strict: false)
-      sl = static_library(d + '-' + m, [genh, module_ss.sources()],
+      module_trace_cfg = module_trace.get(d + '-' + m, {})
+      module_trace_src = module_trace_cfg.get('src', [])
+      sl = static_library(d + '-' + m, [genh, module_ss.sources(), module_trace_src],
                           dependencies: [modulecommon, module_ss.dependencies()], pic: true)
       if d == 'block'
         block_mods += sl
diff --git a/trace/meson.build b/trace/meson.build
index bc946495a714..834ebaa7cc5f 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -17,9 +17,11 @@ endforeach
 foreach c : trace_events_config
   trace_events_file = c.get('file')
   trace_events_files += [ trace_events_file ]
-  group_name = c.get('group')
+  module_name = c.get('module', '')
+  group_name = c.get('group', module_name.underscorify())
   group = '--group=' + group_name
   fmt = '@0@-' + group_name + '.@1@'
+  module_trace_src = []
 
   trace_h = custom_target(fmt.format('trace', 'h'),
                           output: fmt.format('trace', 'h'),
@@ -38,10 +40,10 @@ foreach c : trace_events_config
                                 input: trace_events_file,
                                 command: [ tracetool, group, '--format=ust-events-h', '@INPUT@', '@OUTPUT@' ],
                                 depend_files: tracetool_depends)
-    trace_ss.add(trace_ust_h, lttng, urcubp)
+    module_trace_src += [ trace_ust_h, lttng, urcubp ]
     genh += trace_ust_h
   endif
-  trace_ss.add(trace_h, trace_c)
+  module_trace_src += [ trace_h, trace_c ]
   if 'CONFIG_TRACE_DTRACE' in config_host
     trace_dtrace = custom_target(fmt.format('trace-dtrace', 'dtrace'),
                                  output: fmt.format('trace-dtrace', 'dtrace'),
@@ -52,17 +54,22 @@ foreach c : trace_events_config
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
+  if enable_modules and module_name != ''
+    module_trace += { module_name : { 'src' : module_trace_src } }
+  else
+    trace_ss.add(module_trace_src)
+  endif
 endforeach
 
 trace_events_all = custom_target('trace-events-all',
-- 
2.31.1


