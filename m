Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675FF5F8587
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 16:06:38 +0200 (CEST)
Received: from localhost ([::1]:33210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohATM-0006QL-JZ
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 10:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ohAOT-0004b0-QP
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 10:01:36 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ohAOR-0007Iu-Fr
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 10:01:33 -0400
Received: by mail-pl1-x635.google.com with SMTP id d24so6861160pls.4
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mzxluYw+crSM1OBZS6Wiii64Kf7Dg9LeSDgNPF0HNfU=;
 b=p42O77AD0sOUskNu9kwIOZyhWvMPnv0CjAQ22WCN4UQjoZLceYsD199UEhdLOUVaDk
 erb8qOa5/W8/D9KuSZAxI+GAiDkI/GMeJBFWrQDIJBNEzKEibxcmwAz/B9L0FcHUEKCW
 QBR4qnaHl2xyoGOdzPC6pTB98yE88cYcMiVsxg/fnM1Q9kxEbgAv2iJj4TBylc5UFRLr
 GiHpjrppV/7a5+9DmrIT+uKOeSdRHgCR457KILL2TuQTggj5V0sAcWreSQFEypDhQ34A
 izlgYih0CzAVFhP7YZd57wi3t47KPoXMAoC3Wt94rP+C+sc/aA5l4awE7eKVKQSUNgNH
 lTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mzxluYw+crSM1OBZS6Wiii64Kf7Dg9LeSDgNPF0HNfU=;
 b=xTo7zr7piEnqDXtJu4+oKLFA1Bxg2e3Hceth5qCLng40jv3FdGDR79DSz+6Gh7wXb7
 eS9ZKMvyGszmML2EL1+epEf/X5IJSHI+ZRsklTibTpn6zIKhN3mIlrV151E9wvNE5om2
 ooQ+QxsecGz4v6aWEO5PNgxO28NDtnVz2xHJyY/J87FYe5tXK835sAov0adOZzs5D3iX
 HhSd82I/VrItCI0VWW3TlopUITG/mubJB8mF3mkVPsRuXYtjQraT2MnRnP21d2T87UJN
 bCaADU83K01qPMEdeNR0dbpRNzbKP+TW0J9Vq+kPbSA2OUPG8wQmPuO0TbUM9hQjguEb
 8rIg==
X-Gm-Message-State: ACrzQf0DCJZPG7sVU8/W9wAmYizjFMbqwGUY0yXwhgVjAPV7PvveVXip
 j6IAiT3xKCBPgsOcRCtHu+NUnyUNIizYBA==
X-Google-Smtp-Source: AMsMyM6y6yOhyxMihuucqw6OWe4AS68oowtjnWgYVmBD367g67sEVPs3Uk/t5xCbe7aT3WR3CB8fcQ==
X-Received: by 2002:a17:902:e5cb:b0:178:192d:1fed with SMTP id
 u11-20020a170902e5cb00b00178192d1fedmr10047953plf.30.1665237688196; 
 Sat, 08 Oct 2022 07:01:28 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a63574c000000b0041c0c9c0072sm3333295pgm.64.2022.10.08.07.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 07:01:27 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] ui/gtk: Fix the implicit mouse ungrabbing logic
Date: Sat,  8 Oct 2022 23:01:16 +0900
Message-Id: <20221008140116.11473-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although the grab menu item represents the tabbed displays, the old
implicit mouse ungrabbing logic changes the grab menu item even for
an untabbed display.

Leave the grab menu item when implicitly ungrabbing mouse for an
untabbed display. The new ungrabbing logic introduced in
gd_mouse_mode_change() strictly follows the corresponding grabbing
logic found in gd_button_event().

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 ui/gtk.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 1467b8c7d7..6fc2e23963 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -681,9 +681,13 @@ static void gd_mouse_mode_change(Notifier *notify, void *data)
 
     s = container_of(notify, GtkDisplayState, mouse_mode_notifier);
     /* release the grab at switching to absolute mode */
-    if (qemu_input_is_absolute() && gd_is_grab_active(s)) {
-        gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->grab_item),
-                                       FALSE);
+    if (qemu_input_is_absolute() && s->ptr_owner) {
+        if (!s->ptr_owner->window) {
+            gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->grab_item),
+                                           FALSE);
+        } else {
+            gd_ungrab_pointer(s);
+        }
     }
     for (i = 0; i < s->nb_vcs; i++) {
         VirtualConsole *vc = &s->vc[i];
-- 
2.37.3


