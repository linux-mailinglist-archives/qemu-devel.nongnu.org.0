Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632D039742B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:28:39 +0200 (CEST)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4Ri-00010l-Ed
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4OT-0002z9-NB
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4OR-0007ib-1q
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIzAkFblQQyoSZCk5PvWy8jsgPBiIsSm8FqckkOpJNw=;
 b=aZRCWi2Btf0OsqLmmIMfZ5949D4xPTzceZq1t8LyZL6b43l0iUe20crAzd9NmpAJ9dCjmV
 o961D2dRqFPZuMrrDIjTz650Zu5+kNa4VZFCpRPkhhoefrBg2IFsFdJazZGtXhAI2DziqF
 pM7ENyfVa1A3x29/IJBeGOZb+emE3Hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460--ZOS9r2nO_KxG9rs9rcu2Q-1; Tue, 01 Jun 2021 09:25:12 -0400
X-MC-Unique: -ZOS9r2nO_KxG9rs9rcu2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFF328015F8
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:25:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF4C5D751;
 Tue,  1 Jun 2021 13:25:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B0D6918007AE; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/13] trace/stap: build stap files for modules
Date: Tue,  1 Jun 2021 15:24:10 +0200
Message-Id: <20210601132414.432430-10-kraxel@redhat.com>
In-Reply-To: <20210601132414.432430-1-kraxel@redhat.com>
References: <20210601132414.432430-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build       | 32 ++++++++++++++++++++++++++++++++
 trace/meson.build |  5 +++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 0e1c2f995d79..51fc261a22d3 100644
--- a/meson.build
+++ b/meson.build
@@ -2020,6 +2020,7 @@ foreach d, list : modules
       module_ss = module_ss.apply(config_all, strict: false)
       module_trace_cfg = module_trace.get(d + '-' + m, {})
       module_trace_src = module_trace_cfg.get('src', [])
+      module_trace_evt = module_trace_cfg.get('evt', '')
       sl = static_library(d + '-' + m, [genh, module_ss.sources(), module_trace_src],
                           dependencies: [modulecommon, module_ss.dependencies()], pic: true)
       if d == 'block'
@@ -2027,6 +2028,37 @@ foreach d, list : modules
       else
         softmmu_mods += sl
       endif
+      if 'CONFIG_TRACE_SYSTEMTAP' in config_host and module_trace_evt != ''
+        modname = d + '-' + m
+	modlib = modname + '.so'
+        foreach stp: [
+          {'ext': '.stp-build', 'fmt': 'stap', 'bin': meson.current_build_dir() / modlib, 'install': false},
+          {'ext': '.stp', 'fmt': 'stap', 'bin': get_option('prefix') / qemu_moddir / modlib, 'install': true},
+          {'ext': '-simpletrace.stp', 'fmt': 'simpletrace-stap', 'bin': '', 'install': true},
+          {'ext': '-log.stp', 'fmt': 'log-stap', 'bin': '', 'install': true},
+        ]
+          foreach target : target_dirs
+            config_target = config_target_mak[target]
+            target_name = config_target['TARGET_NAME']
+            if target.endswith('-softmmu')
+              custom_target(modname + '-' + target_name + stp['ext'],
+                            input: module_trace_evt,
+                            output: modname + '-' + target_name + stp['ext'],
+                            install: stp['install'],
+                            install_dir: get_option('datadir') / 'systemtap/tapset',
+                            command: [
+                              tracetool, '--group=all', '--format=' + stp['fmt'],
+                              '--binary=' + stp['bin'],
+                              '--target-name=' + target_name,
+                              '--target-type=system',
+                              '--probe-prefix=qemu.system.' + target_name,
+                              '@INPUT@', '@OUTPUT@'
+                            ],
+                            depend_files: tracetool_depends)
+            endif
+          endforeach
+        endforeach
+      endif
     else
       if d == 'block'
         block_ss.add_all(module_ss)
diff --git a/trace/meson.build b/trace/meson.build
index 834ebaa7cc5f..82332a4a772b 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -16,7 +16,6 @@ endforeach
 
 foreach c : trace_events_config
   trace_events_file = c.get('file')
-  trace_events_files += [ trace_events_file ]
   module_name = c.get('module', '')
   group_name = c.get('group', module_name.underscorify())
   group = '--group=' + group_name
@@ -66,9 +65,11 @@ foreach c : trace_events_config
     genh += trace_dtrace_h
   endif
   if enable_modules and module_name != ''
-    module_trace += { module_name : { 'src' : module_trace_src } }
+    module_trace += { module_name : { 'src' : module_trace_src,
+                                      'evt' : trace_events_file } }
   else
     trace_ss.add(module_trace_src)
+    trace_events_files += [ trace_events_file ]
   endif
 endforeach
 
-- 
2.31.1


