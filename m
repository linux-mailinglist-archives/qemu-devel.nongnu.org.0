Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61966EE580
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:17:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLJn-0001YM-KF; Tue, 25 Apr 2023 12:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prLJl-0001XW-Mw
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:15:01 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prLJj-0003wg-6h
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:15:01 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id BCCFF60AC6;
 Tue, 25 Apr 2023 19:14:52 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b440::1:14])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id ZEJx1U1OcKo0-fbGyRcIy; Tue, 25 Apr 2023 19:14:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682439291; bh=T4OMW3uNIsuTtXXlaMvFRDkYLhI73waVVu2T/GxdfZQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=krcSXv1AMbevDgnQWqtm23VX9QBqYlsoo+HIZJVfthkCGVKQpxobn6zbLe+Nvff6M
 Lw53VQReFgosBsiKd17fYW3l4b3xpylTlbj1g1T8WWrfXZvg3h1S/nX0R54STX7hAq
 1nge0r9jCVWj1ZUu8Towd8SPGAlFZ60UrClB78Og=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru, lersek@redhat.com,
 kraxel@redhat.com
Subject: [PATCH v2 2/3] pci: pci_add_option_rom(): refactor: use g_autofree
 for path variable
Date: Tue, 25 Apr 2023 19:14:33 +0300
Message-Id: <20230425161434.173022-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425161434.173022-1-vsementsov@yandex-team.ru>
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/pci.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 4a61c8d24a..a442f8fce1 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2292,7 +2292,7 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
                                Error **errp)
 {
     int64_t size;
-    char *path;
+    g_autofree char *path = NULL;
     void *ptr;
     char name[32];
     const VMStateDescription *vmsd;
@@ -2337,16 +2337,13 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
     size = get_image_size(path);
     if (size < 0) {
         error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
-        g_free(path);
         return;
     } else if (size == 0) {
         error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
-        g_free(path);
         return;
     } else if (size > 2 * GiB) {
         error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
                    pdev->romfile);
-        g_free(path);
         return;
     }
     if (pdev->romsize != -1) {
@@ -2354,7 +2351,6 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
             error_setg(errp, "romfile \"%s\" (%u bytes) "
                        "is too large for ROM size %u",
                        pdev->romfile, (uint32_t)size, pdev->romsize);
-            g_free(path);
             return;
         }
     } else {
@@ -2372,10 +2368,8 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
     ptr = memory_region_get_ram_ptr(&pdev->rom);
     if (load_image_size(path, ptr, size) < 0) {
         error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
-        g_free(path);
         return;
     }
-    g_free(path);
 
     if (is_default_rom) {
         /* Only the default rom images will be patched (if needed). */
-- 
2.34.1


