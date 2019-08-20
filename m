Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498529581A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 09:17:31 +0200 (CEST)
Received: from localhost ([::1]:33948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzyOX-0007Oe-Oc
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 03:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8b-0005gU-2g
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:01:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8X-0003O3-Dz
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:01:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13358)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzy8W-0003MZ-U4
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:00:57 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EEA863065450;
 Tue, 20 Aug 2019 07:00:55 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-20.ams2.redhat.com
 [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E87FA7E005;
 Tue, 20 Aug 2019 07:00:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 08:59:40 +0200
Message-Id: <1566284395-30287-22-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
References: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 20 Aug 2019 07:00:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 21/36] replay: add missing fix for internal
 function
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
Cc: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

This is a fix which was missed by patch
74c0b816adfc6aa1b01b4426fdf385e32e35cbac, which added current_step
parameter to the replay_advance_current_step function.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
Message-Id: <156404425561.18669.13015037579222450241.stgit@pasha-Precision-3630-Tower>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 replay/replay-internal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/replay/replay-internal.c b/replay/replay-internal.c
index 9e41ed1..979f3a0 100644
--- a/replay/replay-internal.c
+++ b/replay/replay-internal.c
@@ -228,7 +228,7 @@ void replay_mutex_unlock(void)
 
 void replay_advance_current_step(uint64_t current_step)
 {
-    int diff = (int)(replay_get_current_step() - replay_state.current_step);
+    int diff = (int)(current_step - replay_state.current_step);
 
     /* Time can only go forward */
     assert(diff >= 0);
-- 
1.8.3.1



