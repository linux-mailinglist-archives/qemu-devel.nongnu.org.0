Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85060623DA3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 09:37:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot33Q-0004eq-Ga; Thu, 10 Nov 2022 03:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot337-0004cP-9M
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot335-0007cC-KG
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=J3V9SmN/TM9udW5nH4p2vCPkZ/LtgVkUzDNVbu0XGYU=;
 b=IomsGqTNQELHq6Csm/Vp96mhpB26FBoSLJIGZAaJxktzYaz84NUtGee50kdlh/mF8tD2Ek
 wFnFfHkocQ4nEI0wTwhYyHdUni2IA/Gmgv32ZO8c9rCd/qJuR9XRtxl+l5BQsylwMokBIR
 QlAQPiA6QwHUkayiLf4H1uipKyymC40=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-nn_T3fZFNsGU66JGYw44dA-1; Thu, 10 Nov 2022 03:36:29 -0500
X-MC-Unique: nn_T3fZFNsGU66JGYw44dA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B9523C02196;
 Thu, 10 Nov 2022 08:36:29 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 352BE49BB69;
 Thu, 10 Nov 2022 08:36:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] qga: Allow building of the guest agent without system
 emulators or tools
Date: Thu, 10 Nov 2022 09:36:26 +0100
Message-Id: <20221110083626.31899-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If configuring with "--disable-system --disable-user --enable-guest-agent"
the linking currently fails with:

qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined reference to `qmp_command_name'
build/../../home/thuth/devel/qemu/qga/commands.c:71: undefined reference to `qmp_command_is_enabled'
build/../../home/thuth/devel/qemu/qga/commands.c:72: undefined reference to `qmp_has_success_response'
qga/qemu-ga.p/commands.c.o: In function `qmp_guest_info':
build/../../home/thuth/devel/qemu/qga/commands.c:82: undefined reference to `qmp_for_each_command'
qga/qemu-ga.p/commands.c.o: In function `qmp_guest_exec':
build/../../home/thuth/devel/qemu/qga/commands.c:410: undefined reference to `qbase64_decode'
qga/qemu-ga.p/channel-posix.c.o: In function `ga_channel_open':
build/../../home/thuth/devel/qemu/qga/channel-posix.c:214: undefined reference to `unix_listen'
build/../../home/thuth/devel/qemu/qga/channel-posix.c:228: undefined reference to `socket_parse'
build/../../home/thuth/devel/qemu/qga/channel-posix.c:234: undefined reference to `socket_listen'
qga/qemu-ga.p/commands-posix.c.o: In function `qmp_guest_file_write':
build/../../home/thuth/devel/qemu/qga/commands-posix.c:527: undefined reference to `qbase64_decode'

Let's make sure that we also compile and link the required files if
the system emulators have not been enabled.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Refine the file list in the util/ folder (as suggested by Philippe)

 qapi/meson.build  |  2 +-
 stubs/meson.build |  2 +-
 util/meson.build  | 20 ++++++++++++--------
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index 9a36c15c04..fbdb442fdf 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -13,7 +13,7 @@ util_ss.add(files(
 if have_system
   util_ss.add(files('qapi-type-helpers.c'))
 endif
-if have_system or have_tools
+if have_system or have_tools or have_ga
   util_ss.add(files(
     'qmp-dispatch.c',
     'qmp-event.c',
diff --git a/stubs/meson.build b/stubs/meson.build
index 4314161f5f..c96a74f095 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -49,7 +49,7 @@ stub_ss.add(files('vmstate.c'))
 stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
 stub_ss.add(files('cpu-synchronize-state.c'))
-if have_block
+if have_block or have_ga
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
diff --git a/util/meson.build b/util/meson.build
index 59c1f467bb..25b9b61f98 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -68,20 +68,25 @@ if have_system
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
 endif
 
-if have_block
-  util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
+if have_block or have_ga
+  util_ss.add(files('aiocb.c', 'async.c'))
   util_ss.add(files('base64.c'))
+  util_ss.add(files('lockcnt.c'))
+  util_ss.add(files('main-loop.c'))
+  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 'qemu-coroutine-io.c'))
+  util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
+  util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
+  util_ss.add(files('qemu-sockets.c'))
+endif
+if have_block
+  util_ss.add(files('aio-wait.c'))
   util_ss.add(files('buffer.c'))
   util_ss.add(files('bufferiszero.c'))
-  util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
   util_ss.add(files('hbitmap.c'))
   util_ss.add(files('hexdump.c'))
   util_ss.add(files('iova-tree.c'))
-  util_ss.add(files('iov.c', 'qemu-sockets.c', 'uri.c'))
-  util_ss.add(files('lockcnt.c'))
-  util_ss.add(files('main-loop.c'))
+  util_ss.add(files('iov.c', 'uri.c'))
   util_ss.add(files('nvdimm-utils.c'))
-  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 'qemu-coroutine-io.c'))
   util_ss.add(when: 'CONFIG_LINUX', if_true: [
     files('vhost-user-server.c'), vhost_user
   ])
@@ -89,7 +94,6 @@ if have_block
   util_ss.add(files('qemu-coroutine-sleep.c'))
   util_ss.add(files('qemu-co-shared-resource.c'))
   util_ss.add(files('qemu-co-timeout.c'))
-  util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
   util_ss.add(files('readline.c'))
   util_ss.add(files('throttle.c'))
   util_ss.add(files('timed-average.c'))
-- 
2.31.1


