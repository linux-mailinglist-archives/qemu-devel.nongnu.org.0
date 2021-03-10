Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4203339E3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:24:50 +0100 (CET)
Received: from localhost ([::1]:44054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw1J-00047N-CC
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lJvyX-0001AM-W4
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:21:58 -0500
Received: from mail.ispras.ru ([83.149.199.84]:53406)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lJvyS-00045Y-19
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:21:57 -0500
Received: from [127.0.1.1] (unknown [85.142.117.224])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3806C40D403D;
 Wed, 10 Mar 2021 10:21:40 +0000 (UTC)
Subject: [PATCH] hw/i8254: fix vmstate load
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Wed, 10 Mar 2021 13:21:40 +0300
Message-ID: <161537170060.6654.9430112746749476215.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU timer of channel 0 in i8254 is used to raise irq
at the specified moment of time. This irq can be disabled
with irq_disabled flag. But when vmstate of the pit is
loaded, timer may be rearmed despite the disabled interrupts.
This patch adds irq_disabled flag check to fix that.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 hw/timer/i8254.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index c01ee2c72a..c8388ea432 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -324,7 +324,7 @@ static void pit_post_load(PITCommonState *s)
 {
     PITChannelState *sc = &s->channels[0];
 
-    if (sc->next_transition_time != -1) {
+    if (sc->next_transition_time != -1 && !sc->irq_disabled) {
         timer_mod(sc->irq_timer, sc->next_transition_time);
     } else {
         timer_del(sc->irq_timer);


