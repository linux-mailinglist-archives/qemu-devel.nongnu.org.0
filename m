Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A831661B57
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 09:45:12 +0200 (CEST)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkOKl-00027Y-Sp
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 03:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48790)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <root@shaju-abraham.dev.nutanix.com>)
 id 1hkJuf-0003Ic-5j
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 23:01:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <root@shaju-abraham.dev.nutanix.com>)
 id 1hkJuX-00009c-WE
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 23:01:54 -0400
Received: from [192.146.154.1] (port=22458 helo=shaju-abraham.dev.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <root@shaju-abraham.dev.nutanix.com>)
 id 1hkJuC-0008IT-00; Sun, 07 Jul 2019 23:01:29 -0400
Received: by shaju-abraham.dev.nutanix.com (Postfix, from userid 0)
 id 70BBE40628; Sun,  7 Jul 2019 19:55:12 -0700 (PDT)
From: shaju.abraham@nutanix.com
To: qemu-devel@nongnu.org
Date: Sun,  7 Jul 2019 19:55:03 -0700
Message-Id: <1562554503-177179-1-git-send-email-shaju.abraham@nutanix.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.1
X-Mailman-Approved-At: Mon, 08 Jul 2019 03:42:45 -0400
Subject: [Qemu-devel] [PATCH] Fix Guest VM crash due to iSCSI Sense Key error
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
Cc: Shaju Abraham <shaju.abraham@nutanix.com>, jsnow@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shaju Abraham <shaju.abraham@nutanix.com>

During the  IDE DMA transfer for a ISCSI target,when libiscsi encounters
a SENSE KEY error, it sets the task->sense to  the value "COMMAND ABORTED".
The function iscsi_translate_sense() later translaters this error to -ECANCELED
and this value is passed to the callback function. In the case of  IDE DMA read
or write, the callback function returns immediately if the value of the ret
argument is -ECANCELED.
Later when ide_cancel_dma_sync() function is invoked  the assertion
"s->bus->dma->aiocb == ((void *)0)" fails and the qemu process gets terminated.
Fix the issue by making the value of s->bus->dma->aiocb = NULL when
-ECANCELED is passed to the callback.

Signed-off-by: Shaju Abraham <shaju.abraham@nutanix.com>
---
 hw/ide/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 6afadf8..78ea357 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -841,6 +841,7 @@ static void ide_dma_cb(void *opaque, int ret)
     bool stay_active = false;
 
     if (ret == -ECANCELED) {
+        s->bus->dma->aiocb = NULL;
         return;
     }
 
-- 
1.9.4


