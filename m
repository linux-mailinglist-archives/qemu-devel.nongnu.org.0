Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959DD3143F6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:38:10 +0100 (CET)
Received: from localhost ([::1]:46428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9G6b-0002MO-Hk
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1l9Dbl-0000So-M0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:09 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:44252
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1l9Dbj-0002cT-0y
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:09 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 19EE1DA0250;
 Mon,  8 Feb 2021 21:58:04 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id E66B9460149; Mon,  8 Feb 2021 21:58:03 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] util/cutils: Skip "." when looking for next directory
 component
Date: Mon,  8 Feb 2021 21:57:52 +0100
Message-Id: <20210208205752.2488774-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When looking for the next directory component, a "." component is now skipped.

This fixes the path(s) used for firmware lookup for the prefix == bindir case
which is standard for QEMU on Windows and where the internally
used bindir value ends with "/.".

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch is required for Windows to get the firmware access right,
but would also be needed for Linux with --bindir=/usr/local which
currently results in a search path like /usr/local/../share/qemu-firmware.

I noticed that qemu-firmware is not used during the installation.
What is the purpose of that extra search path?

Stefan

 util/cutils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/cutils.c b/util/cutils.c
index 0b5073b330..70c7d6efbd 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -916,7 +916,8 @@ static inline bool starts_with_prefix(const char *dir)
 static inline const char *next_component(const char *dir, int *p_len)
 {
     int len;
-    while (*dir && G_IS_DIR_SEPARATOR(*dir)) {
+    while ((*dir && G_IS_DIR_SEPARATOR(*dir)) ||
+           (*dir == '.' && (G_IS_DIR_SEPARATOR(dir[1]) || dir[1] == '\0'))) {
         dir++;
     }
     len = 0;
-- 
2.30.0


