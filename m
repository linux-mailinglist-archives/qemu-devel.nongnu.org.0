Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8684512599
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 02:38:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMME1-0000Ub-Ng
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 20:38:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hMMCC-0008As-Ng
	for qemu-devel@nongnu.org; Thu, 02 May 2019 20:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <driver1998@foxmail.com>) id 1hMMCB-0002n2-RH
	for qemu-devel@nongnu.org; Thu, 02 May 2019 20:37:00 -0400
Received: from smtpbgbr2.qq.com ([54.207.22.56]:45504)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <driver1998@foxmail.com>)
	id 1hMMCB-0002kg-Fr
	for qemu-devel@nongnu.org; Thu, 02 May 2019 20:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1556843812;
	bh=rNrdiz1Sy8K1ZYQLRYYtYLz7q52e7xr8Xcc2h9May4E=;
	h=From:To:Subject:Date:Message-Id;
	b=uc6WKjHVErtv3Kv/AHtFrPjckiXKICvhhTGlsjzE8t0fKJ6o3CLdKoCDxVnRx7cm6
	hQ5kqm8fMTErFY3qM7gWgdRHtyBYtWdspCHaQsoTGah+iciwDgM2LoEaginlDIvTiT
	fL0uOyOA25Mh9N0umXisIuNkXMO34aPUrOo61lXI=
X-QQ-mid: esmtp4t1556843811tezymyy2b
Received: from localhost (unknown [183.63.119.3])
	by esmtp4.qq.com (ESMTP) with 
	id ; Fri, 03 May 2019 08:36:51 +0800 (CST)
X-QQ-SSF: B100000000000030F7F00F00000000O
X-QQ-FEAT: 5GknEzJPEhvCyQ1/jMaBdgfgTWksQ/7cZqDu1hIg+4LFrE5hIXVo3ecfkFFZ1
	QbOu7+dDmGzfqSH3cUuEFkS4frOOFshPSY6ZZ+rk985bOa/Mn/+Ocr8S6hlvarkz2tfTnlU
	mT2/atjidIX1JoijMo4LONa/SippJKnvat+DOYdpVJh0Q3CjOTq4WsnNtIx4LXz4fK2DW6j
	OmVbIXt8p2bCK3yKjSHWf5XSXTXXMcCY324sue3cehA2islYcPJPezuvg9XN+fyogZpupn9
	HPsfWQINVRPXYefBNYkIevxtNawQXarKZBfaerFjn2RN5Y
X-QQ-GoodBg: 0
From: Cao Jiaxi <driver1998@foxmail.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 08:36:50 +0800
Message-Id: <20190503003650.10137-1-driver1998@foxmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503002206.9751-1-driver1998@foxmail.com>
References: <20190503002206.9751-1-driver1998@foxmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:foxmail.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 54.207.22.56
Subject: [Qemu-devel] [PATCH v3 2/4] qga: Fix mingw compilation warnings on
 enum conversion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Cao Jiaxi <driver1998@foxmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The win2qemu[] is supposed to be the conversion table to convert between
STORAGE_BUS_TYPE in Windows SDK and GuestDiskBusType in qga.

But it was incorrectly written that it forces to set a GuestDiskBusType
value to STORAGE_BUS_TYPE, which generates an enum conversion warning in clang.

Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
---
 qga/commands-win32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index d40d61f605..6b67f16faf 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -457,7 +457,7 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
 
 #ifdef CONFIG_QGA_NTDDSCSI
 
-static STORAGE_BUS_TYPE win2qemu[] = {
+static GuestDiskBusType win2qemu[] = {
     [BusTypeUnknown] = GUEST_DISK_BUS_TYPE_UNKNOWN,
     [BusTypeScsi] = GUEST_DISK_BUS_TYPE_SCSI,
     [BusTypeAtapi] = GUEST_DISK_BUS_TYPE_IDE,
-- 
2.17.1




