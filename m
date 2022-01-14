Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC06048E4B6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:11:55 +0100 (CET)
Received: from localhost ([::1]:60724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Gkc-0001KO-Hb
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:11:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUc-0007bP-76
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUa-0007VH-BO
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nqyD7tE91mqrOgFLxd3dax6i3IBUTo/Va3nEmP8VFy8=;
 b=RQmpY4E6rsBH1n7i2eGYavGabQY9RtR5eo7MCDA39nm/M38WUIuy3Gzq8GrYcUlgk/SBfY
 WOnbzKKtoSeIeiNEPm+SB3Jx447H0dQZ80rzgvjDDJbVvAVvWQzOXmy0VvsJjIPonIvO+N
 HJDzgZGaoAtheNzj2snaJNedYn44oJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-B_dq6mDuP26kT-9z2FZJZg-1; Fri, 14 Jan 2022 01:55:16 -0500
X-MC-Unique: B_dq6mDuP26kT-9z2FZJZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7181189DF41;
 Fri, 14 Jan 2022 06:55:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7944699B;
 Fri, 14 Jan 2022 06:55:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C5E5118007A2; Fri, 14 Jan 2022 07:53:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] ui: fix gtk clipboard clear assertion
Date: Fri, 14 Jan 2022 07:53:14 +0100
Message-Id: <20220114065326.782420-9-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When closing the QEMU Gtk display window, it can occasionaly warn:
qemu-system-x86_64: Gtk: gtk_clipboard_set_with_data: assertion 'targets != NULL' failed

#3  0x00007ffff4f02f22 in gtk_clipboard_set_with_data (clipboard=<optimized out>, targets=<optimized out>, n_targets=<optimized out>, get_func=<optimized out>, clear_func=<optimized out>, user_data=<optimized out>) at /usr/src/debug/gtk3-3.24.30-4.fc35.x86_64/gtk/gtkclipboard.c:672
#4  0x00007ffff552cd75 in gd_clipboard_update_info (gd=0x5555579a9e00, info=0x555557ba4b50) at ../ui/gtk-clipboard.c:98
#5  0x00007ffff552ce00 in gd_clipboard_notify (notifier=0x5555579aaba8, data=0x7fffffffd720) at ../ui/gtk-clipboard.c:128
#6  0x000055555603e0ff in notifier_list_notify (list=0x555556657470 <clipboard_notifiers>, data=0x7fffffffd720) at ../util/notify.c:39
#7  0x000055555594e8e0 in qemu_clipboard_update (info=0x555557ba4b50) at ../ui/clipboard.c:54
#8  0x000055555594e840 in qemu_clipboard_peer_release (peer=0x55555684a5b0, selection=QEMU_CLIPBOARD_SELECTION_PRIMARY) at ../ui/clipboard.c:40
#9  0x000055555594e786 in qemu_clipboard_peer_unregister (peer=0x55555684a5b0) at ../ui/clipboard.c:19
#10 0x000055555595f044 in vdagent_disconnect (vd=0x55555684a400) at ../ui/vdagent.c:852
#11 0x000055555595f262 in vdagent_chr_fini (obj=0x55555684a400) at ../ui/vdagent.c:908

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211216083233.1166504-1-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk-clipboard.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
index e0b8b283fef8..d58fd761abdf 100644
--- a/ui/gtk-clipboard.c
+++ b/ui/gtk-clipboard.c
@@ -83,7 +83,7 @@ static void gd_clipboard_update_info(GtkDisplayState *gd,
     if (info != qemu_clipboard_info(s)) {
         gd->cbpending[s] = 0;
         if (!self_update) {
-            GtkTargetList *list;
+            g_autoptr(GtkTargetList) list = NULL;
             GtkTargetEntry *targets;
             gint n_targets;
 
@@ -94,15 +94,16 @@ static void gd_clipboard_update_info(GtkDisplayState *gd,
             targets = gtk_target_table_new_from_list(list, &n_targets);
 
             gtk_clipboard_clear(gd->gtkcb[s]);
-            gd->cbowner[s] = true;
-            gtk_clipboard_set_with_data(gd->gtkcb[s],
-                                        targets, n_targets,
-                                        gd_clipboard_get_data,
-                                        gd_clipboard_clear,
-                                        gd);
+            if (targets) {
+                gd->cbowner[s] = true;
+                gtk_clipboard_set_with_data(gd->gtkcb[s],
+                                            targets, n_targets,
+                                            gd_clipboard_get_data,
+                                            gd_clipboard_clear,
+                                            gd);
 
-            gtk_target_table_free(targets, n_targets);
-            gtk_target_list_unref(list);
+                gtk_target_table_free(targets, n_targets);
+            }
         }
         return;
     }
-- 
2.34.1


