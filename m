Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEFD270F85
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 18:29:36 +0200 (CEST)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJfjz-0008S6-Ro
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 12:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfHO-0005UR-Eu
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 12:00:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfH9-0007PP-D3
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 12:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600531185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9hu2qGSMErt6AZDRaAjD/LRFTC6mzFaMd/u7evVSb0=;
 b=RpLl9VSDa5M2jjGjPQJ5EZIXX/cPAZT+ojztyoz9bF0wwZv9CyvJJ0q21nulKGKFTvYIOL
 o34VFmsDKI+ci81CM2+VxBpR0plgQGO/llT4xBfYdYn+mkfButXTpuvSh28MQSBbcrMg7m
 o+i+icR0meZtWqUJHT3rlDHLMfFgUq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-fDwSRSlSP7OD1xjaHHv_Cw-1; Sat, 19 Sep 2020 11:59:43 -0400
X-MC-Unique: fDwSRSlSP7OD1xjaHHv_Cw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C73371006710
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 15:59:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92A4610016DA
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 15:59:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/57] meson: extend libmpathpersist test for static linking
Date: Sat, 19 Sep 2020 11:58:52 -0400
Message-Id: <20200919155916.1046398-34-pbonzini@redhat.com>
In-Reply-To: <20200919155916.1046398-1-pbonzini@redhat.com>
References: <20200919155916.1046398-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 06:41:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libmultipath has a dependency on libdevmapper, so
include it as well when static linking.  It seems that
the rabbit hole ends there.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 4d617d7561..8484e24720 100644
--- a/meson.build
+++ b/meson.build
@@ -302,14 +302,25 @@ if targetos == 'linux' and not get_option('mpath').disabled()
           mpath_lib_init(udev);
           return 0;
       }'''
-  libmultipath = cc.find_library('multipath',
-                                 required: get_option('mpath'),
-                                 static: enable_static)
-  libmpathpersist = cc.find_library('mpathpersist',
-                                    required: get_option('mpath'),
-                                    static: enable_static)
-  if libmultipath.found() and libmpathpersist.found() and libudev.found()
-    mpathlibs = [libmultipath, libmpathpersist, libudev]
+  mpathlibs = [libudev]
+  if enable_static
+    mpathlibs += cc.find_library('devmapper',
+                                   required: get_option('mpath'),
+                                   static: enable_static)
+  endif
+  mpathlibs += cc.find_library('multipath',
+                               required: get_option('mpath'),
+                               static: enable_static)
+  mpathlibs += cc.find_library('mpathpersist',
+                               required: get_option('mpath'),
+                               static: enable_static)
+  foreach lib: mpathlibs
+    if not lib.found()
+      mpathlibs = []
+      break
+    endif
+  endforeach
+  if mpathlibs.length() > 0
     if cc.links(mpath_test_source_new, dependencies: mpathlibs)
       mpathpersist = declare_dependency(dependencies: mpathlibs)
       mpathpersist_new_api = true
-- 
2.26.2



