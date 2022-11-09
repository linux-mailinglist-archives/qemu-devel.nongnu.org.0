Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D752C623195
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 18:38:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osp1Z-00037j-Q6; Wed, 09 Nov 2022 12:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osp1W-00036h-1k
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:38:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osp1U-0000ZS-6E
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668015478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=p9DadWsfbhoRGq3z9v34ziSUK6XmXD9LiCzBp9VE1I0=;
 b=U4z6OjZrk9Zsr/CNDDu9gmlY5DYq6I+rkaePxrCFTlf9+eaUJPId1gSPjKpZi94VQQ2p0n
 nbGjIeji/HsoTQ1DUUm8p8NGInXRD20FKNrgsYpfWUEgJzuUT4n9rcB4AcZxI0av1XwtVX
 bWDJm0fIVvE25Sz0AxkBE+ZpSkDOrqA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-pXpn3LBkOv2WuYhdDCV-Mg-1; Wed, 09 Nov 2022 12:37:55 -0500
X-MC-Unique: pXpn3LBkOv2WuYhdDCV-Mg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CC622999B24;
 Wed,  9 Nov 2022 17:37:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FE64492B17;
 Wed,  9 Nov 2022 17:37:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
Date: Wed,  9 Nov 2022 18:37:50 +0100
Message-Id: <20221109173750.201615-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qapi/meson.build  | 2 +-
 stubs/meson.build | 2 +-
 util/meson.build  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
index 59c1f467bb..b260539bd5 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -68,7 +68,7 @@ if have_system
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
 endif
 
-if have_block
+if have_block or have_ga
   util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
   util_ss.add(files('base64.c'))
   util_ss.add(files('buffer.c'))
-- 
2.31.1


