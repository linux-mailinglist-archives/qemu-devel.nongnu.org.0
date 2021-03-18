Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A68340B41
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:12:28 +0100 (CET)
Received: from localhost ([::1]:35722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwCB-0002ZT-9G
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvey-00021j-14
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMveu-00031U-9z
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616085482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9WAQJRyWnpHMiFi7xNe3N3oN1FfaosgQx8l3S12gz8I=;
 b=A7akfPbQohJxtfBXh/liXyGtXcILgfv3PlqSyHjQina85ZHur1BhRwCt0p1484bmacSsUr
 jSvUxzL33aMVhkqRPWCBFsfrN5qOA52Gq6H9SY/K2ngmBmDIUF9jJjHW+WZsFGfO3Qp+7j
 yVIKXHOjj2FgJ1qZw9yBvQYMuezjTHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-IS0xdXLGN_GVGJTvWT9ZAQ-1; Thu, 18 Mar 2021 12:38:00 -0400
X-MC-Unique: IS0xdXLGN_GVGJTvWT9ZAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0103887A83A;
 Thu, 18 Mar 2021 16:37:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C47361899A;
 Thu, 18 Mar 2021 16:37:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3639311385EE; Thu, 18 Mar 2021 17:37:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/11] qemuutil: remove qemu_set_fd_handler duplicate symbol
Date: Thu, 18 Mar 2021 17:37:47 +0100
Message-Id: <20210318163757.1345341-2-armbru@redhat.com>
In-Reply-To: <20210318163757.1345341-1-armbru@redhat.com>
References: <20210318163757.1345341-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

libqemuutil has two definitions of qemu_set_fd_handler.  This
is not needed since the only users of the function are
qemu-io.c and the emulators, both of which already include
util/main-loop.c.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <d0c5aa88-029e-4328-7a53-482a3010c5f8@redhat.com>
Tested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210318155519.1224118-2-armbru@redhat.com>
---
 stubs/set-fd-handler.c | 10 ----------
 stubs/meson.build      |  1 -
 2 files changed, 11 deletions(-)
 delete mode 100644 stubs/set-fd-handler.c

diff --git a/stubs/set-fd-handler.c b/stubs/set-fd-handler.c
deleted file mode 100644
index bff7e0a45a..0000000000
--- a/stubs/set-fd-handler.c
+++ /dev/null
@@ -1,10 +0,0 @@
-#include "qemu/osdep.h"
-#include "qemu/main-loop.h"
-
-void qemu_set_fd_handler(int fd,
-                         IOHandler *fd_read,
-                         IOHandler *fd_write,
-                         void *opaque)
-{
-    abort();
-}
diff --git a/stubs/meson.build b/stubs/meson.build
index a054d5877f..8a3e804cf0 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -34,7 +34,6 @@ stub_ss.add(files('ram-block.c'))
 stub_ss.add(files('ramfb.c'))
 stub_ss.add(files('replay.c'))
 stub_ss.add(files('runstate-check.c'))
-stub_ss.add(files('set-fd-handler.c'))
 stub_ss.add(files('sysbus.c'))
 stub_ss.add(files('target-get-monitor-def.c'))
 stub_ss.add(files('target-monitor-defs.c'))
-- 
2.26.3


