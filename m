Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39CC3A2951
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:26:09 +0200 (CEST)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHt2-0007In-Pc
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHjf-00070i-2b
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHjc-0001IV-QQ
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623320183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYeo3QXoPV73JdQivHo9olDHnBSgCEcjDl7hZRRp+Tw=;
 b=ICExy4WwVd/e5/iS6N+sYuviAZs3DfrsLKjIATD52koKHCX3mRtbvF6aqnIxkv4WPaoops
 wsTZ+1Glqdcbo90VgxeBldYwdPf0siZ2OF5OfYyv6XAcw7SxQjep0l+v3cunSQOMGJG2r3
 Ocp9l5Z837Qdcc1V0FVeTn1xiP3hxS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-NGbBOvdlNtO8SCUQ5R_57A-1; Thu, 10 Jun 2021 06:16:22 -0400
X-MC-Unique: NGbBOvdlNtO8SCUQ5R_57A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A43118D6A25;
 Thu, 10 Jun 2021 10:16:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C8226091A;
 Thu, 10 Jun 2021 10:16:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2B2AF180093F; Thu, 10 Jun 2021 12:15:53 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] modules: target-specific module build infrastructure
Date: Thu, 10 Jun 2021 12:15:52 +0200
Message-Id: <20210610101553.943689-4-kraxel@redhat.com>
In-Reply-To: <20210610101553.943689-1-kraxel@redhat.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 cfontana@suse.de, jose.ziviani@suse.com, pbonzini@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meson.build b/meson.build
index 9823c5889140..a22c26850429 100644
--- a/meson.build
+++ b/meson.build
@@ -1781,6 +1781,7 @@ user_ss = ss.source_set()
 util_ss = ss.source_set()
 
 modules = {}
+target_modules = {}
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
@@ -2052,6 +2053,31 @@ foreach d, list : modules
   endforeach
 endforeach
 
+foreach d, list : target_modules
+  foreach m, module_ss : list
+    if enable_modules and targetos != 'windows'
+      foreach target : target_dirs
+        config_target = config_target_mak[target]
+        config_target += config_host
+        target_inc = [include_directories('target' / config_target['TARGET_BASE_ARCH'])]
+        c_args = ['-DNEED_CPU_H',
+                  '-DCONFIG_TARGET="@0@-config-target.h"'.format(target),
+                  '-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target)]
+        target_module_ss = module_ss.apply(config_target, strict: false)
+        sl = static_library(target + '-' + d + '-' + m,
+                            [genh, target_module_ss.sources()],
+                            dependencies: [modulecommon, target_module_ss.dependencies()],
+                            include_directories: target_inc,
+                            c_args: c_args,
+                            pic: true)
+        softmmu_mods += sl
+      endforeach
+    else
+      specific_ss.add_all(module_ss)
+    endif
+  endforeach
+endforeach
+
 nm = find_program('nm')
 undefsym = find_program('scripts/undefsym.py')
 block_syms = custom_target('block.syms', output: 'block.syms',
-- 
2.31.1


