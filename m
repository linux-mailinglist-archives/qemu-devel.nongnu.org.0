Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A826B9B61
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:27:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7TL-0004xO-6k; Tue, 14 Mar 2023 12:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc7TH-0004wH-GX
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:25:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pc7TF-0007Ot-3j
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678811152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ih/6w4H6hHD/iCx/AvfJuJXmZZOwNOu437gWviSPGp0=;
 b=NoTTLH1iddF+trJfc+xEPkozKwu3Xb7FUXT+qZdfc9BHP6JHEihihpNSlSSvW11K21hYmC
 96DzhD1k/h0AIWWdTOdR7mbbW5FsvcyU7M4EYB4vNWidzaFAEvOanFksBg4zX02sVg8XTv
 4NR+idRjTVQLs8dd7qbjIUkG4TxWEr4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-69AN3MJ7P3qeJkknzwWHrw-1; Tue, 14 Mar 2023 12:25:49 -0400
X-MC-Unique: 69AN3MJ7P3qeJkknzwWHrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CC41857A99;
 Tue, 14 Mar 2023 16:25:48 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 616C14042AC2;
 Tue, 14 Mar 2023 16:25:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PULL 2/3] ps2: Don't send key release event for Lang1, Lang2 keys
Date: Tue, 14 Mar 2023 16:25:39 +0000
Message-Id: <20230314162540.385954-3-berrange@redhat.com>
In-Reply-To: <20230314162540.385954-1-berrange@redhat.com>
References: <20230314162540.385954-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

From: Ross Lagerwall <ross.lagerwall@citrix.com>

The scancodes for the Lang1 and Lang2 keys (i.e. Hangeul, Hanja) are
special since they already have the 0x80 bit set which is commonly used
to indicate a key release in AT set 1. Reportedly, real hardware does
not send a key release scancode. So, skip sending a release for these
keys. This ensures that Windows behaves correctly and interprets it as a
single keypress rather than two consecutive keypresses.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/input/ps2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 3253ab6a92..45af76a837 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -402,6 +402,9 @@ static void ps2_keyboard_event(DeviceState *dev, QemuConsole *src,
                     ps2_put_keycode(s, 0xaa);
                 }
             }
+        } else if ((qcode == Q_KEY_CODE_LANG1 || qcode == Q_KEY_CODE_LANG2)
+                   && !key->down) {
+            /* Ignore release for these keys */
         } else {
             if (qcode < qemu_input_map_qcode_to_atset1_len) {
                 keycode = qemu_input_map_qcode_to_atset1[qcode];
@@ -497,6 +500,9 @@ static void ps2_keyboard_event(DeviceState *dev, QemuConsole *src,
                     ps2_put_keycode(s, 0x12);
                 }
             }
+        } else if ((qcode == Q_KEY_CODE_LANG1 || qcode == Q_KEY_CODE_LANG2) &&
+                   !key->down) {
+            /* Ignore release for these keys */
         } else {
             if (qcode < qemu_input_map_qcode_to_atset2_len) {
                 keycode = qemu_input_map_qcode_to_atset2[qcode];
-- 
2.39.2


