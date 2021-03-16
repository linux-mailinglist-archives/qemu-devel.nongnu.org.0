Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5226B33D550
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:01:15 +0100 (CET)
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAG2-00089L-DB
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMAE8-0007d1-HZ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:59:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMAE6-0003xu-8n
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615903152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J41gdNnNHZwCdLwV0ljitN3fuP4EtTuzRgmsBmx535o=;
 b=GSxfvGU/83TXkLWH9ZePK+eG9MlQD9vH3woTMjP2Hpr2dsSsIOiUJG20fSg4x4pF6z/cPs
 LYQTunUwwT3mgcKS07HjyiXKl0+bi3vBBnjDenlx2tBpxeLHziEwv+Z5qd9a7Eu8NhbhIm
 WJ8E0eMyeFcIdOTe6Veu8xdRGtF8usw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-hvG9ns2DPjSviKCH1vazRA-1; Tue, 16 Mar 2021 09:59:10 -0400
X-MC-Unique: hvG9ns2DPjSviKCH1vazRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1837192D786;
 Tue, 16 Mar 2021 13:59:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74211189A4;
 Tue, 16 Mar 2021 13:59:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C91AE1132C12; Tue, 16 Mar 2021 14:59:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] yank: Avoid linking into executables that don't want it
Date: Tue, 16 Mar 2021 14:59:07 +0100
Message-Id: <20210316135907.3646901-1-armbru@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, lukasstraub2@web.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

util/yank.c and stubs/yank.c are both in libqemuutil.a, even though
their external symbols conflict.  The linker happens to pick the
former.  This links a bunch of unneeded code into the executables that
actually want the latter: qemu-io, qemu-img, qemu-nbd, and several
tests.  Amazingly, none of them fails to link.

To fix this, the non-stub yank.c from sourceset util_ss to sourceset
qmp_ss.  This requires moving it from util/ to monitor/.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 {util => monitor}/yank.c | 0
 MAINTAINERS              | 2 +-
 monitor/meson.build      | 1 +
 util/meson.build         | 1 -
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename {util => monitor}/yank.c (100%)

diff --git a/util/yank.c b/monitor/yank.c
similarity index 100%
rename from util/yank.c
rename to monitor/yank.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 5ca3c9f851..d3174c0bb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2799,7 +2799,7 @@ F: tests/unit/test-uuid.c
 Yank feature
 M: Lukas Straub <lukasstraub2@web.de>
 S: Odd fixes
-F: util/yank.c
+F: monitor/yank.c
 F: stubs/yank.c
 F: include/qemu/yank.h
 F: qapi/yank.json
diff --git a/monitor/meson.build b/monitor/meson.build
index 6d00985ace..1ce5909c88 100644
--- a/monitor/meson.build
+++ b/monitor/meson.build
@@ -1,4 +1,5 @@
 qmp_ss.add(files('monitor.c', 'qmp.c', 'qmp-cmds-control.c'))
+qmp_ss.add(files('yank.c'))
 
 softmmu_ss.add(files(
   'hmp-cmds.c',
diff --git a/util/meson.build b/util/meson.build
index 984fba965f..fa0298adab 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -51,7 +51,6 @@ endif
 if have_system
   util_ss.add(files('crc-ccitt.c'))
   util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
-  util_ss.add(files('yank.c'))
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
 endif
 
-- 
2.26.2


