Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB13A2FFC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:59:43 +0200 (CEST)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrN5q-00009M-Df
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrN4a-0007vO-So
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:58:25 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:36487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1lrN4Z-0003uM-0b
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:58:24 -0400
Received: by mail-lj1-x22c.google.com with SMTP id 131so5638310ljj.3
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 08:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tDP2Ye9cR8baTpCVL0pUhre3DLck8HEMOcZejt8Oi34=;
 b=zA1sX+TTq9xI2AOIQuff39C7eTg0aAEus55TSC9Dn5YvVHwxSFza4DjXOdVJRQzYHh
 WbLJBjKwyky4HJ1G+5R59uwL0hZP4eLEv+t/xA/wWzQ6YjJqMZt/reJzu17UQ1SLO/4I
 nM4QT28/W+syZGh5nPc7m+RMk6Ea3fR8XaJKKOGF++1qzFMtPLIJ63QSQdQL3AcmWNha
 /E9FZETyQ3RfZUSBOBasu1fX/+4DuMWrAyhaTnr6N0U/Hv1vBEzAzA9QFmQGYNzEfd+C
 1EhJl4c0+bwBohW8loJ1QEZtx+mYzq/eT8NyoIfQmHpvJq/aThRZzPgMKkAsy1I/Utca
 Ki/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tDP2Ye9cR8baTpCVL0pUhre3DLck8HEMOcZejt8Oi34=;
 b=ESWUNelTGM9XgIbwEfeh3+Z4QuHTGO2qbUPHO2Xahc44k+yTggNU5zFVOorED9+NDd
 KOk9NaoSpbjJGLkis25xVnFMNzqHqz5MFSnAoCeKco+mX2aVUmolFPK9V5l28LABfIIG
 6jhV4DdRgkh09SmR119UDAzl/U5dm3OViIrXe6EL1jBFYo17vriUQgGlSGdPM2UQVZtB
 cViUJ4aBF5SkjS/66YT2g9yzq8KO02GYNYsf8cXLTu7agev7Diy1W4TX/o2WAteEkBT5
 3yrrCFLSYQ+b7gPQZpvfEiETQtZ+B51BLbEfLjRc+JZ/ouf447/D8J4OOw0Xr6pNdYR9
 S8VA==
X-Gm-Message-State: AOAM532TXPVcZAX9Vw1aen94IxAOnW3E7D5D1POI8m/2wsizceYVoDrc
 pohc6n4+Dy0xftrHTQK6//eGwPznFkzReIviYc8oJQ==
X-Google-Smtp-Source: ABdhPJyFwYDUvCn/GH14dpfnocdZleuWewu4WgTO3XeGUklAVmmZplSl3YmUj0kE7xv+DAn/zjR+BQ==
X-Received: by 2002:a2e:a4c6:: with SMTP id p6mr2718830ljm.485.1623340700769; 
 Thu, 10 Jun 2021 08:58:20 -0700 (PDT)
Received: from kostyanf14nb.Dlink (93-77-45-80.vin.volia.net. [93.77.45.80])
 by smtp.gmail.com with ESMTPSA id p5sm407993ljc.117.2021.06.10.08.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 08:58:20 -0700 (PDT)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qga-win: Free GMatchInfo properly
Date: Thu, 10 Jun 2021 18:58:11 +0300
Message-Id: <20210610155811.3313927-1-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22c;
 envelope-from=konstantin@daynix.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The g_regex_match function creates match_info even if it
returns FALSE. So we should always call g_match_info_free.
A better solution is using g_autoptr for match_info variable.

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 300b87c859..785a5cc6b2 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -2494,7 +2494,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
             continue;
         }
         for (j = 0; hw_ids[j] != NULL; j++) {
-            GMatchInfo *match_info;
+            g_autoptr(GMatchInfo) match_info;
             GuestDeviceIdPCI *id;
             if (!g_regex_match(device_pci_re, hw_ids[j], 0, &match_info)) {
                 continue;
@@ -2511,7 +2511,6 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
             id->vendor_id = g_ascii_strtoull(vendor_id, NULL, 16);
             id->device_id = g_ascii_strtoull(device_id, NULL, 16);
 
-            g_match_info_free(match_info);
             break;
         }
         if (skip) {
-- 
2.25.1


