Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFFDF6B08
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Nov 2019 20:05:25 +0100 (CET)
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iTsWa-0001XO-Ex
	for lists+qemu-devel@lfdr.de; Sun, 10 Nov 2019 14:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34935)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iTsV3-0000FX-Dl
 for qemu-devel@nongnu.org; Sun, 10 Nov 2019 14:03:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iTsV2-000376-AR
 for qemu-devel@nongnu.org; Sun, 10 Nov 2019 14:03:49 -0500
Received: from relay.sw.ru ([185.231.240.75]:42168)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iTsUz-00033i-Fx; Sun, 10 Nov 2019 14:03:45 -0500
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iTsUv-00076X-3N; Sun, 10 Nov 2019 22:03:41 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v0 0/2] allow to set 'drive' property on a realized block
 device
Date: Sun, 10 Nov 2019 22:03:08 +0300
Message-Id: <20191110190310.19799-1-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows to replace the file on a block device and is useful
to workaround the cases (migration) when the VM image is placed on
some shared storage with exclusive file opening model but the image
should be open form more than one app.

The previous version of approaching the workaround was based on the
"blockdev-change-medium" command modification but had some flaws:
  * semantics: blockdev-change-medium is aimed to be used with removable devices
    only
  * interface: it can't accept all possible combination of parameters for
    the "drive" replacement (creation).

More details here: http://patchwork.ozlabs.org/patch/1179329/

The current series suggests another approach:
1. blockdev-add
2. qom-set disk.drive = the blockdev added (this is what the series adds)
 

Denis Plotnikov (2):
  qdev-properties-system: extend set_pionter for unrealized devices
  block: allow to set 'drive' property on a realized block device

 hw/core/qdev-properties-system.c | 117 +++++++++++++++++++++++++------
 1 file changed, 96 insertions(+), 21 deletions(-)

-- 
2.17.0


