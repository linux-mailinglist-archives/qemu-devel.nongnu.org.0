Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA3695822
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 09:19:39 +0200 (CEST)
Received: from localhost ([::1]:33980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzyQc-0001vE-3N
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 03:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42733)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8h-0005mk-R1
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:01:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzy8d-0003VB-Cr
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:01:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37164)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzy8c-0003RG-Rh
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:01:03 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9C6A630BB370;
 Tue, 20 Aug 2019 07:01:00 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-20.ams2.redhat.com
 [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97CB660F88;
 Tue, 20 Aug 2019 07:00:59 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 08:59:43 +0200
Message-Id: <1566284395-30287-25-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
References: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 20 Aug 2019 07:01:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 24/36] replay: fix replay shutdown
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

This patch fixes shutdown of the replay process, which is terminated with
the assert when shutdown event is read from the log.
replay_finish_event reads new data_kind and therefore the value of data_kind
should be preserved to be valid at qemu_system_shutdown_request call.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
Message-Id: <156404427238.18669.12378772823692338069.stgit@pasha-Precision-3630-Tower>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 replay/replay.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/replay/replay.c b/replay/replay.c
index 8b172b2..8d77a4c 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -45,14 +45,14 @@ bool replay_next_event_is(int event)
     }
 
     while (true) {
-        if (event == replay_state.data_kind) {
+        unsigned int data_kind = replay_state.data_kind;
+        if (event == data_kind) {
             res = true;
         }
-        switch (replay_state.data_kind) {
+        switch (data_kind) {
         case EVENT_SHUTDOWN ... EVENT_SHUTDOWN_LAST:
             replay_finish_event();
-            qemu_system_shutdown_request(replay_state.data_kind -
-                                         EVENT_SHUTDOWN);
+            qemu_system_shutdown_request(data_kind - EVENT_SHUTDOWN);
             break;
         default:
             /* clock, time_t, checkpoint and other events */
-- 
1.8.3.1



