Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D851423D21
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:46:14 +0200 (CEST)
Received: from localhost ([::1]:37670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY5NF-0006rH-2S
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mY5Eh-00052O-Ae
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:37:23 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:55600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mY5Ef-0002Ft-7s
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 07:37:23 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id DE5A920779;
 Wed,  6 Oct 2021 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1633520238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=q2PlIwlIoWmZ/WSoA+/auG3v2XMzXedpqi/AaDsiKSM=;
 b=oumFwzBGi9Jp+CgJt+MKyTWPdopn8KvJpq+DPYC8vWZbP6gDj2Of3D8mDWqLJOsVVWuO70
 2YesMrpRc5jRfUetFwciau1Qc6VImTvLbXV0A7cvFqo0Px9MfXk+78PcxZgYy4l411LSIC
 dCE7yXbuj54VhQs19M33uxN+OKvy8p8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
Date: Wed,  6 Oct 2021 13:37:07 +0200
Message-Id: <20211006113707.96907-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now, we cannot load some binary file if it is bigger than the
machine's ram size. This limitation only occurs when loading a
binary file: we can load a corresponding elf file without this
limitation.

This is an issue for machines that have small ram or do not use the
ram_size feature at all.

Also get rid of "hw/boards.h" include, since we needed it only
to access `current_machine`.

Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Hi Alistair,

I found this while experimenting with a ram_size=0 machine.

I checked the original discussion: it seems to me there was no
intention to specifically limit to the ram size but we had to
put some limit.

See this:
https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04668.html
https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04681.html

Thanks for your feedback,
Damien
---
 hw/core/generic-loader.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index d14f932eea..102605c07b 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -34,7 +34,6 @@
 #include "hw/core/cpu.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
-#include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -153,8 +152,8 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
         }
 
         if (size < 0 || s->force_raw) {
-            /* Default to the maximum size being the machine's ram size */
-            size = load_image_targphys_as(s->file, s->addr, current_machine->ram_size, as);
+            /* Do not limit the file size */
+            size = load_image_targphys_as(s->file, s->addr, -1, as);
         } else {
             s->addr = entry;
         }
-- 
2.33.0


