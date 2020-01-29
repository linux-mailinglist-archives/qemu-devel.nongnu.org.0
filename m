Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE614D1A3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 21:01:56 +0100 (CET)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwtX8-0007fE-Ol
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 15:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jpewhacker@gmail.com>) id 1iwtVq-0007GL-5O
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 15:00:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jpewhacker@gmail.com>) id 1iwtVn-0006LJ-QD
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 15:00:33 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:40059)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jpewhacker@gmail.com>)
 id 1iwtVm-0006I1-HL
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 15:00:30 -0500
Received: by mail-io1-xd41.google.com with SMTP id x1so1158797iop.7
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 12:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JssBp+Af03CgiiTxeYvhyMv5hXNuQpZd/7qsT00yHQk=;
 b=SfEF9nGrDmrR3G/ErvBM/n2Y5fcZihata45e59kHv5t3U9gL4Ua7SqcaGfUxJBD1L4
 YwsG/NZGwJZe2TkEphLq36dtzN+CPh0zpVmMd06Mt+DYi1Xnu9cf2bfcE0X85BgFOke0
 ApjfIbBrbpHZs5b4zLdJAT7wx2n2VphorrpGnmjy4UQozhlWQrsjdc2bTV46UplpHxHW
 tkox7JU440BAo2KQBADHI6vW0nCOhKIZ6SxEUI7euXluKFfD+gOEKt+Fnyji7MhvrZca
 IluYArteivzm2QKH0IvHc1H/VNAEOUqZ9YjBhGeRHyu/8GcJBK5Pq5ZtbU2V18lgYTjt
 BdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JssBp+Af03CgiiTxeYvhyMv5hXNuQpZd/7qsT00yHQk=;
 b=gkrh3gY7HC+w9MYdrT5DeGzKRy0O9lsgvzcFyJpMVD4HfegSgPoH7pErFUGu2ZGJ7G
 4LfeBKShgAs35svViIsmWgeDJB2eiWIZGgOwmKxFur3K3IadFGhRh1kqXGs4QWKohdgE
 aRia1sobNr/UcCs2rjfDa92gbjCI1ek6Zh/kfE+AwqdTYrCL7svYRrZ0Saw2i21etjB5
 c4rCqMNdAB3+zbbsZcsVfin17rf808U75/kX76/Da8rLZYayXmoqqjEaq+3MxewylNjq
 R0mPHcT2qCVVcXWA3N3Ixn2DKnJz0Tu3Im+vKA2VBJngTJexp401ACzcftlhz20OWQg9
 r92Q==
X-Gm-Message-State: APjAAAV4/gxYt4ptKwxQkVWDxCQe5xV8ahEy9WLaYa1E01MXG/y7WG+W
 mfDuviAAO9P8B2k4MtvcLgFVd3TVnoc=
X-Google-Smtp-Source: APXvYqxViuRpjlg0hHvYZazU4+lwdhxaKoIaCSG0jltEaT+h0be7L7WGQNpAXT/T3k2UMauHKY6YMA==
X-Received: by 2002:a6b:39c4:: with SMTP id g187mr965298ioa.271.1580328027937; 
 Wed, 29 Jan 2020 12:00:27 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
 by smtp.gmail.com with ESMTPSA id n9sm802190iob.45.2020.01.29.12.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:00:27 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: Respect -show-cursor option
Date: Wed, 29 Jan 2020 13:42:39 -0600
Message-Id: <20200129194654.3949391-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joshua Watt <JPEWhacker@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the user specifies the -show-cursor option, force the cursor to be
shown even if it would not otherwise.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ui/gtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index d18892d1de..bdd1b53236 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -258,7 +258,8 @@ static void gd_update_cursor(VirtualConsole *vc)
     }
 
     window = gtk_widget_get_window(GTK_WIDGET(vc->gfx.drawing_area));
-    if (s->full_screen || qemu_input_is_absolute() || s->ptr_owner == vc) {
+    if (cursor_hide &&
+        (s->full_screen || qemu_input_is_absolute() || s->ptr_owner == vc)) {
         gdk_window_set_cursor(window, s->null_cursor);
     } else {
         gdk_window_set_cursor(window, NULL);
-- 
2.24.1


