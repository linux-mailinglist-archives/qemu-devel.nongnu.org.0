Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A452035CB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 13:35:24 +0200 (CEST)
Received: from localhost ([::1]:34368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnKjS-00026w-Gl
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 07:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnKds-00036U-MX
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 07:29:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25667
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jnKdo-0008Sh-IW
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 07:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592825371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=yL3OSn9AFp67GuusEB0cjy9wuxWUIYUekJFueTqvHJI=;
 b=DW4GuygUjS0u+MdvcBs9utuPcczd8kvGgrnkiKnJ9tWG/V3ZPYOkgenjIOTBYDot8u1GcY
 zgW2GFaWEHbhpYOuHQC2dRIv2VwyKK4htLZaJ1DJed4NP2fnhl8kUPAkAqZfnU/OeBKyEF
 aXppXCVJ7XX8G3L054QebJXAxxJV1AI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-bRQz_Ij1N_isVWthlmdPew-1; Mon, 22 Jun 2020 07:29:30 -0400
X-MC-Unique: bRQz_Ij1N_isVWthlmdPew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FF5C19200C2;
 Mon, 22 Jun 2020 11:29:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAC1F5C1BD;
 Mon, 22 Jun 2020 11:29:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ADA009D7F; Mon, 22 Jun 2020 13:29:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/19] softmmu: initialize spice and audio earlier
Date: Mon, 22 Jun 2020 13:29:11 +0200
Message-Id: <20200622112914.30454-17-kraxel@redhat.com>
In-Reply-To: <20200622112914.30454-1-kraxel@redhat.com>
References: <20200622112914.30454-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

audiodev must be initialized before machine_set_property
so the machine can have auiodev property aliases.

spice must initialize before audiodev because the default
audiodev is spice only in case spice is actually enabled.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 softmmu/vl.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f669c06ede4a..b8dc1f5a0e86 100644
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
-- 
2.18.4


