Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748553708C3
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:21:19 +0200 (CEST)
Received: from localhost ([::1]:54348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcvB0-0000Pr-BI
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@zebra.codingfarm.de>)
 id 1lcv56-0005bB-60
 for qemu-devel@nongnu.org; Sat, 01 May 2021 15:15:13 -0400
Received: from donkey.codingfarm.de ([2a01:4f8:190:12cf::d:1]:43682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raimue@zebra.codingfarm.de>)
 id 1lcv53-0007pl-ED
 for qemu-devel@nongnu.org; Sat, 01 May 2021 15:15:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by donkey.codingfarm.de (Postfix) with ESMTPSA id 1BA7280274;
 Sat,  1 May 2021 21:06:23 +0200 (CEST)
Received: by zebra.codingfarm.de (Postfix, from userid 1000)
 id DF0A744CD7; Sat,  1 May 2021 21:06:22 +0200 (CEST)
From: =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] input-linux: Delay grab toggle if keys are pressed
Date: Sat,  1 May 2021 21:06:21 +0200
Message-Id: <20210501190622.153901-2-raimue@codingfarm.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501190622.153901-1-raimue@codingfarm.de>
References: <20210501190622.153901-1-raimue@codingfarm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a01:4f8:190:12cf::d:1;
 envelope-from=raimue@zebra.codingfarm.de; helo=donkey.codingfarm.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NO_DNS_FOR_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Rainer=20M=C3=BCller?= <raimue@codingfarm.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When multiple keyboards are passed to the guest with input-linux, there
could still be keys pressed on the other keyboard when toggling grab.
Delay toggling grab on the other keyboard until all keys are released,
otherwise keys could be stuck on host without a key up event.

Signed-off-by: Rainer Müller <raimue@codingfarm.de>
---
 ui/input-linux.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/ui/input-linux.c b/ui/input-linux.c
index 05c0c98819..47d489d738 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -89,7 +89,12 @@ static void input_linux_toggle_grab(InputLinux *il)
             continue;
         }
         if (item->grab_active != il->grab_active) {
-            input_linux_toggle_grab(item);
+            if (item->keycount) {
+                /* delay grab until all keys are released */
+                item->grab_request = true;
+            } else {
+                input_linux_toggle_grab(item);
+            }
         }
     }
 }
-- 
2.25.1


