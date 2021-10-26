Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5B43AF95
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 11:56:18 +0200 (CEST)
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJBp-0000e4-Km
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 05:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mfJ9v-0008Hc-Ec
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:54:19 -0400
Received: from mail.ispras.ru ([83.149.199.84]:59972)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1mfJ9t-00051z-3B
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:54:19 -0400
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 6212D40755E2;
 Tue, 26 Oct 2021 09:54:05 +0000 (UTC)
Subject: [PATCH] hw/i386: fix vmmouse registration
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Tue, 26 Oct 2021 12:54:05 +0300
Message-ID: <163524204515.1914131.16465061981774791228.stgit@pasha-ThinkPad-X280>
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
Cc: pavel.dovgalyuk@ispras.ru, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the logic of vmmouse_update_handler function,
vmmouse should be registered as an event handler when
it's status is zero.
vmmouse_read_id resets the status but does not register
the handler.
This patch adds vmmouse registration and activation when
status is reset.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 hw/i386/vmmouse.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
index df4798f502..3d66368286 100644
--- a/hw/i386/vmmouse.c
+++ b/hw/i386/vmmouse.c
@@ -158,6 +158,7 @@ static void vmmouse_read_id(VMMouseState *s)
 
     s->queue[s->nb_queue++] = VMMOUSE_VERSION;
     s->status = 0;
+    vmmouse_update_handler(s, s->absolute);
 }
 
 static void vmmouse_request_relative(VMMouseState *s)


