Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F226D8A1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 12:17:07 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIqyQ-0008Ii-Nq
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 06:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIqv4-0004Ps-T6
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 06:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIquy-0003on-Mz
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 06:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600337611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oal3Tf1tUaESgH+g0IqJDaI2vrUq+fcCgVPBMvgFDMY=;
 b=aKY1revBjGVb814SEW4F3JIiLkLA5RcDOeTPHcxdiNHHUPHAc6Uulr4wgxrtEA6aW2zY61
 W5xE8odK9+EU1lViXIBhaqvJRXT3HQ7FyLlXhtWn25uBz4jrZCKlPexuOjeOCfRBxCpq1Z
 E5BzcarJ5hu7C5Iq5gkgyGoNfbPcWB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-XFCiUbOZMC6dNo-VX-JeoA-1; Thu, 17 Sep 2020 06:13:29 -0400
X-MC-Unique: XFCiUbOZMC6dNo-VX-JeoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B75411018727
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 10:13:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61EBA1964C;
 Thu, 17 Sep 2020 10:13:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9CE2A9A8F; Thu, 17 Sep 2020 12:13:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] chardev/spice: build spice chardevs as module
Date: Thu, 17 Sep 2020 12:13:20 +0200
Message-Id: <20200917101320.25285-5-kraxel@redhat.com>
In-Reply-To: <20200917101320.25285-1-kraxel@redhat.com>
References: <20200917101320.25285-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c       | 2 ++
 chardev/meson.build | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 34772e7d87eb..86781c207f7d 100644
--- a/util/module.c
+++ b/util/module.c
@@ -268,6 +268,8 @@ static struct {
     { "virtio-gpu-device",     "hw-", "display-virtio-gpu"    },
     { "vhost-user-gpu",        "hw-", "display-virtio-gpu"    },
     { "chardev-braille",       "chardev-", "baum"             },
+    { "chardev-spicevmc",      "chardev-", "spice"            },
+    { "chardev-spiceport",     "chardev-", "spice"            },
 };
 
 static bool module_loaded_qom_all;
diff --git a/chardev/meson.build b/chardev/meson.build
index 54e88d031004..85f3464d2971 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -32,7 +32,6 @@ libchardev = static_library('chardev', chardev_ss.sources() + genh,
 chardev = declare_dependency(link_whole: libchardev)
 
 softmmu_ss.add(files('chardev-sysemu.c', 'msmouse.c', 'wctablet.c', 'testdev.c'))
-softmmu_ss.add(when: ['CONFIG_SPICE', spice], if_true: files('spice.c'))
 
 chardev_modules = {}
 
@@ -42,4 +41,10 @@ if config_host.has_key('CONFIG_BRLAPI')
   chardev_modules += { 'baum': module_ss }
 endif
 
+if config_host.has_key('CONFIG_SPICE')
+  module_ss = ss.source_set()
+  module_ss.add(when: [spice], if_true: files('spice.c'))
+  chardev_modules += { 'spice': module_ss }
+endif
+
 modules += { 'chardev': chardev_modules }
-- 
2.27.0


