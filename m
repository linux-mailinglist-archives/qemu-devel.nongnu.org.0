Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F4A32EEBF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:25:42 +0100 (CET)
Received: from localhost ([::1]:59150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICKj-0002Fj-Om
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIC7Q-0000Ji-Ea
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:11:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lIC7K-0000YO-35
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:11:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614957109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4ULXyEp5tV+JRrFBklGVGN4Ny53XdvyHZfUVKFwFI0=;
 b=FCN0sEvD3rKA91FlfA6EeyNkDQLkLBJeQcaod9HgqBebLpXDrXaYvxTNbt4g73uWP5sA+7
 SxvdqWqth+3Gb0CzK3Ox0xPcsDSg9n5Ft55s6mvDqX0Di3dJh+Lpu+VBtX3c40nbtmB9+3
 jF6rS2vFMbuvzj8AgrwXr+AeCZrpxzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-3AawvJjmP_-T3vci8-UbGA-1; Fri, 05 Mar 2021 10:11:47 -0500
X-MC-Unique: 3AawvJjmP_-T3vci8-UbGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 584A2E4962;
 Fri,  5 Mar 2021 15:11:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CCE35D6DC;
 Fri,  5 Mar 2021 15:11:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8D8061131C01; Fri,  5 Mar 2021 16:11:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] qapi: Remove QMP events and commands from user-mode builds
Date: Fri,  5 Mar 2021 16:11:42 +0100
Message-Id: <20210305151143.741181-4-armbru@redhat.com>
In-Reply-To: <20210305151143.741181-1-armbru@redhat.com>
References: <20210305151143.741181-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We removed the QMP loop in user-mode builds in commit 1935e0e4e09
("qapi/meson: Remove QMP from user-mode emulation"), now commands
and events code is unreachable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210224171642.3242293-1-philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/meson.build | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index 0652569bc4..fcb15a78f1 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -102,11 +102,15 @@ foreach module : qapi_all_modules
     'qapi-types-@0@.h'.format(module),
     'qapi-visit-@0@.c'.format(module),
     'qapi-visit-@0@.h'.format(module),
-    'qapi-events-@0@.c'.format(module),
-    'qapi-events-@0@.h'.format(module),
-    'qapi-commands-@0@.c'.format(module),
-    'qapi-commands-@0@.h'.format(module),
   ]
+  if have_system or have_tools
+    qapi_module_outputs += [
+      'qapi-events-@0@.c'.format(module),
+      'qapi-events-@0@.h'.format(module),
+      'qapi-commands-@0@.c'.format(module),
+      'qapi-commands-@0@.h'.format(module),
+    ]
+  endif
   if module.endswith('-target')
     qapi_specific_outputs += qapi_module_outputs
   else
-- 
2.26.2


