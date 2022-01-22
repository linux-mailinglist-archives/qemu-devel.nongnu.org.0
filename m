Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373D6496CB0
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 15:08:22 +0100 (CET)
Received: from localhost ([::1]:58966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBH40-00044G-Pv
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 09:08:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBH29-0002pE-RQ
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 09:06:27 -0500
Received: from mailout12.t-online.de ([194.25.134.22]:34880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1nBH27-0001WW-Vv
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 09:06:25 -0500
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout12.t-online.de (Postfix) with SMTP id A2C721E4AC;
 Sat, 22 Jan 2022 15:06:21 +0100 (CET)
Received: from linpower.localnet ([46.86.48.20]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nBH23-28cWQb0; Sat, 22 Jan 2022 15:06:20 +0100
Received: by linpower.localnet (Postfix, from userid 1000)
 id 8618620061B; Sat, 22 Jan 2022 15:06:19 +0100 (CET)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hw/usb/dev-mtp: create directories with a+x mode mask
Date: Sat, 22 Jan 2022 15:06:19 +0100
Message-Id: <20220122140619.7514-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1642860380-0000C4DD-BF2D335E/0/0 CLEAN NORMAL
X-TOI-MSGID: 1a267f06-84da-4ec7-9d20-0c684603312c
Received-SPF: none client-ip=194.25.134.22;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current code creates directories with mode 0644. Even the creator
can't create files in the new directory. Set all x mode flags in
variable mask and clear all x mode flags in function open() to
preserve the current open mode.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 hw/usb/dev-mtp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index c1d1694fd0..2bf780b297 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -1607,7 +1607,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_t handle)
         usb_mtp_object_lookup(s, s->dataset.parent_handle);
     char *path = NULL;
     uint64_t rc;
-    mode_t mask = 0644;
+    mode_t mask = 0755;
     int ret = 0;
 
     assert(d != NULL);
@@ -1635,7 +1635,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_t handle)
             }
 
             d->fd = open(path, O_CREAT | O_WRONLY |
-                         O_CLOEXEC | O_NOFOLLOW, mask);
+                         O_CLOEXEC | O_NOFOLLOW, mask & 0666);
             if (d->fd == -1) {
                 ret = 1;
                 goto done;
-- 
2.31.1


