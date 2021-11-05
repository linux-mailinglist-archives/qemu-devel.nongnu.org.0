Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC9A446760
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:54:13 +0100 (CET)
Received: from localhost ([::1]:50066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2Tk-0003HV-3Z
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mj2Sd-0002ad-LV
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:53:04 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mj2Sb-0008Fd-TI
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:53:03 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N1Oft-1mcl4V2cQN-012nUa; Fri, 05
 Nov 2021 17:52:56 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] macfb: fix a memory leak (CID 1465231)
Date: Fri,  5 Nov 2021 17:52:54 +0100
Message-Id: <20211105165254.3544369-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hwKZHP2stqmNw7Xf9Sfk5FjozOe4s0X5LET+Ztb00OZ+/GVDb07
 vDEgGY7iYh9GtehZy6jSGuAwEv+YL7ErblXjmc3+fzdbuSfxmrmzvHKN1P1xhlheDwef2fK
 xTOvU/Yf/F7OvqFn/GM/ig35LFOD/joVngw/v91MsGZl49xbmn6GkiNM8JGywVMsI7Jycdd
 IaSPBJGuojcwqOIkFXEaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o1jnE+o5aD0=:mY3InjhLNTnaIEqMPrdLKu
 Tt81efHi/W1VnAoTQiQT1hB378R0XU5YC3vmXJ/CWR1ljI4C4c81H5D+LBjUM9laoH+wZrx8Z
 4hiJLFhUUZCjsmohcs+e5DGg9K2eiQ17lTE0yBlsgSV+Vr9tcPB3CKUiybE3QJF8W+O5J+ItX
 a7UmZbKlby68L4duZira6uRE6equixNTg3RgOYp2qB9/o2PYC/SCLlv58tNv5RnuAKEcCsSCK
 QzUd7Dmj1Kyp3+rcjQCB8GbhYTUSxzkqo2pzaSNmJNDtDk/oEIs+2CVvf9e5zt7kgXZrhDATZ
 osqF1fYUOMkVEVpYqHnpiOURJkIw+A7MkNNAWUjBU/dwZq1j+bpdVq9B7cxCRvPx0U8u0YUCh
 ZqQeaR7c2kX3mkGHQqojucWYVxJuXhvQ7Dbl2Ip+ejc3E9qGkNdxz8+ZD3l9PLGG0J6AwQJgD
 80uezfaVqDWoMhYh7HiBZDqCHuSfT+Zcqu2rVSqPBlAqgbGY5fV4X4Vj2cqBYhmRHiBAzewJ/
 iXpfT2sWtruVRAT0H7mbiIcZ9LFP/AwR/rgJvNJ0G2TdoNJzDp8ObZbAJLzvMVfDBktCRudn8
 rTqGtYoqqIsSAWjtjyDwrR19JvMWt78F4hUHa59PUTmCtvHlXan1jf9Njr0uQu9n/SkKRw0op
 MrpvG4X8MuSnh/vzhfaDhsEWg1U1+PYhsRgAfmQuSIEolK/S0rvOuPHlFq6jG8xu9cV4=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rewrite the function using g_string_append_printf() rather than
g_strdup_printf()/g_strconcat().

Fixes: df8abbbadf74 ("macfb: add common monitor modes supported by the MacOS toolbox ROM")
Cc: mark.cave-ayland@ilande.co.uk
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 4b352eb89c3f..277d3e663331 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -440,21 +440,18 @@ static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
 
 static gchar *macfb_mode_list(void)
 {
-    gchar *list = NULL;
-    gchar *mode;
+    GString *list = g_string_new("");
     MacFbMode *macfb_mode;
     int i;
 
     for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
         macfb_mode = &macfb_mode_table[i];
 
-        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
+        g_string_append_printf(list, "    %dx%dx%d\n", macfb_mode->width,
                                macfb_mode->height, macfb_mode->depth);
-        list = g_strconcat(mode, list, NULL);
-        g_free(mode);
     }
 
-    return list;
+    return g_string_free(list, FALSE);
 }
 
 
@@ -643,7 +640,7 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
         gchar *list;
         error_setg(errp, "unknown display mode: width %d, height %d, depth %d",
                    s->width, s->height, s->depth);
-        list =  macfb_mode_list();
+        list = macfb_mode_list();
         error_append_hint(errp, "Available modes:\n%s", list);
         g_free(list);
 
-- 
2.31.1


