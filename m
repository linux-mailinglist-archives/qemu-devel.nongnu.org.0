Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D648B20726C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:46:11 +0200 (CEST)
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3r0-0004su-V1
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3cI-0004Kh-EE
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34405
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3cB-000839-4p
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592998250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=0EXJ8NYt40ZdOwU8P9DCLv07anDNn+TKTHDnSwUu9wQ=;
 b=KmHpHrsJp6/YuGocyHoa4bMZJf4m2yFuEDmDVrnzwnWg50nf3dB5EeuH3ZyWXyX6i6DzYz
 CcgfHQrIAZ2GEbl3c1tPyJSLkQWA/BxdW+o88Fm4qPZZ0k8bRuZC/IE2e26A6UL7v5Pdbs
 T3qXwfvweF6By0QXYls2ZN3XkJXSkUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-8YGSv19TM_C4-I8_7Td0_Q-1; Wed, 24 Jun 2020 07:30:46 -0400
X-MC-Unique: 8YGSv19TM_C4-I8_7Td0_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80B8A107ACF5;
 Wed, 24 Jun 2020 11:30:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA8D31A8F7;
 Wed, 24 Jun 2020 11:30:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 356BF31E4A; Wed, 24 Jun 2020 13:30:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/20] softmmu: initialize spice and audio earlier
Date: Wed, 24 Jun 2020 13:30:20 +0200
Message-Id: <20200624113026.13343-15-kraxel@redhat.com>
In-Reply-To: <20200624113026.13343-1-kraxel@redhat.com>
References: <20200624113026.13343-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

audiodev must be initialized before machine_set_property
so the machine can have audiodev property aliases.

spice must initialize before audiodev because the default
audiodev is spice only in case spice is actually enabled.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 softmmu/vl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f669c06ede4a..3bfb9d29fd60 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4131,12 +4131,17 @@ void qemu_init(int argc, char **argv, char **envp)
                       fsdev_init_func, NULL, &error_fatal);
 #endif
 
+    /* spice needs the timers to be initialized by this point */
+    /* spice must initialize before audio as it changes the default auiodev */
+    qemu_spice_init();
+
     /*
-     * Note: we need to create block backends before
+     * Note: we need to create audio and block backends before
      * machine_set_property(), so machine properties can refer to
      * them.
      */
     configure_blockdev(&bdo_queue, machine_class, snapshot);
+    audio_init_audiodevs();
 
     machine_opts = qemu_get_machine_opts();
     qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
@@ -4230,9 +4235,6 @@ void qemu_init(int argc, char **argv, char **envp)
         semihosting_arg_fallback(kernel_filename, kernel_cmdline);
     }
 
-    /* spice needs the timers to be initialized by this point */
-    qemu_spice_init();
-
     cpu_ticks_init();
 
     if (default_net) {
@@ -4342,8 +4344,6 @@ void qemu_init(int argc, char **argv, char **envp)
         create_default_memdev(current_machine, mem_path);
     }
 
-    audio_init_audiodevs();
-
     /* from here on runstate is RUN_STATE_PRELAUNCH */
     machine_run_board_init(current_machine);
 
-- 
2.18.4


